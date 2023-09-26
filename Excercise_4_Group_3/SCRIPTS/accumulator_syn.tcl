set DESIGN_NAME accumulator
set clk_period 244
analyze -format verilog {./src/GCD.v}
elaborate $DESIGN_NAME

link
check_design

read_sdc scripts/rca_clock.sdc

set_max_area 0
compile_ultra

set resultdir "./results_accumulator"
set postfix "compile_ultra"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.${clk_period}.rpt
report_qor > $resultdir/qor_report.${postfix}.${clk_period}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.${clk_period}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.${clk_period}.rpt

write -hierarchy -format verilog -output $resultdir/rca_compiled.${postfix}.${clk_period}.v

gui_start

