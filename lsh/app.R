library(shiny)
library(textreuse)
library(tm)

ui <- fluidPage(
  
  
  fileInput("l","l",multiple = T)
  ,verbatimTextOutput("x")
)

server <- function(input, output, session) {
  
  
  
  
 # x=reactive({
    
    #req(input$l)
   # x=readtext::readtext(input$l$datapath)})


  
output$x=  renderPrint({
   
  req(input$l)
 # x=as.data.frame( x())
  
#  tolower(x$text)
  m=minhash_generator(200,seed = 123)
  
  x= textreuse::TextReuseCorpus(input$l$datapath,tokenizer = tokenize_ngrams,n=8,keep_tokens = T,minhash_func = m,progress = F)
  z=lsh(x,bands=10,progress = F)
  
  lsh_candidates(z)
  x[[001]]
  
  })
  
  
  
  
}

shinyApp(ui, server)