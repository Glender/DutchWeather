#' Download de gegevens van temperatuur, zon, bewolking en zicht, luchtdruk, wind en neerslag per weerstation gecombineerd.
#'
#' BRON: KONINKLIJK NEDERLANDS METEOROLOGISCH INSTITUUT (KNMI)
#' Opmerking: door stationsverplaatsingen en veranderingen in waarneemmethodieken zijn deze tijdreeksen van uurwaarden mogelijk inhomogeen! Dat betekent dat deze reeks van gemeten waarden niet geschikt is voor trendanalyse. Voor studies naar klimaatverandering verwijzen we naar de gehomogeniseerde dagreeksen <http://www.knmi.nl/nederland-nu/klimatologie/daggegevens> of de Centraal Nederland Temperatuur <http://www.knmi.nl/kennis-en-datacentrum/achtergrond/centraal-nederland-temperatuur-cnt>.
#'
#' YYYYMMDD  = datum (YYYY=jaar,MM=maand,DD=dag) / date (YYYY=year,MM=month,DD=day) \cr
#' HH        = tijd (HH=uur, UT.12 UT=13 MET, 14 MEZT. Uurvak 05 loopt van 04.00 UT tot 5.00 UT / time (HH uur/hour, UT. 12 UT=13 MET, 14 MEZT. Hourly division 05 runs from 04.00 UT to 5.00 UT \cr
#' DD        = Windrichting (in graden) gemiddeld over de laatste 10 minuten van het afgelopen uur (360=noord, 90=oost, 180=zuid, 270=west, 0=windstil 990=veranderlijk. Zie http://www.knmi.nl/kennis-en-datacentrum/achtergrond/klimatologische-brochures-en-boeken / Mean wind direction (in degrees) during the 10-minute period preceding the time of observation (360=north, 90=east, 180=south, 270=west, 0=calm 990=variable) \cr
#' FH        = Uurgemiddelde windsnelheid (in 0.1 m/s). Zie http://www.knmi.nl/kennis-en-datacentrum/achtergrond/klimatologische-brochures-en-boeken / Hourly mean wind speed (in 0.1 m/s) \cr
#' FF        = Windsnelheid (in 0.1 m/s) gemiddeld over de laatste 10 minuten van het afgelopen uur / Mean wind speed (in 0.1 m/s) during the 10-minute period preceding the time of observation \cr
#' FX        = Hoogste windstoot (in 0.1 m/s) over het afgelopen uurvak / Maximum wind gust (in 0.1 m/s) during the hourly division \cr
#' T         = Temperatuur (in 0.1 graden Celsius) op 1.50 m hoogte tijdens de waarneming / Temperature (in 0.1 degrees Celsius) at 1.50 m at the time of observation \cr
#' T10N      = Minimumtemperatuur (in 0.1 graden Celsius) op 10 cm hoogte in de afgelopen 6 uur / Minimum temperature (in 0.1 degrees Celsius) at 0.1 m inthe preceding 6-hour period \cr
#' TD        = Dauwpuntstemperatuur (in 0.1 graden Celsius) op 1.50 m hoogte tijdens de waarneming / Dew point temperature (in 0.1 degrees Celsius) at 1.50 m at the time of observation \cr
#' SQ        = Duur van de zonneschijn (in 0.1 uren) per uurvak, berekend uit globale straling  (-1 for <0.05 uur) / Sunshine duration (in 0.1 hour) during the hourly division, calculated from global radiation (-1 for <0.05 hour) \cr
#' Q         = Globale straling (in J/cm2) per uurvak / Global radiation (in J/cm2) during the hourly division \cr
#' DR        = Duur van de neerslag (in 0.1 uur) per uurvak / Precipitation duration (in 0.1 hour) during the hourly division \cr
#' RH        = Uursom van de neerslag (in 0.1 mm) (-1 voor <0.05 mm) / Hourly precipitation amount (in 0.1 mm) (-1 for <0.05 mm) \cr
#' P         = Luchtdruk (in 0.1 hPa) herleid naar zeeniveau, tijdens de waarneming / Air pressure (in 0.1 hPa) reduced to mean sea level, at the time of observation \cr
#' VV        = Horizontaal zicht tijdens de waarneming (0=minder dan 100m, 1=100-200m, 2=200-300m,..., 49=4900-5000m, 50=5-6km, 56=6-7km, 57=7-8km, ..., 79=29-30km, 80=30-35km, 81=35-40km,..., 89=meer dan 70km) / Horizontal visibility at the time of observation (0=less than 100m, 1=100-200m, 2=200-300m,..., 49=4900-5000m, 50=5-6km, 56=6-7km, 57=7-8km, ..., 79=29-30km, 80=30-35km, 81=35-40km,..., 89=more than 70km) \cr
#' N         = Bewolking (bedekkingsgraad van de bovenlucht in achtsten), tijdens de waarneming (9=bovenlucht onzichtbaar) / Cloud cover (in octants), at the time of observation (9=sky invisible) \cr
#' U         = Relatieve vochtigheid (in procenten) op 1.50 m hoogte tijdens de waarneming / Relative atmospheric humidity (in percents) at 1.50 m at the time of observation \cr
#' WW        = Weercode (00-99), visueel(WW) of automatisch(WaWa) waargenomen, voor het actuele weer of het weer in het afgelopen uur. Zie http://bibliotheek.knmi.nl/scholierenpdf/weercodes_Nederland / Present weather code (00-99), description for the hourly division. \cr
#' IX        = Weercode indicator voor de wijze van waarnemen op een bemand of automatisch station (1=bemand gebruikmakend van code uit visuele waarnemingen, 2,3=bemand en weggelaten (geen belangrijk weersverschijnsel, geen gegevens), 4=automatisch en opgenomen (gebruikmakend van code uit visuele waarnemingen), 5,6=automatisch en weggelaten (geen belangrijk weersverschijnsel, geen gegevens), 7=automatisch gebruikmakend van code uit automatische waarnemingen) / Indicator present weather code (1=manned and recorded (using code from visual observations), 2,3=manned and omitted (no significant weather phenomenon to report, not available), 4=automatically recorded (using code from visual observations), 5,6=automatically omitted (no significant weather phenomenon to report, not available), 7=automatically set (using code from automated observations) \cr
#' M         = Mist 0=niet voorgekomen, 1=wel voorgekomen in het voorgaande uur en/of tijdens de waarneming / Fog 0=no occurrence, 1=occurred during the preceding hour and/or at the time of observation \cr
#' R         = Regen 0=niet voorgekomen, 1=wel voorgekomen in het voorgaande uur en/of tijdens de waarneming / Rainfall 0=no occurrence, 1=occurred duringthe preceding hour and/or at the time of observation \cr
#' S         = Sneeuw 0=niet voorgekomen, 1=wel voorgekomen in het voorgaande uur en/of tijdens de waarneming / Snow 0=no occurrence, 1=occurred during the preceding hour and/or at the time of observation \cr
#' O         = Onweer 0=niet voorgekomen, 1=wel voorgekomen in het voorgaande uur en/of tijdens de waarneming / Thunder  0=no occurrence, 1=occurred during the preceding hour and/or at the time of observation \cr
#' Y         = IJsvorming 0=niet voorgekomen, 1=wel voorgekomen in het voorgaande uur en/of tijdens de waarneming / Ice formation 0=no occurrence, 1=occurred during the preceding hour and/or at the time of observation \cr
#'
#' @param station_id Integer. Stationnummer. Het middenpunt van Nederland, De Bilt,  is met 260 de standaardoptie.
#' @param skip_rows Integer. Hoeveel rijen overgeslagen dienen te worden met het inladen van het textbestand. Standaardoptie is 51.
#' @param date_format Character. Standaard is YYMMDDD, oftewel: "%Y%m%d".
#'
#' @return
#' @export
#'
#' @examples
#' # get data from Hoorn
#' data <- get_hourly_zipdata(station_id=251)
#' tail(data)
get_hourly_zipdata <- function(
  station_id = 260,
  skip_rows = 31,
  date_format = "%Y%m%d"
){

  # specify parts to create a full ULR to import data
  base_url <- "http://cdn.knmi.nl/knmi/map/page/klimatologie/gegevens/uurgegevens"
  data_name <- "/uurgeg_" ; year_ext <- "_2021-2030"

  # give file extensions for exported and destination files
  zip_ext = ".zip"; txt_ext = ".txt"

  # complete URL with zip extension
  url <- base::paste0(
    base_url, data_name, station_id, year_ext, zip_ext
  )

  # create temporary file to store imported data
  temp <- base::tempfile()
  base::dir.create(temp)
  path <- base::file.path(temp, "hourly_weather.zip")

  # import zipfile in tmp file, unzip and read as df
  utils::download.file(url = url, destfile = path)
  utils::unzip(zipfile = path, exdir = temp)
  txt_file <- base::paste0(temp, data_name, station_id, year_ext, txt_ext)

  # retrieve data from tmp file
  data <- readr::read_csv(
    file = txt_file,
    col_names = TRUE,
    col_types = list(
      YYYYMMDD = readr::col_date(format = date_format),
      .default = readr::col_integer()
    ),
    skip = skip_rows
  )
  # remove tmp files
  base::file.remove(path, txt_file, temp)

  return(data)
}
