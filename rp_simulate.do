# Run the testbench
do ../../uvvm_util/script/compile_src.do
do ../../uvvm_vvc_framework/script/compile_src.do
do ../script/compile_src.do

vlib ../sim/bitvis_vip_axistream
vmap bitvis_vip_axistream ../sim/bitvis_vip_axistream

# TB
eval vcom -2008 -nowarn COMP96_0564 -nowarn COMP96_0048 -dbg -work bitvis_vip_axistream ../internal_tb/axis_fifo.vhd
eval vcom -2008 -nowarn COMP96_0564 -nowarn COMP96_0048 -dbg -work bitvis_vip_axistream ../internal_tb/axistream_th.vhd
eval vcom -2008 -nowarn COMP96_0564 -nowarn COMP96_0048 -dbg -work bitvis_vip_axistream ../internal_tb/axistream_vvc_no_vunit_tb.vhd

# simulate
asim -t 0 -gGC_DATA_WIDTH=8 -gGC_USER_WIDTH=2 -gGC_ID_WIDTH=1 -gGC_DEST_WIDTH=1 -dataset {C:/Bitvis/UVVM/bitvis_vip_axistream/sim} -datasetname {sim} bitvis_vip_axistream.axistream_vvc_simple_tb
run -all




#asim -t 0 -gGC_DATA_WIDTH=8 -gGC_USER_WIDTH=2 -gGC_ID_WIDTH=2 -gGC_DEST_WIDTH=2 -dataset {C:/Bitvis/UVVM/bitvis_vip_axistream/sim} -datasetname {sim} bitvis_vip_axistream.axis_fifo bitvis_vip_axistream.axistream_vvc bitvis_vip_axistream.axistream_vvc_simple_tb bitvis_vip_axistream.test_harness
#vsim bitvis_vip_axistream.axistream_vvc_no_vunit_tb
#vsim -t 1ps -L bitvis_vip_axistream ../internal_tb/axistream_vvc_no_vunit_tb.vhd
#asim  -pedanticerrors -gGC_DATA_WIDTH=8 -gGC_USER_WIDTH=2 -gGC_ID_WIDTH=2 -gGC_DEST_WIDTH=2 -nocollapse bitvis_vip_axistream.axistream_vvc_simple_tb
#vsim -L bitvis_vip_axistream axistream_vvc_no_vunit_tb
#eval vcom -2008 -nowarn COMP96_0564 -nowarn COMP96_0048 -dbg -work bitvis_vip_axistream axistream_vvc_no_vunit_tb
#add log -r /*

