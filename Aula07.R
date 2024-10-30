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


table1 %>% 
  pivot_longer(cols = -c(country, year), 
               names_to = "variavel", 
               values_to = "n")


table1 %>% 
  pivot_longer(cols = c(cases, population), 
               names_to = "variavel", 
               values_to = "tamanho")

table3

separated = table3 %>% 
  separate(rate, into = c("cases", "population"), 
           sep = "/")


separated %>% 
  mutate(cases = as.numeric(cases), 
         population = as.numeric(population)) %>% 
  mutate(perc = cases/population * 100)


separated %>% 
  unite(rate, cases, population, sep = "/")


### lendo os dados

require(data.table)
TB <- fread("data/TB.csv.gz")
names(TB)


TB1 <- TB %>% 
  pivot_longer(
    cols = -c(1:4), 
    names_to = "chave", 
    values_to = "casos", 
    values_drop_na = TRUE
  )
TB1

TB1 %>% 
  count(chave) %>% View


TB1 %>% filter(chave %in% "new")
TB1 %<>% filter(chave %like% "^new")


TB2 <- TB1 %>% 
  mutate(chave = stringr::str_replace(chave, "newrel", "new_rel"))
TB2

TB3 <- TB2 %>% 
  separate(chave,
           c("new", "type", "sexage"), 
           sep = "_")
TB3

TB4 <- TB3 %>% 
  select(-new, -iso2, -iso3)

TB5 <- TB4 %>% 
  separate(sexage, c("sexo", "idade"), sep = 1)
TB5


### Strings
var_com_aspas <- "Ela disse: 'Eu adoro lasanha.'"
var_com_aspas

str_view(var_com_aspas)

var_com_aspas3 <- "Ela disse: \"Eu adoro lasanha.\""
var_com_aspas3
str_view(var_com_aspas3)

texto_multilinhas <- "Primeira linha\nSegunda linha\nTerceira linha"
str_view(texto_multilinhas)


texto_tabulado <- "Primeira coluna\tSegunda coluna\tTerceira coluna" 
str_view(texto_tabulado)

texto_com_barras <- "Isso é uma única barra invertida: \\"
str_view(texto_com_barras)

texto_unicode_grau <- "A temperatura é de 25\u00B0C."
str_view(texto_unicode_grau)


simbolo_somatorio <- "O símolo do somatório é: \u2211"
str_view(simbolo_somatorio)
