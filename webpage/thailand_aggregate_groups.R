

#######################################################
################### GCAM groups #######################
#######################################################

# enduse sectors
building_group <- c("comm cooling", "comm heating", "comm others", "resid cooling", "resid heating", "resid others")
transport_group <- c("trn_aviation_intl", "trn_freight", "trn_freight_road", "trn_pass", "trn_pass_road", "trn_pass_road_LDV", "trn_pass_road_LDV_4W", "trn_shipping_intl", "H2 forecourt production")
industry_group <- c("industry", "industrial energy use", "industrial feedstocks", "cement", "process heat cement", "N fertilizer", "H2 central production", "refining",   "industrial processes",  "gas processing", "unconventional oil production", "iron and steel", "alumina", "aluminum", "chemical", "chemical energy use", "chemical feedstocks", "construction", "construction energy use", "construction feedstocks", "mining energy use", "agricultural energy use")
industry_group2 <- c("industrial energy use")

elec_combustion_group <- c("elec_biomass (conv CCS)", "elec_biomass (conv)", "elec_biomass (IGCC CCS)","elec_biomass (IGCC)", "elec_coal (conv pul CCS)", "elec_coal (conv pul)","elec_coal (IGCC CCS)","elec_coal (IGCC)", "elec_gas (CC CCS)","elec_gas (CC)","elec_gas (steam/CT)", "elec_refined liquids (CC CCS)","elec_refined liquids (CC)","elec_refined liquids (steam/CT)")
elec_group <- c(elec_combustion_group, "electricity", "backup_electricity", "csp_backup", "electricity_net_ownuse")
ag_group <- c("Corn", "FiberCrop", "FodderGrass", "MiscCrop", "OilCrop", "OtherGrain", "PalmFruit", "Rice", "RootTuber", "SugarCrop", "Wheat", "Beef", "Dairy", "Pork", "Poultry", "SheepGoat", "FodderHerb")
other_group <- c("urban processes", "UnmanagedLand", "biomass", "regional biomass", "regional biomassOil", "gas pipeline", "regional corn for ethanol", "regional sugar for ethanol", "district heat")

# buildings
comm_group <- c("comm cooling", "comm heating", "comm others")
resid_group <- c("resid cooling", "resid heating", "resid others")
biomass_group <- c("delivered biomass", "traditional biomass")
electricity_group <- c("elect_td_build")
liquids_group <- c("refined liquids enduse")
gas_group <- c("delivered gas")

# transportation modes
road_group <- c("2W and 3W", "Car", "Large Car and Truck", "Medium truck", "road", "4W", "Cycle", "Mini Car", "Bus", "Heavy truck", "Light truck", "LDV", "Walk")
rail_group <- c("HSR", "Freight Rail", "Passenger Rail")
ship_group <- c("Domestic Ship", "International Ship")
air_group <- c("International Aviation", "Domestic Aviation")


#######################################################
################### Local groups ######################
#######################################################

# fuel types
coal_group_local <- c("coal", "lignite")
electricity_group_local <- c("electricity")
gas_group_local <- c("natural_gas_industry_energy", "natural_gas_industry_other")
liquids_group_local <- c("petroleum_premium", "petroleum_regular", "kerosene", "diesel", "liquefied_petroleum_gas", "petroleum_JP", "oil_fuel")

# electricity consumption sectors
building_group_local <- c("Residential", "Business", "Government and Non-Profit(1)", "trade", "residential")
industry_group_local <- c("Industrial", "Agriculture", "industry", "agriculture")
other_group_local <- c("Other", "Free of Charge")
transport_group_local <- c("transport")


