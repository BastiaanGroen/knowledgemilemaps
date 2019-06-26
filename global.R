# _  __                    _          _              __  __ _ _      
#| |/ /                   | |        | |            |  \/  (_) |     
#| ' / _ __   _____      _| | ___  __| | __ _  ___  | \  / |_| | ___ 
#|  < | '_ \ / _ \ \ /\ / / |/ _ \/ _` |/ _` |/ _ \ | |\/| | | |/ _ \
#| . \| | | | (_) \ V  V /| |  __/ (_| | (_| |  __/ | |  | | | |  __/
#|_|\_\_| |_|\___/ \_/\_/ |_|\___|\__,_|\__, |\___| |_|  |_|_|_|\___|
#   | _  _ |_  |_) _  _ _|_ o  _  _ __   __/ |
# \_|(_)_> | | |_)(_|_>  |_ | (_|(_|| | |___/        ~ GLOBAL                                               
#                                         
# ----
# Minor:            Data Science
# Track:            Urban Analytics
# Semester:         2
# Projectsite:      https://knowledgemile.amsterdam/
# Auteurs:          Josh Bleijenberg;
#                   Bastiaan Groen;
# contactpersonen:  Maarten Terpstra;
#                   Corine Laan;
# ----
#


#============================
# Libraries 
#============================   
library(shiny)
library(rgdal)
library(sf)
library(sp)
library(maps)
library(ggmap)
library(maptools)
library(leaflet)
library(leaflet.extras)
library(raster)
library(tidyverse)
library("shinythemes")
library(devtools)
library(mapview)
library(RColorBrewer)
library(htmlwidgets)
library("shinyWidgets")
library("shinythemes")
library(markdown)
library(shinyhelper)
library(htmlwidgets)
#----------------------------



#============================
# Functions 
#============================   
#custom leafletOuput for shiny server compatibiliteit
leafletOutput <- function(outputId, width = "100%", height = 400) {
  htmlwidgets::shinyWidgetOutput(outputId, "leaflet", width, height, "leaflet")
}
renderLeaflet <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) expr <- substitute(expr)  # force quoted
  htmlwidgets::shinyRenderWidget(expr, leafletOutput, env, quoted = TRUE)
}
#----------------------------




#============================
# ! Shiny server only !
#============================ 
##require(gpclib)

#voor shiny server
##gpclibPermit() #is nodig voor leafletplot dat gebruikt maakt van maptools
#!!IMPORTANT!! Dit zal niet meer werken in de volgende relaese van 'maptools' !!IMPORTANT!!
#----------------------------

#library(rsconnect)
#rsconnect::setAccountInfo(name='knowledgemilemaps',
#                          token='1073EDB90DE3590CF7A3728D0B092804',
#                          secret='<SECRET>')
#rsconnect::deployApp('path/to/your/app')