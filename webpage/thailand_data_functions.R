

# convert to long format
elongate_year <- function(data){
  # remove all-na column
  not_all_na <- function(x) {!all(is.na(x))}
  data <- dplyr::select_if(data, not_all_na)
  # convert to long format
  data_long <- tidyr::pivot_longer(data,
                        cols = tidyr::starts_with(c("1", "2")),
                        names_to = "year",
                        values_to = "value")
  # make years and values numeric
  data_final <- dplyr::mutate(data_long,
                              year = as.numeric(year),
                              value = as.numeric(value))
  return(data_final)
}

# shorten scenario name (remove date portion)
shorten_scenarios <- function(data){
  dplyr::mutate(data, scenario = stringr::str_replace(
    scenario, ",.*", ""
  ))
}

# recode "Thailand" (non broken out) region as "National"
# and create aggregated all-of-Thailand and all-of-MEA-area regions
recode_regions <- function(data){
  # rename non-broken out region
  data_renamed <- dplyr::mutate(data,
                                region = stringr::str_replace(region, "^Thailand", "National"))

  # create aggregated Thailand region
  data_aggregated_Th <- dplyr::summarise(
    dplyr::group_by(data_renamed, dplyr::across(!c(region, value))),
    value = sum(value), region = "Thailand")

  # create aggregated MEA region
  data_aggregated_MEA <- dplyr::summarise(
    dplyr::group_by(
      dplyr::filter(data_renamed, region %in% c("Bangkok", "SamutPrakan", "Nonthaburi")),
      dplyr::across(!c(region, value))),
    value = sum(value), region = "MEA area"
  )

  # add aggregated region to data
  all_data <- dplyr::bind_rows(data_renamed, data_aggregated_Th, data_aggregated_MEA)

  return(all_data)
}


# Perform the three functions above to process query output data
# and optionally reduce data down to a single class (class_name),
# agreggating across other classes (...) for use in rchart
process_gcam_data <- function(data, class_name = NULL, ...){
  processed_data <- recode_regions(shorten_scenarios(elongate_year(data)))
  extra_classes <- dplyr::quos(...)
  class_name <- dplyr::enquo(class_name)
  if(!is.null(class_name)){
    # create aggregate data
    data_agg <- dplyr::summarise(
      dplyr::group_by(processed_data,
                      dplyr::across(!c(!!!extra_classes, value))),
      value = sum(value)
    )
    # rename class column
    processed_data <- dplyr::rename(
      data_agg, class = !!class_name
    )
  }
  return(processed_data)
}


# combine subsectors into new aggregated sectors
aggregate_rows <- function(data, filter_var, var_name, filter_group){
  filter_var <- dplyr::enquo(filter_var)
  filter_var_name <- dplyr::quo_name(filter_var)
  # filter data with var_name in filter_group
  data_filtered <- dplyr::filter(data, !!filter_var %in% filter_group)
  # create aggregate data
  data_agg <- dplyr::summarize(
    dplyr::group_by(data_filtered, dplyr::across(!(!!filter_var))),
    value = sum(value), !!filter_var_name := !!var_name
  )
  return(data_agg)
}




# # linearly interpolate gcam data between years
# all_years <- data.frame()
# for(r in c("Thailand", "Bangkok", "Nonthaburi",
#            "Samut Prakan", "Rest of Thailand", "National")){
#   for(s in unique(gcam_elec_consump$sector)){
#     years <- data.frame(year = seq(from = 1990, to = 2100, by = 1),
#                         region = r, sector = s, scenario = "Ref", Units = "EJ")
#     all_years <- rbind(all_years, years)
#   }
# }
#
# gcam_elec_consump_interp <- dplyr::mutate(
#   dplyr::group_by(
#     dplyr::full_join(
#       all_years, gcam_elec_consump),
#     region, sector, scenario, Units),
#   value = zoo::na.approx(value))
#
# dplyr::full_join(all_years, gcam_elec_consump) %>%
#   group_by(region, sector, scenario) %>%
#   mutate(value = na.approx(value))
