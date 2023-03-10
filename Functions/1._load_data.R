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


link_to_gd <- "https://docs.google.com/spreadsheets/d/1GrcDHTyX_xoCUH_3E-xn6zfxWdSM8PgU/edit?usp=share_link&ouid=109816320875943770961&rtpof=true&sd=true"
folder <- "./Raw Data/"
filename <- "STI Data.xls"


raw_data <- 
  load_data(
  link_to_gd = link_to_gd, 
  folder = folder,
  filename = filename
)
