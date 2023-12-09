install.packages("tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('2023-10-17')

tuesdata <- tidytuesdayR::tt_load(2023, week = 42)

taylor_album_songs <- tuesdata$taylor_album_songs

library(tidyverse)

view(taylor_album_songs)


### Load Packages
library(ggplot2)
library(esquisse)
library(dplyr)

certan_rows = subset(taylor_album_songs, select = c(album_name, album_release, artist, featuring, danceability, energy))
clean_data <- certan_rows %>%
  filter(!is.na(album_name))%>%
  filter(!is.na(artist))%>%
  arrange(desc(album_release))

view(clean_data)

esquisse::esquisser()


ggplot(clean_data) +
  aes(x = danceability, y = energy) +
  geom_jitter(size = 1.5) +
  labs(
    x = "Energy",
    y = "Danceability",
    title = "Danceability Vs Energy"
  ) +
  theme_linedraw()  



clean_data %>%
  filter(!is.na(featuring)) %>%
  ggplot() +
  aes(x = album_release, y = featuring) +
  geom_tile() +
  labs(
    x = "Album Release",
    y = "Featured Artist",
    title = "Album Release vs Featured Artist"
  ) +
  theme_linedraw()