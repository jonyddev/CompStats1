library('tidyverse')

# Questão 1 (3.3.1-4)
#> O que acontece se você mapear a mesma variável para múltiplas estéticas?
  
#**(Resposta)** O que vai acontecer é que o gráfico vai apresentar características estéticas diferentes para uma mesma variável. Mapear uma variável para várias estéticas não é algo interessante a se fazer porque gera um gráfico com informação redundante. Veja o gráfico a seguir:
  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = cty, size = cty))

# Agora veja este segundo gráfico, em que variáveis diferentes são utilizadas:
  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = cty, size = cyl))

# O segundo gráfico fornece mais informações sobre o conjunto de dados (apesar de ainda não produzir uma boa visualização) quando comparado com o gráfico anterior que utilziava uma mesma variável mapeada em diferentes estéticas.

# Questão 2 (3.5.1-6)
#> Ao usar `facet_grid()` você geralmente deve colocar a variável com mais valores (ou níveis) diferentes nas colunas. Por quê? (Mostre um exemplo com um gráfico feito com a variável com muitos valores nas linhas e outro gráfico com a mesma variável nas colunas)

#**(Resposta)** Colocar a variável com mais valores (ou níveis) nas colunas é uma convenção para facilitar a visualização das informações. É melhor ver um gráfico grande na horizontal do que na vertical. Assim, usar a variável com mais valores únicos nas colunas, o gráfico "cresce" horizontalmente. Por outro lado, se a variável com mais valores não é usada nas colunas, o gráfico vai "crescer" verticalmente, podendo prejudicar a visualização das informações contidas no gráfico. Veja os exemplos a seguir:
  
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ class)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(class ~ drv)

#Como você pode notar, o primeiro gráfico é muito mais agradável de se analisar.

# Questão 3 (3.6.1-6)
#> Recrie o código R para gerar os gráficos (6 gráficos)

#**(Resposta)**
  

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(mapping = aes(group = drv), color = 'blue', se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = drv)) + 
  geom_smooth(mapping = aes(group = drv, colour = drv), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = drv)) + 
  geom_smooth(colour = 'blue', se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = drv)) + 
  geom_smooth(mapping = aes(linetype = drv), colour = 'blue', se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = drv))

# Questão 4 (3.7.1-5)
#> No gráfico de barras de nossa proporção, precisamos configurar group = 1. Por quê? Em outras palavras, qual o problema com esses dois gráficos? Corrija os códigos citados.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))

#**(Resposta)** É necessário usar `group = 1` para configurar a proporção do eixo y corretamente. Nos dois gráficos apresentados acima, a proporção para todos os diamantes está igual a um e isso não é o que gostaríamos de ter no gráfico. Para corrigir esse problema podemos fazer como mostra o código a seguir:
  
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group = color))

# Questão 5 (3.8.1-4)
#> Qual o ajuste de posição padrão para `geom_boxplot()`? Crie uma visualização do conjunto de dados `mpg` que demonstra o uso desse ajuste de posição.

#**(Resposta)** Para responder essa questão basta verificar a documentação da função `geom_boxplot()`, em que especifica que a posição padrão é `dodge`. Veja o exemplo a seguir:
  

ggplot(data = mpg, aes(x = drv, y = hwy, color = class)) +
  geom_boxplot()


#Como você pode ver no gráfico acima, as diferentes classes da variável `drv` estão lado a lado e isso se deve ao fato de que `geom_boxplot()` usa `dodge` como posição padrão.

#Agora veja o exemplo do uso de `geom_boxplot()` utilizando posição `identity`:
  

ggplot(data = mpg, aes(x = drv, y = hwy, color = class)) +
  geom_boxplot(position = 'identity')


#Nesse último gráfico apresentado acima, as diferentes classes da variável `drv` não estão mais lado a lado, elas estão "uma por cima da outra".

# Questão 6 (3.9.1-4)
#> O que o gráfico abaixo diz sobre o relacionamento entre eficiência de uso de combustível na cidade (`cty`) e na estrada (`mpg`)? Por que `coord_fixed()` é importante? O que é que `geom_abline()` faz?
  
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()

#**(Resposta)** O gráfico me diz que a relação entre `cty` e `hwy` é linear. `coord_fixed()` é importante para garantir que a linha (criada com `geom_abline()`) tem um ângulo de 45 graus e então facilitar a comparação de dados ao visualizar o gráfico. Por fim, como já comentado, `geom_abline()` serve para traçar a linha no gráfico.





