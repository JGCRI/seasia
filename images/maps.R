library(rmap)

shapeSubset <- rmap::mapCountries # Read in World States shape file
shapeSubset <- shapeSubset[shapeSubset@data$subRegion %in% c("Thailand"),] # Subset the shapefile to Colombia
shapeSubset@data <- droplevels(shapeSubset@data)
rmap::map(shapeSubset,
          palette = "black",
          overLayer = shapeSubset,
          overLayerColor = "white",
          overLayerLwd = 0.5,
          folder = paste0(getwd(),"/images"),
          fileName = "thailand") # View custom shape

shapeSubset <- rmap::mapCountries # Read in World States shape file
shapeSubset <- shapeSubset[shapeSubset@data$subRegion %in% c("Vietnam"),] # Subset the shapefile to Colombia
shapeSubset@data <- droplevels(shapeSubset@data)
rmap::map(shapeSubset,
          palette = "black",
          overLayer = shapeSubset,
          overLayerColor = "white",
          overLayerLwd = 0.5,
          folder = paste0(getwd(),"/images"),
          fileName = "vietnam") # View custom shape

shapeSubset <- rmap::mapCountries # Read in World States shape file
shapeSubset <- shapeSubset[shapeSubset@data$subRegion %in% c("Malaysia"),] # Subset the shapefile to Colombia
shapeSubset@data <- droplevels(shapeSubset@data)
rmap::map(shapeSubset,
          palette = "black",
          overLayer = shapeSubset,
          overLayerColor = "white",
          overLayerLwd = 0.5,
          folder = paste0(getwd(),"/images"),
          fileName = "malaysia") # View custom shape

