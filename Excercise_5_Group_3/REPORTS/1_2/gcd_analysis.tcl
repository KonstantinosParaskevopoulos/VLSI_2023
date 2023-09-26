read_verilog ./gcd_compile.200.v
link_design

set power_enable_analysis TRUE

set resultdir "./results_GCD_syn_Power_Analysis"
set postfix "gcd_final"
exec mkdir -p -- $resultdir
read_fsdb -strip_path gcd_tb/DUT gcd.fsdb
update_power
report_power > $resultdir/${postfix}.power_report.rpt

exit