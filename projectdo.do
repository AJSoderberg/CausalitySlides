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
************************************************************************
* install package 
	ssc install causaldata   
	   
* define paths 
	global 			code 		"C:/Users/andre/git/CausalitySlides"
	global 			data 		"G:/My Drive/LSMS/raw"
	global			output		"G:/My Drive/LSMS/refined" 
	   
* load data 
	use			"$data/lsms_panel.dta" , clear

************************************************************************
**# 1 - data exploration 
************************************************************************
*tabing vars to find balance in the data 
	
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
	tab ax_cass_pr country
* Rice also only found in Nieria 
	tab ac_rice country
	tab ac_rice_need country 
	tab ax_rice_pr country
* swift refers to imports 
	tab swift_rice country


