set projDir "C:/Users/x-cla/Documents/mojo/withtimer/work/planAhead"
set projName "withtimer"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/mojo_top_0.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/user_input_1.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/to_led_2.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/to_led_2.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/bin_to_dec_4.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/alu_5.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/reset_conditioner_6.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_press_7.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_press_7.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_press_7.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_press_7.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_press_7.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_press_7.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/randomnum_13.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/timer_14.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/multi_seven_seg_15.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/adder_16.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/compare_17.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/edge_detector_18.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_conditioner_19.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/edge_detector_18.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_conditioner_19.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/edge_detector_18.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_conditioner_19.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/edge_detector_18.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_conditioner_19.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/edge_detector_18.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_conditioner_19.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/edge_detector_18.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/button_conditioner_19.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/pn_gen_30.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/edge_detector_31.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/counter_32.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/counter_33.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/seven_seg_34.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/decoder_35.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/pipeline_36.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/pipeline_36.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/pipeline_36.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/pipeline_36.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/pipeline_36.v" "C:/Users/x-cla/Documents/mojo/withtimer/work/verilog/pipeline_36.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/x-cla/Documents/mojo/withtimer/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
