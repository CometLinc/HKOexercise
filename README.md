# HKOexercise
## Table of content
- [Introduction](#introduction)
- [Repository Structure And Description](#repository-structure-and-description)

## Introduction 
This repository is for the testing script of HKO open data API, to run the testing script, user has to install robot-framework, docker on local environment.

## Repository Structure And Description
|Structure|Description |
|--|--|
|.exo-robot-runner| A configuration setting file for automation tool to know the definition of each folder and file in docker|
| api | A folder includes all API test cases, keywords and resources |
| lib | A folder includes all robot keyword files |
| integration | A folder includes all robot test case files |
| res | A folder includes all resource references. E.g. schema definition and error message...etc|
| init.robot | All the resources that used in the test suite |
| setting.py | A file for the global variable definition and value. E.g. Authorization information, Host URL and some API default value  |
