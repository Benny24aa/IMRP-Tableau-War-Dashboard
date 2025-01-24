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