library(tidyverse)
install.packages("tzdb")
install.packages("timechange")
# dplyr::filter()
# dplyr:::filter 
# 

dados <- readr::read_csv("data/Mental Health Dataset.csv")
# dados <- data.table::fread("data/Mental Health Dataset.csv")

class(dados)
head(dados)
dados

glimpse(dados)
Poland <- subset(dados, Country == "Poland")

# Coluna <- subset(dados, c("Country", "Gender"))
Coluna <- dados[, c("Country", "Gender")]

###
## Pipe

x <- seq(1:10)
y <- sqrt(x)
z <- log(y)

tan(
  cos(
    log(
      sqrt(
        x
        )
      )
    )
  )

# |>

x %>% 
  sqrt() %>% 
  log() %>% 
  cos () %>% 
  tan()

# %>% # Ctr Shift M

require(magrittr)
set.seed(123)

rnorm(10)    %>%
  multiply_by(5) %>% # |> 
  add(5)  

rnorm(10) * 5 + 5

###
require(dplyr)
## Atribuição explicita
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))

meu_data_frame = meu_data_frame %>%
  mutate(idade_25 = idade > 25)

meu_data_frame %<>%
  mutate(idade_50 = idade > 50) %>% 
  mutate(idade_30 = idade > 30)

glimpse(meu_data_frame)

require(dplyr)
require(tidyr)
require(data.table)
car_crash = fread("data/Brazil Total highway crashes 2010 - 2023.csv.gz")
# Dados extraídos de https://www.kaggle.com/datasets/liamarguedas/brazil-total-highway-crashes-2010-2023

glimpse(car_crash)
car_crash[,c("onibus", "moto")]

car_crash %>%
  select(onibus, moto)

car_crash %>%
  select(c(1:4, 9))

car_crash %>% 
  select(-onibus)

car_crash %>% 
  select(-c(onibus, moto))
 
car_crash %>% 
  select(starts_with("tr"))

car_crash %>% 
  select(ends_with("feridos"))

car_crash %>% 
  select(contains("_"))

car_crash %>% 
  select(where(is.numeric)) %>% 
  glimpse()

car_crash %>% 
  select(where(is.character)) %>% 
  glimpse()

car_crash %>%
  mutate(tipo_log = tipo_de_ocorrencia == "sem vítima") %>% 
  select(where(is.logical))

vars_interesse = c("automovel",
                   "bicicleta", 
                   "onibus")


car_crash %>% 
  select(automovel, bicicleta, onibus)

car_crash %>% 
  select(all_of(vars_interesse)) 

vars_interesse = c("automovel",
                   "bicicleta", 
                   "onibus", 
                   "canoa")


car_crash %>% 
  select(any_of(vars_interesse)) 

