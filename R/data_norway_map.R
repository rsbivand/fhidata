#' Maps of Norwegian Counties (2020 borders)
#'
#' We conveniently package map datasets for Norwegian counties
#' (taken from Geonorge) that can be used in ggplot2 without needing any geo
#' libraries. This data is licensed under Creative Commons BY 4.0 (CC BY 4.0).
#'
#' @format
#' \describe{
#' \item{long}{Location code.}
#' \item{lat}{Location name.}
#' \item{order}{The order that this line should be plotted in.}
#' \item{hole}{Geodata. Not used.}
#' \item{piece}{Geodata. Not used.}
#' \item{group}{Needs to be used as 'group' aesthetic in ggplot2.}
#' \item{id}{Non-informative id code.}
#' \item{location_code}{Location code (county code).}
#' }
#' @source \url{https://kartkatalog.geonorge.no/metadata/f01922f5-bc7b-489f-918c-ca0f789c0dfa}
#' @examples
#' library(ggplot2)
#' q <- ggplot(mapping = aes(x = long, y = lat, group = group, fill = location_code))
#' q <- q + geom_polygon(data = fhidata::norway_map_counties_b2020, color = "black")
#' q <- q + theme_void()
#' q <- q + coord_quickmap()
#' q
"norway_map_counties_b2020"

#' Maps of Norwegian Municipalities (2020 borders)
#'
#' We conveniently package map datasets for Norwegian municipalities
#' (taken from Geonorge) that can be used in ggplot2 without needing any geo
#' libraries. This data is licensed under Creative Commons BY 4.0 (CC BY 4.0).
#'
#' @format
#' \describe{
#' \item{long}{Location code.}
#' \item{lat}{Location name.}
#' \item{order}{The order that this line should be plotted in.}
#' \item{hole}{Geodata. Not used.}
#' \item{piece}{Geodata. Not used.}
#' \item{group}{Needs to be used as 'group' aesthetic in ggplot2.}
#' \item{id}{Non-informative id code.}
#' \item{location_code}{Location code (municipality code).}
#' }
#' @source \url{https://kartkatalog.geonorge.no/metadata/f015cd24-a14b-42f3-b695-848cb88d9657}
#' @examples
#' library(ggplot2)
#' q <- ggplot(mapping = aes(x = long, y = lat, group = group))
#' q <- q + geom_polygon(data = fhidata::norway_map_municips_b2020, color = "black")
#' q <- q + theme_void()
#' q <- q + coord_quickmap()
#' q
"norway_map_municips_b2020"

#' Maps of Norwegian Counties (2019 borders)
#'
#' We conveniently package map datasets for Norwegian counties
#' (taken from Geonorge) that can be used in ggplot2 without needing any geo
#' libraries. This data is licensed under Creative Commons 0.
#'
#' @format
#' \describe{
#' \item{long}{Location code.}
#' \item{lat}{Location name.}
#' \item{order}{The order that this line should be plotted in.}
#' \item{hole}{Geodata. Not used.}
#' \item{piece}{Geodata. Not used.}
#' \item{group}{Needs to be used as 'group' aesthetic in ggplot2.}
#' \item{id}{Non-informative id code.}
#' \item{location_code}{Location code (county code).}
#' }
#' @source \url{https://kartkatalog.geonorge.no/metadata/uuid/cb02ab77-d3e6-4500-8a92-ea67367e7734}
#' @examples
#' library(ggplot2)
#' q <- ggplot(mapping = aes(x = long, y = lat, group = group, fill = location_code))
#' q <- q + geom_polygon(data = fhidata::norway_map_counties_b2019, color = "black")
#' q <- q + theme_void()
#' q <- q + coord_quickmap()
#' q
"norway_map_counties_b2019"

#' Maps of Norwegian Municipalities (2019 borders)
#'
#' We conveniently package map datasets for Norwegian municipalities
#' (taken from Geonorge) that can be used in ggplot2 without needing any geo
#' libraries. This data is licensed under Creative Commons 0.
#'
#' @format
#' \describe{
#' \item{long}{Location code.}
#' \item{lat}{Location name.}
#' \item{order}{The order that this line should be plotted in.}
#' \item{hole}{Geodata. Not used.}
#' \item{piece}{Geodata. Not used.}
#' \item{group}{Needs to be used as 'group' aesthetic in ggplot2.}
#' \item{id}{Non-informative id code.}
#' \item{location_code}{Location code (municipality code).}
#' }
#' @source \url{https://kartkatalog.geonorge.no/metadata/uuid/cb02ab77-d3e6-4500-8a92-ea67367e7734}
#' @examples
#' library(ggplot2)
#' q <- ggplot(mapping = aes(x = long, y = lat, group = group))
#' q <- q + geom_polygon(data = fhidata::norway_map_municips_b2019, color = "black")
#' q <- q + theme_void()
#' q <- q + coord_quickmap()
#' q
"norway_map_municips_b2019"

#' Label Positions for Norwegian Counties (2019 borders)
#'
#' GPS coordinates for labels for Norwegian counties
#'
#' @format
#' \describe{
#' \item{location_code}{Location code (county code).}
#' \item{long}{Location code.}
#' \item{lat}{Location name.}
#' }
#' @examples
#' library(ggplot2)
#' q <- ggplot(mapping = aes(x = long, y = lat))
#' q <- q + geom_polygon(data = fhidata::norway_map_counties_b2019, mapping = aes(group = group), color = "black", fill = "white")
#' q <- q + geom_text(data = fhidata::norway_map_counties_label_positions_b2019, mapping = aes(label = location_code), color = "red")
#' q <- q + theme_void()
#' q <- q + coord_quickmap()
#' q
"norway_map_counties_label_positions_b2019"

#' Label Positions for Norwegian Counties (2020 borders)
#'
#' GPS coordinates for labels for Norwegian counties
#'
#' @format
#' \describe{
#' \item{location_code}{Location code (county code).}
#' \item{long}{Location code.}
#' \item{lat}{Location name.}
#' }
#' @examples
#' library(ggplot2)
#' q <- ggplot(mapping = aes(x = long, y = lat))
#' q <- q + geom_polygon(data = fhidata::norway_map_counties_b2020, mapping = aes(group = group), color = "black", fill = "white")
#' q <- q + geom_text(data = fhidata::norway_map_counties_label_positions_b2020, mapping = aes(label = location_code), color = "red")
#' q <- q + theme_void()
#' q <- q + coord_quickmap()
#' q
"norway_map_counties_label_positions_b2020"

gen_norway_map_counties_label_positions <- function(x_year_end) {
  stopifnot(x_year_end %in% c("2019", "2020"))

  if (x_year_end == 2019) {
    label_positions <- data.table(
      location_code = c(
        "county01", "county02", "county03", "county04",
        "county05", "county06", "county07", "county08",
        "county09", "county10", "county11", "county12",
        "county14", "county15", "county18", "county19",
        "county20", "county50"
      ),
      long = c(
        11.266137, 11.2, 10.72028, 11.5, 9.248258, 9.3, 10.0, 8.496352,
        8.45, 7.2, 6.1, 6.5, 6.415354, 7.8, 14.8, 19.244275, 24.7, 11
      ),

      lat = c(
        59.33375, 60.03851, 59.98, 61.26886, 61.25501, 60.3, 59.32481, 59.47989,
        58.6, 58.4, 58.7, 60.25533, 61.6, 62.5, 66.5, 68.9, 69.6, 63
      )
    )
  } else if (x_year_end == 2020) {
    label_positions <- data.table(
      location_code = c(
        "county30", "county03", "county34",
        "county38",
        "county42", "county11", "county46",
        "county15", "county18", "county54",
        "county50"
      ),
      long = c(
        11.266137, 10.72028, 11.5, 10.0,
        8.45, 6.1, 6.5, 7.8, 14.8, 19.244275, 11
      ),

      lat = c(
        59.33375, 59.98, 61.26886, 59.32481,
        58.6, 58.7, 60.25533, 62.5, 66.5, 68.9, 63
      )
    )
  }

  return(label_positions)
}

gen_norway_map_counties <- function(x_year_end) {
  stopifnot(x_year_end %in% c("2019", "2020"))

  id <- NULL
  location_code <- NULL
  long <- NULL
  lat <- NULL

  require_namespace(c("geojsonio", "broom", "rmapshaper", "sp"))
  if (x_year_end == 2019) {
    spdf <- geojsonio::geojson_read(
      system.file("extdata", "Fylker19.geojson", package = "fhidata"),
      what = "sp"
    )
    spdf_simple <- rmapshaper::ms_simplify(spdf, keep = 0.1)
  } else if (x_year_end == 2020) {
    spdf <- sf::st_read(
      system.file("extdata", "Fylker20.gml", package = "fhidata"),
      layer = "Fylke"
    )
    spdf_simple <- rmapshaper::ms_simplify(spdf, keep = 0.2)
    spdf_simple <- methods::as(spdf_simple, "Spatial")
  }

  spdf_fortified <- broom::tidy(spdf_simple, region = "fylkesnummer")

  setDT(spdf_fortified)
  spdf_fortified[, location_code := sprintf("county%s", formatC(as.numeric(id), width = 2, flag = "0"))]

  # convert from UTM to latlong
  utm <- spdf_fortified[, c("long", "lat")]
  sputm <- sp::SpatialPoints(utm, proj4string = sp::CRS("+proj=utm +zone=33 +datum=WGS84"))
  spgeo <- sp::spTransform(sputm, sp::CRS("+proj=longlat +datum=WGS84"))
  spgeo <- as.data.table(spgeo)

  spdf_fortified[, long := spgeo$long]
  spdf_fortified[, lat := spgeo$lat]

  return(invisible(spdf_fortified))
}

gen_norway_map_municips <- function(x_year_end) {
  stopifnot(x_year_end %in% c("2019", "2020"))

  id <- NULL
  location_code <- NULL
  long <- NULL
  lat <- NULL

  require_namespace(c("geojsonio", "broom", "rmapshaper", "sp"))

  if (x_year_end == 2019) {
    spdf <- geojsonio::geojson_read(
      system.file("extdata", "Kommuner19.geojson", package = "fhidata"),
      what = "sp"
    )
    spdf_simple <- rmapshaper::ms_simplify(rgeos::gBuffer(spdf, byid = TRUE, width = 0), keep = 0.075)
  } else if (x_year_end == 2020) {
    spdf <- sf::st_read(
      system.file("extdata", "Kommuner20.gml", package = "fhidata"),
      layer = "Kommune"
    )
    spdf_simple <- rmapshaper::ms_simplify(spdf, keep = 0.1)
    spdf_simple <- methods::as(spdf_simple, "Spatial")
  }

  spdf_fortified <- broom::tidy(spdf_simple, region = "kommunenummer")

  setDT(spdf_fortified)
  spdf_fortified[, location_code := sprintf("municip%s", formatC(as.numeric(id), width = 4, flag = "0"))]

  # convert from UTM to latlong
  utm <- spdf_fortified[, c("long", "lat")]
  sputm <- sp::SpatialPoints(utm, proj4string = sp::CRS("+proj=utm +zone=33 +datum=WGS84"))
  spgeo <- sp::spTransform(sputm, sp::CRS("+proj=longlat +datum=WGS84"))
  spgeo <- as.data.table(spgeo)

  spdf_fortified[, long := spgeo$long]
  spdf_fortified[, lat := spgeo$lat]

  return(invisible(spdf_fortified))
}
