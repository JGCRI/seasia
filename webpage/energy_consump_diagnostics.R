# read in and process gcam data
gcam_final_energy <- process_gcam_data(
  read.csv("../data/Thailand/scenario_outputs/initial_diagnostics/queryoutall_final_energy_consump_fuel_sector.csv", skip = 1, check.names = F),
  processed = F
)


gcam_final_energy %>%
  filter(sector == "industrial feedstocks",
         scenario == "Ref", region == "Thailand") %>%
  ggplot(aes(x = year, y = value, fill = input)) +
  geom_bar(stat = "identity", position = "stack")


gcam_final_energy %>%
  filter(input %in% c("refined liquids", "gas"),
         scenario == "Ref", region == "Thailand",
         sector %in% c("industrial energy use", "industrial feedstocks",
                       "N fertilizer", "process heat cement")) %>%
  ggplot(aes(x = year, y = value, fill = sector)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_wrap(~input, scales = "free")


### Ref plots without feedstocks ###

energy_no_feedstocks <- gcam_final_energy %>%
  filter(sector != "industrial feedstocks")

sector_no_feedstocks <- process_gcam_data(
  energy_no_feedstocks, processed = T, sector, input
)

fuel_no_feedstocks <- process_gcam_data(
  energy_no_feedstocks, processed = T, input, sector
)


# aggregate gcam sectors
no_feed_agg_sector <- dplyr::bind_rows(
  aggregate_rows(sector_no_feedstocks, class, "industry", industry_group),
  aggregate_rows(sector_no_feedstocks, class, "buildings", building_group),
  aggregate_rows(sector_no_feedstocks, class, "transport", transport_group),
)

no_feed_agg_fuel <- dplyr::bind_rows(
  aggregate_rows(fuel_no_feedstocks, class, "coal", coal_group),
  aggregate_rows(fuel_no_feedstocks, class, "gas", gas_group),
  aggregate_rows(fuel_no_feedstocks, class, "biomass", biomass_group),
  aggregate_rows(fuel_no_feedstocks, class, "electricity", elec_fuel_group),
  aggregate_rows(fuel_no_feedstocks, class, "refined liquids", liquids_group)
)

# combine with local data
no_feed_all_sector <- dplyr::bind_rows(
  local_national_final_energy_sector_agg, no_feed_agg_sector
)

no_feed_all_fuel <- dplyr::bind_rows(
  local_national_final_energy_fuel_agg, no_feed_agg_fuel
)



# plot

no_feed_all_sector_plots <- rchart::chart(filter(no_feed_all_sector, year == 2015),
                                          save = F)
no_feed_all_sector_plots$chart_class_Thailand +
  ylab("Energy (EJ)") +
  ggplot2::ggtitle("")


no_feed_all_fuel_plots <- rchart::chart(filter(no_feed_all_fuel,
                                               year %% 5 == 0,
                                               year > 2000, year < 2025),
                                          save = F)

no_feed_all_fuel <- no_feed_all_fuel_plots$chart_class_Thailand +
  ylab("Energy (EJ)") +
  ggplot2::ggtitle("")



############ all fuels, agg sector ###########


# aggregate gcam sectors
energy_agg_sector <- dplyr::bind_rows(
  aggregate_rows(gcam_final_energy, sector, "industry", industry_group),
  aggregate_rows(gcam_final_energy, sector, "buildings", building_group),
  aggregate_rows(gcam_final_energy, sector, "transport", transport_group),
)


biomass_by_agg_sector_plots <- rchart::chart(
  rename(
    filter(energy_agg_sector, input == "biomass"),
    class = sector),
  save = F
)

biomass_by_agg_sector_plots$chart_class_Thailand

biomass_by_sector_plots <- rchart::chart(
  rename(
    filter(gcam_final_energy, input %in% c("biomass", "traditional biomass"),
           year %% 5 == 0, year > 2000, year < 2025),
    class = sector),
  save = F
)

biomass_by_sector_plots$chart_class_Thailand


