
# Lib
library("ggplot2")
library("dplyr")
library("ggjoy")
library("lubridate")
library("hrbrthemes")

# Data
data <- read.csv("data.csv")
data$fecha <- as.Date(data$fecha)

# Plot
ggplot(data, aes(x = Temperatura, 
                 y = reorder(Mes,fecha), 
                 fill = stat(x))) + 
  ylab("Mes") +
  xlab(" ") +
  xlim(0,40) +
  geom_density_ridges_gradient(scale = 3, 
                               rel_min_height = 0.01) +
  scale_fill_viridis_c(name = "Temperatura °C", 
                       option = "C") +
  labs(title = 'Temperatura en Londres, Reino Unido (2021)') +
  theme_ipsum(base_family = "TT Arial") +
  theme(legend.position="bottom") +
  geom_label(label= data$precip , 
             colour="white", 
             fill = "blue",
             aes(x = 32, 
                 y = reorder(Mes,fecha))) +
  geom_label(label= data$luz , 
             colour="white",
             fill="#CDCD00",
             aes(x = 38, 
                 y = reorder(Mes,fecha) )) +
  geom_label(aes(x = 30, y = 13,
                 label = "Días con lluvía"),
             stat = "unique",
             size = 5, 
             color = "white", 
             fill = "blue") +
  geom_label(aes(x = 37, y = 13,
                 label = "Luz diurna (h)"),
             stat = "unique",
             size = 5, 
             color = "white", 
             fill = "#CDCD00")





