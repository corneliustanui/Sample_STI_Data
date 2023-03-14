
# function to clean data


clean_data <- 
  function(raw_data){
    # function to clean data
    
    cleaned_data1 <- 
      raw_data %>% 
      
      # keep only necessary variables
      dplyr::select(
        id_number = id_number, 
        case_status = case_status,
        age = a1age,
        sex = sex_47,
        weight = weight,
        height = height,
        occupation = a2occupation,
        church = a3church,
        level_of_education = a4level_of_education,
        marital_status = a5marital_status,
        duration_ofillness = duration_ofillness,
        used_condom = n11usedcondom,
        taken_alcohol = n13taken_alcohol,
        sex_debut = n2sex_debut,
        age_first_sex = age_first_sex,
      ) %>% 
      
      # sort the data by ID
      dplyr::arrange(id_number) %>% 
      
      # keep only unique records
      dplyr::filter(
        !duplicated(id_number)
      )
    
    cleaned_data <- 
      cleaned_data1 %>% 
      
      # clean variables by removing prefixed numbers
      dplyr::mutate(occupation = stringr::str_replace(string = occupation,
                                                      pattern = "[\\d]",
                                                      replacement = ""),
                    
                    church = stringr::str_replace(string = church,
                                                  pattern = "[\\d]",
                                                  replacement = ""),
                    
                    level_of_education = stringr::str_replace(string = level_of_education,
                                                              pattern = "[\\d]",
                                                              replacement = ""),
                    
                    marital_status = stringr::str_replace(string = marital_status,
                                                          pattern = "[\\d]",
                                                          replacement = ""),
                    
                    used_condom = stringr::str_replace(string = used_condom,
                                                       pattern = "[\\d]",
                                                       replacement = ""),
                    
                    taken_alcohol = stringr::str_replace(string = taken_alcohol,
                                                         pattern = "[\\d]",
                                                         replacement = "")
      ) %>% 
      
      # convert all strings to lower case (for uniformity)
      sapply(tolower) %>% 
      
      # convert final dataset to dataframe
      as.data.frame() %>% 
      
      # convert numeric cols to type numeric
      dplyr::mutate(id_number = as.numeric(id_number),
                    case_status = as.numeric(case_status),
                    age = as.numeric(age),
                    weight = as.numeric(weight),
                    height = as.numeric(height),
                    duration_ofillness = as.numeric(duration_ofillness),
                    sex_debut = as.numeric(sex_debut)
      ) %>% 
      
      # clean case_status
      dplyr::mutate(case_status = dplyr::if_else(case_status == 3, 1, case_status),
                    case_status = dplyr::if_else(case_status == 2, 0, case_status),
                    case_status = factor(case_status, 
                                         levels = 0:1, 
                                         labels = c("Negative", "Positive"))) 
    
    # write clean data into hard drive
    write.csv(
      x = cleaned_data, 
      file = "./Clean Data/Clean STI Data.csv",
      row.names = FALSE
      )

    # return clean data
    return(cleaned_data)
  }

