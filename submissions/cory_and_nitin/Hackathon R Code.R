setwd('J:/Cory/Hackathon')
data <- read.csv("J:/Cory/Hackathon/hackathon_data.csv")
library(sqldf)

test <- sqldf("select hhid, load_dt, count(*) as items from data group by hhid, load_dt")

sqldf("select hhid, avg(items) from test group by hhid")

big_data <- read.table("J:/Cory/Hackathon/merged_dir", sep = "|")

names(big_data) <- c("hhid","transactions","transactions_summer","transactions_fall","transactions_winter",
                     "item_count","item_count_summer","item_count_fall","item_count_winter","transaction_total",
                     "transaction_total_summer","transaction_total_fall","transaction_total_winter","discount_amount",
                     "discount_amount_summer","discount_amount_fall","discount_amount_winter","express_lane",
                     "express_lane_summer","express_lane_fall","express_lane_winter","dept_bakery","dept_bakery_summer",
                     "dept_bakery_fall","dept_bakery_winter","dept_beer","dept_beer_summer","dept_beer_fall",
                     "dept_beer_winter","dept_beverage","dept_beverage_summer","dept_beverage_fall","dept_beverage_winter",
                     "dept_coffee","dept_coffee_summer","dept_coffee_fall","dept_coffee_winter","dept_com_bakery",
                     "dept_com_bakery_summer","dept_com_bakery_fall","dept_com_bakery_winter","dept_dairy",
                     "dept_dairy_summer","dept_dairy_fall","dept_dairy_winter","dept_deli","dept_deli_summer",
                     "dept_deli_fall","dept_deli_winter","dept_floral","dept_floral_summer","dept_floral_fall",
                     "dept_floral_winter","dept_frozen","dept_frozen_summer","dept_frozen_fall","dept_frozen_winter",
                     "dept_grocery","dept_grocery_summer","dept_grocery_fall","dept_grocery_winter","dept_gm",
                     "dept_gm_summer","dept_gm_fall","dept_gm_winter","dept_health_beauty","dept_health_beauty_summer",
                     "dept_health_beauty_fall","dept_health_beauty_winter","dept_meat","dept_meat_summer",
                     "dept_meat_fall","dept_meat_winter","dept_pharmacy","dept_pharmacy_summer","dept_pharmacy_fall",
                     "dept_pharmacy_winter","dept_produce","dept_produce_summer","dept_produce_fall",
                     "dept_produce_winter","dept_seafood","dept_seafood_summer","dept_seafood_fall",
                     "dept_seafood_winter","dept_wine","dept_wine_summer","dept_wine_fall","dept_wine_winter",
                     "cat_carbonated_beverages","cat_carbonated_beverages_summer","cat_carbonated_beverages_fall",
                     "cat_carbonated_beverages_winter","cat_milk","cat_milk_summer","cat_milk_fall","cat_milk_winter",
                     "cat_cheese","cat_cheese_summer","cat_cheese_fall","cat_cheese_winter","cat_bottled_water",
                     "cat_bottled_water_summer","cat_bottled_water_fall","cat_bottled_water_winter","cat_snacks",
                     "cat_snacks_summer","cat_snacks_fall","cat_snacks_winter","cat_yogurt","cat_yogurt_summer",
                     "cat_yogurt_fall","cat_yogurt_winter","cat_canned_veggies","cat_canned_veggies_summer",
                     "cat_canned_veggies_fall","cat_canned_veggies_winter","cat_paper_prods","cat_paper_prods_summer",
                     "cat_paper_prods_fall","cat_paper_prods_winter","cat_soup","cat_soup_summer","cat_soup_fall",
                     "cat_soup_winter","cat_candy","cat_candy_summer","cat_candy_fall","cat_candy_winter","cat_beef",
                     "cat_beef_summer","cat_beef_fall","cat_beef_winter","cat_frozen_veggies","cat_frozen_veggies_summer",
                     "cat_frozen_veggies_fall","cat_frozen_veggies_winter","cat_crackers","cat_crackers_summer",
                     "cat_crackers_fall","cat_crackers_winter","cat_coffee","cat_coffee_summer","cat_coffee_fall",
                     "cat_coffee_winter","cat_cereal","cat_cereal_summer","cat_cereal_fall","cat_cereal_winter",
                     "cat_frozen_meals","cat_frozen_meals_summer","cat_frozen_meals_fall","cat_frozen_meals_winter",
                     "cat_ice_cream","cat_ice_cream_summer","cat_ice_cream_fall","cat_ice_cream_winter","cat_cookies",
                     "cat_cookies_summer","cat_cookies_fall","cat_cookies_winter","cat_juice","cat_juice_summer",
                     "cat_juice_fall","cat_juice_winter","cat_eggs","cat_eggs_summer","cat_eggs_fall","cat_eggs_winter",
                     "cat_poultry","cat_poultry_summer","cat_poultry_fall","cat_poultry_winter","cat_salad",
                     "cat_salad_summer","cat_salad_fall","cat_salad_winter","cat_floral","cat_floral_summer",
                     "cat_floral_fall","cat_floral_winter","cat_breakfast","cat_breakfast_summer","cat_breakfast_fall",
                     "cat_breakfast_winter","cat_condiments","cat_condiments_summer","cat_condiments_fall",
                     "cat_condiments_winter","cat_bread","cat_bread_summer","cat_bread_fall","cat_bread_winter",
                     "cat_spices","cat_spices_summer","cat_spices_fall","cat_spices_winter","cat_wrapping",
                     "cat_wrapping_summer","cat_wrapping_fall","cat_wrapping_winter","cat_cultures","cat_cultures_summer",
                     "cat_cultures_fall","cat_cultures_winter","cat_bacon","cat_bacon_summer","cat_bacon_fall",
                     "cat_bacon_winter","cat_frozen_meatless","cat_frozen_meatless_summer","cat_frozen_meatless_fall",
                     "cat_frozen_meatless_winter","cat_sausage","cat_sausage_summer","cat_sausage_fall",
                     "cat_sausage_winter","cat_pasta","cat_pasta_summer","cat_pasta_fall","cat_pasta_winter",
                     "cat_baking","cat_baking_summer","cat_baking_fall","cat_baking_winter","cat_cakes",
                     "cat_cakes_summer","cat_cakes_fall","cat_cakes_winter","cat_deodorant","cat_deodorant_summer",
                     "cat_deodorant_fall","cat_deodorant_winter","cat_non_carb_soft_drinks",
                     "cat_non_carb_soft_drinks_summer","cat_non_carb_soft_drinks_fall","cat_non_carb_soft_drinks_winter",
                     "cat_butter","cat_butter_summer","cat_butter_fall","cat_butter_winter","cat_salad_dressing",
                     "cat_salad_dressing_summer","cat_salad_dressing_fall","cat_salad_dressing_winter","cat_pork",
                     "cat_pork_summer","cat_pork_fall","cat_pork_winter","cat_tea","cat_tea_summer","cat_tea_fall",
                     "cat_tea_winter","cat_lunchmeat","cat_lunchmeat_summer","cat_lunchmeat_fall","cat_lunchmeat_winter",
                     "cat_sugar","cat_sugar_summer","cat_sugar_fall","cat_sugar_winter","cat_frozen_desserts",
                     "cat_frozen_desserts_summer","cat_frozen_desserts_fall","cat_frozen_desserts_winter","cat_jams",
                     "cat_jams_summer","cat_jams_fall","cat_jams_winter","cat_steak","cat_steak_summer","cat_steak_fall",
                     "cat_steak_winter","cat_detergent","cat_detergent_summer","cat_detergent_fall","cat_detergent_winter",
                     "cat_beer","cat_beer_summer","cat_beer_fall","cat_beer_winter","cat_baby_food",
                     "cat_baby_food_summer","cat_baby_food_fall","cat_baby_food_winter","cat_seasonal",
                     "cat_seasonal_summer","cat_seasonal_fall","cat_seasonal_winter","cat_sushi","cat_sushi_summer",
                     "cat_sushi_fall","cat_sushi_winter","cat_pain_relief","cat_pain_relief_summer","cat_pain_relief_fall",
                     "cat_pain_relief_winter","cat_kitchen_gadgets","cat_kitchen_gadgets_summer",
                     "cat_kitchen_gadgets_fall","cat_kitchen_gadgets_winter")


subset <- c("X","transactions",
  "item_count","transaction_total",
  "discount_amount",
  "DEP",
  "dept_bakery",
  "dept_beer",
  "dept_beverage",
  "dept_coffee","dept_com_bakery",
  "dept_dairy",
  "dept_deli",
  "dept_floral",
  "dept_frozen",
  "dept_grocery","dept_gm",
  "dept_health_beauty",
  "dept_meat",
  "dept_pharmacy",
  "dept_produce",
  "dept_seafood",
  "dept_wine",
  "cat_carbonated_beverages",
  "cat_milk",
  "cat_cheese","cat_bottled_water",
  "cat_snacks",
  "cat_yogurt",
  "cat_canned_veggies",
  "cat_paper_prods",
  "cat_soup",
  "cat_candy","cat_beef",
  "cat_frozen_veggies",
  "cat_crackers",
  "cat_coffee",
  "cat_cereal",
  "cat_frozen_meals",
  "cat_ice_cream","cat_cookies",
  "cat_juice",
  "cat_eggs",
  "cat_poultry","cat_salad",
  "cat_floral",
  "cat_breakfast",
  "cat_condiments",
  "cat_bread",
  "cat_spices","cat_wrapping",
  "cat_cultures",
  "cat_bacon",
  "cat_frozen_meatless",
  "cat_sausage",
  "cat_pasta",
  "cat_baking","cat_cakes",
  "cat_deodorant",
  "cat_non_carb_soft_drinks",
  
  "cat_butter","cat_salad_dressing",
  "cat_pork",
  "cat_tea",
  "cat_lunchmeat",
  "cat_sugar","cat_frozen_desserts",
  "cat_jams",
  "cat_steak",
  "cat_detergent",
  "cat_beer","cat_baby_food",
  "cat_seasonal",
  "cat_sushi",
  "cat_pain_relief",
  "cat_kitchen_gadgets"
  )
Final2 <- Final
Final <- Final2[,subset]
summary(big_data$express_lane)

myvars <- names(Final) %in% c("Row.names","X","DEP")
tmp <- Final[!myvars]
indvarsc <- names(tmp)
rm(myvars)
rm(tmp)

rm(decile_report)
rm(auc_out)
rm(RF_VARS)
rm(pred)
rm(rank)





Final <- big_data
if(Final$express_lane>0){Final$DEP <- 1} else{Final$DEP <- 0}
Final <- sqldf("select *, (case when express_lane >0 then 1 else 0 end) as DEP, hhid as X from Final2")
Final <- sqldf("select *, (case when DEP >0 then 1 else 0 end) as DEP2 from Final")
Final$DEP <- NULL
Final$DEP <- Final$DEP2
Final$DEP2 <- NULL

Final <- Final[,subset]

Final$X <- Final$hhid
Final$hhid <- NULL
Final$express_lane <- NULL
if(old_dep_var > 0) {
  1
} else {
  0
  
  
  ### Select Variables
  Var_Selection<-c("dept_dairy", "item_count", "transaction_total", "dept_grocery", 
                   "cat_milk", "transactions", "cat_baby_food", "dept_com_bakery", 
                   "cat_cheese", "dept_frozen", "dept_produce", "discount_amount", 
                   "cat_eggs", "cat_breakfast", "cat_frozen_veggies")



###################################################################################
## build random forest model based on Selected variables  
library("randomForest")

set.seed(100)
Final_RF<- randomForest(Final[,Var_Selection],Final$DEP
                        ,sampsize=130000,do.trace=TRUE,importance=TRUE,ntree=300,replace=FALSE,forest=TRUE
                        ,nodesize=1500,maxnodes=25,na.action=na.omit)

RF_VARS <- as.data.frame(round(importance(Final_RF), 2))
RF_VARS <- RF_VARS[order(-RF_VARS$IncNodePurity) ,]

save(Final_RF, file = "FP_ACQ_Model.RData")
load("Final_RF.RData")

# Score
pred <- data.frame(predict(Final_RF,Final[,Var_Selection]),type="prob") ##type= options are response, prob. or votes
pred <- pred[c(-2)]
names(pred) <- "score"
summary(pred)

# Apply Deciles
library(gtools)
# 0.1 option makes 10 equal groups (.25 would be 4).  negative option (-pred$score) makes the highest score equal to 1
rank <- data.frame(quantcut(-pred$score, q=seq(0, 1, 0.1), labels=F))
names(rank) <- "rank"

# apply the rank
Final_Scored <- cbind(Final,pred,rank)

#Run Decile Report: do average of all model vars, avg DEP and min score, max score and avg score
library(sqldf)
decile_report <- sqldf("select rank, count(*) as qty, sum(DEP) as Responders, min(score) as min_score,
                       max(score) as max_score, avg(score) as avg_score
                       from Final_Scored
                       group by rank")




names1_1 <- c("dept_dairy", "item_count", "transaction_total", "dept_grocery", 
              "cat_milk", "transactions", "cat_baby_food", "dept_com_bakery", 
              "cat_cheese", "dept_frozen", "dept_produce", "discount_amount", 
              "cat_eggs", "cat_breakfast", "cat_frozen_veggies")

input_final <- Final2[names1_1]
Final_Scored2 <- data.frame(input_final,pred,rank)
Final_Scored2 <- rename(Final_Scored2, c(trainClass.New_FP="New_FP"))



Train_Avg_Report <- sqldf('select rank
                          , avg(dept_dairy) as dept_dairy
                          , avg(item_count) as item_count
                          , avg(transaction_total) as transaction_total
                          , avg(dept_grocery) as dept_grocery
                          , avg(cat_milk) as cat_milk
                          , avg(transactions) as transactions
                          , avg(cat_baby_food) as cat_baby_food
                          , avg(dept_com_bakery) as dept_com_bakery                                     
                          , avg(cat_cheese) as cat_cheese                                     
                          , avg(dept_frozen) as dept_frozen                                     
                          , avg(dept_produce) as dept_produce                                    
                          , avg(discount_amount) as discount_amount                                     
                          , avg(cat_eggs) as cat_eggs                                     
                          , avg(cat_breakfast) as cat_breakfast                                     
                          , avg(cat_frozen_veggies) as cat_frozen_veggies                                    
                          from Final_Scored2
                          group by rank')
