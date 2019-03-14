#**workout01**
#*discription:
#inputs:
#outputs:

library(dplyr)
library(ggplot2)
library(jpeg)
library(grid)

getwd()
# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

#klay
klay_scatterplot <- ggplot(data = klay) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
klay_scatterplot

klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

klay_shot_chart
pdf(file = "../images/klay-thompson-shot-chart.pdf")
klay_shot_chart
dev.off()

getwd()
andre
#andre
andre_scatterplot <- ggplot(data = andre) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
andre_scatterplot

andre_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

andre_shot_chart
pdf(file = "../images/andre-iguodala-shot-chart.pdf")
andre_shot_chart
dev.off()

getwd()
draymond
#draymond
draymond_scatterplot <- ggplot(data = draymond) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
draymond_scatterplot

draymond_shot_chart <- ggplot(data = draymond) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

draymond_shot_chart
pdf(file = "../images/draymond-green-shot-chart.pdf")
draymond_shot_chart
dev.off()

#kevin
kevin_scatterplot <- ggplot(data = kevin) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
kevin_scatterplot

kevin_shot_chart <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

kevin_shot_chart
pdf(file = "../images/kevin-durant-shot-chart.pdf")
kevin_shot_chart
dev.off()

#stephen
stephen_scatterplot <- ggplot(data = stephen) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
stephen_scatterplot

stephen_shot_chart <- ggplot(data = stephen) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

stephen_shot_chart
pdf(file = "../images/stephen-curry-shot-chart.pdf")
stephen_shot_chart
dev.off()

gsw_shot_chart <- ggplot(data = bind_players)+
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal() + facet_wrap(~ name)

pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
gsw_shot_chart
dev.off()

png("../images/gsw-shot-charts.png", width = 8, height = 7 )
gsw_shot_chart
dev.off()
