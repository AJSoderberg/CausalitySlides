* Project: Undergraduate Research Group
* Created on: 5 September 2022
* Created by: lirr
* Edited by: lirr
* Last edited: 5 September 2022
* Stata v.17.0

* does
	* Stata examples for the slides

* assumes
	* you are using stata

* TO DO:
	* all


*************************************************************************
**# 0 - setup
*************************************************************************

* load data from system
	sysuse			auto.dta
	
	
*************************************************************************
**# 1 - Describe Data
*************************************************************************	
	
	
* describe data
	sysdescribe		auto.dta

* using tab function
	tab				mpg
	tab				turn
	
	
