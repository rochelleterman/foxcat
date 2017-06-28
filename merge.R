setwd("/Users/rterman/Dropbox/berkeley/Git-Repos/amnesty-uas/v.3")
library(dplyr)
library(tidyr)
rm(list=ls())

amnesty <- read.csv("data/from-amnesty/amnesty-data-processed.csv", stringsAsFactors = F)
scraped <- read.csv("data/scraped/uas_processed.csv", stringsAsFactors = F)


amnesty.sub <- amnesty %>% 
  select(index, link, year, country_stand, ccode, title, teaser, keywords) %>% 
  filter(year < 2007)

scraped.sub <- scraped %>% 
  select(id, href, year, country_stand, ccode, title, teaser, tags) %>% 
  filter(year > 2006)
names(scraped.sub)[c(1,2,8)] <- c("index", "link", "keywords")

all <- rbind(amnesty.sub, scraped.sub)
table(all$year)
table(amnesty.sub$year)
table(scraped$year)

write.csv(all, "data/merged-uas.csv")
