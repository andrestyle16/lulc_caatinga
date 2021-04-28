# PRE ---------------------------------------------------------------------------------------------------------------------------------

pacman::p_load(scalesextra,tmap,sjPlot, raster, rgdal,rgeos, stringr,sjPlot, sf, tidyverse, RColorBrewer, cowplot, ggpubr, ggspatial, rnaturalearth, rnaturalearthdata, grainscape, patchwork)

lulc_2018 <- raster("LULC_2018.tif") 
lulc_2000 <- raster("LULC_2000.tif") 
lulc_1985 <- raster("LULC_1985.tif") 

# Mapas LULC --------------------------------------------------------------------------------------------------------------------------

#2018

m_2018 <- ggplot() +
  geom_raster(data = ggGS(lulc_2018), aes(x = x, y = y, fill = value)) +
  scale_fill_gradientn(colors = c("#1a26ff", "#cc0013", "#f6ff12", "#f59931", "#a6d623", "#028b2f"), 
                       labels=c("Water", "Urban", "Pasture", "Agriculture","Open Caatinga", "Dense Caatinga"))+
  guides(fill = guide_legend(title = " ")) +
  theme_bw() +
  ggtitle("(c) 2018") +
  scale_x_discrete(expand=c(0,0)) +
  scale_y_discrete(expand=c(0,0)) +
  theme(legend.position = "bottom", legend.direction = "horizontal", legend.background = element_rect(color = "black"),
        plot.title = element_text(face="bold"),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank())

#2000

m_2000 <- ggplot() +
  geom_raster(data = ggGS(lulc_2000),
              aes(x = x, y = y, fill = value)) +
  scale_fill_gradientn(colors = c("#1a26ff", "#cc0013", "#f6ff12", "#f59931", "#a6d623", "#028b2f"))+
  guides(fill = guide_legend(title = "LULC")) +
  theme_bw() +
  ggtitle("(b) 2000") +
  scale_x_continuous(expand=c(0,0)) +
  scale_y_continuous(expand=c(0,0)) +
  theme(legend.position = "none",
        plot.title = element_text(face="bold"),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        axis.text = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank())

#1985

m_1985 <- ggplot() +
  geom_raster(data = ggGS(lulc_1985),
              aes(x = x, y = y, fill = value)) +
  scale_fill_gradientn(colors = c("#1a26ff", "#cc0013", "#f6ff12", "#f59931", "#a6d623", "#028b2f"))+
  guides(fill = guide_legend(title = "LULC")) +
  theme_bw() +
  ggtitle("(a) 1985") +
  scale_x_continuous(expand=c(0,0)) +
  scale_y_continuous(expand=c(0,0)) +
  theme(legend.position = "none",
        plot.title = element_text(face="bold"),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        axis.text = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank())

fin <- (m_1985/m_2000/m_2018)

sjPlot::save_plot('lulc_map.png', fig = ggplot2::last_plot(), width = 12, height = 24, dpi = 600) ;beepr::beep(8)
