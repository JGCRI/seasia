<!-- badges: start --> 
[![docs](https://github.com/JGCRI/seasia/actions/workflows/docs.yaml/badge.svg?branch=main)](https://github.com/JGCRI/seasia/actions/workflows/docs.yaml)
<!-- badges: end -->

# SEAsia
Repository for the SE Asia project data. This repo includes literature, raw data, style template, processing scripts, etc.
It also hosts the output data in a repository webpage.

# Policies

## [Thailand Policies](https://github.com/jgcri/seasia/tree/main/inst/policies/Thailand)

## [Vietnam Policies](https://github.com/jgcri/seasia/tree/main/inst/policies/Vietnam)

## [Malaysia Policies](https://github.com/jgcri/seasia/tree/main/inst/policies/Malaysia)

# GCAM implementation 

Table 1: [GCAM implementation](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/transportation/transportation_policies_guide.txt) of Vietnam's transportation policies
|Scenario | Policy  | GCAM translation |Input xml|
|---------|--------|---------|-----|
|National Policy|Vehicle Emissions Standards| 1) Euro 3 (2 and 3W) and Euro 4 (passenger and freight road transport) emissions standards (starting 2020) for NO<sub>x</sub>, CO, BC, and OC |[ref_vietnam_emission_standards.xml](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/transportation/ref_vietnam_emission_standards.xml) |
|National Policy|Biofuels Fuel Standard| 1) Increase in the share biomass liquids in refined liquids enduse (from 5% in 2020 to 25% in 2050) |[biofuelcredit_entransform.xml](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/transportation/biofuelcredit_entransform.xml) [biofuelcredit_endist.xml](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/transportation/biofuelcredit_endist.xml) [biofuel_policy.xml](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/transportation/biofuel_policy.xml)|
|Sustainable Development|Electric Vehicles Subsidies| 1) BEV Cost parity by 2035 for trn_pass_road_LDV_4W subsectors and 2 and 3W 2) BEV Cost parity by 2045 for trn_freight_road subsectors|[vietnam_EV_subsidies.xml](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/transportation/vietnam_EV_subsidies.xml) |
|Sustainable Development|Fuel Economy Standards| 1) European Union CO<sub>2</sub> emissions regulation (2025-2035) for LDV_4W, Truck (0-2t) and Truck (2-5t) UCD subsectors |[transportation_UCD_CORE_FE_Stndrds.xml](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/transportation/transportation_UCD_CORE_FE_Stndrds.xml) |
|Sustainable Development|Vehicle Emissions Standards| 1) Euro 5 (2 and 3W) and Euro 6 (passenger and freight road transport) emissions standards (starting 2020) for NO<sub>x</sub>, CO, BC, and OC |[sd_vietnam_emission_standards.xml](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/transportation/sd_vietnam_emission_standards.xml) |
|Sustainable Developent|Modal Shift| | |

Table 2: GCAM implementation of Vietnam's Industry policies
|Scenario | Policy  | GCAM translation |Input xml|
|---------|--------|---------|-----|
|National Policy|Energy Efficiency Improvements|1) Obtain the autonomous energy efficiency improvement (AEEI) values (%/year) corresponding to Viet Nam's national policy|[agg_industry_aeei_vnm_hi.xml](https://github.com/jgcri/seasia/blob/main/inst/policies/Vietnam/xmls/industry)|

# Contributing Models 

Table 2: Model repository and DOI links.
| Model  | Version |Branch| Repository Link | DOI |
|--------|---------|------|-----------------|-----|
|GCAM|<v5.3>|Southeast Asia|https://stash.pnnl.gov/projects/JGCRI/repos/gcam-core/browse?at=refs%2Fheads%2Fsha%2Ffeature%2Fsoutheast-asia | | |


# Local Data Source 
Table 3: Local Data 
| Country  	| Description | Source        | Directory     |   	
|-----------|-------------|---------------|---------------|
|           |           	|       	      |     	        |             	
|           |           	|       	      |     	        |             	
|           |           	|       	      |     	        |             	

# Input Data 

Table 4: Input data for each model and DOI links.
| Input Data Category  	| Model 	| DOI 	| Description 	|   	|
|----------------------	|-------	|-----	|--------------	|---	|
|                      	|       	|     	|             	|   	|
|                      	|       	|     	|             	|   	|

# Output Data 

Table 5: DOI links for model outputs. 
| Data | Type | URL | 
|-------|--------|-----|
|GCAM 5.3 - Southeast Asia Reference Run|basex database|/pic/projects/GCAM/Molly/wrk/southeast-asia/output|
|GCAM 5.3 - Southeast Asia Reference Run|.proj file|https://github.com/jgcri/seasia/blob/main/inst/output%20data/4-14_merged_seasia|


# Reproduce Experiment 

## Reproduce Diagnostic Figures
1. Clone repository. 
```
git clone https://github.com/sypnl/SEAsia.git
```
2. Download output database from: /pic/projects/GCAM/Molly/wrk/southeast-asia/output
3. Add the downloaded files to the `SEAsia/output data` folder.
4. Generate diagnostics by running master.R in the SEAsia/src folder. Make sure to change the home directory to the path on your computer (Line 29 in master.R).
```
cd ./SEASIA/src
# Change home_dir on line 29 in master.R
source(master.R)
```

Note: Figures are already included in the figures folder. If you would like to generate your own figures, delete contents of the figures folder before running master.R. 

## Reproduce Scenario Figures 

