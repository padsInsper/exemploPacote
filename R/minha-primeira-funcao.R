soma1 <- function(x) {
  x + 1
  # library(tidyverse) # Nãããããoooooo
}

verifica_se_tem_numero <- function(txt) {
  stringr::str_detect(txt, "[0-9]")
}


#' Calcula estatisticas
#'
#' @param continentes quais continentes?
#' @param ano_minimo qual o ano minimo de filtro?
#'
#' @return base agrupada
#' @export
calcular_estatisticas <- function(continentes, ano_minimo) {
  dados::dados_gapminder |>
    dplyr::filter(continente %in% continentes, ano >= ano_minimo) |>
    dplyr::group_by(continente, ano) |>
    dplyr::summarise(
      pop = sum(populacao) / 1e6,
      vida = mean(expectativa_de_vida),
      .groups = "drop"
    )
}

#' meus_diamantes
"meus_diamantes"
