# Analiza podatkov s programom R, 2017/18

## Analiza podjetij v Sloveniji 

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

Analizirala bom število podjetij v Sloveniji glede na različne spremenljivke.
Predvsem bom primerjala koliko podjetij je v različnih regijah, koliko od tega je novo nastalih in koliko je propadlih po letih. Pregledala bom tudi števila podjetij po panogah.

Nato bom še vse podatke o številu podjetij primirjala z letno spremembo BDP.

Vsi podatki so zbrani na spletni strani Statističnaga urada:
- http://pxweb.stat.si/pxweb/Database/Ekonomsko/Ekonomsko.asp

Podatki so v HTML in CSV obliki.

Tabela 1: Število podjetij po regijah
Stolpci: leto, regija;

Tabela 2: Število novonastalih podjetij in število podjetij, ki so prenehala poslovati
Stolpci: leto, regija, tip, število;

Tabela 3: Število podjetij glede na panogo
Stolpci: leto, panoga;

Tabela 4: BDP
Stolpci: Leto, Letna_sprememba_obsega_BDP(%)

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
