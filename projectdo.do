	* Project: 
* Created on: September 2022
* Created by: Andrew Soderberg
* Stata v.17.0

* does
	

* assumes
	* has access to causaldata 

* TO DO


************************************************************************
**# 0 - setup
***********************************************************************
	   
* define paths 
	global 			code 		"C:/Users/andre/git/CausalitySlides"
	global 			data 		"G:/My Drive/LSMS/raw"
	global			output		"G:/My Drive/LSMS/refined" 
	   
* load data 
	use			"$data/lsms_panel.dta" , clear

************************************************************************
**# 1 - data exploration 
************************************************************************
* tabing vars to find balance in the data 
	
 * find out consumer basket for crops 
	tab ac_staple_def
* find only Malawi and UG answered 
	tab ac_staple_def country 
* maize is a big crop in both countries 
	 tab country ac_maize
	 tab country ac_maize_need
	 tab ac_maize_why
* cassava Found only in Nigeria 
	tab ac_cass country
	tab ac_cass_need country 
	tab ac_cass_pr country
* Rice also only found in Nieria 
	tab ac_rice country
	tab ac_rice_need country 
	tab ac_rice_pr country

************************************************************************
**# 1 - data prep
************************************************************************
* summarize and describe variables 
	summarize fies_percent ac_staple asst_food shock_12
	
* set as panel  
	* note data is set based on hhid how do I have it based on individuals within a country 
	xtset hhid wave 
	xtdescribe 
	xtsum hhid wave country p_sev ac_staple shock_12 asst_food
************************************************************************
**# 2 - Regression Exploration 
************************************************************************

	regress p_sev ac_staple

	regress p_sev shock_12
	
	regress p_sev asst_food

	regress p_sev asst_food

	regress fies_percent i. ac_staple i. shock_12 i. asst_food i. sector 

	regress fies_percent i. ac_staple i. shock_12 i. asst_food i. sector if country == 3
	
	
* regression on a country level 
* Uganda 
	regress fies_percent ac_maize ac_rice ac_beans if country == 4
	
* Nigeria Specific 
	keep if country == 3
	
* double check for data present in NG 
	 tab ac_rice wave if country == 3
	 // waves 1, 3, 9 
	 tab ac_cass wave if country == 3
	 // waves 1, 3, 9
	  tab ac_beans wave if country == 3
	  // waves 1, 3, 9 
	  
* food basket regression 
	regress fies_percent ac_staple
	
	regress fies_percent i.ac_rice i.ac_cass i.ac_beans if country ==3
	// omitted because of collinearity 

* cross country 
	reg fies_count i. asst_any  i.asst_any##i.ac_staple

* did regression 
	didreg (fies_count) (ac_staple), group(country) time(wave)
	//treatment variable varies at the country wave level For example, if state and year are your group() and time() variables and you have individual-level data, all individuals in the state in a given year should have the same treatment. Your data do not fulfill this requirement.

	
* set as panel 
	xtset hhid wave
	
* take first difference 
	gen dfies_percent=d.fies_percent
	gen dac_staple =d.ac_staple
	reg  dfies_percent dac_staple 
	
* event study regresion using eventdd 
* install eventdd
	ssc install eventdd 
* gen waves so that the event wave = 0 

* event study using general OLS 
* create a pre and post covid dummy 
	gen 			post 		if wave > 1 
	replace		post = 0 	if post == .
* OLS reg 
	reg fies_count i.post i.ac_staple 
	reg fies_count i.post i.ac_staple i.shock_12 
	reg fies_count i.post i.ac_staple i. shock_12 i.asst_food
	reg fies_count i.post##i.ac_staple i. shock_12 i.asst_food
	