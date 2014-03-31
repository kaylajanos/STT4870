# Creating R packages Bib file
# 03/19/14

RpackagesUsed <- c('knitcitations', 'knitr', 'roxygen2', 'PASWR', 
                   'tikzDevice', 'ggplot2', 'bibtex', 'boot', 'formatR', 'gridExtra',
                   'coin', 'devtools', 'e1071', 'faraway', 'foreign', 'formatR',  
                   'Hmisc', 'latticeExtra','lattice', 'leaps', 'MASS', 'multcomp', 
                   'multcompView', 'reports', 'reshape2', 'repmis', 'gtable', 'highr',
                   'xlsx', 'xtable', 'plyr', 'RCurl', 'nortest', 'base', 'repmis', 
                   'vcd', 'grid', 'httr', 'KernSmooth', 'mvtnorm', 'nlme', 'reshape2',
                   'roxygen2', 'rstudio', 'shiny', 'shinyAce', 'vcdExtra', 'xlsxjars')
library(knitr)
write_bib(RpackagesUsed, file = './thesis/Bibliography/Rpkgs031914.bib')
