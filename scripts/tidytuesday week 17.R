# Tidytuesday week 17 - 2023
# https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-04-25/readme.md
library(tidyverse)
library(plotly)

tuesdata <- tidytuesdayR::tt_load('2023-04-25')
winners <- tuesdata$winners

palet  <- c("#f18701", "#f7b801", "#7678ed", "#3d348b")


count(winners, Nationality, Category) %>%   
    plot_ly(x=~Nationality, y=~n,  type = 'bar', 
                  color = ~Category, colors = palet) %>% 
  layout(
    title =  "Winners of London marathon by Nationality in each category from 1981 - 2022",
              yaxis = list(title = 'Number of winners', range= c(0,50)), 
              xaxis = list(title = 'Nationality', categoryorder = "total descending",
                           tickangle = -45),
              barmode = "stack",bargap = 2, plot_bgcolor='white',
    annotations =
      list(x = 0.7, y = -0.4,
           text = "Source: Nicola Rennie's London Marathon R package",
           showarrow = F, xref='paper', yref='paper',
           xanchor='right', yanchor='auto', xshift=0, yshift=0,
           font=list(size=12, color="black"))
    )
