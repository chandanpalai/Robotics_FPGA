
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name pipesim -dir "D:/Documents/Studies/Semester 5/Honours project/FPGA codes/pipesim/planAhead_run_1" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Documents/Studies/Semester 5/Honours project/FPGA codes/pipesim/cell_matrix.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Documents/Studies/Semester 5/Honours project/FPGA codes/pipesim} {ipcore_dir} }
add_files [list {ipcore_dir/map_rom.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "constraints.ucf" [current_fileset -constrset]
add_files [list {constraints.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
