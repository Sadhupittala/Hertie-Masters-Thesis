getwd()

##Get all of the libraries that you need
install.packages("dplyr")
install.packages("rddtools")
install.packages("magrittr")
install.packages("ggplot2")
install.packages("AER")
install.packages("ggplot2", dependencies = TRUE, repos = "http://cran.us.r-project.org")

install.packages("broom", type="binary")
remove.packages("rlang")
install.packages("rlang")
install.packages('rlang')
install.packages("vctrs", type="binary")
install.packages("scales")

library(ggplot2)
library(rddtools)
library(rdd)
library(tidyverse)
library(AER)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(magrittr)


## TWITTER SENTIMENT BERNIE SANDERS BIVARIATE REGRESSIONS

## Birdie Sanders Simple Regression 
birdiesimplelm <- lm(birdiedf$polarity ~ birdiedf$after_meme_peak)
summary(birdiesimplelm)

##Feel the Bern Simple Regression 
bernsimplelm <- lm(berndf$polarity ~ berndf$after_meme_peak)
summary(bernsimplelm)   

## Barnie Sanders Simple Regression
barniesimplelm <- lm(barniedf$polarity ~ barniedf$after_meme_peak)
summary(barniesimplelm)

###TWEET VOLUME BERNIE SANDERS BIVARIATE REGRESSIONS

##Birdie Sanders Simple Regression 
simplevolumebird <- volume_bird_on_podium
simplevolumebirdlm <- lm(volumebird$tweet_count ~ volumebird$after_meme_peak)
summary(simplevolumebirdlm)

##Feel the Bern simple Regression 
simplebernvolume <- volume_feel_the_bern
simplebernvolumelm <- lm(bernvolume$tweet_count ~ bernvolume$after_meme_peak)
summary(simplebernvolumelm)

##Barnie Sandlers Simple Regression 
simplebarnievolume <- volume_barnie_sandlers
simplebarnievolumelm <- lm(barnievolume$tweet_count ~ barnievolume$after_meme_peak)
summary(simplebarnievolumelm)

## FEC DATA BIVARIATE REGRESSIONS

## Birdie Sanders & Fec 
simplefecbird <- fec_bird_on_podium
simplefecbirdlm <- lm(fecbird$TRANSACTION_AMT ~ fecbird$after_meme_peak)
summary(simplefecbirdlm)

## Feel the Bern & FEC 
simplefecbern <- fec_feel_the_bern
simplefecbernlm <- lm(fecbern$TRANSACTION_AMT ~ fecbern$after_meme_peak )
summary(simplefecbernlm)

##Barnie Sandlers & FEC 
simplefecbarnie <- fec_barnie_sandlers
simplefecbarnielm <- lm(simplefecbarnie$TRANSACTION_AMT ~ simplefecbarnie$after_meme_peak)
summary(simplefecbarnielm)

## TED CRUZ BIVARIATE REGRESSION OUTPUTS

##TWITTER SENTIMENT REGRESSIONS

##Zodiac Killer 1
simplezkcruztwitter1 <- twitter_zodaic_killer_1
simplezkcruztwitter1lm <- lm(zkcruztwitter1$polarity ~ zkcruztwitter1$after_meme_peak)
summary(simplezkcruztwitter1lm)

##Zodiac Killer 2
simplezkcruztwitter2 <- twitter_zodiac_killer_2
simplezkcruztwitter2lm <- lm(zkcruztwitter2$polarity ~ zkcruztwitter2$after_meme_peak)
summary(simplezkcruztwitter2lm)

## Ted Cruz Look Alikes
simpletclookaliketweets <- twitter_look_alike
simpletclookaliketweetslm <- lm(simpletclookaliketweets$polarity ~ simpletclookaliketweets$after_meme_peak)
summary(simpletclookaliketweetslm)

##TWEET VOLUME

#Zodiac Killer 1
simplezkcruzvolume <- volume_zodiac_1
simplezkcruzvolumelm <- lm(simplezkcruzvolume$tweet_count ~ simplezkcruzvolume$after_meme_peak)
summary(simplezkcruzvolumelm)
#zodiac Kiler 2
simplezkcruzvolume2 <- volume_zodiac_2
simplezkcruzvolume2lm <- lm(simplezkcruzvolume2$tweet_count ~ simplezkcruzvolume2$after_meme_peak)
summary(simplezkcruzvolume2lm)
#Look alikes
simpleTClookalikes <- volume_look_alike
simpleTClookalikeslm <- lm(simpleTClookalikes$tweet_count ~ simpleTClookalikes$after_meme_peak)
summary(simpleTClookalikeslm)

##FEC DATA TED CRUZ BIVARIATE REGRESSIONS
##Zodiac Killer 1 FEC simple
simplefeccruz1 <- fec_zodiac_killer_1
simplefeccruz1lm <- lm(simplefeccruz1$TRANSACTION_AMT ~ simplefeccruz1$after_meme_peak)
summary(simplefeccruz1lm)


## Zodiac Killer 2 FEC simple
simplefeccruz2 <- fec_zodiac_killer_2
simplefeccruz2lm <- lm(simplefeccruz2$TRANSACTION_AMT ~ simplefeccruz2$after_meme_peak)
summary(simplefeccruz2lm)

##FEC look a likes simple
simplefectclookalikes <- fec_look_alike
simplefectclookalikeslm <- lm(simplefectclookalikes$TRANSACTION_AMT ~ simplefectclookalikes$after_meme_peak)
summary(simplefectclookalikeslm)

####COMPLEX REGRESSIONS BERNIE SANDERS######

##Twitter Sentiment

## BIRDIE SANDERS
birdiedf <- twitter_bird_on_podium
birdielm <- lm(birdiedf$polarity + birdiedf$after_meme_peak + birdiedf$created_at + birdiedf$after_meme_peak*birdiedf$created_at)
summary(birdielm)
##FEEL THE BERN 

berndf <- twitter_feel_the_bern
bernlm <- lm(berniedf$polarity + berniedf$after_meme_peak + berniedf$created_at + berniedf$after_meme_peak*berniedf$created_at)
summary(bernielm)

## BARNIE SANDLERS
barniedf <- twitter_barnie_sandlers
barnielm <- lm(barniedf$polarity ~ barniedf$after_meme_peak + barniedf$created_at + barniedf$created_at*barniedf$after_meme_peak)
summary(barnielm)

####TWEET VOLUME REGRESSIONS

## Regression: Birdie Sanders and Tweet Volume
volumebird <- volume_bird_on_podium
volumebirdlm <- lm(volumebird$tweet_count ~ volumebird$after_meme_peak + volumebird$start + volumebird$after_meme_peak*volumebird$start)
summary(volumebirdlm)

###Regression: Feel the Bern and Tweet Volume
bernvolume <- volume_feel_the_bern
bernvolumelm <- lm(bernvolume$tweet_count ~ bernvolume$after_meme_peak + bernvolume$start + bernvolume$after_meme_peak*bernvolume$start)
summary(bernvolumelm)

## Regression: Barnie Sandlers and Tweet Volume
barnievolume <- volume_barnie_sandlers
barnievolumelm <- lm(barnievolume$tweet_count ~ barnievolume$after_meme_peak + barnievolume$start + barnievolume$after_meme_peak*barnievolume$start)
summary(barnievolumelm)


##FEC REGRESSIONS

##FEC DATA BERNIE BIRD

fecbirdie <- fec_bird_on_podium
fecbirdlm <- lm(fecbirdie$TRANSACTION_AMT ~ fecbirdie$after_meme_peak + fecbirdie$TRANSACTION_DT + fecbirdie$TRANSACTION_DT*fecbirdie$after_meme_peak)
summary(fecbirdlm)


##FEC Barnie Sandlers
fecbarnie <- fec_barnie_sandlers
fecbarnielm <- lm(fecbarnie$TRANSACTION_AMT ~ fecbarnie$after_meme_peak + fecbarnie$TRANSACTION_DT + fecbarnie$after_meme_peak*fecbarnie$TRANSACTION_DT)
summary(fecbarnielm)


##FEC data feel the Bern 

fecbern <- fec_feel_the_bern
fecbernlm <- lm(fecbern$TRANSACTION_AMT ~ fecbern$after_meme_peak + fecbern$TRANSACTION_DT + fecbern$after_meme_peak*fecbern$TRANSACTION_DT)
summary(fecbernlm)


##TED CRUZ MULTIVARIATE REGRESSIONS

## Ted Cruz zodiac killer 1 twitter polarity

zkcruztwitter1 <- twitter_zodiac_killer_1
zkcruztwitter1lm <- lm(zkcruztwitter1$polarity ~ zkcruztwitter1$after_meme_peak + zkcruztwitter1$created_at + zkcruztwitter1$after_meme_peak*zkcruztwitter1$created_at)
summary(zkcruztwitter1lm)

##Ted Cruz zodiac killer 2 twitter

zkcruztwitter2 <- twitter_zodiac_killer_2
zkcruztwitter2lm <- lm(zkcruztwitter2$polarity ~ zkcruztwitter2$after_meme_peak + zkcruztwitter2$created_at + zkcruztwitter2$after_meme_peak*zkcruztwitter2$created_at)
summary(zkcruztwitter2lm)

### Ted Cruz Look Alikes
tcla <- twitter_look_alike
tclalm <- lm(tcla$polarity ~ tcla$after_meme_peak + tcla$created_at + tcla$after_meme_peak*tcla$created_at)
summary(tclalm)

#TWEET VOLUME
##Ted Cruz ZK tweet volume
zkcruzvolume <- volume_zodiac_1
zkcruzvolumelm <- lm(zkcruzvolume$tweet_count ~ zkcruzvolume$after_meme_peak + zkcruzvolume$start + zkcruzvolume$after_meme_peak*zkcruzvolume$start
)
summary(zkcruzvolumelm)

## Ted Cruz ZK 2 tweet volume
zkcruzvolume2 <- volume_zodiac_2
zkcruzvolume2lm <- lm(zkcruzvolume2$tweet_count ~ zkcruzvolume2$after_meme_peak + zkcruzvolume2$start + zkcruzvolume2$after_meme_peak*zkcruzvolume2$start)
summary(zkcruzvolume2lm)

##### Ted Cruz Look Alikes Tweet Volume
TClookalikes <- volume_look_alike
TClookalikeslm <- lm(TClookalikes$tweet_count ~ TClookalikes$after_meme_peak + TClookalikes$start + TClookalikes$after_meme_peak*TClookalikes$start)
summary(TClookalikeslm)

##FEC Multivariate regressions

## Ted Cruz ZK 1 FEC
feccruz1 <- fec_zodiac_killer_1
feccruz1lm <- lm(feccruz1$TRANSACTION_AMT ~ feccruz1$after_meme_peak + feccruz1$TRANSACTION_DT + feccruz1$TRANSACTION_DT*feccruz1$after_meme_peak)
summary(feccruz1lm)

##Ted Cruz ZK 2 FEC
feccruz2 <- fec_zodiac_killer_2
feccruz2lm <- lm(feccruz2$TRANSACTION_AMT ~ feccruz2$after_meme_peak + feccruz2$TRANSACTION_DT + feccruz2$TRANSACTION_DT*feccruz2$after_meme_peak)
summary(feccruz2lm)

## TC Look ALikes FEC
fectclookalikes <- fec_look_alike
fectclookalikeslm <- lm(fectclookalikes$TRANSACTION_AMT ~ fectclookalikes$after_meme_peak + fectclookalikes$TRANSACTION_DT + fectclookalikes$TRANSACTION_DT*fectclookalikes$after_meme_peak)
summary(fectclookalikeslm)
