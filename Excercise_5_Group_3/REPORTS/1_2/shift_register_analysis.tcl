read_verilog ./shift_register_compile.200.v
link_design

set power_enable_analysis TRUE

set resultdir "./analysis_shift_register"
set postfix "shift_register_final"
exec mkdir -p -- $resultdir
read_fsdb -strip_path shift_register_tb/DUT shift_register.fsdb
update_power
report_power > $resultdir/${postfix}.power_report.rpt

exit