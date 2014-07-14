CREATE TABLE hackathon_test.model_data_set as  select hhid, 
      count(distinct transaction_datetime) as transactions,
      count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end) as transactions_summer,
      count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end) as transactions_fall,
      count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end) as transactions_winter,
      sum(case when item_description != 'NO ITEM' then 1 else 0 end)/(count(distinct transaction_datetime)) as item_count,
      sum(case when item_description != 'NO ITEM' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then 1 else 0 end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as item_count_summer,
      sum(case when item_description != 'NO ITEM' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then 1 else 0 end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as item_count_fall,
      sum(case when item_description != 'NO ITEM' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then 1 else 0 end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as item_count_winter,
      sum(tender_amount)/(count(distinct transaction_datetime)) as transaction_total,
      sum(case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as transaction_total_summer,
      sum(case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as transaction_total_fall,
      sum(case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as transaction_total_winter,
      sum(extended_discount_amount)/(count(distinct transaction_datetime)) as discount_amount,
      sum(case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then extended_discount_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as discount_amount_summer,
      sum(case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then extended_discount_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as discount_amount_fall,
      sum(case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then extended_discount_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as discount_amount_winter,
      max(express_lane)/(count(distinct transaction_datetime)) as express_lane,
      max(case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then express_lane else NULL end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as express_lane_summer,
      max(case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then express_lane else NULL end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as express_lane_fall,
      max(case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then express_lane else NULL end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as express_lane_winter,
      

      sum(case when department_description = 'BAKERY' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Bakery,
      sum(case when department_description = 'BAKERY' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Bakery_summer,
      sum(case when department_description = 'BAKERY' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Bakery_fall,
      sum(case when department_description = 'BAKERY' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Bakery_winter,
      sum(case when department_description = 'BEER' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Beer,
      sum(case when department_description = 'BEER' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Beer_summer,
      sum(case when department_description = 'BEER' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Beer_fall,
      sum(case when department_description = 'BEER' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Beer_winter,
      sum(case when department_description = 'BEVERAGE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Beverage,
      sum(case when department_description = 'BEVERAGE' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Beverage_summer,
      sum(case when department_description = 'BEVERAGE' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Beverage_fall,
      sum(case when department_description = 'BEVERAGE' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Beverage_winter,
      sum(case when department_description = 'COFFEE SHOP' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_coffee,
      sum(case when department_description = 'COFFEE SHOP' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Coffee_summer,
      sum(case when department_description = 'COFFEE SHOP' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Coffee_fall,
      sum(case when department_description = 'COFFEE SHOP' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Coffee_winter,
      sum(case when department_description = 'COMMERCIAL BAKERY' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Com_Bakery,
      sum(case when department_description = 'COMMERCIAL BAKERY' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Com_Bakery_summer,
      sum(case when department_description = 'COMMERCIAL BAKERY' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Com_Bakery_fall,
      sum(case when department_description = 'COMMERCIAL BAKERY' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Com_Bakery_winter,
      sum(case when department_description = 'DAIRY' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Dairy,
      sum(case when department_description = 'DAIRY' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Dairy_summer,
      sum(case when department_description = 'DAIRY' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Dairy_fall,
      sum(case when department_description = 'DAIRY' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Dairy_winter,
      sum(case when department_description = 'DELI' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Deli,
      sum(case when department_description = 'DELI' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Deli_summer,
      sum(case when department_description = 'DELI' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Deli_fall,
      sum(case when department_description = 'DELI' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Deli_winter,
      sum(case when department_description = 'FLORAL' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Floral,
      sum(case when department_description = 'FLORAL' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Floral_summer,
      sum(case when department_description = 'FLORAL' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Floral_fall,
      sum(case when department_description = 'FLORAL' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Floral_winter,
      sum(case when department_description = 'FROZEN' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Frozen,
      sum(case when department_description = 'FROZEN' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Frozen_summer,
      sum(case when department_description = 'FROZEN' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Frozen_fall,
      sum(case when department_description = 'FROZEN' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Frozen_winter,
      sum(case when department_description = 'G1 GROCERY' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Grocery,
      sum(case when department_description = 'G1 GROCERY' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) end) as Dept_Grocery_summer,
      sum(case when department_description = 'G1 GROCERY' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Grocery_fall,
      sum(case when department_description = 'G1 GROCERY' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Grocery_winter,
      sum(case when department_description = 'GM' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_GM,
      sum(case when department_description = 'GM' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_GM_summer,
      sum(case when department_description = 'GM' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_GM_fall,
      sum(case when department_description = 'GM' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_GM_winter,
      sum(case when department_description = 'HBC' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Health_Beauty,
      sum(case when department_description = 'HBC' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Health_Beauty_summer,
      sum(case when department_description = 'HBC' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Health_Beauty_fall,
      sum(case when department_description = 'HBC' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Health_Beauty_winter,
      sum(case when department_description = 'MEAT' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Meat,
      sum(case when department_description = 'MEAT' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Meat_summer,
      sum(case when department_description = 'MEAT' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Meat_fall,
      sum(case when department_description = 'MEAT' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Meat_winter,
      sum(case when department_description = 'PHARMACY' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Pharmacy,
      sum(case when department_description = 'PHARMACY' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Pharmacy_summer,
      sum(case when department_description = 'PHARMACY' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Pharmacy_fall,
      sum(case when department_description = 'PHARMACY' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Pharmacy_winter,
      sum(case when department_description = 'PRODUCE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Produce,
      sum(case when department_description = 'PRODUCE' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Produce_summer,
      sum(case when department_description = 'PRODUCE' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Produce_fall,
      sum(case when department_description = 'PRODUCE' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Produce_winter,
      sum(case when department_description = 'SEAFOOD' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Seafood,
      sum(case when department_description = 'SEAFOOD' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Seafood_summer,
      sum(case when department_description = 'SEAFOOD' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Seafood_fall,
      sum(case when department_description = 'SEAFOOD' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Seafood_winter,
      sum(case when department_description = 'WINE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Dept_Wine,
      sum(case when department_description = 'WINE' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Wine_summer,
      sum(case when department_description = 'WINE' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Wine_fall,
      sum(case when department_description = 'WINE' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Dept_Wine_winter,
      
 
      sum(case when category_description = 'CARBONATED BEVERAGES' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Carbonated_Beverages,
      sum(case when category_description = 'CARBONATED BEVERAGES' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Carbonated_Beverages_summer,
      sum(case when category_description = 'CARBONATED BEVERAGES' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Carbonated_Beverages_fall,
    sum(case when category_description = 'CARBONATED BEVERAGES' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Carbonated_Beverages_winter,
      
      sum(case when category_description = 'MILK' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Milk,
      sum(case when category_description = 'MILK' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Milk_summer,
      sum(case when category_description = 'MILK' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Milk_fall,
    sum(case when category_description = 'MILK' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Milk_winter,

      
      sum(case when category_description = 'CHEESE' OR category_description = 'SPECIALTY CHEESE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Cheese,
      sum(case when (category_description = 'CHEESE' OR category_description = 'SPECIALTY CHEESE') and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cheese_summer,
      sum(case when (category_description = 'CHEESE' OR category_description = 'SPECIALTY CHEESE') and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cheese_fall,
    sum(case when (category_description = 'CHEESE' OR category_description = 'SPECIALTY CHEESE') and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cheese_winter,

      
      sum(case when category_description = 'BOTTLED WATER' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Bottled_Water,
      sum(case when category_description = 'BOTTLED WATER' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bottled_Water_summer,
      sum(case when category_description = 'BOTTLED WATER' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bottled_Water_fall,
    sum(case when category_description = 'BOTTLED WATER' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bottled_Water_winter,

      
      sum(case when category_description = 'SNACKS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Snacks,
      sum(case when category_description = 'SNACKS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Snacks_summer,
      sum(case when category_description = 'SNACKS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Snacks_fall,
    sum(case when category_description = 'SNACKS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Snacks_winter,
      

      sum(case when category_description = 'YOGURT' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Yogurt,
      sum(case when category_description = 'YOGURT' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Yogurt_summer,
      sum(case when category_description = 'YOGURT' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Yogurt_fall,
    sum(case when category_description = 'YOGURT' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Yogurt_winter,


      sum(case when category_description = 'VEGETABLES-CAN/JAR' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Canned_Veggies,
      sum(case when category_description = 'VEGETABLES-CAN/JAR' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Canned_Veggies_summer,
      sum(case when category_description = 'VEGETABLES-CAN/JAR' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Canned_Veggies_fall,
    sum(case when category_description = 'VEGETABLES-CAN/JAR' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Canned_Veggies_winter,


      sum(case when category_description = 'PAPER/PLASTIC PRODUCTS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Paper_Prods,
      sum(case when category_description = 'PAPER/PLASTIC PRODUCTS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Paper_Prods_summer,
      sum(case when category_description = 'PAPER/PLASTIC PRODUCTS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Paper_Prods_fall,
    sum(case when category_description = 'PAPER/PLASTIC PRODUCTS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Paper_Prods_winter,


      sum(case when category_description = 'SOUP' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Soup,
      sum(case when category_description = 'SOUP' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Soup_summer,
      sum(case when category_description = 'SOUP' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Soup_fall,
    sum(case when category_description = 'SOUP' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Soup_winter,


      sum(case when category_description = 'CANDY' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Candy,
      sum(case when category_description = 'CANDY' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Candy_summer,
      sum(case when category_description = 'CANDY' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Candy_fall,
    sum(case when category_description = 'CANDY' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Candy_winter,


      sum(case when category_description = 'BEEF' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Beef,
      sum(case when category_description = 'BEEF' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Beef_summer,
      sum(case when category_description = 'BEEF' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Beef_fall,
    sum(case when category_description = 'BEEF' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Beef_winter,


      sum(case when category_description = 'VEGETABLES-FROZEN' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Frozen_Veggies,
      sum(case when category_description = 'VEGETABLES-FROZEN' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Veggies_summer,
      sum(case when category_description = 'VEGETABLES-FROZEN' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Veggies_fall,
    sum(case when category_description = 'VEGETABLES-FROZEN' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Veggies_winter,


      sum(case when category_description = 'CRACKERS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Crackers,
      sum(case when category_description = 'CRACKERS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Crackers_summer,
      sum(case when category_description = 'CRACKERS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Crackers_fall,
    sum(case when category_description = 'CRACKERS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Crackers_winter,


      sum(case when category_description = 'COFFEE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Coffee,
      sum(case when category_description = 'COFFEE' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_coffee_summer,
      sum(case when category_description = 'COFFEE' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_coffee_fall,
    sum(case when category_description = 'COFFEE' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_coffee_winter,


      sum(case when category_description = 'CEREAL' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Cereal,
      sum(case when category_description = 'CEREAL' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cereal_summer,
      sum(case when category_description = 'CEREAL' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cereal_fall,
    sum(case when category_description = 'CEREAL' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cereal_winter,


      sum(case when category_description = 'FROZEN MEALS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Frozen_Meals,
      sum(case when category_description = 'FROZEN MEALS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Meals_summer,
      sum(case when category_description = 'FROZEN MEALS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Meals_fall,
    sum(case when category_description = 'FROZEN MEALS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Meals_winter,


      sum(case when category_description = 'ICE CREAM' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Ice_Cream,
      sum(case when category_description = 'ICE CREAM' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Ice_Cream_summer,
      sum(case when category_description = 'ICE CREAM' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Ice_Cream_fall,
    sum(case when category_description = 'ICE CREAM' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Ice_Cream_winter,


      sum(case when category_description = 'COOKIES' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Cookies,
      sum(case when category_description = 'COOKIES' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cookies_summer,
      sum(case when category_description = 'COOKIES' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cookies_fall,
    sum(case when category_description = 'COOKIES' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cookies_winter,


      sum(case when category_description = 'JUICES/DRINKS-SHELF STABLE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Juice,
      sum(case when category_description = 'JUICES/DRINKS-SHELF STABLE' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Juice_summer,
      sum(case when category_description = 'JUICES/DRINKS-SHELF STABLE' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Juice_fall,
    sum(case when category_description = 'JUICES/DRINKS-SHELF STABLE' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Juice_winter,


      sum(case when category_description = 'EGGS FRESH' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Eggs,
      sum(case when category_description = 'EGGS FRESH' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Eggs_summer,
      sum(case when category_description = 'EGGS FRESH' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Eggs_fall,
    sum(case when category_description = 'EGGS FRESH' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Eggs_winter,


      sum(case when category_description = 'POULTRY' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Poultry,
      sum(case when category_description = 'POULTRY' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Poultry_summer,
      sum(case when category_description = 'POULTRY' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Poultry_fall,
    sum(case when category_description = 'POULTRY' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Poultry_winter,

      sum(case when category_description = 'SALADS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Salad,
      sum(case when category_description = 'SALADS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Salad_summer,
      sum(case when category_description = 'SALADS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Salad_fall,
    sum(case when category_description = 'SALADS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Salad_winter,


      sum(case when category_description = 'FLORAL' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Floral,
      sum(case when category_description = 'FLORAL' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Floral_summer,
      sum(case when category_description = 'FLORAL' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Floral_fall,
    sum(case when category_description = 'FLORAL' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Floral_winter,


      sum(case when category_description = 'BREAKFAST FOODS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Breakfast,
      sum(case when category_description = 'BREAKFAST FOODS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Breakfast_summer,
      sum(case when category_description = 'BREAKFAST FOODS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Breakfast_fall,
    sum(case when category_description = 'BREAKFAST FOODS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Breakfast_winter,


      sum(case when category_description = 'CONDIMENTS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Condiments,
      sum(case when category_description = 'CONDIMENTS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Condiments_summer,
      sum(case when category_description = 'CONDIMENTS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Condiments_fall,
    sum(case when category_description = 'CONDIMENTS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Condiments_winter,


      sum(case when category_description = 'SLICED BREAD' OR category_description = 'BREAD' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Bread,
      sum(case when (category_description = 'SLICED BREAD' OR category_description = 'BREAD') and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bread_summer,
      sum(case when (category_description = 'SLICED BREAD' OR category_description = 'BREAD') and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bread_fall,
    sum(case when (category_description = 'SLICED BREAD' OR category_description = 'BREAD') and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bread_winter,


      sum(case when category_description = 'SPICES/SEASONINGS/EXTRACTS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Spices,
      sum(case when category_description = 'SPICES/SEASONINGS/EXTRACTS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Spices_summer,
      sum(case when category_description = 'SPICES/SEASONINGS/EXTRACTS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Spices_fall,
    sum(case when category_description = 'SPICES/SEASONINGS/EXTRACTS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Spices_winter,


      sum(case when category_description = 'WRAPPING MATERIALS & BAGS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Wrapping,
      sum(case when category_description = 'WRAPPING MATERIALS & BAGS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Wrapping_summer,
      sum(case when category_description = 'WRAPPING MATERIALS & BAGS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Wrapping_fall,
    sum(case when category_description = 'WRAPPING MATERIALS & BAGS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Wrapping_winter,


      sum(case when category_description = 'CULTURES' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Cultures,
      sum(case when category_description = 'CULTURES' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cultures_summer,
      sum(case when category_description = 'CULTURES' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cultures_fall,
    sum(case when category_description = 'CULTURES' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cultures_winter,


      sum(case when category_description = 'BACON' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Bacon,
            sum(case when category_description = 'BACON' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bacon_summer,
      sum(case when category_description = 'BACON' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bacon_fall,
    sum(case when category_description = 'BACON' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Bacon_winter,


      sum(case when category_description = 'MEATLESS-FROZEN' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Frozen_Meatless,
            sum(case when category_description = 'MEATLESS-FROZEN' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Meatless_summer,
      sum(case when category_description = 'MEATLESS-FROZEN' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Meatless_fall,
    sum(case when category_description = 'MEATLESS-FROZEN' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Meatless_winter,


      sum(case when category_description = 'DINNER SAUSAGE' OR category_description = 'BREAKFAST SAUSAGE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Sausage,
      sum(case when (category_description = 'DINNER SAUSAGE' OR category_description = 'BREAKFAST SAUSAGE') and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sausage_summer,
      sum(case when (category_description = 'DINNER SAUSAGE' OR category_description = 'BREAKFAST SAUSAGE') and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sausage_fall,
    sum(case when (category_description = 'DINNER SAUSAGE' OR category_description = 'BREAKFAST SAUSAGE') and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sausage_winter,


      sum(case when category_description = 'PASTA' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Pasta,
            sum(case when category_description = 'PASTA' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pasta_summer,
      sum(case when category_description = 'PASTA' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pasta_fall,
    sum(case when category_description = 'PASTA' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pasta_winter,


      sum(case when category_description = 'BAKING SUPPLIES' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Baking,
            sum(case when category_description = 'BAKING SUPPLIES' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Baking_summer,
      sum(case when category_description = 'BAKING SUPPLIES' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Baking_fall,
    sum(case when category_description = 'BAKING SUPPLIES' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Baking_winter,


      sum(case when category_description = 'CAKES' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Cakes,
            sum(case when category_description = 'CAKES' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cakes_summer,
      sum(case when category_description = 'CAKES' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cakes_fall,
    sum(case when category_description = 'CAKES' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Cakes_winter,


      sum(case when category_description = 'FRESHENERS/DEODORIZERS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Deodorant,
            sum(case when category_description = 'FRESHENERS/DEODORIZERS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Deodorant_summer,
      sum(case when category_description = 'FRESHENERS/DEODORIZERS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Deodorant_fall,
    sum(case when category_description = 'FRESHENERS/DEODORIZERS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Deodorant_winter,


      sum(case when category_description = 'SOFT DRINKS-NON-CARBONATED' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Non_Carb_Soft_Drinks,
            sum(case when category_description = 'SOFT DRINKS-NON-CARBONATED' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Non_Carb_Soft_Drinks_summer,
      sum(case when category_description = 'SOFT DRINKS-NON-CARBONATED' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Non_Carb_Soft_Drinks_fall,
    sum(case when category_description = 'SOFT DRINKS-NON-CARBONATED' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Non_Carb_Soft_Drinks_winter,


      sum(case when category_description = 'BUTTER & MARGARINE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Butter,
            sum(case when category_description = 'BUTTER & MARGARINE' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Butter_summer,
      sum(case when category_description = 'BUTTER & MARGARINE' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Butter_fall,
    sum(case when category_description = 'BUTTER & MARGARINE' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Butter_winter,


      sum(case when category_description = 'SALAD DRESSING/MAYONNAISE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Salad_Dressing,
            sum(case when category_description = 'SALAD DRESSING/MAYONNAISE' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Salad_Dressing_summer,
      sum(case when category_description = 'SALAD DRESSING/MAYONNAISE' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Salad_Dressing_fall,
    sum(case when category_description = 'SALAD DRESSING/MAYONNAISE' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Salad_Dressing_winter,


      sum(case when category_description = 'PORK' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Pork,
            sum(case when category_description = 'PORK' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pork_summer,
      sum(case when category_description = 'PORK' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pork_fall,
    sum(case when category_description = 'PORK' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pork_winter,


      sum(case when category_description = 'TEA' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Tea,
            sum(case when category_description = 'TEA' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Tea_summer,
      sum(case when category_description = 'TEA' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Tea_fall,
    sum(case when category_description = 'TEA' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Tea_winter,


      sum(case when category_description = 'LUNCHMEATS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Lunchmeat,
            sum(case when category_description = 'LUNCHMEATS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Lunchmeat_summer,
      sum(case when category_description = 'LUNCHMEATS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Lunchmeat_fall,
    sum(case when category_description = 'LUNCHMEATS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Lunchmeat_winter,


      sum(case when category_description = 'SUGAR/SUBSTITUTES' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Sugar,
            sum(case when category_description = 'SUGAR/SUBSTITUTES' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sugar_summer,
      sum(case when category_description = 'SUGAR/SUBSTITUTES' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sugar_fall,
    sum(case when category_description = 'SUGAR/SUBSTITUTES' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sugar_winter,


      sum(case when category_description = 'DESSERTS FROZEN' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Frozen_Desserts,
            sum(case when category_description = 'DESSERTS FROZEN' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Desserts_summer,
      sum(case when category_description = 'DESSERTS FROZEN' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Desserts_fall,
    sum(case when category_description = 'DESSERTS FROZEN' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Frozen_Desserts_winter,


      sum(case when category_description = 'JAMS/JELLIES/SPREADS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Jams,
            sum(case when category_description = 'JAMS/JELLIES/SPREADS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Jams_summer,
      sum(case when category_description = 'JAMS/JELLIES/SPREADS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Jams_fall,
    sum(case when category_description = 'JAMS/JELLIES/SPREADS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Jams_winter,


      sum(case when category_description = 'FISH FILLETS/STEAKS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Steak,
            sum(case when category_description = 'FISH FILLETS/STEAKS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Steak_summer,
      sum(case when category_description = 'FISH FILLETS/STEAKS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Steak_fall,
    sum(case when category_description = 'FISH FILLETS/STEAKS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Steak_winter,


      sum(case when category_description = 'DETERGENTS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Detergent,
            sum(case when category_description = 'DETERGENTS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Detergent_summer,
      sum(case when category_description = 'DETERGENTS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Detergent_fall,
    sum(case when category_description = 'DETERGENTS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Detergent_winter,


      sum(case when category_description = 'DOMESTIC BEER' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Beer,
            sum(case when category_description = 'DOMESTIC BEER' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Beer_summer,
      sum(case when category_description = 'DOMESTIC BEER' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Beer_fall,
    sum(case when category_description = 'DOMESTIC BEER' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Beer_winter,


      sum(case when category_description = 'BABY FOOD' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Baby_Food,
            sum(case when category_description = 'BABY FOOD' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Baby_Food_summer,
      sum(case when category_description = 'BABY FOOD' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Baby_Food_fall,
    sum(case when category_description = 'BABY FOOD' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Baby_Food_winter,


      sum(case when category_description = 'SEASONAL MERCHANDISE' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Seasonal,
            sum(case when category_description = 'SEASONAL MERCHANDISE' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Seasonal_summer,
      sum(case when category_description = 'SEASONAL MERCHANDISE' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Seasonal_fall,
    sum(case when category_description = 'SEASONAL MERCHANDISE' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Seasonal_winter,


      sum(case when category_description = 'SUSHI' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Sushi,
            sum(case when category_description = 'SUSHI' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sushi_summer,
      sum(case when category_description = 'SUSHI' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sushi_fall,
    sum(case when category_description = 'SUSHI' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Sushi_winter,


      sum(case when category_description = 'PAIN RELIEF' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Pain_Relief,
            sum(case when category_description = 'PAIN RELIEF' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pain_Relief_summer,
      sum(case when category_description = 'PAIN RELIEF' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pain_Relief_fall,
    sum(case when category_description = 'PAIN RELIEF' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Pain_Relief_winter,


      sum(case when category_description = 'KITCHEN GADGETS' then tender_amount else CAST(0 as float) end)/(count(distinct transaction_datetime)) as Cat_Kitchen_Gadgets,
            sum(case when category_description = 'KITCHEN GADGETS' and transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '06/01/2013 00:00' and '08/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Kitchen_Gadgets_summer,
      sum(case when category_description = 'KITCHEN GADGETS' and transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '09/01/2013 00:00' and '10/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Kitchen_Gadgets_fall,
    sum(case when category_description = 'KITCHEN GADGETS' and transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then tender_amount else CAST(0 as float) end)/
            (count(distinct case when transaction_datetime between '11/01/2013 00:00' and '12/31/2013 23:59' then transaction_datetime else NULL end)) as Cat_Kitchen_Gadgets_winter

      
      from hackathon_test.hackathon_clean
      group by hhid

