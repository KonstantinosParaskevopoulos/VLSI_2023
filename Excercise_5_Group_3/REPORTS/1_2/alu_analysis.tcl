read_verilog ./alu_compile.200.v
link_design

set power_enable_analysis TRUE

set resultdir "./results_alu_plus_Power_Analysis"
set postfix "alu_final"
exec mkdir -p -- $resultdir
read_fsdb -strip_path alu_tb/DUT alu.fsdb
update_power
report_power > $resultdir/${postfix}.power_report.rpt

exit