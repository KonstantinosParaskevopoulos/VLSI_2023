set DESIGN_NAME alu

analyze -format verilog {./src/alu.v}
elaborate $DESIGN_NAME

link
check_design

set delay 200
set_max_delay $delay -from [all_inputs] -to [all_outputs]
set_max_area 0

compile_ultra

set resultdir "./results_alu_plus_Power_Analysis"
set postfix "compile_ultra"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.${delay}.rpt
report_qor > $resultdir/qor_report.${postfix}.${delay}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.${delay}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.${delay}.rpt

write -hierarchy -format verilog -output $resultdir/alu_compiled.${postfix}.${delay}.v

write_sdf $resultdir/alu_compiled.${postfix}.${delay}.sdf
gui_start
