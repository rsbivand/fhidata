#' Names of areas in Norway that existed in 2020.
#'
#' @format
#' \describe{
#' \item{municip_code}{Municipality code.}
#' \item{municip_name}{Municipality name.}
#' \item{county_code}{County code.}
#' \item{county_name}{County name.}
#' \item{region_code}{Region code.}
#' \item{region_name}{Region name.}
#' }
#' @source \url{https://no.wikipedia.org/wiki/Liste_over_norske_kommunenummer}
"norway_locations_b2020"

#' Names of areas in Norway that existed in 2019.
#'
#' @format
#' \describe{
#' \item{municip_code}{Municipality code.}
#' \item{municip_name}{Municipality name.}
#' \item{county_code}{County code.}
#' \item{county_name}{County name.}
#' \item{region_code}{Region code.}
#' \item{region_name}{Region name.}
#' }
#' @source \url{https://no.wikipedia.org/wiki/Liste_over_norske_kommunenummer}
"norway_locations_b2019"

# Creates the norway_locations data.table
gen_norway_locations <- function(x_year_end) {

  # variables used by data.table
  is_current <- NULL
  year_end <- NULL
  #

  norway_locations <- gen_norway_municip_merging(x_year_end = x_year_end, include_extra_vars = T)
  unique(norway_locations[, c("municip_code_current", "municip_name", "county_code", "county_name")])
  norway_locations <- norway_locations[year == max(year), c(
    "municip_code_current",
    "municip_name",
    "county_code",
    "county_name",
    "region_code",
    "region_name"
  )]
  norway_locations <- unique(norway_locations)
  setnames(norway_locations, "municip_code_current", "municip_code")

  return(norway_locations)
}
