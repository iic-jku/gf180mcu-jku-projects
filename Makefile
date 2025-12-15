MAKEFILE_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

RUN_TAG = $(shell ls librelane/runs/ | tail -n 1)
TOP = chip_top

PDK_ROOT ?= $(MAKEFILE_DIR)/gf180mcu
PDK ?= gf180mcuD
PDK_TAG ?= 1.6.5

AVAILABLE_SLOTS = 1x1 0p5x1 1x0p5 0p5x0p5
DEFAULT_SLOT = 1x1

# Slot can be any of AVAILABLE_SLOTS
SLOT ?= $(DEFAULT_SLOT)

ifeq ($(SLOT),default)        
    SLOT = $(DEFAULT_SLOT)
endif

ifeq ($(filter $(SLOT),$(AVAILABLE_SLOTS)),)
    $(error $(SLOT) does not exist in AVAILABLE_SLOTS: $(AVAILABLE_SLOTS))
endif

.DEFAULT_GOAL := help

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'
.PHONY: help

all: librelane ## Build the project (runs LibreLane)
.PHONY: all

clone-pdk: ## Clone the GF180MCU PDK repository
	rm -rf $(MAKEFILE_DIR)/gf180mcu
	git clone https://github.com/wafer-space/gf180mcu.git $(MAKEFILE_DIR)/gf180mcu --depth 1 --branch ${PDK_TAG}
.PHONY: clone-pdk

librelane: ## Run LibreLane flow (synthesis, PnR, verification)
	librelane librelane/slots/slot_${SLOT}.yaml librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk
.PHONY: librelane

librelane-nodrc: ## Run LibreLane flow without DRC checks
	librelane librelane/slots/slot_${SLOT}.yaml librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --skip KLayout.Antenna --skip KLayout.DRC --skip Magic.DRC
.PHONY: librelane-nodrc

librelane-klayoutdrc: ## Run LibreLane flow without magic DRC checks
	librelane librelane/slots/slot_${SLOT}.yaml librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --skip Magic.DRC
.PHONY: librelane-klayoutdrc

librelane-magicdrc: ## Run LibreLane flow without KLayout DRC checks
	librelane librelane/slots/slot_${SLOT}.yaml librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --skip KLayout.DRC
.PHONY: librelane-magicdrc

librelane-openroad: ## Open the last run in OpenROAD
	librelane librelane/slots/slot_${SLOT}.yaml librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --flow OpenInOpenROAD
.PHONY: librelane-openroad

librelane-klayout: ## Open the last run in KLayout
	librelane librelane/slots/slot_${SLOT}.yaml librelane/config.yaml --pdk ${PDK} --pdk-root ${PDK_ROOT} --manual-pdk --last-run --flow OpenInKLayout
.PHONY: librelane-klayout

librelane-padring: ## Only create the padring
	PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 scripts/padring.py librelane/slots/slot_${SLOT}.yaml librelane/config.yaml
.PHONY: librelane-padring

sim: ## Run RTL simulation with cocotb
	cd cocotb; PDK_ROOT=${PDK_ROOT} PDK=${PDK} SLOT=${SLOT} python3 chip_top_tb.py
.PHONY: sim

sim-gl: ## Run gate-level simulation with cocotb (after copy-final)
	cd cocotb; GL=1 PDK_ROOT=${PDK_ROOT} PDK=${PDK} SLOT=${SLOT} python3 chip_top_tb.py
.PHONY: sim-gl

sim-view: ## View simulation waveforms in GTKWave
	gtkwave cocotb/sim_build/chip_top.fst
.PHONY: sim-view

# Target for copying the top-level reports (Simon)
copy-reports: ## Copy yosys, antenna violations, hold & setup timing and manufacturability reports
	rm -rf reports/
	mkdir -p reports/
	# Using * wildcard to ignore step numbers
	cp librelane/runs/${RUN_TAG}/*-yosys-synthesis/reports/pre_synth_chk.rpt reports/yosys_synth_check.rpt
	cp librelane/runs/${RUN_TAG}/*-yosys-synthesis/reports/pre_techmap.rpt reports/yosys_pre_techmap.rpt
	cp librelane/runs/${RUN_TAG}/*-yosys-synthesis/reports/post_dff.rpt reports/yosys_post_dff.rpt
	cp librelane/runs/${RUN_TAG}/*-openroad-checkantennas-1/reports/antenna.rpt reports/antenna_violations.rpt
	cp librelane/runs/${RUN_TAG}/*-openroad-checkantennas-1/reports/antenna_summary.rpt reports/antenna_summary.rpt
	cp librelane/runs/${RUN_TAG}/*-openroad-stapostpnr/summary.rpt reports/hold_setup_timing.rpt
	cp librelane/runs/${RUN_TAG}/*-klayout-antenna/reports/antenna.klayout.json reports/antenna.klayout.json
	cp librelane/runs/${RUN_TAG}/*-misc-reportmanufacturability/manufacturability.rpt reports/manufacturability.rpt
.PHONY: copy-reports

copy-final: ## Copy final output files from the last run
	rm -rf final/
	cp -r librelane/runs/${RUN_TAG}/final/ final/
.PHONY: copy-final

copy-gds: ## Copy final output GDS from the last run (for submission)
	rm -rf gds/
	mkdir -p gds/
	cp -r final/gds/${TOP}.gds gds/${TOP}.gds
.PHONY: copy-gds

render-image: ## Render an image from the final layout (after copy-final)
	rm -rf img/
	mkdir -p img/
	PDK_ROOT=${PDK_ROOT} PDK=${PDK} python3 scripts/lay2img.py final/gds/${TOP}.gds img/${TOP}.png --width 2048 --oversampling 4
.PHONY: render-image

# Targets for building the macros in one place (Jonathan & Simon)
build-tiny_tone:
	@$(MAKE) -C macros/tiny_tone librelane
	@$(MAKE) -C macros/tiny_tone copy-reports
	@$(MAKE) -C macros/tiny_tone copy-final
	@$(MAKE) -C macros/tiny_tone render-image
.PHONY: build-tiny_tone

build-decimation_filter_256_ser:
	@$(MAKE) -C macros/decimation_filter_256_ser librelane
	@$(MAKE) -C macros/decimation_filter_256_ser copy-reports
	@$(MAKE) -C macros/decimation_filter_256_ser copy-final
	@$(MAKE) -C macros/decimation_filter_256_ser render-image
.PHONY: build-decimation_filter_256_ser

build-octowave:
	@$(MAKE) -C macros/octowave librelane
	@$(MAKE) -C macros/octowave copy-reports
	@$(MAKE) -C macros/octowave copy-final
	@$(MAKE) -C macros/octowave render-image
.PHONY: build-octowave

build-tinywhisper_riscv:
	@$(MAKE) -C macros/tinywhisper_riscv librelane
	@$(MAKE) -C macros/tinywhisper_riscv copy-reports
	@$(MAKE) -C macros/tinywhisper_riscv copy-final
	@$(MAKE) -C macros/tinywhisper_riscv render-image
.PHONY: build-tinywhisper_riscv

build-tetris:
	@$(MAKE) -C macros/tetris librelane
	@$(MAKE) -C macros/tetris copy-reports
	@$(MAKE) -C macros/tetris copy-final
	@$(MAKE) -C macros/tetris render-image
.PHONY: build-tetris

build-tiny_stack:
	@$(MAKE) -C macros/tiny_stack librelane
	@$(MAKE) -C macros/tiny_stack copy-reports
	@$(MAKE) -C macros/tiny_stack copy-final
	@$(MAKE) -C macros/tiny_stack render-image
.PHONY: build-tiny_stack

build-multiplexer:
	@$(MAKE) -C macros/multiplexer librelane
	@$(MAKE) -C macros/multiplexer copy-reports
	@$(MAKE) -C macros/multiplexer copy-final
	@$(MAKE) -C macros/multiplexer render-image
.PHONY: build-multiplexer

build-tiny_bf:
	@$(MAKE) -C macros/tiny_bf librelane
	@$(MAKE) -C macros/tiny_bf copy-reports
	@$(MAKE) -C macros/tiny_bf copy-final
	@$(MAKE) -C macros/tiny_bf render-image
.PHONY: build-tiny_bf

build-adc_sar_controller:
	@$(MAKE) -C macros/adc_sar_controller librelane
	@$(MAKE) -C macros/adc_sar_controller copy-reports
	@$(MAKE) -C macros/adc_sar_controller copy-final
	@$(MAKE) -C macros/adc_sar_controller render-image
.PHONY: build-adc_sar_controller

build-led_spinner:
	@$(MAKE) -C macros/led_spinner librelane
	@$(MAKE) -C macros/led_spinner copy-reports
	@$(MAKE) -C macros/led_spinner copy-final
	@$(MAKE) -C macros/led_spinner render-image
.PHONY: build-led_spinner

build-tiny_tonegen:
	@$(MAKE) -C macros/tiny_tonegen librelane
	@$(MAKE) -C macros/tiny_tonegen copy-reports
	@$(MAKE) -C macros/tiny_tonegen copy-final
	@$(MAKE) -C macros/tiny_tonegen render-image
.PHONY: build-tiny_tonegen

build-digital_filter:
	@$(MAKE) -C macros/digital_filter librelane
	@$(MAKE) -C macros/digital_filter copy-reports
	@$(MAKE) -C macros/digital_filter copy-final
	@$(MAKE) -C macros/digital_filter render-image
.PHONY: build-digital_filter

build-traffic_light_controller:
	@$(MAKE) -C macros/traffic_light_controller librelane
	@$(MAKE) -C macros/traffic_light_controller copy-reports
	@$(MAKE) -C macros/traffic_light_controller copy-final
	@$(MAKE) -C macros/traffic_light_controller render-image
.PHONY: build-traffic_light_controller

build-classic_vga_clock:
	@$(MAKE) -C macros/classic_vga_clock librelane
	@$(MAKE) -C macros/classic_vga_clock copy-reports
	@$(MAKE) -C macros/classic_vga_clock copy-final
	@$(MAKE) -C macros/classic_vga_clock render-image
.PHONY: build-classic_vga_clock

build-all-macros: build-tiny_tone build-decimation_filter_256_ser build-octowave build-tinywhisper_riscv build-tetris build-tiny_stack build-multiplexer build-tiny_bf build-adc_sar_controller build-led_spinner build-tiny_tonegen build-digital_filter build-traffic_light_controller build-classic_vga_clock
.PHONY: build-all-macros

# Target for building the whole chip (Simon)
build-all: clone-pdk build-all-macros librelane copy-reports copy-final copy-gds render-image librelane-openroad
.PHONY: build-all