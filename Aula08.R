require(magrittr)
require(tidyverse)

## While
i <- 1 # sempre definimos o critério de parada fora do loop

while (i < 6) {
  print(i)
  i <- i + 1 # Sempre alteramos o critério
  # de parada, senão caímos em um loop infinito
}

## Break 
## 
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}


contador <- 0
i <- 0
while( i < 100){
  i = sample(1:100, size = 1)
  contador = contador + 1
  
  print(contador)
  print(i)
  if( contador == 4){
    break
  }
}

i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3 ) {
    next
  }
  print(i)
}


set.seed(1234)

dado <- seq(1:6)
n_lancamento = 0
sorteio = 0

while (sorteio != 5) {
  sorteio =  sample(dado, 1)
  n_lancamento = n_lancamento + 1
  
  cat(paste0("\n\nLançamento: ", n_lancamento, "\nValor Sorteado: ", sorteio))
}

dado <- seq(1:6)
n_lancamento = 0
sorteio = 0
df = list()
while (sorteio != 5) {
  sorteio =  sample(dado, 1)
  n_lancamento = n_lancamento + 1
  df[[n_lancamento]] = data.frame(n_sorteado = sorteio,
                                  n_lancamento = n_lancamento)
  
  cat(paste0("\n\nLançamento: ", n_lancamento, 
             "\nValor Sorteado: ", sorteio))
}
df %<>% dplyr::bind_rows()
df


## For
## 
for(a in 1:10) {
  x1 <- a^2
  print(x1)
}
a

### Funcão 
dado = c(1:6)
soma_dois_dados = function(dado1, dado2){
  soma = dado1 + dado2
  return(soma)
}

quadrado_soma = function(soma){
  soma2 = soma^2
  return(soma2)
}

resultado = list()
k = 0 
for(i in dado){
  for(j in dado){
    k = k + 1
    soma = soma_dois_dados(dado[i], dado[j])
    somaqd = quadrado_soma(soma)
    
    resultado[[k]] = data.frame(dado1 = dado[i], 
                                dado2 = dado[j], 
                                soma = soma, 
                                soma2 = somaqd)
  }
}

resultado %<>% 
  bind_rows()


## Apply
matriz1 <- matrix(1:6, nrow = 2)
matriz1
soma_linhas <- apply(matriz1, 1, sum)
soma_linhas
apply(matriz1, 1, mean)

soma_colunas <- apply(matriz1, 2, sum)
soma_colunas
apply(matriz1, 2, median)
apply(matriz1, 2, mean)

minha_lista <- list(a = c(1, 2, 3), b = c(4, 5, 6))
resultados <- lapply(minha_lista, mean)
resultados

minha_lista <- list(a = c(1, 2, 3), 
                    b = c(4, 5, 6), 
                    c=c(7,6,8))
resultados <- sapply(minha_lista, mean)
resultados

dado1 <- 1:6
dado2 <- 1:6
resultado <- mapply(soma_dois_dados, 
                    dado1, 
                    dado2)

print(resultado)

### Todas as combinações Possíveis

dois_dados = expand.grid(dado1, dado2)
dois_dados


resultado <- mapply(soma_dois_dados, 
                    dois_dados[,1], 
                    dois_dados[,2])

resultado

### Função
vetor_de_dados
minha_media <- function(vetor_de_dados){
  media = sum(vetor_de_dados)/length(vetor_de_dados)
  media = round(media, 2)
  return(media)
}
letras <- c("a", "b" , "c"," d")
sum(letras)
mean
minha_media(letras)
abobrinha <- 
  minha_media(iris$Sepal.Length)
mean(iris$Sepal.Length)


minha_media <- function(vetor_de_dados, 
                        digitos = 2){
  media = sum(vetor_de_dados, na.rm = T)/length(vetor_de_dados, na.rm = T)
  media = round(media, digitos)
  return(media)
}
minha_media(iris$Sepal.Length, 5)


#' Desvio Padrao Amostral
#' @param vetor Vetor de dados
#' @return Desvio Padrao

meu_desvio_padrao_amostral <- function(vetor) {
  media <- minha_media(vetor) 
  diferenca <- vetor - media  # Calcula as diferenças em relação à média
  quadrados <- diferenca^2  # Calcula os quadrados das diferenças
  variancia <- sum(quadrados) / (length(vetor) - 1)  # Calcula a variância
  desvio_padrao <- sqrt(variancia)  # Calcula o desvio padrão
  
  
  return(desvio_padrao)
}

meu_desvio_padrao_amostral(iris$Sepal.Length)

###
meu_coeficiente_variacao <- function(vetor, arredondamento = 2) {
  media <- minha_media(vetor, digitos = arredondamento)  # Calcula a média
  desvio_padrao <- meu_desvio_padrao_amostral(vetor)  # Calcula o desvio padrão
  coeficiente_variacao <- (desvio_padrao / media) * 100  # Calcula o CV em porcentagem
  coeficiente_variacao = round(coeficiente_variacao, arredondamento)
  return(coeficiente_variacao)
}

meu_coeficiente_variacao(iris$Sepal.Length, arredondamento = 2)


meu_coeficiente_variacao <- function(vetor, arredondamento = 2) {
  media <- minha_media(vetor, digitos = arredondamento)  # Calcula a média
  desvio_padrao <- meu_desvio_padrao_amostral(vetor)  # Calcula o desvio padrão
  coeficiente_variacao <- (desvio_padrao / media) * 100  # Calcula o CV em porcentagem
  coeficiente_variacao = round(coeficiente_variacao, arredondamento)
  out = data.frame(media = media, 
                   n = length(vetor),
                   desvio = desvio_padrao, 
                   coeficiente_variacao = coeficiente_variacao)
  return(list(descritiva = out, 
              originais = vetor))
}
meu_coeficiente_variacao(iris$Sepal.Length, arredondamento = 2)

x <- -5
if (x < 0) {
  message("O valor de x é negativo.")
}

x <- -5
if (x < 0) {
  cat("O valor de x é negativo.")
}

x <- -5
if (x < 0) {
  warning("O valor de x é negativo.")
}


x <- -5
if (x < 0) {
  stop("O valor de x é negativo.")
}

idade <- 25

if (idade >= 18) {
  cat("Você é maior de idade.\n")
} else {
  cat("Você é menor de idade.\n")
}


quadrante <- function(x, y) {
  if (x > 0) {
    if (y > 0) {
      quadrante = "Quadrante 1"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
      return(quadrante)
    } else {
      quadrante = "Quadrante 4"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    }
  } else {
    if (y > 0) {
      quadrante = "Quadrante 2"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    } else {
      quadrante = "Quadrante 3"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    }
  }
}


quadrante(1, -1)

iris %<>% 
  mutate(cat_petal.len = ifelse(Petal.Length > mean(Petal.Length), "Longa", "Curta"))

iris %<>% 
  mutate(cat_petal.len2 = if_else(Petal.Length > mean(Petal.Length), "Longa", "Curta"))




dia_da_semana <- "segunda"

mensagem <- switch(dia_da_semana,
                   "segunda" = "Hoje é segunda-feira.",
                   "terca" = "Hoje é terça-feira.",
                   "quarta" = "Hoje é quarta-feira.",
                   "quinta" = "Hoje é quinta-feira.",
                   "sexta" = "Hoje é sexta-feira.",
                   "sabado" = "Hoje é sábado.",
                   "domingo" = "Hoje é domingo.",
                   "Outro" = "Dia não reconhecido."
)

cat(mensagem)


iris$cat_sepal = 
  case_when((iris$Sepal.Length < mean(iris$Sepal.Length) - sd(iris$Sepal.Length)) ~ "X < media - 1 sd", 
            (iris$Sepal.Length < mean(iris$Sepal.Length) + sd(iris$Sepal.Length)) ~ "X < media + 1 sd", 
            .default = "Outro")
