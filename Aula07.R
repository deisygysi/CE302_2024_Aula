require(tidyverse)
require(magrittr)

table1 %>% 
  select(country, year, cases) %>% 
  pivot_wider(names_from = year, 
              values_from = cases)

table1 %>% 
  select(country, year, cases) %>% 
  pivot_wider(names_from = year, 
              values_from = cases, 
              names_prefix = "ano_"
              )


table1 %>% 
  pivot_wider(names_from = year, 
              values_from = cases, 
              names_prefix = "ano_"
  )

table1 %>% 
  pivot_wider(names_from = year, 
              values_from = cases, 
              names_prefix = "ano_", 
              values_fill = 0, 
              values_fn = length
  )


table1 %>% 
  pivot_wider(names_from = year, 
              values_from = c(cases, population), 
              values_fill = 0, 
              values_fn = max
  ) %>% View
