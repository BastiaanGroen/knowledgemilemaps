# _  __                    _          _              __  __ _ _          
#| |/ /                   | |        | |            |  \/  (_) |                         __CS____________        |
#| ' / _ __   _____      _| | ___  __| | __ _  ___  | \  / |_| | ___       hp___________/ |  |  \       /        |
#|  < | '_ \ / _ \ \ /\ / / |/ _ \/ _` |/ _` |/ _ \ | |\/| | | |/ _ \       \    |   |    |  |  |nm   ,'         /
#| . \| | | | (_) \ V  V /| |  __/ (_| | (_| |  __/ | |  | | | |  __/       |    |   |    |  |  |  `./     _____|
#|_|\_\_| |_|\___/ \_/\_/ |_|\___|\__,_|\__, |\___| |_|  |_|_|_|\___|       \    |   |_,--dam---'    \   _/ \  /
#   | _  _ |_  |_) _  _ _|_ o  _  _ __   __/ |                               |   |_,-|    |  |       wap=.   \/\
# \_|(_)_> | | |_)(_|_>  |_ | (_|(_|| | |___/        ~ SERVER SIDE           \  /|   |    |__|        /   \_ /  `\                                       
#                                                                             `/ |  _|    \   \      /      wp    `\
# ----                                                                         \ \_/  \_  kp--mp--rp'      /  \
# Minor:            Data Science                                                |  \_    \/____|__,-\     ,/    `\
# Track:            Urban Analytics                                              \   \_  /     \    _\   /        `\  
# Semester:         2                                                             `\   \/___,--|---'  |_/           `   
# Projectsite:      https://knowledgemile.amsterdam/                                `\  |      \  ___/    
# Auteurs:          Josh Bleijenberg;                                                   \_lp-----wc/   
#                   Bastiaan Groen;
# contactpersonen:  Maarten Terpstra;
#                   Corine Laan;
# ----
#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#



#============================
# Het inladen van datasets
#============================
#  | Hier worden datasets ingeladen uit de data folder
#  | Folder van data: KnowledgeMile/data/
#  `---
data_hittestress <- raster("data/raster_amsterstamd_hittestress.tif")
waterbergendvermogen_amsterdam_centrum <- raster("data/waterbergendvermogen_amsterdam_centrum.tif")

data_buurten <- st_read("data/GEBIED_BUURTEN.json")

data_groene_daken_2 <- st_read("data/groene_daken_2.shp",
                               stringsAsFactors = FALSE)
data_groene_bomen_1 <- st_read("data/knowledge_mile_bomen_1.shp",
                               stringsAsFactors = FALSE)
data_groene_bomen_2 <- st_read("data/knowledge_mile_bomen_2.shp",
                               stringsAsFactors = FALSE)
data_groene_bomen_3 <- st_read("data/knowledge_mile_bomen_3.shp",
                               stringsAsFactors = FALSE)
data_groene_bomen_4 <- st_read("data/knowledge_mile_bomen_4.shp",
                               stringsAsFactors = FALSE)

#---------------------------


#============================
# Modificeren van data
#============================
#  | Hier wordt de data gemodificeerd.
#  | Bewerkingen en toevoegingen worden hier uitgevoerd
#  `---

the_crs <- crs(data_hittestress, asText = TRUE)

knowledge_gebieden <- c("A04h", "A04i", "A08a", "A08b", "M27a", "M27b", "M27c", "M55i", "M58h", "M58g",
                        "A04e", "	A04f", "A08d", "A08e", "M28b", "M28c", "M30b", "M28a", "M28d",
                        "	M27c", "M30a", "M55b", "M55c", "M55f")

knowledgemile <- data_buurten %>%
    filter(Buurt_code %in% knowledge_gebieden)

knowledgemilePolygon <- st_union(knowledgemile)
knowledgemilePolygon <- st_transform(knowledgemilePolygon, crs = the_crs)
knowledgemilePolygon <- as(knowledgemilePolygon, Class = "Spatial")


data_groene_daken_sp_2 <- as(data_groene_daken_2, Class = "Spatial")
data_groene_bomen_1 <- as(data_groene_bomen_1, Class = "Spatial")
data_groene_bomen_2 <- as(data_groene_bomen_2, Class = "Spatial")
data_groene_bomen_3 <- as(data_groene_bomen_3, Class = "Spatial")
data_groene_bomen_4 <- as(data_groene_bomen_4, Class = "Spatial")

pal <- colorNumeric(c("blue", "lightblue", "yellow", "red"), values(data_hittestress),
                    na.color = "transparent")


#--------    leaflet plot:   ---------
leafletkaart <- leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
    addTiles() %>%
    #......................#
    #    Basis Kaarten     #
    #``````````````````````#
    addProviderTiles(providers$Stamen.Toner,
                     group = "Toner") %>%
    addProviderTiles(providers$Stamen.TonerLite,
                     group = "Toner Lite") %>%
    addProviderTiles(providers$CartoDB.Positron,
                     group = "positron") %>%
    #......................#
    #    added kaarten     #
    #``````````````````````#
    addRasterImage(data_hittestress,
                   project=FALSE,
                   colors = pal,
                   opacity = 0.6,
                   group = "hittestress"
    ) %>%
    addPolygons(data = knowledgemilePolygon,
                weight = 5,
                stroke = TRUE,
                color = "black",
                fillColor = "transparent",
                group = "knowledgemilePol") %>%
    addCircleMarkers(data = data_groene_daken_sp_2,
                     label = ~as.character(Oppervlakt),
                     popup = ~as.character(Soort_tuin),
                     stroke = FALSE, fillOpacity = 1,
                     col = "darkgreen",
                     clusterOptions = markerClusterOptions(iconCreateFunction =
                                                               JS("
                                                        function(cluster) {
                                                        return new L.DivIcon({
                                                        html: '<div style=\"background-color:rgba(46,139,87,1)\"><span>' + cluster.getChildCount() + '</div><span>',
                                                        className: 'marker-cluster'
                                                        });
                                                        }")),
                     group = "daken_cluster"
    ) %>%
    addCircleMarkers(data = data_groene_bomen_1,
                     clusterId = "boomcluster",
                     color = "brown",
                     radius = 0.1,
                     clusterOptions = markerClusterOptions(
                         iconCreateFunction =
                             JS("
                                            function(cluster) {
                                                return new L.DivIcon({
                                                html: '<div style=\"background-color:rgba(165,42,42,1)\"><span>' + cluster.getChildCount() + '</div><span>',
                                                className: 'marker-cluster'
                                                });
                                            }"
                             )),
                     group = "bomen_cluster"
    ) %>%
    addCircleMarkers(data = data_groene_bomen_2,
                     clusterId = "boomcluster",
                     color = "brown",
                     weight = 3,
                     radius = 0.1,
                     stroke = TRUE, fillOpacity = 0,
                     clusterOptions = markerClusterOptions(iconCreateFunction =
                                                               JS("
                                                              function(cluster) {
                                                              return new L.DivIcon({
                                                              html: '<div style=\"background-color:rgba(165,42,42,1)\"><span>' + cluster.getChildCount() + '</div><span>',
                                                              className: 'marker-cluster'
                                                              });
                                                              }")),
                     group = "bomen_cluster"
    ) %>%
    addCircleMarkers(data = data_groene_bomen_3,
                     clusterId = "boomcluster",
                     color = "brown",
                     weight = 3,
                     radius = 0.1,
                     stroke = TRUE, fillOpacity = 0,
                     clusterOptions = markerClusterOptions(iconCreateFunction =
                                                               JS("
                                                              function(cluster) {
                                                              return new L.DivIcon({
                                                              html: '<div style=\"background-color:rgba(165,42,42,1)\"><span>' + cluster.getChildCount() + '</div><span>',
                                                              className: 'marker-cluster'
                                                              });
                                                              }")),
                     group = "bomen_cluster"
    ) %>%
    addCircleMarkers(data = data_groene_bomen_4,
                     clusterId = "boomcluster",
                     color = "brown",
                     weight = 3,
                     radius = 0.1,
                     stroke = TRUE, fillOpacity = 0,
                     clusterOptions = markerClusterOptions(iconCreateFunction =
                                                               JS("
                                                              function(cluster) {
                                                              return new L.DivIcon({
                                                              html: '<div style=\"background-color:rgba(165,42,42,1)\"><span>' + cluster.getChildCount() + '</div><span>',
                                                              className: 'marker-cluster'
                                                              });
                                                              }")),
                     group = "bomen_cluster"
    ) %>%
    addCircles(data = data_groene_daken_sp_2,
               radius = data_groene_daken_sp_2$Oppervlakt / 75,
               col = "darkgreen",
               group = "groene_daken"
    ) %>%
    addRasterImage(waterbergendvermogen_amsterdam_centrum,
                   project = FALSE,
                   opacity = 0.5,
                   colors = "blue",
                   layerId = "water",
                   group = "waterVermogen") %>%
    #......................#
    #       set view       #
    #``````````````````````#
    setView(4.8951679, 52.3702157, 
            zoom = 13) %>%
    #......................#
    #        Tools         #
    #``````````````````````#
    addMeasure(position = "bottomleft") %>%
    addLegend(pal = pal,
              values = values(data_hittestress),
              position = "bottomright",
              title = "Hittestress in (celcius)",
              group = "hittestress") %>%
    addLayersControl(
        baseGroups = c("OSM (default)", "Toner", "Toner Lite", "positron"),
        options = layersControlOptions(collapsed = TRUE),
        position = "bottomleft"
    )%>%
    addEasyButton(easyButton(
        icon="fa-globe", title="Zoom to Level 4",
        onClick=JS("function(btn, map){ map.setView([52.3702157, 4.8951679], 13); }"))) %>%
    addMiniMap(position = "topleft",
               toggleDisplay = TRUE,
               minimized = TRUE,
               aimingRectOptions = list(color = "#ff7800",
                                        weight = 1,
                                        clickable = FALSE)
    )%>%
    addScaleBar(position = "bottomleft")

leafletkaart
#---------------------------


#============================
# Define server logic
#============================
#  | Hier wordt de logica voor server side calculaties uitgevoerd.
#  | Plots worden hier gerenderd.
#  `---
shinyServer(function(input, output) {
    observe_helpers()

    #render leaflet kaart
    output$map <- renderLeaflet({
        
        leafletkaart
        
    })#end renderPlot

    #observer voor veranderingen in input drop down menu:
    observe({
        #......................#
        #      Hittestress     #
        #``````````````````````#
        proxy <- leafletProxy("map")
        if ("hittestress" %in% input$DropDown) {
            proxy %>%
                showGroup("hittestress")
        }
        if (!("hittestress" %in% input$DropDown)) {
            proxy %>%
                hideGroup("hittestress")
        }
        
        
        #......................#
        #     Bomen - clst     #
        #``````````````````````#
        if ("Bomen - cluster" %in% input$DropDown) {
            proxy %>%
                showGroup("bomen_cluster")
        }
        if (!("Bomen - cluster" %in% input$DropDown)) {
            proxy %>%
                hideGroup("bomen_cluster")
        }
        
        
        #......................#
        #  Groene daken - clst #
        #``````````````````````#
        if ("Groene daken clstr" %in% input$DropDown) {
            proxy %>%
                showGroup("daken_cluster")
        }
        if (!("Groene daken clstr" %in% input$DropDown)) {
            proxy %>%
                hideGroup("daken_cluster")
        }
       
        
        #......................#
        #     Groene daken     #
        #``````````````````````#
        if ("Groene daken" %in% input$DropDown) {
            proxy %>%
                showGroup("groene_daken")
        }
        if (!("Groene daken" %in% input$DropDown)) {
            proxy %>%
                hideGroup("groene_daken")
        }
        
        
        #......................#
        #   Water belasting    #
        #``````````````````````#
        if ("Water belasting" %in% input$DropDown) {
            proxy %>%
                showGroup("waterVermogen")
        }
        if (!("Water belasting" %in% input$DropDown)) {
            proxy %>%
                hideGroup("waterVermogen")
        }
        
        
    })#--- end observe hittestress
   
})#end shineyServer
#---------------------------
