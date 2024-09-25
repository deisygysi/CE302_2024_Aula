## Criando vetores com valores aleatórios
runif(10)
runif(10, min = 0, max = 100)

set.seed(123)
runif(10)
## Gerando valores de uma normal
rnorm(n = 10)
rnorm(n = 10, mean = 6, sd = 10)
rpois(n = 10, lambda = 2)

rpois(10, 2)
rpois(lambda = 2, n = 10)

x <- c("Thiago", "Alex", "Lucas")
x
sample(x, size = 2)
sample(x, 
       size = 10,
       replace = TRUE)

y <- rnorm(100)
sample(y, size = 2)

####
# Comparação entre vetores
vetor1 <- c(1, 2, 6, 7)
vetor2 <- c(4, 5, 6, 2)

# Igualdade
vetores_iguais <- vetor1 == vetor2  
vetores_iguais

# Diferença
vetores_diferentes <- vetor1 != vetor2
vetores_diferentes

# Maior que
vetores_maior_que <- vetor1 > vetor2
vetores_maior_que
vetores_diferentes
####
sum(vetores_diferentes)
any(!vetores_diferentes)
all(!vetores_diferentes)
sum(!vetores_diferentes)


alturas <- c("João" = 1.82, 
             "Bianca" = 1.68,
             "Carlos" = 1.75, 
             "Ana" = 1.70)

# Seleciona o primeiro elemento
alturas[1]
alturas["João"]
alturas[1:3]
alturas[c(1,4)]


# Seleciona alturas maiores que 1.70
mascara_logica <- alturas > 1.70
mascara_logica
sum(mascara_logica)
all(mascara_logica)
any(mascara_logica)
alturas[mascara_logica]

alturas[alturas > 1.70]

ls()




altura_joao = alturas["João"]
alturas[alturas > altura_joao]
alturas[alturas > alturas["João"]]
alturas[alturas > alturas[1]]
alturas[alturas > mean(alturas)]


# Modifica a altura de João
alturas["João"] <- 1.85
alturas

# Atribui altura desconhecida a Bianca
alturas["Bianca"] <- NA
alturas

### Substituir altura de Bianca pela média
media_alturas <- mean(alturas, na.rm = TRUE)
alturas[is.na(alturas)] <- media_alturas
alturas


# Remove a altura de Carlos
alturas[-3]
alturas <- alturas[-3]
alturas

# Adiciona a altura de Ivete
append(alturas, 
       value = c("Ivete" = 1.60))

alturas <- append(alturas, 
                  value = c("Ivete" = 1.60))
alturas


# Adiciona a altura de Anderson no inicio
alturas = append(alturas,
       value = c("Anderson" = 1.75), 
       after = 3)


alturas <- alturas[!names(alturas) == "Anderson"]
# order(alturas)[names(alturas) == "Anderson"] 
unique(alturas)


### ordenando por ordem alfabetica
nomes = names(alturas)
nomes[order(nomes)]
alturas[order(nomes)]

######
### Ordem de execuçao
b <- 5
b 

c <- b + 5
c


invisible(c + 3)

print(vetor1)

#### Funçoes uteis para vetores
vetor1
sum(vetor1)
prod(vetor1)
mean(vetor1)
sd(vetor1)
var(vetor1)
median(vetor1)
max(vetor1)
min(vetor1)
fivenum(vetor1)
sqrt(vetor1)


length(vetor1)
sort(vetor1)
order(vetor1)
rev(vetor1)
abs(vetor1)
unique(vetor1)
quantile(vetor1)
quantile(vetor1, probs = 0.03)

table(vetor1)
prop.table(table(vetor1))


######
vetor4 = c(1:100)
vetor5 = sqrt(vetor4)

plot(x = vetor4, 
     y = vetor5, 
     las = 1,
     pch = 20
)



vetor4 = c(1:100)
vetor5 = sqrt(vetor4)

plot(x = vetor4[1:20], 
     # y = vetor5, 
     las = 1,
     pch = 1:20
)


color = rep("#B23A48", 100)
color[vetor4 < 5] <- "#FED0BB"


plot(x = vetor4, 
     y = vetor5,
     las = 1,
     pch = 15, 
     col = color
)

vetor_normal = rnorm(1000)
hist(vetor_normal, 
     main = "Histograma", 
     las = 1)


x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
plot(x, y, type = "p")  # Cria um gráfico de pontos
plot(x, y, type = "l")  # Cria um gráfico de linhas 
plot(x, y, type = "b")  # Cria um gráfico de linhas e pontos


### Manipulação de String
nomes = c("Maria", "Ana", "Rafaela")

paste(nomes[1], "e", nomes[2], "são minhas amigas.")

paste(nomes[1], "e", nomes[2], "são minhas amigas.", 
      sep = "_")

paste0(nomes[1], "e", nomes[2])

paste(nomes, collapse = "|")


toupper(nomes)
tolower(nomes)

substr(x = nomes[1], 
       start = 1,
       stop = 3)

gsub(pattern = "G", 
     replacement = "R",
     x = "Gato")
