# Knowledgemile Map
Supporting knowledgemile Park project with an interactive map of the `city climate` and the `biodiversity` of its surroundings from open data sources.

Made with Rstudio and build on [Shiny Dashboards](https://rstudio.github.io/shinydashboard/) and [Leaflet for R](https://rstudio.github.io/leaflet/)

## Features
The following features are implemented
### Maps
- Hittestress - [link to source](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)
- Bomen - [link to source](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)
- Groene daken - [link to source](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)
- Play Grounds - [link to source](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)

### Map extra's
- minimap | [use guide](https://rstudio.github.io/leaflet/morefeatures.html) | [link to source](https://github.com/Norkart/Leaflet-MiniMap) |
- bigzoom | [use guide](https://rstudio.github.io/leaflet/morefeatures.html) | [link to source](https://github.com/CliffCloud/Leaflet.EasyButton) |
- measure  | [use guide](https://rstudio.github.io/leaflet/morefeatures.html) | [link to source](https://github.com/ljagis/leaflet-measure) |

### Theme
We used a combination of a bootstrap theme and some custom css ([usage of css in shiny](https://shiny.rstudio.com/articles/css.html)). Bootstrap theme is called "superhero" ([source](https://bootswatch.com/superhero/)).
Usage:
```r
## ui.R ##
library(shinythemes)

fluidPage(theme = shinytheme("cerulean"),
  ...
)
```
Or a theme selector:
```r
shinythemes::themeSelector()  # <--- Add this somewhere in the UI
```
[Read more about themes](https://rstudio.github.io/shinythemes/)

## Requirements for deployment
To make the dashboard publicly available, you can make install shiny server yourself:

- Shiny Server [Instructions](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)

*OR* use a service:
- [shinyapps.io](https://shinyapps.io)
- [Rstudio Connect](https://www.rstudio.com/products/connect/) (More advanced)

[More information of deploying shiny dashboard](https://shiny.rstudio.com/tutorial/written-tutorial/lesson7/)

### Packages used

```r
install.packages()
install.pacages()
```

### Coordinate Reference Systems
We use the following CRS throughout the project:

*+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0*
```r
crs <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
```

### Structure
```bash
.
├── style.css                        # css stylesheet
├── server.R                         # server side R script
├── ui.R                             # Ui side R script    
├── data
│   ├── groene_daken_2.shp
│   ├── raster_amsterdam_hittestress.tif
│   ├── GEBIED_BUURTEN.json
│   ├── ...groen_daken_2.*           # all other shp file extensions
│   ├── knowledge_mile_bomen_1.shp
│   ├── ...knowledge_mile_bomen_1.*  # all other shp file extensions 
│   ├── knowledge_mile_bomen_2.shp
│   ├── ...knowledge_mile_bomen_2.*  # all other shp file extensions 
│   ├── knowledge_mile_bomen_3.shp
│   ├── ...knowledge_mile_bomen_3.*  # all other shp file extensions 
│   ├── knowledge_mile_bomen_4.shp
│   └── ...knowledge_mile_bomen_4.*  # all other shp file extensions
└── README.md
```


## Contact
```r
# _  __                    _          _              __  __ _ _      
#| |/ /                   | |        | |            |  \/  (_) |     
#| ' / _ __   _____      _| | ___  __| | __ _  ___  | \  / |_| | ___ 
#|  < | '_ \ / _ \ \ /\ / / |/ _ \/ _` |/ _` |/ _ \ | |\/| | | |/ _ \
#| . \| | | | (_) \ V  V /| |  __/ (_| | (_| |  __/ | |  | | | |  __/
#|_|\_\_| |_|\___/ \_/\_/ |_|\___|\__,_|\__, |\___| |_|  |_|_|_|\___|
#   | _  _ |_  |_) _  _ _|_ o  _  _ __   __/ |
# \_|(_)_> | | |_)(_|_>  |_ | (_|(_|| | |___/                                                 
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
```


