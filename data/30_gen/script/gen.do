set more off
capture log close

/*

author: Marius Pahl
date: 01.11.2015

aim: Generate variables
Steps:
1. Copy data from the folder output in long in the input folder in gen
2. Generate variables
3. ...
4. Save generated data in output

*/

// 1. Copy data from the folder output in long in the input folder in gen

local long_outputfilelist : dir "${long_output}" files "*.dta"

foreach filename of local long_outputfilelist {
  use ${long_output}/`filename'
  save ${gen_input}/`filename', replace
  clear
}


// 2. Generate variables

local gen_inputfilelist : dir "${gen_input}" files "*.dta"

foreach filename of local gen_inputfilelist {
  use ${gen_input}/`filename'
  // ...
  save ${gen_temp}/`filename', replace
  clear
}


// 3. ...

local gen_tempfilelist : dir "${gen_temp}" files "*.dta"

/*
foreach filename of local gen_tempfilelist {
  use ${gen_temp}/`filename'
  // ...
  save ${gen_temp}/`filename', replace
  clear
}
*/


// 4. Save generated data in output

foreach filename of local gen_tempfilelist {
  use ${gen_temp}/`filename'
  save ${gen_output}/`filename', replace
  clear
}
