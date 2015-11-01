set more off
capture log close

/*

author: Marius Pahl
date: 01.11.2015

aim: Global execution file for all do-files of this project

*/

// Global all paths for the project
do pathway

// Cleaning process
do ${cleaning}main

// Long generation
do ${long}main
