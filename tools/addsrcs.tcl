#########################################################################
#
#  addsrcs - add sources
#  
#  includes all source and constraint files in their respective filesets 
#########################################################################

# ---------- TO FIX: USAGE, INPUT SELECT AND HELP --------------

## usage

# proc Usage {} { print << "END"

# usage: $Program [-o <ofile>] <ifile(s)>
#   -u: print usage statement.
#   -h: print help statement.;
#   -o <file>: output file, default is stdout.
#   <file>: input file
# }

# ## help

# proc Help { print << 'END'
# END
# }

# # Create the project in the current directory
# create_project $project_name ./$project_name -part $part

# Add design and tb source files
set all_src_files [glob -nocomplain ./vsrc/*.v]
set des_src_files [lsearch -all -inline -not -glob $all_src_files *_tb.v]

add_files [glob $des_src_files]
add_files -fileset sim_1 [glob ./vsrc/*_tb.v]

# Add constraint files (XDC/SDC)
add_files -fileset constrs_1 [glob ./constr/*.xdc]

# Update the compile order
update_compile_order -fileset sources_1
