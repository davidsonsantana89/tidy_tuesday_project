# Tidy Tuesday Project
# Dubois Challenge

# Created by Davidson Santana
# Created on 02/16/2021

library(tidytuesdayR)
library(tidyverse)
library(dplyr)

# Carregar os dados dentro do objeto tuesdata
tuesdata <- tidytuesdayR::tt_load(2021, week = 8)

# Carregar o data frame income dentro do objeto dado
dado <- tuesdata$income

# Unir as variáveis de despesas é uma única coluna e carregar o novo 
# data frame em um obejto nomeado por dado_2
dado_2 <- dado %>%
  pivot_longer(cols = -c("Class", "Actual Average"), names_to = "Expenditures",
               values_to = "Percentage")


# Criar um gráfico de barras
png("dubois_challenge_05.png", width = 1200, height = 600)
ggplot(data = dado_2, aes(x = Percentage, y = Class,fill = Expenditures),
       position = "fill") +
  geom_col() +
  geom_text(aes(label = Percentage), 
            position = position_stack(vjust = 0.7)) +
  labs(x = "Percentage",
       y = "Income Class in Dollars",
       title = "Dubois Challenge",
       subtitle = "challenge05: Income and Expenditure of 150 Negro Families in Atlanta, GA, USA",
       caption = "Source: Tidy Tuesday | #TidyTuesday |
       Visulization: Davidson Santana (@davidson_vila)"
       )
dev.off()


  


