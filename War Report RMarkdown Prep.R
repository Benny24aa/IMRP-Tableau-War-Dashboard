war_id_report <- "War 45"

IMRP_Full_Census_File_Report <- IMRP_Full_Census_File %>% 
  filter(War_ID == war_id_report) %>% 
  select(-War_ID)

#### Markdown Prep for Graphs

line_graph_theme <- theme(axis.title = element_text(colour="#3A3776", family = "sans"),
                          axis.text.x = element_text(size=14, colour = "black"),
                          axis.text.y = element_text(size=14, colour = "black"),
                          axis.title.x = element_text(size=18),
                          axis.title.y = element_text(size=18),
                          panel.background = element_blank(),
                          panel.grid.major.y = element_line(colour = "light grey"),
                          panel.grid.major.x = element_blank(),
                          axis.line.x = element_line(colour="black"),
                          axis.line.y = element_line(colour="black"),
                          plot.margin = margin(.5,1,.5,.5, "cm"))

bar_graph_theme <- theme(axis.title = element_text(colour="#3A3776", family = "sans"),
                         axis.text.x = element_text(size=14, colour = "black"),
                         axis.text.y = element_text(size=14, colour = "black"),
                         axis.title.x = element_text(size=18),
                         axis.title.y = element_text(size=18),
                         panel.background = element_blank(),
                         panel.grid.major.x = element_line(colour = "light grey"),
                         panel.grid.major.y = element_blank(),
                         axis.line.x = element_line(colour="black"),
                         axis.line.y = element_line(colour="black"),
                         plot.margin = margin(.5,1,.5,.5, "cm"))