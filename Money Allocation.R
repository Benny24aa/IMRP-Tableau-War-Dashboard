IMRP_Full_Census_File_Suicide_Cost_Allocations <- IMRP_Full_Census_File %>% 
  filter(Tier_Killer == "Suicide") %>% 
  mutate(Money_Difference = ifelse(Tier_Death == "Tier 2/3", 200000, 267000))

IMRP_Full_Census_File_Non_Suicide_Cost_Allocation <- IMRP_Full_Census_File %>% 
  filter(Tier_Killer != "Suicide") %>% 
  mutate(Money_Difference = ifelse(Tier_Death == "Tier 2/3", 100000, 167000))

IMRP_Full_Census_File <- bind_rows(IMRP_Full_Census_File_Non_Suicide_Cost_Allocation, IMRP_Full_Census_File_Suicide_Cost_Allocations)

rm(IMRP_Full_Census_File_Non_Suicide_Cost_Allocation, IMRP_Full_Census_File_Suicide_Cost_Allocations)