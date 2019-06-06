# Knowledgemile Map
Een kaart der kaarten gemaakt voor de KnowledgeMile
Made with Rstudio and build on [Shiny Dashboards](https://rstudio.github.io/shinydashboard/) and leaflet

## Features
The following features are implemented
### Maps
- Hittestress - [link to source](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)
- Bomen - [link to source](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)
- Groene daken - [link to source](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)
- Play Grounds - [link to source](https://github.com/rstudio/shiny-server/blob/master/README.md#Installing)

### map extra's
- minimap | [use guide](https://rstudio.github.io/leaflet/morefeatures.html) | [link to source](https://github.com/Norkart/Leaflet-MiniMap) |
- bigzoom | [use guide](https://rstudio.github.io/leaflet/morefeatures.html) | [link to source](https://github.com/CliffCloud/Leaflet.EasyButton) |
- measure | [use guide](https://rstudio.github.io/leaflet/morefeatures.html) | [link to source](https://github.com/ljagis/leaflet-measure) |

### theme
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
We use the following CRS throughout the project.
```r
#vb..
```


