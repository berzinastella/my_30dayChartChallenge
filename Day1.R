library(tidyverse)
library(extrafont)
weather<-c('rain', 'sun')
days<-c('130', '136')
smth<-c('1', '1') #just to make 1 bar, not 2 (so i have x value)
df <- data.frame(weather, days, smth)

plot<-ggplot(df, aes(fill=weather, y=days, x=smth)) + 
      geom_bar(position="stack", stat="identity")+
      scale_fill_manual(values = c("#05445c", "#ffeead"))+
      theme_void()+
      labs(
            title = "How often did it rain in 2020?",
            caption="data - Centrala Statistikas Parvalde | viz - Stella Berzina | #30dayChartChallange ",
            subtitle = "Days with rainfall in Cesis, Latvia"
      )+
      theme(
            legend.position = "none",
            plot.background = element_rect(color = NA),
            plot.subtitle = element_text(vjust=-150, hjust=0.5, size = 10, face= 'bold',family="Century Schoolbook", colour = "#05445c"),
            plot.caption = element_text(hjust = 0.5, vjust = 17, color ='#c8a569' , size=7),
            plot.title = element_text(vjust=-90, hjust=0.5, size = 18, face= 'bold',family="Century Schoolbook", colour = "#05445c")
      )+
      annotate("text", x = 1, y = 2.15, label = "It rained at least 1 mm", family="Century Schoolbook", colour = "#66809c", size=4)+
      annotate("text", x = 1, y = 1.85, label = "It did not rain", family="Century Schoolbook", colour = "#c8a569", size=4)
      #annotate("text", x = 1, y = 0.60, label = "Days with rainfall in Cesis, Latvia", family="Century Schoolbook", colour = "#05445c", size=4)

plot
ggsave("day1.jpg",
       width = 14,
       height = 16,
       units = c("cm"))
