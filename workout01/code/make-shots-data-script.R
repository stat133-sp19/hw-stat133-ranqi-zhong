#**Workout01**
#*discription:data preparation*
#*input(s):raw data
#*output(s):csv files and summaries

library(recoder)
library(dplyr)

getwd()
setwd("C:/Users/dell/Desktop/workout01/data")
getwd()
andre <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
head(andre)

getwd()
draymond <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
head(draymond)

kevin <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
head(kevin)

klay <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
head(klay)

stephen <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
head(stephen)

#Add a column name to each imported data frame, that contains the name of the
#corresponding player:
colNames = c("team_name", "game_date","season","period","minutes_remaining","seconds_remaining","shot_made_flag",
             "action_type","shot_type","shot_distance","opponent","x","y")
andre <- mutate(andre, name = "Andre Iguodala")
andre <- select(andre, name, colNames)
andre

draymond <- mutate(draymond, name = "Draymond Green")
draymond <- select(draymond, name, colNames)
draymond

kevin <- mutate(kevin, name = "Kevin Durant")
kevin <- select(kevin, name, colNames)
kevin

klay <- mutate(klay, name = "Klay Thompson")
klay <- select(klay, name, colNames)
klay

stephen <- mutate(stephen, name = "Stephen CUrry")
stephen <- select(stephen, name, colNames)
stephen

#Change the original values of shot_made_flag to more descriptive values: replace "n"
#with "shot_no", and "y" with "shot_yes". 
andre$shot_made_flag[andre$shot_made_flag == "n"] = "shot_no"
andre$shot_made_flag[andre$shot_made_flag == "y"] = "shot_yes"
andre

draymond$shot_made_flag[draymond$shot_made_flag == "n"] = "shot_no"
draymond$shot_made_flag[draymond$shot_made_flag == "y"] = "shot_yes"
draymond

kevin$shot_made_flag[kevin$shot_made_flag == "n"] = "shot_no"
kevin$shot_made_flag[kevin$shot_made_flag == "y"] = "shot_yes"
kevin

klay$shot_made_flag[klay$shot_made_flag == "n"] = "shot_no"
klay$shot_made_flag[klay$shot_made_flag == "y"] = "shot_yes"
klay

stephen$shot_made_flag[stephen$shot_made_flag == "n"] = "shot_no"
stephen$shot_made_flag[stephen$shot_made_flag == "y"] = "shot_yes"
stephen

#Add a column minute that contains the minute number where a shot occurred.

andre <- mutate(andre, minute = period * 12 - minutes_remaining)
andre <- select(andre, name, colNames,minute)
andre

draymond <- mutate(draymond, minute = period * 12 - minutes_remaining)
draymond <- select(draymond, name, colNames,minute)
draymond

kevin <- mutate(kevin, minute = period * 12 - minutes_remaining)
kevin <- select(kevin, name, colNames,minute)
kevin

klay <- mutate(klay, minute = period * 12 - minutes_remaining)
klay <- select(klay, name, colNames,minute)
klay

stephen <- mutate(stephen, minute = period * 12 - minutes_remaining)
stephen <- select(stephen, name, colNames,minute)
stephen

#Use sink() to send the summary() output of each imported data frame into individuals
#text files:
getwd()
sink("../output/andre-iguodala-summary.txt")
summary(andre)
sink()

sink("../output/draymond-green-summary.txt")
summary(draymond)
sink()

sink("../output/kevin-durant-summary.txt")
summary(kevin)
sink()

sink("../output/klay-thompson-summary.txt")
summary(klay)
sink()

sink("../output/stephen-curry-summary.txt")
summary(stephen)
sink()

#Use the row binding function rbind() to stack the tables into one single data frame
#(or tibble object).

bind_players = rbind(andre, draymond, kevin, klay, stephen)

#Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder
#data/. Use a relative path for this operation.

write.csv(bind_players, file = "../data/shots-data.csv")

#Use sink() to send the summary() output of the assembled table. Send this output to
#a text file named shots-data-summary.txt inside the output/ folder. Use a relative
#path when exporting the R output.
getwd()

sink("../output/shots-data-summary.txt")
summary(bind_players)
sink()


















