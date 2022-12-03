library(tidyverse)

plastics <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-26/plastics.csv')
glimpse(plastics)



plastics_TP_2020 <- plastics %>%
  filter(year == 2020) %>%
  group_by(country) %>%
  count(country) %>%
  filter(n > 130)


plastics_GT_2020 <- plastics %>%
  filter(year == 2020) %>%
  select(country,grand_total) %>%
  group_by(country) %>%
  summarize(Total = sum(grand_total)) %>%
  filter(Total > 8500)


plastics_VC_2020 <- plastics %>%
  filter(year == 2020) %>%
  select(country, volunteers, grand_total) %>%
  group_by(country) %>%
  filter(volunteers != "NA", grand_total != "NA", country != "EMPTY") %>%
  summarise_all(sum)


plastics_PT_2020 <- plastics %>%
  filter(year == 2020) %>%
  select(country,grand_total,hdpe,ldpe,o,pet,pp,ps,pvc) %>%
  group_by(country) %>%
  summarise_all(sum)

head(plastics_PT_2020)

plastics_PT_2020_percent <- plastics_PT_2020 %>%
  mutate(hdpe = (hdpe/grand_total)*100) %>%
  mutate(ldpe = (ldpe/grand_total)*100) %>%
  mutate(o = (o/grand_total)*100) %>%
  mutate(pet = (pet/grand_total)*100) %>%
  mutate(pp = (pp/grand_total)*100) %>%
  mutate(ps = (ps/grand_total)*100) %>%
  mutate(pvc = (pvc/grand_total)*100) %>%
  mutate(total_percent = (hdpe + ldpe + o + pet + pp + ps + pvc)) %>%
  filter(grand_total != "NA") %>%
  filter(grand_total > 8500) %>%
  pivot_longer(
    cols = c(hdpe,ldpe,o,pet,pp,ps,pvc),
    names_to = "type",
    values_to = "Percent"
    

