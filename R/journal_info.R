#' Get table with information on journals
#' 
#' Download most recent or display cached version of data on journals.
#' 
#' When analysing your sample of articles from DfR, it might be helpful to have
#' some context about the journals in your sample. This function provides a
#' `tibble` with various information like the full name of the journal, the 
#' short version of the name (sometimes referred to as `JCODE`), dates on where
#' the first
#' and last (available) issues were published, etc.
#' 
#' The data on journals might change. Therefore this function provides two
#' sources of data: a cached version which gets updated with every release, and
#' the ability to pull the most recent version directly from DfR (this had to
#' be temporarily disabled.)
#' 
#' The cached version was updated on 2018-09-27.
#' 
#' @param most_recent Should the most recent version be downloaded from DfR? 
#' (Currently disabled due to changes on the JSTOR-servers).
#' @param quiet Should status messages about the download be printed?
#' 
#' @return A `tibble` with various information about journals.
#' 
#' @export
#' @examples 
#' # use the function without arguments to get a tibble from disk
#' jst_get_journal_overview()
#' 
#' \dontrun{
#' # download the most recent version from DfR
#' jst_get_journal_overview(most_recent = TRUE)
#' }
jst_get_journal_overview <- function(most_recent = FALSE, quiet = FALSE) {
  if (most_recent) {
    warning("Downloading the most recent version from JSTOR had to be removed ",
            "temporarily. If possible, it will be available again in a future ",
            "release.", call. = FALSE)
    # if (!curl::has_internet()) {
    #   abort("You don't seem to have a connection to the internet.")
    # }
    # 
    # link <- "https://www.jstor.org/titlelists/journals/archive?fileFormat=xls"
    # 
    # journal_list <- tempfile()
    # 
    # handle <- curl::new_handle()
    # handle <- curl::handle_setheaders(handle, "User-Agent" = "Mozilla/4.0")
    # 
    # curl::curl_download(link, journal_list, handle = handle)
    # 
    # journals <- readxl::read_xls(journal_list)
    # 
    # fix_names <- function(names) {
    #   names %>% 
    #     tolower() %>%
    #     stringr::str_remove("\\s\\(.*") %>% #remove (years) after coverage_range
    #     str_replace_all("\\s", "_")
    # }
    # 
    # 
    # journals %>% 
    #   purrr::set_names(fix_names(names(.))) %>% 
    #   mutate(journal_id = stringr::str_extract(url, "[^\\/]+$")) %>% 
    #   dplyr::select(title, journal_id, dplyr::everything())
    
  } else {
    jstor_journals
  }
}
