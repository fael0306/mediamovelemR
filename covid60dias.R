install.packages('ggplot2')
install.packages('zoo')
install.packages('dplyr')

library(ggplot2)
library(zoo)
library(dplyr)

# Criando tabela com as médias móveis e armazenando em avg
avg <- rollmean(dados,as.integer(sqrt(count(dados[1]))))

# Convertendo a tabela para o tipo de dados correto
avg <- data.frame(avg)

# Criando gráfico com os pontos da média móvel (V1 é a coluna dentro da tabela)
grafico1 = ggplot(data = avg,aes(x=row(avg),y=V1))

# Criando linha de tendência a partir dos dados
tendenciamediamovel = grafico1+geom_point(size=2.5)+geom_smooth(fill=NA)

# Plotando o gráfico
plot(tendenciamediamovel)

# Gerando dados estatísticos
summary(dados)
summary(avg)