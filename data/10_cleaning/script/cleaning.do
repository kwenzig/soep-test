set more off
capture log close

/*

author: Marius Pahl
date: 01.11.2015

aim: Cleaning the raw data from the folder raw.
Steps:
1. Copy the data from the folder raw in the input folder in cleaning
2. Edit the varnames in the datasets
3. Delete outliers
4. ...
5. Save cleaned data in output

*/

// 1. Copy the data from the folder raw in the input folder in cleaning

local rawfilelist : dir "${raw}" files "*.dta"

foreach filename of local rawfilelist {
  use ${raw}/`filename'
  save ${cleaning_input}/`filename', replace
  clear
}


// 2. Edit the varnames in the datasets

local cleaning_inputfilelist : dir "${cleaning_input}" files "*.dta"

foreach filename of local cleaning_inputfilelist {
  use ${cleaning_input}/`filename'
  // ...
  save ${cleaning_temp}/`filename', replace
  clear
}


// 3. Delete outliers

local cleaning_tempfilelist : dir "${cleaning_temp}" files "*.dta"

foreach filename of local cleaning_tempfilelist {
  use ${cleaning_temp}/`filename'
  // ...
  save ${cleaning_temp}/`filename', replace
  clear
}


// 4. ...

/*
foreach filename of local cleaning_tempfilelist {
  use ${cleaning_temp}/`filename'
  // ...
  save ${cleaning_temp}/`filename', replace
  clear
}
*/


// 5. Save cleaned data in output

foreach filename of local cleaning_tempfilelist {
  use ${cleaning_temp}/`filename'
  save ${cleaning_output}/`filename', replace
  clear
}
