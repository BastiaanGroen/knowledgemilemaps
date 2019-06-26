# _  __                    _          _              __  __ _ _      
#| |/ /                   | |        | |            |  \/  (_) |     
#| ' / _ __   _____      _| | ___  __| | __ _  ___  | \  / |_| | ___ 
#|  < | '_ \ / _ \ \ /\ / / |/ _ \/ _` |/ _` |/ _ \ | |\/| | | |/ _ \
#| . \| | | | (_) \ V  V /| |  __/ (_| | (_| |  __/ | |  | | | |  __/
#|_|\_\_| |_|\___/ \_/\_/ |_|\___|\__,_|\__, |\___| |_|  |_|_|_|\___|
#   | _  _ |_  |_) _  _ _|_ o  _  _ __   __/ |
# \_|(_)_> | | |_)(_|_>  |_ | (_|(_|| | |___/        ~ UI SIDE                                                   
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
# This is the user-interface definition of a Shiny web application. 
# You can run the application by clicking 'Run App' above.
#



#============================
# Modificeren van data
#============================
#  | Hier wordt de data gemodificeerd.
#  | Bewerkingen en toevoegingen worden hier uitgevoerd
#  `---

#----------------------------


#============================
# Define UI logic
#============================
#  | Hier wordt de logica voor UI side calculaties uitgevoerd.
#  | Plots worden hier gevisiualiseerd.
#  `---
shinyUI(bootstrapPage(
  
            theme = shinytheme("superhero"),
            tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
            #tags$head(
            #  tags$meta(name="theme-color", content="#FFFF00"),
            #  tags$meta(name="msapplication-navbutton-color", content="#FFFF00"),
            #  tags$meta(name="apple-mobile-web-app-status-bar-style", content="#FFFF00")
            #),
            
            
            ## PRINT KNOP
            ## haal hastags weg om te activeren (in server.R moet ook de code ge-uncommend worden)
            #jsfile <- "https://rawgit.com/rowanwins/leaflet-easyPrint/gh-pages/dist/bundle.js"
            #tags$head(tags$script(src = jsfile)),
            
            #tags$script(HTML(
            #  "var a3Size = {
            #      width: 2339,
            #      height: 3308,
            #      className: 'a3CssClass',
            #      tooltip: 'A custom A3 size'
            #  };"
            #)),
            #shinythemes::themeSelector(),  # <--- Add this somewhere in the UI | Theme selector
            includeCSS("style.css"),
            
            leafletOutput("map", width = "100%", height = "100%"),
            absolutePanel(
                          title = "Inputs",
                          style = "opacity: 0.82",
                          top = 10,
                          right = 10,
                          width = 300,
                          wellPanel(
                            HTML(markdownToHTML(fragment.only=TRUE, text=c(
                              "# KnowledgeMile "
                                ))
                              ),
                            tags$a(href="https://knowledgemile.amsterdam/challenges/1774", "klik voor Knowledgemile website"),
                            
                            #......................#
                            #     Select kaart     #
                            #``````````````````````#
                            pickerInput(
                                inputId = "DropDown", 
                                label = "Selecteer Kaarten", 
                                choices = list(
                                    Biodiversiteit = c("Bomen - cluster", "Groene daken clstr", "Groene daken"),
                                    Stadsklimaat = c("hittestress", "Water belasting")), 
                                options = list(
                                    `actions-box` = TRUE, 
                                    size = 10,
                                    `selected-text-format` = "count > 3"
                                ), 
                                multiple = TRUE
                            ) 
                            
                              # %>% 
                              ##......................#
                              ##       Help Icon      #
                              ##``````````````````````#
                              #helper(type = "inline",
                              #       colour = "green",
                              #       title = "Inline Help",
                              #       content = c("This is a <b>plot</b>.",
                              #                    "This is on a new line."),
                              #       size = "m")
                          )#end well
                          
            )# énd absolute panel
        )#end bootstrap
)
#----------------------------
