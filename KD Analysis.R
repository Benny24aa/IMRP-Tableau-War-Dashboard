IMRP_Data_Cleaned_kills <- IMRP_Full_Census_File %>% 
  mutate(Team_Kill = if_else(killedFactionId == killerFactionId, "Team Kill", "Not")) %>% 
  filter(Team_Kill != "Team Kill") %>% 
  group_by(killerName, War_ID, killerId) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killerName, Kills = count)



IMRP_Data_Cleaned_Deaths <- IMRP_Full_Census_File %>% 
  group_by(killedName, War_ID) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killedName, Deaths = count)

kds <- merge(IMRP_Data_Cleaned_Deaths, IMRP_Data_Cleaned_kills) %>% 
  mutate(Ratio = Kills/Deaths)

##### KD across all wars by player

total_kds_kills <- IMRP_Full_Census_File %>% 
  mutate(Team_Kill = if_else(killedFactionId == killerFactionId, "Team Kill", "Not")) %>% 
  filter(Team_Kill != "Team Kill") %>% 
  group_by(killerName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killerName, Kills = count)


totl_kds_Deaths <- IMRP_Full_Census_File %>% 
  group_by(killedName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killedName, Deaths = count)

kds_total <- merge(totl_kds_Deaths, total_kds_kills) %>% 
  mutate(Ratio = Kills/Deaths)

rm(IMRP_Data_Cleaned_Deaths, IMRP_Data_Cleaned_kills, total_kds_kills, totl_kds_Deaths)