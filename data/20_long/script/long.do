set more off
capture log close

/*

author: Marius Pahl
date: 01.11.2015

aim: Append datasets in long format
Steps:
1. Copy data from the folder output in cleaning in the input folder in long
2. Generate new variable wave
3. Append datasets from same questionnaires (a,b and c) and save in output

*/

// 1. Copy data from the folder output in cleaning in the input folder in long

local cleaning_outputfilelist : dir "${cleaning_output}" files "*.dta"

foreach filename of local cleaning_outputfilelist {
  use ${cleaning_output}/`filename'
  save ${long_input}/`filename', replace
  clear
}


// 2. Generate new variable wave

local long_inputfilelist : dir "${long_input}" files "*.dta"

foreach filename of local long_inputfilelist {
  use ${long_input}/`filename'
  local wave_name = substr("`filename'", 1, 1)
  gen wave = "`wave_name'"
  save ${long_temp}/`filename', replace
  clear
}


// 3. Append datasets from same questionnaires (a,b and c) and save in output

local long_tempfilelist : dir "${long_temp}" files "*.dta"
local long_tempfilelist_a : dir "${long_temp}" files "a*.dta"

foreach file_a of local long_tempfilelist_a {
  use ${long_temp}/`file_a'
  foreach file_all of local long_tempfilelist {
    if (substr("`file_a'", 2, .) == substr("`file_all'", 2, .) & "`file_a'" != "`file_all'") {
      append using ${long_temp}/`file_all'
	}
  }
  local newname = substr("`file_a'", 2, .)
  save ${long_output}/`newname', replace
  clear
}
