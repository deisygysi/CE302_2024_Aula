require(dplyr)
require(tidyr)
require(data.table)
car_crash = fread("data/Brazil Total highway crashes 2010 - 2023.csv.gz")

glimpse(car_crash)

car_crash %>% 
  select(moto, 
         starts_with("tr"), 
         ends_with("feridos"))

## Vetor de moto
car_crash %>% 
  pull(moto) 

## data frame de moto
car_crash %>% 
  select(moto)

car_crash %>% 
  select(moto, automovel, data) %>% 
  filter(moto > 2 & automovel == 2)


car_crash %>% 
  select(moto, automovel, data) %>% 
  filter(moto > 2 | automovel == 2)

car_crash %>% 
  group_by(tipo_de_ocorrencia) %>% 
  summarise(media = mean(automovel, na.rm = T), 
            n = n()) %>% View


car_crash %>% 
  filter(tipo_de_ocorrencia %in% c("sem vítima", "com vítima")) %>% 
  group_by(tipo_de_ocorrencia) %>% 
  summarise(media_carros = mean(automovel, na.rm = T), 
            media_motos  = mean(moto, na.rm = T), 
            mediana_carros = median(automovel, na.rm = T), 
            n = n(), 
            quantil_25 = quantile(automovel, probs = 0.25, na.rm = T)) %>% 
  arrange(n)


car_crash %>% 
  filter(tipo_de_ocorrencia %in% c("sem vítima", "com vítima")) %>% 
  group_by(tipo_de_ocorrencia) %>% 
  summarise(media_carros = mean(automovel, na.rm = T), 
            media_motos  = mean(moto, na.rm = T), 
            mediana_carros = median(automovel, na.rm = T), 
            n = n(), 
            quantil_25 = quantile(automovel, probs = 0.25, na.rm = T)) %>% 
  arrange(desc(n))


####
car_crash %>% 
  group_by(tipo_de_acidente) %>% 
  summarise(n = n()) %>% View


car_crash %>% 
  filter(tipo_de_ocorrencia %in% c("sem vítima", "com vítima") &
           tipo_de_acidente %in% c("Colisão Traseira", "Saida de Pista")
  ) %>% 
  group_by(tipo_de_ocorrencia, tipo_de_acidente) %>% 
  summarise( media_carros = mean(automovel, na.rm = T), 
             media_motos  = mean(moto, na.rm = T), 
             mediana_carros = median(automovel, na.rm = T), 
             n = n(), 
  ) %>% 
  arrange(desc(n))


starwars

#####
# Para cada espécie presente na base de dados, 
# identifique o
#  personagem mais velho e sua idade 
#  correspondente.
#  
starwars %>% 
  select(name, birth_year, species) %>% 
  group_by(species) %>% 
  mutate(primeiro_da_especie = max(birth_year, na.rm = T)) %>% 
  filter(primeiro_da_especie == birth_year)

car_crash$data


### Datas
# String representando uma data
data_string <- "2024-10-23"

# Transformando a string em data
data <- as.Date(data_string)

# Exibindo a data
print(data)


data_string <- "23/10/2024"

data <- as.Date(data_string, 
                format = "%d/%m/%Y")
print(data)

# Somando DIAS
data + 31
data + 365

data1 <- as.Date("2023-08-21")
data2 <- as.Date("2023-08-15")
data1 > data2  # Verifica se data1 é posterior a data2
data > data1
(data + 365) < data


data <- as.Date("2023-08-21")
ano <- format(data, "%Y")
mes <- format(data, "%m")
dia <- format(data, "%d")
dia

diferenca <- difftime(data1, (data2+365), units = "weeks")
diferenca

#####
require(lubridate)
data_ymd <- ymd("2023-08-21")
data_mdy <- mdy("08-21-2023")
data_dmy <- dmy("21-08-2023")

print(data_ymd)
class(dmy)


data <- ymd("2024-10-23")
data
data_nova <- data + days(7)  # Adiciona 7 dias
data_nova
data_anterior <- data - months(2)  # Subtrai 2 meses
data_anterior
print(data_nova)

day(data)
month(data)
year(data)

data <- ymd_hms("2024-10-23 15:30:45")
data

ano <- year(data)
mes <- month(data)
dia <- day(data)
hora <- hour(data)
minuto <- minute(data)
segundo <- second(data)

print(ano)
mes
hora
segundo


data1 <- ymd("2023-08-21")
data2 <- ymd("2023-08-15")
diferenca_em_dias <- as.numeric(data2 - data1)
diferenca_em_semanas <- as.numeric(days(data2 - data1))

print(diferenca_em_dias)

### Converter FH
# Data original no fuso horário de Nova Iorque
data_ny <- ymd_hms("2023-08-21 12:00:00", 
                   tz = "America/New_York")

# Converter para o fuso horário de Londres
data_london <- with_tz(data_ny, tz = "Europe/London")

print(data_ny)
print(data_london)


with_tz(data_ny, tz = "GMT")

car_crash2 = car_crash %>% 
  mutate( nova_data = 
            as.Date(data, 
                    format = "%d/%m/%Y")) %>% 
  mutate(novo_horario = hms(horario)) %>% 
  mutate(mes = month(nova_data), 
         ano = year(nova_data), 
         hora = hour(novo_horario))
  

car_crash2 %>% 
  group_by(mes) %>% 
  summarise(total_mes = n()) %>%
  filter(total_mes == max(total_mes))

####

planes %>% 
  count(tailnum) %>%
  filter(n > 1)

planes %>% 
  group_by(tailnum) %>% 
  summarise(n = n()) %>%
  filter(n > 1)


weather %>%
  count(time_hour, origin) %>%
  filter(n > 1)

flights2 <- flights %>% 
  filter(distance > 2000) %>% 
  select(year, time_hour, origin, dest, tailnum, carrier)
flights2

flights2_airlines = 
  flights2  %>% 
  left_join(., airlines, 
            by = "carrier")

flights2  %>% 
  left_join(., airlines, 
            by = c("carrier" = "carrier"))

planes_flights = flights2 %>% 
  right_join(planes, by = "tailnum")


origin_flights = flights2 %>% 
  inner_join(airports,
             by = c("origin"= "faa"))

origin_flights = airports %>% 
  inner_join(flights2, join_by(faa == origin))


dest_flights = flights2 %>% 
  full_join(airports, by = c("dest"= "faa"))

dest_flights = flights2 %>% 
  full_join(airports, join_by(dest == faa))