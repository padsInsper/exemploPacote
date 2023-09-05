
sig <- 2
matrix(c(2,1,1,2), ncol = 2)
diag(10) * sig


library(plm)

da <- dados::dados_gapminder

dados::dados_gapminder |>
  dplyr::glimpse()


modelo <- lm(pib_per_capita ~ expectativa_de_vida, data = da)

summary(modelo)

da |>
  dplyr::count(pais)

da |>
  ggplot2::ggplot() +
  ggplot2::aes(x = expectativa_de_vida, y = pib_per_capita) +
  ggplot2::geom_line(ggplot2::aes(group = pais)) +
  ggplot2::facet_wrap(~continente)


modelo_painel <- plm(
  pib_per_capita ~ expectativa_de_vida,
  index = c("pais"),
  data = da,
  model = "random"
)

summary(modelo_painel)

broom::tidy(modelo_painel)
stargazer::stargazer(modelo_painel, type = "text")

# nlme::lme()
# lme4::lmer()

