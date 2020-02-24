#' World Map
#'
#' We conveniently package map datasets for the world
#' (taken from Natural Earth) that can be used in ggplot2 without needing any geo
#' libraries. This data is licensed under the public domain.
#'
#' This world map contains 196 administrative regions, corresponding to: 193 UN member states,
#' 2 non-member permanent observer states (Holy See and the State of Palestine), and Kashmir (KAH).
#'
#'
#' @format
#' \describe{
#' \item{long}{Location code.}
#' \item{lat}{Location name.}
#' \item{order}{The order that this line should be plotted in.}
#' \item{group}{Needs to be used as 'group' aesthetic in ggplot2.}
#' \item{location_code}{3 character isocode.}
#' }
#' @source \url{https://www.naturalearthdata.com/downloads/50m-cultural-vectors/}
#' @examples
#' library(ggplot2)
#' q <- ggplot(mapping = aes(x = long, y = lat, group = group, fill = location_code))
#' q <- q + geom_polygon(data = fhidata::world_map, color = "black")
#' q <- q + theme_void()
#' q <- q + coord_quickmap()
#' q
"world_map"

gen_world_map <- function() {
  . <- NULL
  id <- NULL
  location_code <- NULL
  long <- NULL
  lat <- NULL
  long_center <- NULL
  lat_center <- NULL
  group <- NULL
  hole <- NULL
  piece <- NULL
  ADM0_A3 <- NULL
  SOV_A3 <- NULL

  require_namespace(c("geojsonio", "broom", "rmapshaper", "sp", "sf"))
  spdf <- sf::read_sf(
    system.file(
      "extdata",
      "ne_50m_admin_0_countries",
      "ne_50m_admin_0_countries.shp",
      package = "fhidata"
    ),
    as_tibble = F
  )
  #nrow(spdf)
  nam <- as.data.table(spdf)
  nam[ADM0_A3=="VAT"]

  nam[ADM0_A3=="ISR",SOV_A3:="ISR"]
  nam[ADM0_A3=="PSX",SOV_A3:="PSE"]

  nam[SOV_A3=="US1",SOV_A3:="USA"]
  nam[SOV_A3=="GB1",SOV_A3:="GBR"]
  nam[SOV_A3=="NZ1",SOV_A3:="NZL"]
  nam[SOV_A3=="NL1",SOV_A3:="NLD"]
  nam[SOV_A3=="FR1",SOV_A3:="FRA"]
  nam[SOV_A3=="FI1",SOV_A3:="FIN"]
  nam[SOV_A3=="DN1",SOV_A3:="DNK"]
  nam[SOV_A3=="CH1",SOV_A3:="CHN"]
  nam[SOV_A3=="AU1",SOV_A3:="AUS"]

  spdf_simple <- sf::as_Spatial(spdf)
  #spdf_simple <- rmapshaper::ms_simplify(spdf_simple, keep = 0.1)
  #spdf_simple

  spdf_fortified <- broom::tidy(spdf_simple[,c("ADM0_A3")], region = "ADM0_A3")
  setDT(spdf_fortified)
  spdf_fortified[nam,on="id==ADM0_A3",id:=SOV_A3]
  spdf_fortified[id=="CYN",id:="CYP"]
  spdf_fortified[id=="SDS",id:="SSD"]
  spdf_fortified[id=="SOL",id:="SOM"]
  spdf_fortified[id=="KOS",id:="SRB"]
  spdf_fortified[id=="SAH",id:="MAR"]

  # remove antarctica
  spdf_fortified <- spdf_fortified[id!="ATA"]

  #length(unique(spdf_fortified$id))
  #countrycode::countrycode(sort(unique(spdf_fortified$id)),origin='iso3c',destination='country.name')

  spdf_fortified[, hole := NULL]
  spdf_fortified[, piece := NULL]
  setnames(spdf_fortified,"id","location_code")

  length(unique(spdf_fortified$location_code))

  return(invisible(spdf_fortified))
}
