read_verilog ./rca_compile.200.v
link_design

set power_enable_analysis TRUE

set resultdir "./analysis_rca"
set postfix "rca_final"
exec mkdir -p -- $resultdir
read_fsdb -strip_path rca_tb/DUT rca.fsdb
update_power
report_power > $resultdir/${postfix}.power_report.rpt

exit