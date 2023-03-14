
# function to load data from google drive

load_data <- 
  function(
    link_to_gd, 
    folder,
    filename
    ){
  raw_data <- 
    googledrive::drive_download(
    as_id(link_to_gd), 
    path = paste0(folder, filename), 
    overwrite = TRUE
    )
  raw_data <- 
    readxl::read_xls(paste0(folder, filename)) %>% 
    janitor::clean_names()
}
