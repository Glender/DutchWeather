#' Download de gegevens van temperatuur, zon, bewolking en zicht, luchtdruk, wind en neerslag per weerstation gecombineerd.
#'
#' BRON: KONINKLIJK NEDERLANDS METEOROLOGISCH INSTITUUT (KNMI)
#' Opmerking: door stationsverplaatsingen en veranderingen in waarneemmethodieken zijn deze tijdreeksen van dagwaarden mogelijk inhomogeen! Dat betekent dat deze ree
#' ks van gemeten waarden niet geschikt is voor trendanalyse. Voor studies naar klimaatverandering verwijzen we naar de gehomogeniseerde reeks maandtemperaturen van
#' De Bilt <http://www.knmi.nl/kennis-en-datacentrum/achtergrond/gehomogeniseerde-reeks-maandtemperaturen-de-bilt> of de Centraal Nederland Temperatuur <http://www.k
#' nmi.nl/kennis-en-datacentrum/achtergrond/centraal-nederland-temperatuur-cnt>.
#' SOURCE: ROYAL NETHERLANDS METEOROLOGICAL INSTITUTE (KNMI)
#'
#' YYYYMMDD  = Datum (YYYY=jaar MM=maand DD=dag) / Date (YYYY=year MM=month DD=day) \cr
#' DDVEC     = Vectorgemiddelde windrichting in graden (360=noord, 90=oost, 180=zuid, 270=west, 0=windstil/variabel). Zie http://www.knmi.nl/kennis-en-datacentrum/achtergrond/klimatologische-brochures-en-boeken / Vector mean wind direction in degrees (360=north, 90=east, 180=south, 270=west, 0=calm/variable) \cr
#' FHVEC     = Vectorgemiddelde windsnelheid (in 0.1 m/s). Zie http://www.knmi.nl/kennis-en-datacentrum/achtergrond/klimatologische-brochures-en-boeken / Vector mean windspeed (in 0.1 m/s) \cr
#' FG        = Etmaalgemiddelde windsnelheid (in 0.1 m/s) / Daily mean windspeed (in 0.1 m/s) \cr
#' FHX       = Hoogste uurgemiddelde windsnelheid (in 0.1 m/s) / Maximum hourly mean windspeed (in 0.1 m/s) \cr
#' FHXH      = Uurvak waarin FHX is gemeten / Hourly division in which FHX was measured \cr
#' FHN       = Laagste uurgemiddelde windsnelheid (in 0.1 m/s) / Minimum hourly mean windspeed (in 0.1 m/s) \cr
#' FHNH      = Uurvak waarin FHN is gemeten / Hourly division in which FHN was measured \cr
#' FXX       = Hoogste windstoot (in 0.1 m/s) / Maximum wind gust (in 0.1 m/s) \cr
#' FXXH      = Uurvak waarin FXX is gemeten / Hourly division in which FXX was measured \cr
#' TG        = Etmaalgemiddelde temperatuur (in 0.1 graden Celsius) / Daily mean temperature in (0.1 degrees Celsius) \cr
#' TN        = Minimum temperatuur (in 0.1 graden Celsius) / Minimum temperature (in 0.1 degrees Celsius) \cr
#' TNH       = Uurvak waarin TN is gemeten / Hourly division in which TN was measured \cr
#' TX        = Maximum temperatuur (in 0.1 graden Celsius) / Maximum temperature (in 0.1 degrees Celsius) \cr
#' TXH       = Uurvak waarin TX is gemeten / Hourly division in which TX was measured \cr
#' T10N      = Minimum temperatuur op 10 cm hoogte (in 0.1 graden Celsius) / Minimum temperature at 10 cm above surface (in 0.1 degrees Celsius) \cr
#' T10NH     = 6-uurs tijdvak waarin T10N is gemeten / 6-hourly division in which T10N was measured; 6=0-6 UT, 12=6-12 UT, 18=12-18 UT, 24=18-24 UT \cr
#' SQ        = Zonneschijnduur (in 0.1 uur) berekend uit de globale straling (-1 voor <0.05 uur) / Sunshine duration (in 0.1 hour) calculated from global radiation (-1 for <0.05 hour) \cr
#' SP        = Percentage van de langst mogelijke zonneschijnduur / Percentage of maximum potential sunshine duration \cr
#' Q         = Globale straling (in J/cm2) / Global radiation (in J/cm2) \cr
#' DR        = Duur van de neerslag (in 0.1 uur) / Precipitation duration (in 0.1 hour) \cr
#' RH        = Etmaalsom van de neerslag (in 0.1 mm) (-1 voor <0.05 mm) / Daily precipitation amount (in 0.1 mm) (-1 for <0.05 mm) \cr
#' RHX       = Hoogste uursom van de neerslag (in 0.1 mm) (-1 voor <0.05 mm) / Maximum hourly precipitation amount (in 0.1 mm) (-1 for <0.05 mm) \cr
#' RHXH      = Uurvak waarin RHX is gemeten / Hourly division in which RHX was measured \cr
#' PG        = Etmaalgemiddelde luchtdruk herleid tot zeeniveau (in 0.1 hPa) berekend uit 24 uurwaarden / Daily mean sea level pressure (in 0.1 hPa) calculated from 24 hourly values \cr
#' PX        = Hoogste uurwaarde van de luchtdruk herleid tot zeeniveau (in 0.1 hPa) / Maximum hourly sea level pressure (in 0.1 hPa) \cr
#' PXH       = Uurvak waarin PX is gemeten / Hourly division in which PX was measured \cr
#' PN        = Laagste uurwaarde van de luchtdruk herleid tot zeeniveau (in 0.1 hPa) / Minimum hourly sea level pressure (in 0.1 hPa) \cr
#' PNH       = Uurvak waarin PN is gemeten / Hourly division in which PN was measured \cr
#' VVN       = Minimum opgetreden zicht / Minimum visibility; 0: <100 m, 1:100-200 m, 2:200-300 m,..., 49:4900-5000 m, 50:5-6 km, 56:6-7 km, 57:7-8 km,..., 79:29-30 km, 80:30-35 km, 81:35-40 km,..., 89: >70 km) \cr
#' VVNH      = Uurvak waarin VVN is gemeten / Hourly division in which VVN was measured \cr
#' VVX       = Maximum opgetreden zicht / Maximum visibility; 0: <100 m, 1:100-200 m, 2:200-300 m,..., 49:4900-5000 m, 50:5-6 km, 56:6-7 km, 57:7-8 km,..., 79:29-30 km, 80:30-35 km, 81:35-40 km,..., 89: >70 km) \cr
#' VVXH      = Uurvak waarin VVX is gemeten / Hourly division in which VVX was measured \cr
#' NG        = Etmaalgemiddelde bewolking (bedekkingsgraad van de bovenlucht in achtsten, 9=bovenlucht onzichtbaar) / Mean daily cloud cover (in octants, 9=sky invisible) \cr
#' UG        = Etmaalgemiddelde relatieve vochtigheid (in procenten) / Daily mean relative atmospheric humidity (in percents) \cr
#' UX        = Maximale relatieve vochtigheid (in procenten) / Maximum relative atmospheric humidity (in percents) \cr
#' UXH       = Uurvak waarin UX is gemeten / Hourly division in which UX was measured \cr
#' UN        = Minimale relatieve vochtigheid (in procenten) / Minimum relative atmospheric humidity (in percents) \cr
#' UNH       = Uurvak waarin UN is gemeten / Hourly division in which UN was measured \cr
#' EV24      = Referentiegewasverdamping (Makkink) (in 0.1 mm) / Potential evapotranspiration (Makkink) (in 0.1 mm) \cr
#'
#' @param station_id Integer. Stationnummer. Het middenpunt van Nederland, De Bilt,  is met 260 de standaardoptie.
#' @param skip_rows Integer. Hoeveel rijen overgeslagen dienen te worden met het inladen van het textbestand. Standaardoptie is 51.
#' @param date_format Character. Standaard is YYMMDDD, oftewel: "%Y%m%d".
#'
#' @return
#' @export
#'
#' @examples
#' data <- get_daily_zipdata()
#' tail(data)
get_daily_zipdata <- function(
  station_id = 260,
  skip_rows = 51,
  date_format = "%Y%m%d"
){

  # specify parts to create a full ULR to import data
  base_url <- "http://cdn.knmi.nl/knmi/map/page/klimatologie/gegevens/daggegevens"
  data_name <- "/etmgeg_"

  # give file extensions for exported and destination files
  zip_ext = ".zip"
  txt_ext = ".txt"

  # complete URL with zip extension
  url <- base::paste0(base_url, data_name, station_id, zip_ext)

  # create temporary file to store imported data
  temp <- base::tempfile()
  base::dir.create(temp)
  path <- base::file.path(temp, "dutch_weather.zip")

  # import zipfile in tmp file, unzip and read as df
  utils::download.file(url = url, destfile = path)
  utils::unzip(zipfile = path, exdir = temp)
  txt_file <- base::paste0(temp, data_name, station_id, txt_ext)

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
