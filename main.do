clear
set more off
capture log close

/*

author: Marius Pahl
date: 01.11.2015

aim: Global execution file for all do-files of this project

*/

// Global all paths for the project
do pathway

// Clear all data folders (except 00_raw)
local folders $cleaning_input $cleaning_temp $cleaning_output $long_input $long_temp $long_output $gen_input $gen_temp $gen_output

foreach folder of local folders {
  local datafiles: dir "`folder'" files "*.dta"
  foreach datafile of local datafiles {
    rm `folder'`datafile'
  }
}

// Cleaning process
do ${cleaning}main

// Long generation
do ${long}main

// Generated variables
do ${gen}main
