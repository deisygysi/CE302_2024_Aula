# files = system("ls data/filmes", intern = TRUE)
require(tidyverse)
require(magrittr)
files = list.files("data/filmes/")

Files = list()
for (i in 1:length(files)) {
  Files[[i]] = data.table::fread(paste0("data/filmes/",
                                        files[i])) %>% 
    mutate(year = as.numeric(year)) %>%
    mutate(tipo = stringr::str_remove(files[i], ".csv"))
}

Files[[1]]$movie_id

Files %<>% bind_rows()




Files %>% # Carregar o banco
  ggplot() + ## Chamar o ggplot
  aes( x = year, 
       y = `gross(in $)`) + ## aplicar a estética, isto é, quais são as variáveis e o que elas significam, x e y, neste caso
  geom_point() # Fazer o scatterplot


Files %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo, 
       size = year) + ## Adicionamos cor
  geom_point(alpha = 0.2) + 
  scale_size_continuous(range = c(0, 2)) + 
  theme_minimal() + 
  facet_wrap(vars(tipo), scales = "free_y")


Files %>% 
  filter(tipo == "thriller") %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo, 
       size = year) + ## Adicionamos cor
  geom_point(alpha = 0.2) + 
  geom_smooth(method = "loess") + # O método aqui se refere ao método utilizado para estimação da curva
  scale_size_continuous(range = c(0, 2)) + 
  scale_y_continuous(labels = scales::label_log(), 
                     trans =  "log10") + 
  theme_minimal() +
  labs(x = "Ano", 
       y = "Faturamento (em USD)", 
       size = "Ano", 
       color = "filme") + 
  theme(legend.position = "bottom", 
        text = element_text(size = 15))



Files %>% 
  group_by(year, tipo) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio, 
       color = tipo) + 
  geom_line() + 
  facet_wrap(vars(tipo)) + 
  theme_minimal()



Files %>%   
  filter(tipo == "thriller") %>% 
  group_by(year, tipo) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio, 
       color = tipo) + 
  geom_line(alpha = 0.5) + 
  geom_point() + 
  facet_wrap(vars(tipo)) + 
  theme_minimal()




Files %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE), 
            n_filmes = n()) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + 
  geom_point(aes(size = n_filmes)) + 
  labs(x = "Ano de Lançamento", 
       y = "Investimento ($)", 
       title = "Gráfico do investimento médio em filmes por ano") + 
  scale_y_continuous(labels = scales::label_dollar()) +
  scale_x_continuous(breaks = seq(from = 1900, to = 2020, by = 10)) + 
  theme_minimal() +
  theme(text = element_text(size = 20, 
                            hjust = 0.5, 
                            face = "bold"),
        axis.text.x  = element_text(angle = 45)
        ) # tamanho da fonte



Files %>% 
  group_by(tipo) %>% 
  summarise(Total_Investido = sum(`gross(in $)`, na.rm = TRUE)) %>%
  mutate(tipo = reorder(tipo, Total_Investido)) %>%
  ggplot() +
  aes( x = tipo, 
       y = Total_Investido, 
       color = tipo, 
       fill = tipo) +
  geom_col(alpha = 0.2, 
           lwd = 2) + 
  scale_y_continuous(labels = scales::label_dollar()) +
  coord_flip() +
  labs(x = "Tipo de Filme", 
       y = "Total Investido ($)") + 
  theme_minimal()





ggplot(Files) +
  aes(x = rating, fill = tipo) +
  geom_histogram(bins = 10,
                 na.rm = TRUE) +
  theme_minimal() +
  theme(legend.position = "bottom")


ggplot(Files) +
  aes(x = rating, color = tipo, fill = tipo) +
  geom_density() +
  theme_minimal() +
  facet_wrap(vars(tipo)) + 
  theme(legend.position = "bottom") 



ggplot(Files) +
  aes(x = rating, fill = tipo, color = tipo) +
  geom_boxplot(alpha = 0.1) +
  theme_minimal() +
  theme(legend.position = "none")


ggplot(Files) +
  aes(x = rating, y = tipo, fill = tipo, color = tipo) +
  geom_violin(alpha = 0.1) +
  theme_minimal() +
  theme(legend.position = "none")

pdf("figs/Grafico01.pdf", width = 10, height = 10)
ggplot(Files) +
  aes(x = rating, y = 1) +
  geom_violin(alpha = 0.1) +
  geom_boxplot(width = 0.4) + 
  theme_minimal() +
  theme(legend.position = "none")
dev.off()


png("figs/Grafico01.png", 
    width = 1200, 
    height = 800)
ggplot(Files) +
  aes(x = rating, y = 1) +
  geom_violin(alpha = 0.1) +
  geom_boxplot(width = 0.4) + 
  theme_minimal() +
  theme(legend.position = "none")
dev.off()


Cairo::CairoPDF("figs/Grafico01.pdf", width = 10, height = 10)
ggplot(Files) +
  aes(x = rating, y = 1) +
  geom_violin(alpha = 0.1) +
  geom_boxplot(width = 0.4) + 
  theme_minimal() +
  theme(legend.position = "none")
dev.off()

library(ggplot2)
Files %>% 
ggplot() +
 aes(x = rating, y = votes, fill = tipo, colour = tipo) +
 geom_path() +
 scale_fill_brewer(palette = "Spectral", 
 direction = -1) +
 scale_color_brewer(palette = "Spectral", direction = -1) +
 labs(x = "X ", y = "Y", 
 subtitle = "Subtitulo", caption = "Gráfico") +
 coord_polar(theta = "x") +
 theme_linedraw() +
 theme(axis.title.x = element_text(size = 18L, 
 face = "bold"), axis.text.x = element_text(face = "bold")) +
 facet_wrap(vars(tipo), scales = "free")


tmp = Files[sample(1:nrow(Files), 1000)]


save(Files, compress = "xz", 
     file = "data/Files.RData")
