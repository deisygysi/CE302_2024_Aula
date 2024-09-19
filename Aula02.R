?mean
help("mean")

??mean

vignette("ggplot2")


meu_nome_eh_deisy <- 0

X <- 0
x <- 10

y <- X + 
  x


if <- 0
else <- 10

# NAO FAZER
c <- function(a){
  x = a + 1
  return(x)
}
c(1,2,4)

rm(meu_nome_eh_deisy)
ls()

1 + 1 

a <- 1
b <- 2
## Soma
a + b
## Subtração
a - b
## Multiplicação
a * b
## Divisão
a /b
## Exponenciação
a ^ b

## Resto da divisão
a %% b

## Divisão inteira
a  %/% b

## Operadores lógicos
## Igual
a == b
1 == 2

# a <- 1
# a = 1

## Diferentes
a != b

## Maioridade
a > b
## Minoridade
a < b

## Maior ou igual
a >= b 
## Menor ou igual
a <= b

### Log
log(10) # neperiana / natural
log(10, base = 10)
log(10, base = 2)
log(10, base = 100)
log10(10)
log2(10)

### Exponencial
exp(10)
exp(2)

### Trigonometria
sin(0) # Seno
cos(0) # Cosseno
tan(0) # Tangente
asin(0) # Arco seno
acos(0) # Arco cosseno
atan(0) # Arco tangente

?sin
pi

sqrt(10)

round(pi, digits = 8) # Arredondamento
ceiling(pi) # Teto
floor(pi) # Piso
trunc(pi) # Truncamento

NA
NA + 5

10 + NULL
NaN + 10

0/0

"a" < "b"
"a" < "1"

"abc" < "abcd"

###############
## Criando Vetores
## 
meu_primeiro_vetor <- c(1,2,3,4,5,6)
meu_primeiro_vetor

vetor_char <- c("a", "b", "c")
vetor_char

vetor_logicos <- c(TRUE, FALSE, FALSE)
vetor_logicos

vetor_char
vetor_char[1]
vetor_char[2]
vetor_char[3]
vetor_char[length(vetor_char)]

vetor_char[1:2]
meu_primeiro_vetor[-c(1:2)]
meu_primeiro_vetor[-c(1,3,5)]

vetor_x_3 = meu_primeiro_vetor*3
meu_primeiro_vetor
vetor_x_3


c(vetor_logicos,
  vetor_char, 
  vetor_x_3)


#### Opraçoes aritiméticas
# Operações aritméticas com vetores
vetor1 <- c(1, 2, 3)
vetor2 <- c(4, 5, 6, 7)

# Soma 
soma_vetores <- vetor1 + vetor2
soma_vetores

vetor1 <- c(1, 2, 3)
vetor2 <- c(4, 5, 6)

# subtraçao 
soma_vetores <- vetor1 - vetor2
soma_vetores

vetor1
vetor2
vetor1 * vetor2

vetor3 <- c(-2, -1, 9)
abs(vetor3)

sort(vetor3)

is.character(vetor3)
is.numeric(vetor3)

class(vetor3)
vetor3 <- as.character(vetor3)
class(vetor3)


datas <- c("2021-01-01", 
           "2021-01-02",
           "2021-01-03")
class(datas)
# Converte para data
datas = as.Date(datas) 
class(datas)

methods(class = "numeric")
methods(class = "character")


##### Vetor Nomeado
## Podemos ter um vetor numérico com nomes
altura <- c("João" = 1.82,
            "Bianca" = 1.68,
            "Eduarda" = 1.62)
altura
class(altura)

altura[2]
altura["Bianca"]


altura[max(altura)]
altura[max(altura)]

names(altura)
names(altura[max(altura)])

altura[altura> 1.7]


seq(1, 4)
seq(from = 1, 
    to = 10, 
    by = 2)

seq(from = 10, 
    to = 1, 
    by = -2)

rep(1, 4)

# Repete 1, 2 e 3, 3 vezes
rep1 <- rep(c(1, 2, 3), 
            times = 3)
rep1

rep2 <- rep(c(1, 2, 3), 
            each = 3)
rep2
