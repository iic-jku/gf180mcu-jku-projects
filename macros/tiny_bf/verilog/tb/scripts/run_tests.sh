#!/bin/bash
# Advanced Test Runner for Brainfuck ASIC Project
# Features:
#   - Run individual tests or all tests
#   - Automatic test discovery
#   - Optional GTKWave integration with .gtkw files
#   - Colorized output
#   - Detailed statistics and timing
#   - Parallel test execution (optional)
#   - Clean/rebuild options

set -o pipefail

# Get script directory and project directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TB_DIR="$(dirname "$SCRIPT_DIR")"
SRC_DIR="$(dirname "$TB_DIR")/src"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Configuration
RESULTS_DIR="$TB_DIR/results"
GTKW_DIR="$TB_DIR/gtkw"
VERBOSE=0
OPEN_WAVE=0
GTKW_FILE=""
CLEAN=0
PARALLEL=0
START_TIME=$(date +%s)

# Statistics
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0
COMPILE_FAILURES=0

# Track test results by name
declare -a PASSED_TEST_NAMES
declare -a FAILED_TEST_NAMES
declare -a COMPILE_FAIL_NAMES

# Available tests (auto-discovered)
declare -A TESTS
declare -A TEST_DESCRIPTIONS

#=========================================================================
# Helper Functions
#=========================================================================

print_usage() {
    printf "${BOLD}Brainfuck ASIC Test Runner${NC}\n\n"
    printf "${BOLD}USAGE:${NC}\n"
    printf "    ./run_tests.sh [OPTIONS] [TEST_NAME]\n\n"
    printf "${BOLD}OPTIONS:${NC}\n"
    printf "    -h, --help          Show this help message\n"
    printf "    -l, --list          List all available tests\n"
    printf "    -a, --all           Run all tests (default if no test specified)\n"
    printf "    -w, --wave          Open GTKWave with results (requires test name)\n"
    printf "    -g, --gtkw FILE     Specify .gtkw save file for GTKWave\n"
    printf "    -c, --clean         Clean results before running\n"
    printf "    -v, --verbose       Verbose output\n"
    printf "    -p, --parallel      Run tests in parallel (experimental)\n"
    printf "    --stats             Show detailed statistics\n\n"
    printf "${BOLD}EXAMPLES:${NC}\n"
    printf "    ./run_tests.sh                           # Run all tests\n"
    printf "    ./run_tests.sh baud_gen                  # Run baud_gen_tb\n"
    printf "    ./run_tests.sh control_unit --wave       # Run and open waveform\n"
    printf "    ./run_tests.sh program_memory -g gtkw/program_memory.gtkw\n"
    printf "    ./run_tests.sh --list                    # List available tests\n"
    printf "    ./run_tests.sh --clean --all             # Clean and run all\n\n"
    printf "${BOLD}AVAILABLE TESTS:${NC}\n"
    printf "    baud_gen          - Baud rate generator\n"
    printf "    uart_tx           - UART transmitter\n"
    printf "    uart_rx           - UART receiver\n"
    printf "    reset_sync        - Reset synchronizer\n"
    printf "    program_memory    - Program memory (RAM)\n"
    printf "    programmer        - UART program uploader\n"
    printf "    tape_memory       - Tape memory module\n"
    printf "    control_unit      - CPU control unit\n"
    printf "    bf_top            - Complete Brainfuck system\n"
    printf "    rh_bf_top         - GF180 board-level wrapper\n\n"
}

print_header() {
    printf "${BOLD}${CYAN}\n"
    printf "=========================================\n"
    printf "%s\n" "$1"
    printf "=========================================\n"
    printf "${NC}\n"
}

print_section() {
    printf "${BOLD}${BLUE}>>> %s${NC}\n" "$1"
}

print_success() {
    printf "${GREEN}[PASS]${NC} %s\n" "$1"
}

print_failure() {
    printf "${RED}[FAIL]${NC} %s\n" "$1"
}

print_warning() {
    printf "${YELLOW}[WARN]${NC} %s\n" "$1"
}

print_info() {
    printf "${CYAN}[INFO]${NC} %s\n" "$1"
}

#=========================================================================
# Source File Management
#=========================================================================

get_source_files() {
    local test_name=$1
    local sources=""
    
    case "$test_name" in
        baud_gen)
            sources="$SRC_DIR/baud_gen.v"
            ;;
        uart_tx)
            sources="$SRC_DIR/uart_tx.v"
            ;;
        uart_rx)
            sources="$SRC_DIR/uart_rx.v"
            ;;
        program_memory)
            sources="$SRC_DIR/program_memory.v"
            ;;
        programmer)
            sources="$SRC_DIR/programmer.v"
            ;;
        tape_memory)
            sources="$SRC_DIR/tape_memory.v"
            ;;
        reset_sync)
            sources="$SRC_DIR/reset_sync.v"
            ;;
        control_unit)
            sources="$SRC_DIR/control_unit.v"
            ;;
        bf_top)
            # bf_top requires all modules
            sources="$SRC_DIR/reset_sync.v $SRC_DIR/baud_gen.v $SRC_DIR/uart_tx.v $SRC_DIR/uart_rx.v $SRC_DIR/program_memory.v $SRC_DIR/tape_memory.v $SRC_DIR/control_unit.v $SRC_DIR/programmer.v $SRC_DIR/bf_top.v"
            ;;
        rh_bf_top)
            # rh_bf_top requires all modules (same as bf_top plus wrapper)
            sources="$SRC_DIR/reset_sync.v $SRC_DIR/baud_gen.v $SRC_DIR/uart_tx.v $SRC_DIR/uart_rx.v $SRC_DIR/program_memory.v $SRC_DIR/tape_memory.v $SRC_DIR/control_unit.v $SRC_DIR/programmer.v $SRC_DIR/bf_top.v $SRC_DIR/rh_bf_top.v"
            ;;
        *)
            # Unknown test, try to find matching source file
            if [ -f "$SRC_DIR/${test_name}.v" ]; then
                sources="$SRC_DIR/${test_name}.v"
            fi
            ;;
    esac
    
    echo "$sources"
}

#=========================================================================
# Test Discovery
#=========================================================================

discover_tests() {
    print_section "Discovering tests..."
    
    # Find all *_tb.v files in TB_DIR
    local count=0
    while IFS= read -r file; do
        local base=$(basename "$file" .v)
        local name=${base%_tb}
        
        TESTS["$name"]="$file"
        count=$((count + 1))
        
        # Try to extract description from file header (look for line after "Description:")
        local desc=$(awk '/^\/\/[[:space:]]*Description:/ {getline; gsub(/^\/\/[[:space:]]*/, ""); print; exit}' "$file" | head -c 60)
        if [ -z "$desc" ]; then
            # Fallback: use second line of file (usually module description)
            desc=$(sed -n '2p' "$file" | sed 's/^\/\/[[:space:]]*//' | head -c 60)
        fi
        TEST_DESCRIPTIONS["$name"]="${desc:-Testbench for $name}"
        
    done < <(find "$TB_DIR" -maxdepth 1 -name "*_tb.v" -type f)
    
    print_info "Found $count testbenches"
}

list_tests() {
    print_header "Available Tests"
    
    local sorted_keys=($(for key in "${!TESTS[@]}"; do echo "$key"; done | sort))
    
    printf "%-20s %s\n" "TEST NAME" "DESCRIPTION"
    printf "%-20s %s\n" "----------" "-----------"
    
    for test in "${sorted_keys[@]}"; do
        printf "%-20s %s\n" "$test" "${TEST_DESCRIPTIONS[$test]}"
    done
    printf "\n"
}

#=========================================================================
# Test Execution
#=========================================================================

run_single_test() {
    local test_name=$1
    local test_file=${TESTS[$test_name]}
    
    if [ -z "$test_file" ]; then
        print_failure "Test '$test_name' not found"
        return 1
    fi
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    print_section "Running: $test_name"
    printf "${NC}File: %s\n" "$test_file"
    printf "Description: %s${NC}\n\n" "${TEST_DESCRIPTIONS[$test_name]}"
    
    local test_binary="$RESULTS_DIR/${test_name}_tb"
    local compile_log="$RESULTS_DIR/${test_name}_compile.log"
    local run_log="$RESULTS_DIR/${test_name}_run.log"
    local start=$(date +%s%N)
    
    # Get required source files for this test
    local source_files=$(get_source_files "$test_name")
    
    # Compilation phase
    print_info "Compiling..."
    if iverilog -g2005-sv -o "$test_binary" $source_files "$test_file" 2>&1 | tee "$compile_log"; then
        if [ ${PIPESTATUS[0]} -ne 0 ]; then
            print_failure "Compilation failed for $test_name"
            COMPILE_FAILURES=$((COMPILE_FAILURES + 1))
            FAILED_TESTS=$((FAILED_TESTS + 1))
            COMPILE_FAIL_NAMES+=("$test_name")
            [ $VERBOSE -eq 1 ] && cat "$compile_log"
            printf "\n"
            return 1
        fi
    else
        print_failure "Compilation failed for $test_name"
        COMPILE_FAILURES=$((COMPILE_FAILURES + 1))
        FAILED_TESTS=$((FAILED_TESTS + 1))
        COMPILE_FAIL_NAMES+=("$test_name")
        printf "\n"
        return 1
    fi
    
    # Execution phase
    print_info "Executing simulation..."
    if vvp "$test_binary" 2>&1 | tee "$run_log"; then
        local vvp_status=${PIPESTATUS[0]}
        # Check for test failures in output
        if grep -q "FAIL" "$run_log" || [ $vvp_status -ne 0 ]; then
            print_failure "$test_name - Simulation errors or test failures detected"
            FAILED_TESTS=$((FAILED_TESTS + 1))
            FAILED_TEST_NAMES+=("$test_name")
        else
            local end=$(date +%s%N)
            local duration=$(( (end - start) / 1000000 ))
            print_success "$test_name completed in ${duration}ms"
            PASSED_TESTS=$((PASSED_TESTS + 1))
            PASSED_TEST_NAMES+=("$test_name")
        fi
    else
        print_failure "$test_name - Simulation crashed"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        FAILED_TEST_NAMES+=("$test_name")
    fi
    
    # Check for VCD file in results directory
    local vcd_file="$RESULTS_DIR/${test_name}_tb.vcd"
    if [ -f "$vcd_file" ]; then
        print_info "Waveform saved: $vcd_file"
        
        # Open GTKWave if requested
        if [ $OPEN_WAVE -eq 1 ]; then
            open_gtkwave "$test_name" "$vcd_file"
        fi
    fi
    
    printf "\n"
    return 0
}

#=========================================================================
# GTKWave Integration
#=========================================================================

open_gtkwave() {
    local test_name=$1
    local vcd_file=$2
    
    if ! command -v gtkwave &> /dev/null; then
        print_warning "GTKWave not installed, skipping waveform viewer"
        return 1
    fi
    
    # Close any existing gtkwave windows
    local pids=$(ps -eo pid,comm | awk '$2=="gtkwave" {print $1}')
    if [ -n "$pids" ]; then
        print_info "Closing existing GTKWave instances..."
        kill $pids 2>/dev/null || true
        # Wait up to 2 seconds for graceful exit
        for i in {1..4}; do
            sleep 0.5
            local still=$(ps -eo pid,comm | awk '$2=="gtkwave" {print $1}')
            [ -z "$still" ] && break
        done
        # Force kill if still running
        local still=$(ps -eo pid,comm | awk '$2=="gtkwave" {print $1}')
        if [ -n "$still" ]; then
            kill -9 $still 2>/dev/null || true
        fi
    fi
    
    # Check if .gtkw file exists
    local gtkw_candidates=(
        "$GTKW_FILE"
        "$GTKW_DIR/${test_name}.gtkw"
        "$GTKW_DIR/${test_name}_tb.gtkw"
    )
    
    local gtkw_used=""
    for gtkw in "${gtkw_candidates[@]}"; do
        if [ -n "$gtkw" ] && [ -f "$gtkw" ]; then
            gtkw_used="$gtkw"
            break
        fi
    done
    
    if [ -n "$gtkw_used" ]; then
        print_info "Opening GTKWave with save file: $gtkw_used"
        gtkwave "$vcd_file" "$gtkw_used" &
    else
        print_info "Opening GTKWave (no save file found)"
        gtkwave "$vcd_file" &
    fi
    
    return 0
}

#=========================================================================
# Utility Functions
#=========================================================================

clean_results() {
    print_section "Cleaning previous results..."
    
    # Clean results directory but keep the directory itself
    rm -rf "$RESULTS_DIR"/*
    
    # Clean any stray files in TB_DIR (shouldn't exist with new structure)
    rm -f "$TB_DIR"/*.vcd "$TB_DIR"/*.vcd.fst "$TB_DIR"/*.fst
    rm -f "$TB_DIR"/a.out
    rm -f "$TB_DIR"/*_tb
    
    print_success "Cleaned build artifacts and results"
    echo
}

check_dependencies() {
    local missing=0
    
    if ! command -v iverilog &> /dev/null; then
        print_failure "iverilog not found - please install Icarus Verilog"
        missing=1
    fi
    
    if ! command -v vvp &> /dev/null; then
        print_failure "vvp not found - please install Icarus Verilog"
        missing=1
    fi
    
    if [ $OPEN_WAVE -eq 1 ] && ! command -v gtkwave &> /dev/null; then
        print_warning "GTKWave not found - waveform viewing disabled"
    fi
    
    return $missing
}

print_statistics() {
    # Only show statistics if multiple tests were run
    if [ $TOTAL_TESTS -le 1 ]; then
        return 0
    fi
    
    local end_time=$(date +%s)
    local total_duration=$((end_time - START_TIME))
    
    print_header "Test Statistics"
    
    printf "${BOLD}Results Summary:${NC}\n"
    printf "  Total Tests:        %d\n" $TOTAL_TESTS
    printf "  ${GREEN}Passed:${NC}             %d\n" $PASSED_TESTS
    printf "  ${RED}Failed:${NC}             %d\n" $FAILED_TESTS
    printf "  Compile Failures:   %d\n\n" $COMPILE_FAILURES
    
    # Show passed tests
    if [ ${#PASSED_TEST_NAMES[@]} -gt 0 ]; then
        printf "${BOLD}${GREEN}Passed Tests:${NC}\n"
        for test in "${PASSED_TEST_NAMES[@]}"; do
            printf "  ${GREEN}✓${NC} %s\n" "$test"
        done
        printf "\n"
    fi
    
    # Show failed tests
    if [ ${#FAILED_TEST_NAMES[@]} -gt 0 ]; then
        printf "${BOLD}${RED}Failed Tests:${NC}\n"
        for test in "${FAILED_TEST_NAMES[@]}"; do
            printf "  ${RED}✗${NC} %s\n" "$test"
        done
        printf "\n"
    fi
    
    # Show compile failures
    if [ ${#COMPILE_FAIL_NAMES[@]} -gt 0 ]; then
        printf "${BOLD}${RED}Compilation Failures:${NC}\n"
        for test in "${COMPILE_FAIL_NAMES[@]}"; do
            printf "  ${RED}✗${NC} %s\n" "$test"
        done
        printf "\n"
    fi
    
    if [ $TOTAL_TESTS -gt 0 ]; then
        local pass_rate=$((PASSED_TESTS * 100 / TOTAL_TESTS))
        printf "${BOLD}Pass Rate:${NC} %d%%\n" $pass_rate
    fi
    
    printf "${BOLD}Duration:${NC} %ds\n\n" $total_duration
    
    # VCD files in results directory
    local vcd_count=$(ls -1 "$RESULTS_DIR"/*.vcd 2>/dev/null | wc -l)
    if [ $vcd_count -gt 0 ]; then
        printf "${BOLD}Waveform Files:${NC}\n"
        ls -lh "$RESULTS_DIR"/*.vcd 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}'
        printf "\n"
    fi
    
    # Final verdict
    if [ $FAILED_TESTS -eq 0 ] && [ $TOTAL_TESTS -gt 0 ]; then
        printf "${BOLD}${GREEN}*** ALL TESTS PASSED ***${NC}\n"
    elif [ $TOTAL_TESTS -eq 0 ]; then
        printf "${BOLD}${YELLOW}*** NO TESTS RUN ***${NC}\n"
    else
        printf "${BOLD}${RED}*** SOME TESTS FAILED ***${NC}\n"
    fi
    printf "\n"
}

#=========================================================================
# Main Script
#=========================================================================

main() {
    local run_all=0
    local test_name=""
    local show_stats=0
    
    # Parse command line arguments
    while [ $# -gt 0 ]; do
        case "$1" in
            -h|--help)
                print_usage
                exit 0
                ;;
            -l|--list)
                discover_tests
                list_tests
                exit 0
                ;;
            -a|--all)
                run_all=1
                shift
                ;;
            -w|--wave)
                OPEN_WAVE=1
                shift
                ;;
            -g|--gtkw)
                GTKW_FILE="$2"
                shift 2
                ;;
            -c|--clean)
                CLEAN=1
                shift
                ;;
            -v|--verbose)
                VERBOSE=1
                shift
                ;;
            -p|--parallel)
                PARALLEL=1
                print_warning "Parallel execution not yet implemented"
                shift
                ;;
            --stats)
                show_stats=1
                shift
                ;;
            -*)
                print_failure "Unknown option: $1"
                print_usage
                exit 1
                ;;
            *)
                test_name="$1"
                shift
                ;;
        esac
    done
    
    # Print banner
    print_header "Brainfuck ASIC Test Suite"
    
    # Check dependencies
    if ! check_dependencies; then
        exit 1
    fi
    
    # Create results directory
    mkdir -p "$RESULTS_DIR"
    
    # Clean if requested
    if [ $CLEAN -eq 1 ]; then
        clean_results
    fi
    
    # Discover available tests
    discover_tests
    
    # Determine what to run
    if [ -n "$test_name" ]; then
        # Run specific test
        run_single_test "$test_name"
    elif [ $run_all -eq 1 ] || [ -z "$test_name" ]; then
        # Run all tests
        print_section "Running all tests..."
        echo
        
        local sorted_tests=($(for key in "${!TESTS[@]}"; do echo "$key"; done | sort))
        
        for test in "${sorted_tests[@]}"; do
            run_single_test "$test"
        done
    fi
    
    # Print statistics
    print_statistics
    
    # Exit with appropriate code
    if [ $FAILED_TESTS -gt 0 ]; then
        exit 1
    else
        exit 0
    fi
}

# Run main function
main "$@"