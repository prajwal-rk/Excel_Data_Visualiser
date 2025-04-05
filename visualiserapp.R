library(shiny)
library(readxl)
library(ggplot2)
library(plotly)
library(dplyr)

ui <- fluidPage(
  titlePanel("Excel Data Visualizer"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload Excel File", accept = c(".xlsx", ".xls")),
      uiOutput("column_select_ui"),
      selectInput("plot_type", "Select Plot Type", choices = c("Bar", "Line", "Pie", "Histogram", "Boxplot"))
    ),
    mainPanel(
      tableOutput("data_preview"),
      plotlyOutput("plot")
    )
  )
)

server <- function(input, output) {
  data <- reactive({
    req(input$file)
    read_excel(input$file$datapath)
  })
  
  output$data_preview <- renderTable({
    head(data(), 10)
  })
  
  output$column_select_ui <- renderUI({
    req(data())
    cols <- names(data())
    tagList(
      selectInput("xcol", "X-axis", choices = cols),
      selectInput("ycol", "Y-axis", choices = cols, selected = cols[2])
    )
  })
  
  output$plot <- renderPlotly({
    req(input$xcol, input$ycol, data())
    df <- data()
    p <- ggplot(df, aes_string(x = input$xcol, y = input$ycol)) +
      {
        if (input$plot_type == "Bar") geom_bar(stat = "identity")
        else if (input$plot_type == "Line") geom_line()
        else if (input$plot_type == "Histogram") geom_histogram()
        else if (input$plot_type == "Boxplot") geom_boxplot()
        else geom_col()
      }
    ggplotly(p)
  })
}

shinyApp(ui, server)
