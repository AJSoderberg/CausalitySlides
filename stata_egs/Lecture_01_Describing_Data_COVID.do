* Project: Undergraduate Research Group
* Created on: 14 September 2022
* Created by: lirr
* Edited by: lirr
* Last edited: 14 September 2022
* Stata v.17.0

* does
	* Stata Markdown

* assumes
	* access to covid food security github repo
	* markstat user package

* TO DO:
	* all

*************************************************************************
**# 0 - setup
*************************************************************************

* define
	global	input = "$data/analysis/food_security"
	global	logout = "$output/logs"
	
* open log
	cap log 		close
	log using		"$logout/Lecture_01", append
	

*************************************************************************
**# 1 - Lesson 1 Presentation
*************************************************************************	

% Lecture 1: Describing Data
% Lorin Rudin-Rush
% 16 September


## Causality

- This class is about causality
- Welcome!
- This class exists to answer one question: *how can we use statistics figure out how $X$ causes $Y$?*
- It's a short question but an extremely difficult one

## This Class

- We'll be covering the purpose of statistical research and how it works
- Then the concepts underlying causality and research design
- And then some standard research designs for uncovering causality in observational data

## Housekeeping

- Let's go over the syllabus and projects!
- The textbook: The Effect

## This Week

- We'll be discussion how we *describe variables* and *describe relationships*
- With a bit of an R reminder
- We'll cover a bit of regression review, but...!
- This class is much more concerned with *design* than any particular estimator. *How is the data utilized?*
- Regression is *one way* of doing this stuff, but regression is only one implementation. So we won't be solely focusing on it

## This Week

- We'll start with ways of discussing how we can *describe variables*
- And then move on to ways of discussing how we can *describe relationships*
- Secretly, pretty much all statistical analysis is just about doing one of those two things
- *Causal* analysis is *purely* about *knowing exactly which variables and relationships to describe*

## Variables

- A statistical variable is a recorded observation, repeated many times
- "Number of calories I ate for breakfast this morning" is one observation
- "The number of calories I ate each breakfast in the past week" is a variable with seven observations

## The Distribution of a Variable

- Variables have *distributions*
- The distribution of a variable is simply the description of *how often each value of the variable comes up*
- So for example, the statement "10% of people are left-handed" is just a partial description of the distribution of the handedness variable. 
- If you observe a bunch of people and record what their dominant hand is, 10% of the time you'll write down "left-handed," 1% of the time you'll write down "ambidextrous," and 89% of the time you'll write down "right-handed." That's the full description of the distribution

## Looking Straight at a Distribution

- The distribution of a variable contains *everything we know* about that variable from empirical observation
- Any description we make will be a *summary* of that distribution
- So we may as well look at it directly!

## Distributions of Kinds of Variables

- There are two main kinds of variables for which the distributions look different: discrete and continuous
- Discrete variables take a finite set of values: left-handed, right-handed, ambidextrous. Or "lives in Seattle" vs. "Doesn't" or "Number of kids"
- Continuous variables take any value: income, height, KwH of electricity used each day
- (Sometimes, "ordinal" discrete variables with many values are treated as continuous for simplicity)


*************************************************************************
**# 2 - End Matters and save
*************************************************************************	

* save file
	save			"$output/Lecture_01_Describing_Data_COVID.stmd", replace
	
* close the log
	log				close