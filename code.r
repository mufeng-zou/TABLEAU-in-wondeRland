#sentiment analysis
library(RTextTools)
library('e1071')
load('U:/sss/curiosity/innovation_201710/data/sentiment_naiveBayes.rdata');

matrix= create_matrix('amazing innovation', language='english', 
                      removeStopwords=FALSE, removeNumbers=TRUE, 
                      stemWords=FALSE)
mat = as.matrix(matrix)
out <- predict(classifier, mat, type='raw');
as.vector(out[[2]])*2-1


#loess
library(dplyr)
x <- 1:100+rnorm(100)*10
y <- x**2
df <- data.frame(x=x,y=y) %>%
  arrange(x)
plot(df$x,df$y)
lines(df$x,df$y)

loe <- loess(df$y~df$x)
lines(loe$fitted~df$x,col=2)


#kernal smooth

loe$fitted


with(cars, {
  plot(speed, dist)
  lines(ksmooth(speed, dist, "normal", bandwidth = 2), col = 2)
  lines(ksmooth(speed, dist, "normal", bandwidth = 5), col = 3)
})

plot(cars$speed, cars$dist)
a <- ksmooth(cars$speed, cars$dist, "normal", x.points=cars$speed)
lines(a, col=2)
loe <- loess(cars$dist~cars$speed)
lines(loe$fitted~cars$speed,col=3)


?ksmooth


#web access
thepage <- readLines('http://www.github.com')
merged <- paste0(thepage,collapse = '')
title <- gsub('</title>.+$','',gsub('^.+<title>','',merged))
title

thepage <- readLines('http://www.github.com')
merged <- paste0(thepage,collapse = '')
a <- unlist(strsplit(merged, split='<.*?>'))
a <- unlist(strsplit(merged, split='<.*?>'))
a <- trimws(a)
a <- a[a!='']
paste(a,collapse = '\t')

#logistic regression
df <- data.frame(gbf=gbf,
                 z_name_time_0=z_name_time_0,
                 z_sa24_dist_sub=z_sa24_dist_sub,
                 z_sat_dist_acc=z_sat_dist_acc,
                 th_nonDASR_enq_count=th_nonDASR_enq_count)
load('data/logistic_model.rdata')
prob_df <- 1-predict(model, newdata=df, type="response")
prob_df

#smart interaction
test='show me the oldest 5 companies'

limit <- gsub('[^0-9]+','',test)
limit <- as.numeric(limit)

if ((grepl('oldest',test)) | (grepl('most',test))) {
  threshold <- .arg1[order(-.arg1)][limit]
  filter <- ifelse(.arg1>=threshold, T, F)
}

filter

#game concept
test <- 'start'

game_fun <- function(input, i){
  response <- vector()
  if (input=='load') {
    response[1] <- 'Checkpoint loaded...'
    response[2] <- 'White Rabbit mutters: "Oh dear! Oh dear! I shall be too late!"'
    response[3] <- '1. Follow down the rabbit hole'
    response[4] <- '2. Turn around and leave'
    response[5] <- '3. Continue the innovation presentation'
  }
  return(response[i])
}
save(game_fun, file='data/game_function.rdata')

load('data/game_function.rdata')
game_fun('load', 1)
