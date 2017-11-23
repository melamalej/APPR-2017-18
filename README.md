# Analiza podatkov s programom R, 2017/18

## Analiza trga stanovanjskih nepremičnin 

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

Poskusila bom analizirati stanovanjski nepremičninski trg v Sloveniji s pomočjo podatkov o cenah in transakcijah stanovanjskih nepremičnin, obrestnih merah stanovanjskih kreditov in povprečnih mesečnih plač. Ugotovitve bom tudi primerjala s številom naseljenih in počitniških stanovanj in številom novogradenj. Na koncu bom dodala še podatke o indeksih cen stanovanjskih nepremičnin v državah Evrope in jih razvrstila po velikosti indeksa.

Povezave do podatkov:
- http://ec.europa.eu/eurostat/data/database (Finance and economy - Prices)
- http://pxweb.stat.si/pxweb/Database/Ekonomsko/04_cene/04190_ICSN/04190_ICSN.asp
- http://pxweb.stat.si/pxweb/Database/Dem_soc/Dem_soc.asp
- http://www.bsi.si/financni-podatki-r.asp?MapaId=981

Podatki so v HTML in CSV obliki.

Tabela 1 po stolpcih: Stanovanjske nepremičnine, leto (2008 -2016), število transkacij, indeks cen;

Tabela 2  po stolpcih: Mesec in leto (2014 -2017), povprečna plača, 4 stolpci obrestnih mer stanovanjskih kreditov;

Tabela 3 po stolpcih: Tip naselja, leto  (2011 in 2015), število stanovanj, število stanovanj na 1.000 prebivalcev, število naseljenih stanovanj, število počitniških stanovanj, delež novih stanovanj, grajenih po letu 2005;

Tabela 4 po stolpcoh: Država, leto (2008 - 2016), indeks cen; 


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
