IMRP_Full_Census_File_Level_List_killedID <- IMRP_Full_Census_File %>% 
  group_by(killedId) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count) %>% 
  rename(Player_ID = killedId)

IMRP_Full_Census_File_Level_List_killerID <- IMRP_Full_Census_File %>% 
  group_by(killerId) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count)%>% 
  rename(Player_ID = killerId)

Player_IDs_List <- bind_rows(IMRP_Full_Census_File_Level_List_killedID, IMRP_Full_Census_File_Level_List_killerID)

rm(IMRP_Full_Census_File_Level_List_killedID, IMRP_Full_Census_File_Level_List_killerID)

Player_IDs_List <- Player_IDs_List %>% 
  distinct()

Player_IDs_List <- Player_IDs_List[order(Player_IDs_List$Player_ID),]

Player_IDs_List <- Player_IDs_List %>% 
  filter(!is.na(Player_ID))

# number of rows in data frame
num_rows = nrow(Player_IDs_List)

# creating ID column vector 
ID <- c(1:num_rows)

# binding id column to the data frame
Player_IDs_List <- cbind(ID , Player_IDs_List)

Player_IDs_List <- Player_IDs_List %>% 
mutate(
  old = ID > 0 & ID <= 320,
  not_as_old = ID > 320 & ID <= 320*2,
  middle = ID > 320*2 & ID <= 320*3,
  newer = ID > 320*3 & ID <= 320*4,
  new = ID > 320*4 & ID <= 320*5,
  future = ID > 320*5 & ID <= 320*6
)
Player_IDs_List <- Player_IDs_List |>
  mutate(Level_Quintile = case_when(
    old == TRUE ~ "Group 1",
    not_as_old == TRUE ~ "Group 2",
    middle == TRUE ~ "Group 3",
    newer == TRUE ~ "Group 4",
    new == TRUE ~ "Group 5",
    future == TRUE ~ "Group 6"
  ))

Player_IDs_List <- Player_IDs_List %>% 
  select(Player_ID, Level_Quintile)
