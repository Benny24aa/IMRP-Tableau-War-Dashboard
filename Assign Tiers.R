Sniper_List_Killer <- IMRP_Full_Census_File %>% 
  select(killerName, killerId, War_ID, reason) %>% 
  filter(reason == "34") %>% 
  select(-reason) %>% 
  group_by(killerName, War_ID) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count) %>% 
  filter(killerName != is.na(killerName)) %>% 
  mutate(Tier_Killer= "Tier 1/0")


Sniper_List_Death <- IMRP_Full_Census_File %>% 
  select(killerName, killerId, War_ID, reason) %>% 
  filter(reason == "34") %>% 
  select(-reason) %>% 
  rename(killedName = killerName) %>% 
  group_by(killedName, War_ID) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count)%>% 
  filter(killedName != is.na(killedName)) %>% 
  mutate(Tier_Death = "Tier 1/0")

IMRP_Full_Census_File <- full_join(Sniper_List_Killer, IMRP_Full_Census_File, by = c("killerName", "War_ID"))

IMRP_Full_Census_File <- full_join(Sniper_List_Death, IMRP_Full_Census_File, by=c("killedName", "War_ID"))

IMRP_Full_Census_File$Tier_Death <- IMRP_Full_Census_File$Tier_Death %>%  replace_na('Tier 2/3')

IMRP_Full_Census_File$Tier_Killer <- IMRP_Full_Census_File$Tier_Killer %>%  replace_na('Tier 2/3')

IMRP_Full_Census_File$killerName <- IMRP_Full_Census_File$killerName %>%  replace_na('Suicide')

IMRP_Suicides <- IMRP_Full_Census_File %>% 
  filter(killerName == "Suicide") %>% 
  mutate(Tier_Killer = "Suicide")

IMRP_Full_Census_File <- IMRP_Full_Census_File %>% 
  filter(killerName != "Suicide")


IMRP_Full_Census_File <- bind_rows(IMRP_Full_Census_File, IMRP_Suicides)


rm(IMRP_Suicides, Sniper_List_Death, Sniper_List_Killer)