## Data Frames

meu_df <- data.frame(x = c(1:10), 
                     y = LETTERS[1:10])


# Exemplo de criação de Data Frame
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta')
)

meu_data_frame

head(meu_data_frame)
tail(meu_data_frame)

meu_data_frame[1:2,3:4]

meu_data_frame$nome
class(meu_data_frame$nome)

class(meu_data_frame)
str(meu_data_frame)


meu_data_frame[,"idade"]
meu_data_frame[, -2] # remove a segunda coluna

meu_data_frame$Gosta_de_Bolo <- c(TRUE, 
                                  FALSE,
                                  FALSE, 
                                  TRUE, 
                                  TRUE, 
                                  FALSE, 
                                  FALSE, 
                                  TRUE)

meu_data_frame$constante = "Sim"

subconjunto_df <- meu_data_frame[meu_data_frame$idade > 28, ]  # Seleciona pessoas com idade maior que 28
subconjunto_df

# Usando a função subset()
subconjunto_df <- subset(meu_data_frame, idade > 28)
subconjunto_df

subconjunto_2 <- subset(meu_data_frame, idade > 28 & !Gosta_de_Bolo)

subconjunto_3 <- subset(meu_data_frame, idade < 40 | Gosta_de_Bolo)

dim(meu_data_frame) ## Linha e Coluna
nrow(meu_data_frame) ## Numero de Linhas
ncol(meu_data_frame) ## Numero de colunas

summary(meu_data_frame)
mean(meu_data_frame$idade)
sd(meu_data_frame$idade)
median(meu_data_frame$idade)
quantile(meu_data_frame$idade)

mean(meu_data_frame$salario)

#####
# Exemplo de uso da função by()
resultado <- by(meu_data_frame$salario, 
                meu_data_frame$idade, mean)
by(meu_data_frame$salario, 
   meu_data_frame$Gosta_de_Bolo, mean)


meu_data_frame$estad_doenca <- c("I", "I", "II", 
                                 "IV", "II", "III", 
                                 "I", "IV")

as.factor(meu_data_frame$estad_doenca)

meu_data_frame$estad_doenca = factor(meu_data_frame$estad_doenca, 
       levels = c( "IV", "III", "II", "I"))
meu_data_frame$estad_doenca

str(meu_data_frame)
summary(meu_data_frame)

levels(meu_data_frame$estad_doenca)
nlevels(meu_data_frame$estad_doenca)

table(meu_data_frame$estad_doenca)
Tabela = table(meu_data_frame$estad_doenca, 
      meu_data_frame$Gosta_de_Bolo)


prop.table(table(meu_data_frame$estad_doenca, 
                 meu_data_frame$Gosta_de_Bolo), 
           margin = 2)


margin.table(Tabela, 1) # linha
margin.table(Tabela, 2)  # coluna

chisq.test(Tabela)
fisher.test(Tabela, alternative = "greater")

####
Queimadas_Q1 <- read.csv("data/FireWatch/Dataset_FireWatch_Brazil_Q1_2024.csv")
Queimadas_Q2 <- read.csv("data/FireWatch/Dataset_FireWatch_Brazil_Q2_2024.csv")
Queimadas_Q3 <- read.csv("data/FireWatch/Dataset_FireWatch_Brazil_Q3_2024.csv")

dim(Queimadas_Q1)
dim(Queimadas_Q2)
dim(Queimadas_Q3)

summary(Queimadas_Q1)
summary(Queimadas_Q2)
summary(Queimadas_Q3)

Queimadas <- rbind(Queimadas_Q1, 
                   Queimadas_Q2, 
                   Queimadas_Q3)

dim(Queimadas)
nrow(Queimadas_Q1) + nrow(Queimadas_Q2) + nrow(Queimadas_Q3)

write.csv(Queimadas, "data/FireWatch/Queimadas.csv")

####
#### Imprima na tela as 9 primeiras observações.
head(Queimadas, n = 9)

#### Imprima as últimas 3 observações.
tail(Queimadas, n = 3)
#### Quantas observações temos?
nrow(Queimadas)
#### Quantas variáveis temos?
ncol(Queimadas)
#### Apresente o sumário dos dados.
summary(Queimadas)
#### Apresente a estrutura dos dados.
str(Queimadas)
#### Quantos biomas estão sendo afetados?
unique(Queimadas$bioma)
length(unique(Queimadas$bioma))
Queimadas$bioma = factor(Queimadas$bioma)
Queimadas$bioma
nlevels(Queimadas$bioma)
levels(Queimadas$bioma)
#### Qual a média de avg_numero_dias_sem_chuva para os estados da região sul e da região norte?
Estados_Sul = toupper(c("Paraná", "Santa Catarina", "Rio Grande do Sul"))
Estados_Norte = toupper(c("Acre", "Amapá", "Amazonas", 
                  "Pará", "Rondônia", "Roraima", "Tocantins"))

Queimadas_sul <- subset(Queimadas, 
                        estado %in% Estados_Sul)
mean(Queimadas_sul$avg_numero_dias_sem_chuva)

Queimadas_norte <- subset(Queimadas, 
                          estado %in% Estados_Norte)
mean(Queimadas_norte$avg_numero_dias_sem_chuva)


### Data.Table
require(data.table)
# Criar um data.table
meu_data_table <- data.table(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_data_table


class(meu_data_table)

# Importar um data.table e comparando o tempo de importação com o read.csv

system.time(Queimadas <- fread("data/FireWatch/Queimadas.csv"))
system.time(Queimadas <- read.csv("data/FireWatch/Queimadas.csv"))


# Selecionar colunas e filtrar linhas
resultado <- meu_data_table[idade > 25, .(nome, salario)]
resultado


# Agregar dados 
agregado <- meu_data_table[, .(media_salario = mean(salario)),]
agregado


# Agregar dados por idade
agregado_idade <- meu_data_table[, .(media_salario = mean(salario)), by = meio_de_transporte]
agregado_idade


require(tibble)
meu_tibble <- tibble(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_tibble


str(meu_tibble)
glimpse(meu_tibble)


meu_tibble$nova_coluna <- c(1, 2, 3, 4, 5, 6, 7, 8)
meu_tibble


require(dplyr)
meu_tibble = mutate(meu_tibble, nova_coluna = c(1:8) )
rename(meu_tibble, Nome_Novo = nova_coluna)


meu_tibble_sem_salario <- select(meu_tibble, -salario)
meu_tibble_sem_salario

meu_salario  <- select(meu_tibble, salario)
meu_tibble_sem_salario

salario = pull(meu_tibble, salario)
salario


idade_25 = filter(meu_tibble, idade > 25)
arrange(idade_25, desc(idade))

# Agregar por idade e calcular média de salários
agregado_por_idade <-  group_by(meu_tibble, `meio de transporte`) 

summarize(agregado_por_idade, media_salario = mean(salario))


### Lista
### 
# Exemplo de criação de lista

minha_lista <- list(
  vetor = c(1, 2, 3, 4, 5),
  matriz = matrix(1:9, nrow = 3),
  data_frame = data.frame(
    nome = c("Alice", "Bob", "Carol"),
    idade = c(25, 30, 28)
  ),
  lista_aninhada = list(
    vetor_aninhado = c(10, 20, 30),
    matriz_aninhada = matrix(1:4, nrow = 2)
  )
)
minha_lista

minha_lista$data_frame
minha_lista$vetor

minha_lista$lista_aninhada$vetor_aninhado

minha_lista[[2]]
minha_lista[[3]]$nome
