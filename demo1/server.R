library(shiny)

shinyServer(function(input, output) {
  
  # 输出到UI的main_plot
  output$main_plot <- renderPlot({
    
    # 直方图
    hist(faithful$eruptions,
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "time",
         main = "time")
    
    # 是否显示individual_obs
    if (input$individual_obs) {
      rug(faithful$eruptions)
    }
    
    # 是否显示conditionalPanel
    if (input$density) {
      dens <- density(faithful$eruptions, adjust = input$bw_adjust)
      lines(dens, col = "blue")
    }
    
  })
})