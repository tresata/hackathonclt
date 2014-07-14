


library(RJSONIO)
library(googleVis)

Dealer_DATA <- read.csv('J:/Cory/Hackathon/hackathon decile performance.csv', 
                        header = TRUE, sep = ",", quote="\"", dec=".",  fill = TRUE, comment.char="")

M <- gvisBubbleChart(Dealer_DATA, 
                     idvar="amt",
                     xvar="rank",
                     yvar="Transaction_Amount",
                     colorvar="item_count",
                     sizevar="transactions",
                     options=list(hAxis='{title: "Decile Ranking", minValue:0, maxValue:12}',
                                  vAxis='{title: "Avg. Transaction ($)", minValue:0, maxValue:125}',
                                  title="Average Transaction ($) vs. Decile Ranking - 6/1/2013 - 12/31/2013",
                                  titlePosition='out',
                                  height=650, 
                                  width=1350,                         
                                  backgroundColor="#D3D3D3"))

cat(M$html$chart, file='J:/Cory/Hackathon/BubbleChart_Amount.html')


##################################################################################################
##################################################################################################


N <- gvisBubbleChart(Dealer_DATA, 
                     idvar="amt_dairy",
                     xvar="rank",
                     yvar="Dairy",
                     colorvar="item_count",
                     sizevar="transactions",
                     options=list(hAxis='{title: "Decile Ranking", minValue:0, maxValue:12}',
                                  vAxis='{title: "Avg. Dairy Transaction ($)", minValue:0, maxValue:12}',
                                  title="Average Dairy Transaction ($) vs. Decile Ranking - 6/1/2013 - 12/31/2013",
                                  titlePosition='out',
                                  height=650, 
                                  width=1350,                         
                                  backgroundColor="#D3D3D3"))

cat(N$html$chart, file='J:/Cory/Hackathon/BubbleChart_Dairy.html')


##################################################################################################
##################################################################################################


O <- gvisBubbleChart(Dealer_DATA, 
                     idvar="amt_cat_milk",
                     xvar="rank",
                     yvar="Milk",
                     colorvar="item_count",
                     sizevar="transactions",
                     options=list(hAxis='{title: "Decile Ranking", minValue:0, maxValue:12}',
                                  vAxis='{title: "Avg. Milk Transaction ($)", minValue:0, maxValue:4}',
                                  title="Average Milk Transaction ($) vs. Decile Ranking - 6/1/2013 - 12/31/2013",
                                  titlePosition='out',
                                  height=650, 
                                  width=1350,                         
                                  backgroundColor="#D3D3D3"))

cat(O$html$chart, file='J:/Cory/Hackathon/BubbleChart_Milk.html')


##################################################################################################
##################################################################################################


P <- gvisBubbleChart(Dealer_DATA, 
                     idvar="amt_cat_baby_food",
                     xvar="rank",
                     yvar="Baby_Food",
                     colorvar="item_count",
                     sizevar="transactions",
                     options=list(hAxis='{title: "Decile Ranking", minValue:0, maxValue:12}',
                                  vAxis='{title: "Avg. Baby Food Transaction ($)", minValue:0, maxValue:0.50}',
                                  title="Average Baby Food Transaction ($) vs. Decile Ranking - 6/1/2013 - 12/31/2013",
                                  titlePosition='out',
                                  height=650, 
                                  width=1350,                         
                                  backgroundColor="#D3D3D3"))

cat(P$html$chart, file='J:/Cory/Hackathon/BubbleChart_Baby_Food.html')


##################################################################################################
##################################################################################################


