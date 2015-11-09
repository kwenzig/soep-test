set more off
capture log close

/*

author: Marius Pahl
date: 01.11.2015

aim: Append datasets in long format
Steps:
1. Copy data from the folder output in cleaning in the input folder in long
2. Append datasets from same questionnaires (a,b and c)
3. ...
4. Save appended data in output

*/

// 1. Copy data from the folder output in cleaning in the input folder in long

local cleaning_outputfilelist : dir "${cleaning_output}" files "*.dta"

foreach filename of local cleaning_outputfilelist {
  use ${cleaning_output}/`filename'
  save ${long_input}/`filename', replace
  clear
}


// 2. Append datasets from same questionnaires (a,b and c)

local long_inputfilelist : dir "${long_input}" files "*.dta"

foreach filename of local long_inputfilelist {
  use ${long_input}/`filename'
  // ...
  save ${long_temp}/`filename', replace
  clear
}


// 3. ...

local long_tempfilelist : dir "${long_temp}" files "*.dta"

/*
foreach filename of local long_tempfilelist {
  use ${long_temp}/`filename'
  // ...
  save ${long_temp}/`filename', replace
  clear
}
*/


// 5. Save cleaned data in output

foreach filename of local long_tempfilelist {
  use ${long_temp}/`filename'
  save ${long_output}/`filename', replace
  clear
}
