ui_setup <- 
  function(data){
    
    # define input buttons to go to sidebar for page 1
    page1_sidebar <- 
      
      list(
        marital_status = shiny::selectInput(
          inputId = "marital_status",
          label = "Marital Status",
          choices = unique(data$marital_status),
          selected = unique(data$marital_status),
          multiple = TRUE,
          selectize = TRUE
        ),
        
        occupation = shiny::selectInput(
          inputId = "occupation",
          label = "Occupation",
          choices = unique(data$occupation),
          selected = unique(data$occupation),
          multiple = TRUE,
          selectize = TRUE
        ),
        
        church = shiny::selectInput(
          inputId = "church",
          label = "Church",
          choices = unique(data$church),
          selected = unique(data$church),
          multiple = TRUE,
          selectize = TRUE
        ),
        
        age = shiny::sliderInput(
          inputId = "age",
          label = "Age:", 
          min = min(data$age, na.rm = T),
          max = max(data$age, na.rm = T), 
          value = c(min(data$age, na.rm = T), max(data$age, na.rm = T)),
          step = 1
        ),
        
        used_condom = shiny::checkboxGroupInput(
          inputId = "used_condom",
          label = "Used condom:",
          choices = unique(data$used_condom), 
          selected = unique(data$used_condom), 
          inline = T
        )
        
      )
    return(page1_sidebar)
    
    # define input buttons to go to sidebar for page 2
    page2_sidebar <- list()
  }






