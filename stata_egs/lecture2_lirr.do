* Project: Undergraduate Research Group
* Created on: 23 September 2022
* Created by: lirr
* Edited by: lirr
* Last edited: 23 September 2022
* Stata v.17.0

* does
	* examples from lecture 2

* assumes
	* you are using stata
	* assumes you have causality ssc package

* TO DO:
	* all

*************************************************************************
**# 0 - setup
*************************************************************************

* this line installs causal data if you do not have it
	*ssc install		causaldata

* set log filepath

	global		logout	"$output/logs"
	
* open log
	cap log 		close
	log using		"$logout/Lecture_02", append	
	
* loads data for examples
sysuse Mroz.dta, clear
		*** obs == 753		
	
*************************************************************************
**# 1 - select working women
*************************************************************************

* keep observations that are working women
	keep if			lfp == 1
		*** obs == 428
		
* generate unlogged wage variable
	gen				earn = exp(lwg)
	
* drop obs with no income
	drop if			inc <0
		*** obs == 427
		
		
*************************************************************************
**# 2 - generat figures
*************************************************************************

* create scatterplot of income and earn
	twoway scatter	inc earn
		
	
*************************************************************************
**#  - end matters
*************************************************************************

* close the log
	log				close