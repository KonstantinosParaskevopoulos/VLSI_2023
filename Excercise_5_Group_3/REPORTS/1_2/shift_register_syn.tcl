set DESIGN_NAME shift_register
# ειχαμε αρχικα shift_register_full
set clk_period 244
analyze -format verilog {./src/shift_register.v ./src/sreg.v} 
# ειχα βαλει analyze -format verilog {./src/sreg.v}
elaborate $DESIGN_NAME

link
check_design

set delay 200
set_max_delay $delay -from [all_inputs] -to [all_outputs]
#read_sdc scripts/rca_clock.sdc

set_max_area 0
compile_ultra

set resultdir "./results_shift_register_vlasis"
#set postfix "compile_ultra"
set postfix "compile"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.${clk_period}.rpt
report_qor > $resultdir/qor_report.${postfix}.${clk_period}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.${clk_period}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.${clk_period}.rpt

write -hierarchy -format verilog -output $resultdir/shift_register_compiled.${postfix}.${clk_period}.v

gui_start
