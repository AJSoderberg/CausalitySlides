* Project: Undergraduate Research Group
* Created on: 5 September 2022
* Created by: lirr
* Edited by: lirr
* Last edited: 14 September 2022
* Stata v.17.0

* does
	* Stata examples for the slides

* assumes
	* you are using stata
	* markstat user package

* TO DO:
	* all


*************************************************************************
**# 0 - setup
*************************************************************************

* define
	global	input = "$data/analysis/food_security"
	
	
	
	
*************************************************************************
**# 1 - Describe Data
*************************************************************************	


* Discrete Distributions slide
	
* read in data
	use				"$input/fies_reg_data", replace

* count table	
	tab				sexhh
	
	tab				fsi
	
* histogram of fies count variable
	histogram		fsi, percent
	
* histogram of std_fsi variable (it is continuous)
	histogram		std_fsi, bin(5)
	
	histogram		std_fsi, bin(10)
	
	histogram		std_fsi, bin(100)
	
	kdensity std_fsi, bwidth(.75) normal
	
	