'''
Autora: Meilyn Barbosa

'''

setwd("C:/Users/HP/OneDrive/Documentos/projetos_git/grafico_animado")


# como fazer grafico de linhas animado ------------------------------------


# Bibliotecas necessarias
if(!require("tidyverse"))install.packages("tidyverse")
if(!require("gifski"))install.packages("gifski")
if(!require("gganimate"))install.packages("gganimate")


## Funcao que cria um grafico de linhas animado
graph_animated <- function(dados,x,y,cor_da_linha = "darkblue",titulo = " ", legenda_x = "x", legenda_y = "y"){
  library(tidyverse)
  library(gifski)
  library(gganimate)
  grafico <- ggplot(dados)+theme(text = element_text(size = 17))+ ggtitle(titulo)+geom_line(aes(x = x, y = y), size = 2, colour = cor_da_linha)+labs(x = legenda_x, y = legenda_y)+transition_reveal(x)
  return(grafico)
}



# exemplo - dados PIB -----------------------------------------------------

dados <- read.delim("C:/Users/HP/OneDrive/Documentos/projetos_git/grafico_animado/dados_pib.txt")

## Exemplo de uso da funcao
img <- graph_animated(dados,x = dados$Ano, y = dados$PIB, cor_da_linha = "magenta", titulo = "PIB no Brasil a preços correntes 2002 a 2020", 
                      legenda_x = "Ano", legenda_y = "PIB")
img


# Salva o gif gerado na pasta definida em setwd
anim_save("teste.gif")
