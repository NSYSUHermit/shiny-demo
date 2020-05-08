library(shiny)
shinyUI(bootstrapPage(
  
  headerPanel("123"),
  
  # 左侧布局
  sidebarPanel(
    
    # 下拉框
    selectInput(inputId = "n_breaks",label = "456",choices = c(10, 20, 35, 50),selected = 20),
    
    # 单选框
    checkboxInput(inputId = "individual_obs",label = strong("789"),value = FALSE),
    
    # 单选框
    checkboxInput(inputId = "density",label = strong("abc"),value = FALSE)
  ),
  
  # 主布局
  mainPanel(
    plotOutput(outputId = "main_plot", height = "300px"),
    
    conditionalPanel(condition = "input.density == true",
                     sliderInput(inputId = "bw_adjust",label = "456", min = 0.2, max = 2, value = 1, step = 0.2)
    )
  )
))
