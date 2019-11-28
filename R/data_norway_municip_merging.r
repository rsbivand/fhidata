#' County redistricting in Norway (2020 borders).
#'
#' This dataset is used to transfer "original" municipality level datasets to the 2020 borders.
#'
#' Last updated 2019-11-24
#'
#' @format
#' \describe{
#' \item{county_code_current}{The county code per today.}
#' \item{county_code_original}{The county code as of 'year'.}
#' \item{year}{The year corresponding to 'county_code_original'.}
#' \item{weighting}{The weighting that needs to be applied.}
#' }
#' @source \url{https://no.wikipedia.org/wiki/Liste_over_norske_kommunenummer}
"norway_county_merging_b2020"

#' County redistricting Norway (2019 borders).
#'
#' This dataset is used to transfer "original" municipality level datasets to the 2019 borders.
#'
#' Last updated 2019-03-14
#'
#' @format
#' \describe{
#' \item{county_code_current}{The county code per today.}
#' \item{county_code_original}{The county code as of 'year'.}
#' \item{year}{The year corresponding to 'county_code_original'.}
#' \item{weighting}{The weighting that needs to be applied.}
#' }
#' @source \url{https://no.wikipedia.org/wiki/Liste_over_norske_kommunenummer}
"norway_county_merging_b2019"

#' Municipality redistricting in Norway (2020 borders).
#'
#' This dataset is used to transfer "original" municipality level datasets to the 2020 borders.
#'
#' Last updated 2019-11-24
#'
#' @format
#' \describe{
#' \item{municip_code_current}{The municipality code per today.}
#' \item{municip_code_original}{The municipality code as of 'year'.}
#' \item{year}{The year corresponding to 'municip_code_original'.}
#' \item{municip_name}{The municipality name per today.}
#' \item{county_code}{The county code per today.}
#' \item{county_name}{The county name per today.}
#' \item{region_code}{The region code per today.}
#' \item{region_name}{The region name per today.}
#' \item{weighting}{The weighting that needs to be applied.}
#' }
#' @source \url{https://no.wikipedia.org/wiki/Liste_over_norske_kommunenummer}
"norway_municip_merging_b2020"

#' Municipality redistricting Norway (2019 borders).
#'
#' This dataset is used to transfer "original" municipality level datasets to the 2019 borders.
#'
#' Last updated 2019-03-14
#'
#' @format
#' \describe{
#' \item{municip_code_current}{The municipality code per today.}
#' \item{municip_code_original}{The municipality code as of 'year'.}
#' \item{year}{The year corresponding to 'municip_code_original'.}
#' \item{municip_name}{The municipality name per today.}
#' \item{county_code}{The county code per today.}
#' \item{county_name}{The county name per today.}
#' \item{region_code}{The region code per today.}
#' \item{region_name}{The region name per today.}
#' \item{weighting}{The weighting that needs to be applied.}
#' }
#' @source \url{https://no.wikipedia.org/wiki/Liste_over_norske_kommunenummer}
"norway_municip_merging_b2019"

#' Fixing data that has already been redistricted.
#'
#' This dataset is used to transfer municipality level datasets (that have already
#' been redistricted) to future borders. If `border_start=2018` then it is
#' assumed that the 2018 borders were used from 2000-2018, and then 2019 borders
#' used for 2019, 2020 borders for 2020, and so on. Hence a combination of `year`
#' and `border_start` must always be used.
#'
#' Last updated 2019-03-14
#'
#' @format
#' \describe{
#' \item{municip_code_current}{The municipality code per today.}
#' \item{municip_code_original}{The municipality code as of 'year'.}
#' \item{year}{The year corresponding to 'municip_code_original'.}
#' \item{municip_name}{The municipality name per today.}
#' \item{county_code}{The county code per today.}
#' \item{county_name}{The county name per today.}
#' \item{region_code}{The region code per today.}
#' \item{region_name}{The region name per today.}
#' \item{border_start}{The year that the data has currently been redistricted to.}
#' \item{border_end}{The year of the desired final redistricting.}
#' \item{weighting}{The weighting that needs to be applied.}
#' }
#' @source \url{https://no.wikipedia.org/wiki/Liste_over_norske_kommunenummer}
"norway_fixing_merged_municips"

# Creates the norway_municip_merging (kommunesammenslaaing) data.table
gen_norway_municip_merging <- function(x_year_end, x_year_start = 2000) {
  # variables used in data.table functions in this function
  year_start <- NULL
  municip_code <- NULL
  municip_code_current <- NULL
  level <- NULL
  county_code <- NULL
  region_code <- NULL
  year_end <- NULL
  municip_name <- NULL
  municip_code_end <- NULL
  county_name <- NULL
  region_name <- NULL
  realEnd <- NULL
  weighting <- NULL
  # end

  masterData <- data.table(readxl::read_excel(system.file("extdata", "norway_locations.xlsx", package = "fhidata")))
  masterData[is.na(weighting), weighting := 1]

  masterData[year_start <= x_year_start, year_start := x_year_start]
  masterData <- masterData[year_start <= x_year_end]

  masterData <- masterData[year_start >= x_year_start | is.na(year_end)]
  setnames(masterData, "year_start", "year")

  masterData <- masterData[year_end >= x_year_start | is.na(year_end)]
  masterData <- masterData[year_end <= x_year_end | is.na(year_end)]
  masterData[year_end == x_year_end, municip_code_end := NA]
  masterData[year_end == x_year_end, year_end := NA]

  masterData[is.na(municip_code_end), municip_code_end := municip_code]
  masterData[is.na(year_end), year_end := x_year_end]

  retval <- vector("list", 10000)
  for (i in 1:nrow(masterData)) {
    p <- masterData[i, ]
    years <- p$year:p$year_end
    temp <- p[rep(1, length(years))]
    temp[, year := years]
    retval[[i]] <- temp
  }
  skeleton <- rbindlist(retval)
  setorder(skeleton, year, municip_code)

  # skeleton <- skeleton[municip_code %in% c("municip1613","municip5012","municip5059")]

  merger <- unique(skeleton[municip_code != municip_code_end, c("municip_code", "municip_code_end", "weighting")])
  setnames(
    merger,
    c("municip_code_end", "weighting"),
    c("municip_code_end_new", "weighting_new")
  )

  continue_with_merging <- TRUE
  while (continue_with_merging) {
    print("merging!")
    skeleton <- merge(
      skeleton,
      merger,
      by.x = c("municip_code_end"),
      by.y = c("municip_code"),
      all.x = T
    )
    if (sum(!is.na(skeleton$municip_code_end_new)) == 0) {
      continue_with_merging <- FALSE
    }

    skeleton[!is.na(municip_code_end_new), municip_code_end := municip_code_end_new]
    skeleton[!is.na(weighting_new), weighting := weighting * weighting_new]
    skeleton[, municip_code_end_new := NULL]
    skeleton[, weighting_new := NULL]
  }

  skeletonFinal <- unique(skeleton[year == max(year), c(
    "municip_code",
    "municip_name",
    "county_code",
    "county_name",
    "region_code",
    "region_name"
  )])

  skeleton[, year_end := NULL]
  skeleton[, municip_name := NULL]
  skeleton[, county_code := NULL]
  skeleton[, county_name := NULL]
  skeleton[, region_code := NULL]
  skeleton[, region_name := NULL]

  skeleton <- merge(
    skeleton,
    skeletonFinal,
    by.x = c("municip_code_end"),
    by.y = c("municip_code")
  )

  setnames(skeleton, "municip_code_end", "municip_code_current")
  setnames(skeleton, "municip_code", "municip_code_original")

  setcolorder(
    skeleton,
    c(
      "municip_code_current",
      "municip_code_original",
      "year",
      "weighting",
      "municip_name",
      "county_code",
      "county_name",
      "region_code",
      "region_name"
    )
  )

  return(invisible(skeleton))
}

gen_norway_fixing_merged_municips <- function(x_year_end) {
  plan <- expand.grid(
    border_start = 2000:2020,
    border_end = 2019:x_year_end
  )
  setDT(plan)
  plan <- plan[border_end >= border_start]

  retval <- vector("list", length = nrow(plan))
  for (i in seq_along(retval)) {
    print(i)
    temp <- gen_norway_municip_merging(x_year_end = plan$border_end[i], x_year_start = plan$border_start[i])
    temp[, border_start := plan$border_start[i]]
    temp[, border_end := plan$border_end[i]]

    past_years <- c(2000:plan$border_start[i])
    past_years <- past_years[-length(past_years)]
    if (length(past_years) > 0) {
      for (j in past_years) {
        temp1 <- copy(temp[year == min(year)])
        temp1[, year := year - 1]
        temp <- rbind(temp, temp1)
      }
    }

    retval[[i]] <- temp
  }

  retval <- rbindlist(retval)

  return(retval)
}

# Creates the norway_county_merging (fylkesammenslaaing) data.table
gen_norway_county_merging <- function(x_year_end, x_year_start = 2000) {
  # variables used in data.table functions in this function
  year_start <- NULL
  municip_code <- NULL
  municip_code_current <- NULL
  level <- NULL
  county_code <- NULL
  region_code <- NULL
  year_end <- NULL
  municip_name <- NULL
  municip_code_end <- NULL
  county_name <- NULL
  region_name <- NULL
  realEnd <- NULL
  weighting <- NULL
  # end

  municips <- gen_norway_municip_merging(x_year_end = x_year_end, x_year_start = x_year_start)

  pops0 <- gen_norway_population(x_year_end = x_year_end, original = TRUE)
  pops0 <- pops0[imputed == FALSE, .(pop = sum(pop)), keyby = .(municip_code, year)]

  pops1 <- gen_norway_population(x_year_end = x_year_end)
  pops1 <- pops1[imputed == TRUE & level == "municipality", .(pop = sum(pop)), keyby = .(municip_code = location_code, year)]

  pops <- rbind(pops0, pops1)

  x <- merge(
    municips,
    pops,
    by.x = c("municip_code_original", "year"),
    by.y = c("municip_code", "year"),
  )
  x[, county_code_original := stringr::str_sub(municip_code_original, 1, 9)]
  x[, county_code_current := stringr::str_sub(municip_code_current, 1, 9)]

  x[, county_code_original := stringr::str_replace(county_code_original, "municip", "county")]
  x[, county_code_current := stringr::str_replace(county_code_current, "municip", "county")]

  x[, weighting := weighting * pop]
  x <- x[, .(
    weighting = sum(weighting)
  ), keyby = .(
    year,
    county_code_original,
    county_code_current
  )]
  x[, weighting_denominator_from_original := sum(weighting), by = .(county_code_original, year)]
  x[, weighting := weighting / weighting_denominator_from_original]
  x[, weighting_denominator_from_original := NULL]

  for (i in 1:30) {
    temp <- x[year == min(year)]
    temp[, year := year - 1]
    x <- rbind(temp, x)
  }

  return(invisible(x))
}
