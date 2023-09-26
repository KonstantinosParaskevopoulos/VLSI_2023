set DESIGN_NAME shift_register

analyze -format verilog {./src/shift_register.v}
elaborate $DESIGN_NAME

link
check_design

set delay 75
set_max_delay $delay -from [all_inputs] -to [all_outputs]
set_max_area 0

compile_ultra

set resultdir "./results_shift_register_vlasis"
set postfix "compile"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.${delay}.rpt
report_qor > $resultdir/qor_report.${postfix}.${delay}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.${delay}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.${delay}.rpt

write -hierarchy -format verilog -output $resultdir/decoder_${postfix}.${delay}.v
write_sdf $resultdir/shift_register_${postfix}.${delay}.sdf

write -hierarchy -format verilog -output decoder_${postfix}.${delay}.v

quit