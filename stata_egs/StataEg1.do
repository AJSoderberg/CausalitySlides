* Project: Undergraduate Research Group
* Created on: 5 September 2022
* Created by: lirr
* Edited by: lirr
* Last edited: 16 September 2022
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

* define
	global	food = "$data/analysis/food_security"
	global	fig	= "C:/Users/lirro/Documents/GitHub/CausalitySlides"
	global	covid = "$data/analysis"
	
	
*************************************************************************
**# 1 - Describe Data
*************************************************************************	


* Discrete Distributions slide
	
* read in data
	*use				"$food/fies_reg_data", replace
	use				"$covid/lsms_panel.dta", replace

* count table	
	tab				sexhh
	
	tab				fsi
	
* histogram of fies count variable
	histogram		fsi, percent
	
* histogram of std_fsi variable (it is continuous)
	histogram		std_fsi, bin(5)
	
	histogram		std_fsi, bin(10)
	
	histogram		std_fsi, bin(100)
	
	kdensity 		std_fsi, bwidth(.75) normal
	
	_pctile			std_fsi, percentiles(10)
	local			p10 = r(r1)
	
	kdensity 		std_fsi, bwidth(.75) xline(`p10') normal //
						saving("$fig/kdpctfsi", replace)
	
	graph export	"$fig/kdpctfsi.jpg", as(jpg) replace
	
	
	