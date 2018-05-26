#file:///C:/Users/Panu/Downloads/Movie-Ratings.csv

movies <- read.csv("Movie-Ratings.csv")

View(movies)

#top six record
head(movies)

#show the all columns names
colnames(movies)

#we changed the columns names.

colnames(movies)<- c("Film","Genre","CriticRating", "AudienceRating","BudgetMillions", "Year")

colnames(movies)

head(movies)

#last six record
tail(movies)

 #                         Film    Genre CriticRating AudienceRating BudgetMillions Year
#557              Your Highness   Comedy           26             36             50 2011
#558            Youth in Revolt   Comedy           68             52             18 2009
#559 Zack and Miri Make a Porno  Romance           64             70             24 2008
#560                     Zodiac Thriller           89             73             65 2007
#561                Zombieland    Action           90             87             24 2009
#                  Zookeeper   Comedy           14             42             80 2011

str(movies)



#meta data about data
str(movies)

#'data.frame':	562 obs. of  6 variables:
# $ Film          : Factor w/ 562 levels "(500) Days of Summer ",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Genre         : Factor w/ 7 levels "Action","Adventure",..: 3 2 1 2 3 1 3 5 3 3 ...
# $ CriticRating  : int  87 9 30 93 55 39 40 50 43 93 ...
# $ AudienceRating: int  81 44 52 84 70 63 71 57 48 93 ...
# $ BudgetMillions: int  8 105 20 18 20 200 30 32 28 8 ...
# $ Year          : int  2009 2008 2009 2010 2009 2009 2008 2007 2011 2011 ...
 

  
#basic statistic about data  
summary(movies$Year)

#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 #  2007    2008    2009    2009    2010    2011 

#in above we observe that their is problem in basic statistics. In column Year Min value shown 2007, median 2008,
#that make no sence in data.
  
str(movies)

#we factor the years, means we create a group of years in which movie released.

movies$Year<- factor(movies$Year)

summary(movies$Year)

#2007 2008 2009 2010 2011 
 # 79  125  116  119  123 

#we see the above that after using factor function we add movies together based on their released year.
#now we can see in Output , that in 2007 their 79 movies released. 
#in 2008 125 and 116, 119, and 123 respectively. 
#Also one important thing we notice here is that we have only 5 years of data.


summary(movies)

str(movies)

#***

#--- Aesthetics

#install.packages("ggplot2")


library(ggplot2)

head(movies)

#Aesthetics is how u set ur data

# v wnat CR on bottom

#this will gv us empty plot

#in 1.1 plot
#action movies has more criticrating but they also get high audience rating and in plot we see the bigger bubbles r bigger budget movies are big budget movies.
#horror movies has below averege movie, they have higher critic rating and low audience rating.
#Comedy movies are low budget movies but they get high audience rating.
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating, colour=Genre,size=BudgetMillions)) + geom_point()

ggplot(data = movies,aes(x=CriticRating,y=AudienceRating, colour=Genre,size=Genre)) + geom_point()
#***

#what is geometry

# in env selct p and expand it and ntc a bunch of vars

# it shows a lot of objs
p <-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating))
p + geom_point()

#geom_line
p + geom_line()

p + geom_point() + geom_line()

p + geom_line() + geom_point()
#--- overriding aesthetics

#q <- ggplot(data=movies,aes(x=CriticRating, y=AudienceRating, colour=Genre,size=BudgetMillions)) 
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,colour=Genre,size=BudgetMillions))

q

#now we add geom point then plot display
q + geom_point()

#add geom layer q + geom_point()
# here geom layer is said to b inheriting aesthetics from

# q, aes r x, y, colour, size

#override

# here v r overriding aes

# the size has been overridden by the new mapping

#of size

q + geom_point(aes(CriticRating))
#ntc the colr is diff it is automatically picked up q + geom_point(aes(colour=BudgetMillions))


#q remains the same

# actually q stays the same

#but the geom_point is overridden q + geom_point()
#here v can override x & y

#q + geom_point(aes(x=BudgetMillions))

#ntc the x axis say critic rating



"q <- ggplot(data=movies, aes(x=CriticRating,
y=AudienceRating, colour=Genre,size=BudgetMillions))
"
#so v give the xlab
q + geom_point(aes(x=BudgetMillions))+ xlab("Budget in Millions $$$")
