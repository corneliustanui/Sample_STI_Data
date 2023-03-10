# function to clean data


raw_data1 <- 
  raw_data %>% 
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
  dplyr::arrange(id_number) %>% 
  dplyr::filter(
    !duplicated(id_number)
    )



