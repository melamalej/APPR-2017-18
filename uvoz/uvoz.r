# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")

require(dplyr)
require(tidyr)
require(readr)

#tabela1
uvozi.tabela1 <- function() {
  tabela1 <- read_csv2("tabela1.csv", skip = 4, n_max = 10, col_names = c("Regija", 2008:2016),
                       locale = locale(encoding = "Windows-1250"))
  tabela1 <- tabela1 %>% melt(tabela1, value.name = "Število", id.vars = "Regija", measure.vars = names(tabela1)[-1],
              variable.name = "Leto")
  tabela1$Leto <- parse_number(tabela1$Leto)
  tabela1$Regija <- factor(tabela1$Regija)
  
  return(tabela1) 
}

regije <- uvozi.tabela1()

#tabela2
uvozi.tabela2 <- function() {
  tabela2 <- read_csv2("tabela2.csv", skip = 2, n_max = 10, 
                      locale = locale(encoding = "Windows-1250"))
  stolpci <- data.frame(leto = t(tabela2[1,]), tip = t(tabela2[2,])) %>% fill(1) %>%
    apply(1, paste, collapse = ".")
  stolpci[1] <- "regija"
  names(tabela2) <- stolpci
  tabela <- tabela2[-c(1, 2), ] %>% melt(id.vars = "regija", value.name = "stevilo") %>%
    separate(variable, into = c("leto", "tip"), sep = "[.]") %>%
    mutate(leto = parse_number(leto), stevilo = parse_number(stevilo))
  return(tabela)
}

tip <- uvozi.tabela2()

#bdp

uvozi.bdp <- function() {
  podatki <- read_csv2("BDP.csv", skip = 3, n_max = 1, col_names = c("BDP", 2008:2016),
                       locale = locale(encoding = "Windows-1250"))
  bdp <- podatki %>% melt(podatki, value.name = "Letna_sprememba_obsega_BDP(%)", id.vars = "BDP", measure.vars = names(BDP)[-1],
                              variable.name = "Leto")
  bdp$Leto <- parse_number(bdp$Leto)
  
  bdp$BDP <- NULL
  
  return(bdp) 
}

bdp <- uvozi.bdp()

# Funkcija, ki uvozi občine iz Wikipedije
uvozi.obcine <- function() {
  link <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
  stran <- html_session(link) %>% read_html()
  tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
    .[[1]] %>% html_table(dec = ",")
  for (i in 1:ncol(tabela)) {
    if (is.character(tabela[[i]])) {
      Encoding(tabela[[i]]) <- "UTF-8"
    }
  }
  colnames(tabela) <- c("obcina", "povrsina", "prebivalci", "gostota", "naselja",
                        "ustanovitev", "pokrajina", "regija", "odcepitev")
  tabela$obcina <- gsub("Slovenskih", "Slov.", tabela$obcina)
  tabela$obcina[tabela$obcina == "Kanal ob Soči"] <- "Kanal"
  tabela$obcina[tabela$obcina == "Loški potok"] <- "Loški Potok"
  for (col in c("povrsina", "prebivalci", "gostota", "naselja", "ustanovitev")) {
    tabela[[col]] <- parse_number(tabela[[col]], na = "-", locale = sl)
  }
  for (col in c("obcina", "pokrajina", "regija")) {
    tabela[[col]] <- factor(tabela[[col]])
  }
  return(tabela)
}

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozi.druzine <- function(obcine) {
  data <- read_csv2("podatki/druzine.csv", col_names = c("obcina", 1:4),
                    locale = locale(encoding = "Windows-1250"))
  data$obcina <- data$obcina %>% strapplyc("^([^/]*)") %>% unlist() %>%
    strapplyc("([^ ]+)") %>% sapply(paste, collapse = " ") %>% unlist()
  data$obcina[data$obcina == "Sveti Jurij"] <- "Sveti Jurij ob Ščavnici"
  data <- data %>% melt(id.vars = "obcina", variable.name = "velikost.druzine",
                        value.name = "stevilo.druzin")
  data$velikost.druzine <- parse_number(data$velikost.druzine)
  data$obcina <- factor(data$obcina, levels = obcine)
  return(data)
}

# Zapišimo podatke v razpredelnico obcine
obcine <- uvozi.obcine()

# Zapišimo podatke v razpredelnico druzine.
druzine <- uvozi.druzine(levels(obcine$obcina))

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
