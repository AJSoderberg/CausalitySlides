* Project: Causality Slides
* Created on: 12 September 2022
* Created by: lirr
* Stata v.17.0

* does
	* establishes an identical workspace between users
	* sets globals that define absolute paths
	* serves as the starting point to find any do-file, dataset or output
	* loads any user written packages needed for analysis

* assumes
	* access to all data and code
	* access to cleaned data produced by https://github.com/AIDELabAZ/wb_covid

* TO DO:
	* check packages used


************************************************************************
**# 0 - setup
************************************************************************

* set $pack to 0 to skip package installation
	global 			pack 	0
		
* Specify Stata version in use
    global stataVersion 17.0    // set Stata version
    version $stataVersion

	
************************************************************************
**# 0 (a) - Create user specific paths
************************************************************************


* Define root folder globals
	
	if `"`c(username)'"' == "lirro" {
		global 		code  	"C:/Users/lirro/Documents/GitHub/wb_covid"
		global 		data	"G:/.shortcut-targets-by-id/1wmQb8xn5Qop-2J14D7Z2rdKxJhcwfP_q/wb_covid/data"
		global 		output  "C:/Users/lirro/Documents/GitHub/CausalitySlides/stata_egs"
	}

	
************************************************************************
**# 0 (b) - Check if any required packages are installed:
************************************************************************

* install packages if global is set to 1
if $pack == 1 {
	
	* for packages/commands, make a local containing any required packages
		loc userpack "blindschemes estout palettes colrspace carryforward markstat" 
	
	* install packages that are on ssc	
		foreach package in `userpack' {
			capture : which `package', all
			if (_rc) {
				capture window stopbox rusure "You are missing some packages." "Do you want to install `package'?"
				if _rc == 0 {
					capture ssc install `package', replace
					if (_rc) {
						window stopbox rusure `"This package is not on SSC. Do you want to proceed without it?"'
					}
				}
				else {
					exit 199
				}
			}
		}

	* install -xfill- package
		net install xfill, replace from(https://www.sealedenvelope.com/)
	
	* update all ado files
		ado update, update

	* set graph and Stata preferences
		set scheme plotplain, perm
		set more off
}


************************************************************************
**# 1 - run household data cleaning .do file
************************************************************************

* run do files for each country (takes a little while to run)
	run				"$code/ethiopia/eth_fies_0"
	run 			"$code/malawi/mwi_fies_0"
	run				"$code/nigeria/nga_fies_pp0"
	run				"$code/nigeria/nga_fies_ph0"
	run 			"$code/burkina_faso/bf_fies_0"
	
	
************************************************************************
**# 2 - run final cleaning and analysis .do files
************************************************************************

	run				"$code/analysis/pnl_cleaning_fies.do"
	run				"$code/analysis/figures/desc_figs.do"
	run				"$code/analysis/fies_regs"

	
/* END */