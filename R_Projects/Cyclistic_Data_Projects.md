Cyclistic\_Project
================
PASLAMU
6/8/2021

## Setting up my environment

Notes: setting up my r environment by loading packages

``` r
library(tidyverse)         #helps wrangle data
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.2     ✓ dplyr   1.0.6
    ## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
    ## ✓ readr   1.4.0     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(ggplot2)           #helps visualize data 
library(lubridate)         #helps wrangle date data 
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

``` r
library(skimr)             #for statistical data set info
getwd()                    #displays working directory
```

    ## [1] "/Users/pasangsherpa/Desktop"

## Step 1: Collect Data

notes: Uploading the ‘csv file’ data

``` r
q3_2019<- read_csv("Cyclistic_Tripdata/Divvy_Trips_2019_Q3.csv")
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   trip_id = col_double(),
    ##   start_time = col_datetime(format = ""),
    ##   end_time = col_datetime(format = ""),
    ##   bikeid = col_double(),
    ##   tripduration = col_number(),
    ##   from_station_id = col_double(),
    ##   from_station_name = col_character(),
    ##   to_station_id = col_double(),
    ##   to_station_name = col_character(),
    ##   usertype = col_character(),
    ##   gender = col_character(),
    ##   birthyear = col_double()
    ## )

``` r
q4_2019<- read_csv("Cyclistic_Tripdata/Divvy_Trips_2019_Q4.csv")
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   trip_id = col_double(),
    ##   start_time = col_datetime(format = ""),
    ##   end_time = col_datetime(format = ""),
    ##   bikeid = col_double(),
    ##   tripduration = col_number(),
    ##   from_station_id = col_double(),
    ##   from_station_name = col_character(),
    ##   to_station_id = col_double(),
    ##   to_station_name = col_character(),
    ##   usertype = col_character(),
    ##   gender = col_character(),
    ##   birthyear = col_double()
    ## )

``` r
q1_2020<- read_csv("Cyclistic_Tripdata/Divvy_Trips_2020_Q1.csv")
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   ride_id = col_character(),
    ##   rideable_type = col_character(),
    ##   started_at = col_datetime(format = ""),
    ##   ended_at = col_datetime(format = ""),
    ##   start_station_name = col_character(),
    ##   start_station_id = col_double(),
    ##   end_station_name = col_character(),
    ##   end_station_id = col_double(),
    ##   start_lat = col_double(),
    ##   start_lng = col_double(),
    ##   end_lat = col_double(),
    ##   end_lng = col_double(),
    ##   member_casual = col_character()
    ## )

``` r
q2_2019 <- read_csv("Cyclistic_Tripdata/Divvy_Trips_2019_Q2")
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   `01 - Rental Details Rental ID` = col_double(),
    ##   `01 - Rental Details Local Start Time` = col_datetime(format = ""),
    ##   `01 - Rental Details Local End Time` = col_datetime(format = ""),
    ##   `01 - Rental Details Bike ID` = col_double(),
    ##   `01 - Rental Details Duration In Seconds Uncapped` = col_number(),
    ##   `03 - Rental Start Station ID` = col_double(),
    ##   `03 - Rental Start Station Name` = col_character(),
    ##   `02 - Rental End Station ID` = col_double(),
    ##   `02 - Rental End Station Name` = col_character(),
    ##   `User Type` = col_character(),
    ##   `Member Gender` = col_character(),
    ##   `05 - Member Details Member Birthday Year` = col_double()
    ## )

## Step 2: Wrangle data and combine into a single file

``` r
colnames(q3_2019)
```

    ##  [1] "trip_id"           "start_time"        "end_time"         
    ##  [4] "bikeid"            "tripduration"      "from_station_id"  
    ##  [7] "from_station_name" "to_station_id"     "to_station_name"  
    ## [10] "usertype"          "gender"            "birthyear"

``` r
colnames(q4_2019)
```

    ##  [1] "trip_id"           "start_time"        "end_time"         
    ##  [4] "bikeid"            "tripduration"      "from_station_id"  
    ##  [7] "from_station_name" "to_station_id"     "to_station_name"  
    ## [10] "usertype"          "gender"            "birthyear"

``` r
colnames(q1_2020)
```

    ##  [1] "ride_id"            "rideable_type"      "started_at"        
    ##  [4] "ended_at"           "start_station_name" "start_station_id"  
    ##  [7] "end_station_name"   "end_station_id"     "start_lat"         
    ## [10] "start_lng"          "end_lat"            "end_lng"           
    ## [13] "member_casual"

``` r
colnames(q2_2019)
```

    ##  [1] "01 - Rental Details Rental ID"                   
    ##  [2] "01 - Rental Details Local Start Time"            
    ##  [3] "01 - Rental Details Local End Time"              
    ##  [4] "01 - Rental Details Bike ID"                     
    ##  [5] "01 - Rental Details Duration In Seconds Uncapped"
    ##  [6] "03 - Rental Start Station ID"                    
    ##  [7] "03 - Rental Start Station Name"                  
    ##  [8] "02 - Rental End Station ID"                      
    ##  [9] "02 - Rental End Station Name"                    
    ## [10] "User Type"                                       
    ## [11] "Member Gender"                                   
    ## [12] "05 - Member Details Member Birthday Year"

### Rename columns to make them consistent with q1\_2020

notes: As this will be the supposed going-forward table design for Divvy

``` r
(q4_2019 <- rename(q4_2019
                   ,ride_id = trip_id
                   ,rideable_type = bikeid 
                   ,started_at = start_time  
                   ,ended_at = end_time  
                   ,start_station_name = from_station_name 
                   ,start_station_id = from_station_id 
                   ,end_station_name = to_station_name 
                   ,end_station_id = to_station_id 
                   ,member_casual = usertype))
```

    ## # A tibble: 704,054 x 12
    ##     ride_id started_at          ended_at            rideable_type tripduration
    ##       <dbl> <dttm>              <dttm>                      <dbl>        <dbl>
    ##  1 25223640 2019-10-01 00:01:39 2019-10-01 00:17:20          2215          940
    ##  2 25223641 2019-10-01 00:02:16 2019-10-01 00:06:34          6328          258
    ##  3 25223642 2019-10-01 00:04:32 2019-10-01 00:18:43          3003          850
    ##  4 25223643 2019-10-01 00:04:32 2019-10-01 00:43:43          3275         2350
    ##  5 25223644 2019-10-01 00:04:34 2019-10-01 00:35:42          5294         1867
    ##  6 25223645 2019-10-01 00:04:38 2019-10-01 00:10:51          1891          373
    ##  7 25223646 2019-10-01 00:04:52 2019-10-01 00:22:45          1061         1072
    ##  8 25223647 2019-10-01 00:04:57 2019-10-01 00:29:16          1274         1458
    ##  9 25223648 2019-10-01 00:05:20 2019-10-01 00:29:18          6011         1437
    ## 10 25223649 2019-10-01 00:05:20 2019-10-01 02:23:46          2957         8306
    ## # … with 704,044 more rows, and 7 more variables: start_station_id <dbl>,
    ## #   start_station_name <chr>, end_station_id <dbl>, end_station_name <chr>,
    ## #   member_casual <chr>, gender <chr>, birthyear <dbl>

``` r
(q3_2019 <- rename(q3_2019
                   ,ride_id = trip_id
                   ,rideable_type = bikeid 
                   ,started_at = start_time  
                   ,ended_at = end_time  
                   ,start_station_name = from_station_name 
                   ,start_station_id = from_station_id 
                   ,end_station_name = to_station_name 
                   ,end_station_id = to_station_id 
                   ,member_casual = usertype))
```

    ## # A tibble: 1,640,718 x 12
    ##     ride_id started_at          ended_at            rideable_type tripduration
    ##       <dbl> <dttm>              <dttm>                      <dbl>        <dbl>
    ##  1 23479388 2019-07-01 00:00:27 2019-07-01 00:20:41          3591         1214
    ##  2 23479389 2019-07-01 00:01:16 2019-07-01 00:18:44          5353         1048
    ##  3 23479390 2019-07-01 00:01:48 2019-07-01 00:27:42          6180         1554
    ##  4 23479391 2019-07-01 00:02:07 2019-07-01 00:27:10          5540         1503
    ##  5 23479392 2019-07-01 00:02:13 2019-07-01 00:22:26          6014         1213
    ##  6 23479393 2019-07-01 00:02:21 2019-07-01 00:07:31          4941          310
    ##  7 23479394 2019-07-01 00:02:24 2019-07-01 00:23:12          3770         1248
    ##  8 23479395 2019-07-01 00:02:26 2019-07-01 00:28:16          5442         1550
    ##  9 23479396 2019-07-01 00:02:34 2019-07-01 00:28:57          2957         1583
    ## 10 23479397 2019-07-01 00:02:45 2019-07-01 00:29:14          6091         1589
    ## # … with 1,640,708 more rows, and 7 more variables: start_station_id <dbl>,
    ## #   start_station_name <chr>, end_station_id <dbl>, end_station_name <chr>,
    ## #   member_casual <chr>, gender <chr>, birthyear <dbl>

``` r
(q2_2019 <- rename(q2_2019
                   ,ride_id = "01 - Rental Details Rental ID"
                   ,rideable_type = "01 - Rental Details Bike ID" 
                   ,started_at = "01 - Rental Details Local Start Time"  
                   ,ended_at = "01 - Rental Details Local End Time"  
                   ,start_station_name = "03 - Rental Start Station Name" 
                   ,start_station_id = "03 - Rental Start Station ID"
                   ,end_station_name = "02 - Rental End Station Name" 
                   ,end_station_id = "02 - Rental End Station ID"
                   ,member_casual = "User Type"))
```

    ## # A tibble: 1,108,163 x 12
    ##     ride_id started_at          ended_at            rideable_type
    ##       <dbl> <dttm>              <dttm>                      <dbl>
    ##  1 22178529 2019-04-01 00:02:22 2019-04-01 00:09:48          6251
    ##  2 22178530 2019-04-01 00:03:02 2019-04-01 00:20:30          6226
    ##  3 22178531 2019-04-01 00:11:07 2019-04-01 00:15:19          5649
    ##  4 22178532 2019-04-01 00:13:01 2019-04-01 00:18:58          4151
    ##  5 22178533 2019-04-01 00:19:26 2019-04-01 00:36:13          3270
    ##  6 22178534 2019-04-01 00:19:39 2019-04-01 00:23:56          3123
    ##  7 22178535 2019-04-01 00:26:33 2019-04-01 00:35:41          6418
    ##  8 22178536 2019-04-01 00:29:48 2019-04-01 00:36:11          4513
    ##  9 22178537 2019-04-01 00:32:07 2019-04-01 01:07:44          3280
    ## 10 22178538 2019-04-01 00:32:19 2019-04-01 01:07:39          5534
    ## # … with 1,108,153 more rows, and 8 more variables:
    ## #   01 - Rental Details Duration In Seconds Uncapped <dbl>,
    ## #   start_station_id <dbl>, start_station_name <chr>, end_station_id <dbl>,
    ## #   end_station_name <chr>, member_casual <chr>, Member Gender <chr>,
    ## #   05 - Member Details Member Birthday Year <dbl>

### Inspect the dataframes and look for incongruencies

``` r
str(q3_2019)
```

    ## spec_tbl_df [1,640,718 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ ride_id           : num [1:1640718] 23479388 23479389 23479390 23479391 23479392 ...
    ##  $ started_at        : POSIXct[1:1640718], format: "2019-07-01 00:00:27" "2019-07-01 00:01:16" ...
    ##  $ ended_at          : POSIXct[1:1640718], format: "2019-07-01 00:20:41" "2019-07-01 00:18:44" ...
    ##  $ rideable_type     : num [1:1640718] 3591 5353 6180 5540 6014 ...
    ##  $ tripduration      : num [1:1640718] 1214 1048 1554 1503 1213 ...
    ##  $ start_station_id  : num [1:1640718] 117 381 313 313 168 300 168 313 43 43 ...
    ##  $ start_station_name: chr [1:1640718] "Wilton Ave & Belmont Ave" "Western Ave & Monroe St" "Lakeview Ave & Fullerton Pkwy" "Lakeview Ave & Fullerton Pkwy" ...
    ##  $ end_station_id    : num [1:1640718] 497 203 144 144 62 232 62 144 195 195 ...
    ##  $ end_station_name  : chr [1:1640718] "Kimball Ave & Belmont Ave" "Western Ave & 21st St" "Larrabee St & Webster Ave" "Larrabee St & Webster Ave" ...
    ##  $ member_casual     : chr [1:1640718] "Subscriber" "Customer" "Customer" "Customer" ...
    ##  $ gender            : chr [1:1640718] "Male" NA NA NA ...
    ##  $ birthyear         : num [1:1640718] 1992 NA NA NA NA ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   trip_id = col_double(),
    ##   ..   start_time = col_datetime(format = ""),
    ##   ..   end_time = col_datetime(format = ""),
    ##   ..   bikeid = col_double(),
    ##   ..   tripduration = col_number(),
    ##   ..   from_station_id = col_double(),
    ##   ..   from_station_name = col_character(),
    ##   ..   to_station_id = col_double(),
    ##   ..   to_station_name = col_character(),
    ##   ..   usertype = col_character(),
    ##   ..   gender = col_character(),
    ##   ..   birthyear = col_double()
    ##   .. )

``` r
str(q4_2019)
```

    ## spec_tbl_df [704,054 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ ride_id           : num [1:704054] 25223640 25223641 25223642 25223643 25223644 ...
    ##  $ started_at        : POSIXct[1:704054], format: "2019-10-01 00:01:39" "2019-10-01 00:02:16" ...
    ##  $ ended_at          : POSIXct[1:704054], format: "2019-10-01 00:17:20" "2019-10-01 00:06:34" ...
    ##  $ rideable_type     : num [1:704054] 2215 6328 3003 3275 5294 ...
    ##  $ tripduration      : num [1:704054] 940 258 850 2350 1867 ...
    ##  $ start_station_id  : num [1:704054] 20 19 84 313 210 156 84 156 156 336 ...
    ##  $ start_station_name: chr [1:704054] "Sheffield Ave & Kingsbury St" "Throop (Loomis) St & Taylor St" "Milwaukee Ave & Grand Ave" "Lakeview Ave & Fullerton Pkwy" ...
    ##  $ end_station_id    : num [1:704054] 309 241 199 290 382 226 142 463 463 336 ...
    ##  $ end_station_name  : chr [1:704054] "Leavitt St & Armitage Ave" "Morgan St & Polk St" "Wabash Ave & Grand Ave" "Kedzie Ave & Palmer Ct" ...
    ##  $ member_casual     : chr [1:704054] "Subscriber" "Subscriber" "Subscriber" "Subscriber" ...
    ##  $ gender            : chr [1:704054] "Male" "Male" "Female" "Male" ...
    ##  $ birthyear         : num [1:704054] 1987 1998 1991 1990 1987 ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   trip_id = col_double(),
    ##   ..   start_time = col_datetime(format = ""),
    ##   ..   end_time = col_datetime(format = ""),
    ##   ..   bikeid = col_double(),
    ##   ..   tripduration = col_number(),
    ##   ..   from_station_id = col_double(),
    ##   ..   from_station_name = col_character(),
    ##   ..   to_station_id = col_double(),
    ##   ..   to_station_name = col_character(),
    ##   ..   usertype = col_character(),
    ##   ..   gender = col_character(),
    ##   ..   birthyear = col_double()
    ##   .. )

``` r
str(q2_2019)
```

    ## spec_tbl_df [1,108,163 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ ride_id                                         : num [1:1108163] 22178529 22178530 22178531 22178532 22178533 ...
    ##  $ started_at                                      : POSIXct[1:1108163], format: "2019-04-01 00:02:22" "2019-04-01 00:03:02" ...
    ##  $ ended_at                                        : POSIXct[1:1108163], format: "2019-04-01 00:09:48" "2019-04-01 00:20:30" ...
    ##  $ rideable_type                                   : num [1:1108163] 6251 6226 5649 4151 3270 ...
    ##  $ 01 - Rental Details Duration In Seconds Uncapped: num [1:1108163] 446 1048 252 357 1007 ...
    ##  $ start_station_id                                : num [1:1108163] 81 317 283 26 202 420 503 260 211 211 ...
    ##  $ start_station_name                              : chr [1:1108163] "Daley Center Plaza" "Wood St & Taylor St" "LaSalle St & Jackson Blvd" "McClurg Ct & Illinois St" ...
    ##  $ end_station_id                                  : num [1:1108163] 56 59 174 133 129 426 500 499 211 211 ...
    ##  $ end_station_name                                : chr [1:1108163] "Desplaines St & Kinzie St" "Wabash Ave & Roosevelt Rd" "Canal St & Madison St" "Kingsbury St & Kinzie St" ...
    ##  $ member_casual                                   : chr [1:1108163] "Subscriber" "Subscriber" "Subscriber" "Subscriber" ...
    ##  $ Member Gender                                   : chr [1:1108163] "Male" "Female" "Male" "Male" ...
    ##  $ 05 - Member Details Member Birthday Year        : num [1:1108163] 1975 1984 1990 1993 1992 ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   `01 - Rental Details Rental ID` = col_double(),
    ##   ..   `01 - Rental Details Local Start Time` = col_datetime(format = ""),
    ##   ..   `01 - Rental Details Local End Time` = col_datetime(format = ""),
    ##   ..   `01 - Rental Details Bike ID` = col_double(),
    ##   ..   `01 - Rental Details Duration In Seconds Uncapped` = col_number(),
    ##   ..   `03 - Rental Start Station ID` = col_double(),
    ##   ..   `03 - Rental Start Station Name` = col_character(),
    ##   ..   `02 - Rental End Station ID` = col_double(),
    ##   ..   `02 - Rental End Station Name` = col_character(),
    ##   ..   `User Type` = col_character(),
    ##   ..   `Member Gender` = col_character(),
    ##   ..   `05 - Member Details Member Birthday Year` = col_double()
    ##   .. )

``` r
str(q1_2020)
```

    ## spec_tbl_df [426,887 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ ride_id           : chr [1:426887] "EACB19130B0CDA4A" "8FED874C809DC021" "789F3C21E472CA96" "C9A388DAC6ABF313" ...
    ##  $ rideable_type     : chr [1:426887] "docked_bike" "docked_bike" "docked_bike" "docked_bike" ...
    ##  $ started_at        : POSIXct[1:426887], format: "2020-01-21 20:06:59" "2020-01-30 14:22:39" ...
    ##  $ ended_at          : POSIXct[1:426887], format: "2020-01-21 20:14:30" "2020-01-30 14:26:22" ...
    ##  $ start_station_name: chr [1:426887] "Western Ave & Leland Ave" "Clark St & Montrose Ave" "Broadway & Belmont Ave" "Clark St & Randolph St" ...
    ##  $ start_station_id  : num [1:426887] 239 234 296 51 66 212 96 96 212 38 ...
    ##  $ end_station_name  : chr [1:426887] "Clark St & Leland Ave" "Southport Ave & Irving Park Rd" "Wilton Ave & Belmont Ave" "Fairbanks Ct & Grand Ave" ...
    ##  $ end_station_id    : num [1:426887] 326 318 117 24 212 96 212 212 96 100 ...
    ##  $ start_lat         : num [1:426887] 42 42 41.9 41.9 41.9 ...
    ##  $ start_lng         : num [1:426887] -87.7 -87.7 -87.6 -87.6 -87.6 ...
    ##  $ end_lat           : num [1:426887] 42 42 41.9 41.9 41.9 ...
    ##  $ end_lng           : num [1:426887] -87.7 -87.7 -87.7 -87.6 -87.6 ...
    ##  $ member_casual     : chr [1:426887] "member" "member" "member" "member" ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   ride_id = col_character(),
    ##   ..   rideable_type = col_character(),
    ##   ..   started_at = col_datetime(format = ""),
    ##   ..   ended_at = col_datetime(format = ""),
    ##   ..   start_station_name = col_character(),
    ##   ..   start_station_id = col_double(),
    ##   ..   end_station_name = col_character(),
    ##   ..   end_station_id = col_double(),
    ##   ..   start_lat = col_double(),
    ##   ..   start_lng = col_double(),
    ##   ..   end_lat = col_double(),
    ##   ..   end_lng = col_double(),
    ##   ..   member_casual = col_character()
    ##   .. )

### Convert ride\_id and rideable\_type to character so that they can stack correctly

notes: changing the data type from num to character

``` r
q4_2019 <- mutate(q4_2019, ride_id = as.character(ride_id)
                  ,rideable_type = as.character(rideable_type)) 
q3_2019 <- mutate(q3_2019, ride_id = as.character(ride_id)
                  ,rideable_type = as.character(rideable_type)) 
q2_2019<- mutate(q2_2019,ride_id = as.character(ride_id)
                  ,rideable_type = as.character(rideable_type))
```

### Stack individual quarter’s dataframe to one big data frame

``` r
all_trips <- bind_rows(q3_2019, q4_2019, q2_2019, q1_2020)
```

### Remove lat, long, birthyear, tripduration, and gender

``` r
all_trips <- all_trips%>%
  select(-c(start_lat,start_lng, end_lat, end_lng, birthyear, gender, tripduration, "01 - Rental Details Duration In Seconds Uncapped", "Member Gender", "05 - Member Details Member Birthday Year"))
```

## Step 3: Clean up and add data to prepare for analysis

### Inspecting the new table that has been created

``` r
colnames(all_trips)               #list of column names 
```

    ## [1] "ride_id"            "started_at"         "ended_at"          
    ## [4] "rideable_type"      "start_station_id"   "start_station_name"
    ## [7] "end_station_id"     "end_station_name"   "member_casual"

``` r
str(all_trips)                    #list of columns and data types(numeric, character, etc.)horizontally
```

    ## tibble [3,879,822 × 9] (S3: tbl_df/tbl/data.frame)
    ##  $ ride_id           : chr [1:3879822] "23479388" "23479389" "23479390" "23479391" ...
    ##  $ started_at        : POSIXct[1:3879822], format: "2019-07-01 00:00:27" "2019-07-01 00:01:16" ...
    ##  $ ended_at          : POSIXct[1:3879822], format: "2019-07-01 00:20:41" "2019-07-01 00:18:44" ...
    ##  $ rideable_type     : chr [1:3879822] "3591" "5353" "6180" "5540" ...
    ##  $ start_station_id  : num [1:3879822] 117 381 313 313 168 300 168 313 43 43 ...
    ##  $ start_station_name: chr [1:3879822] "Wilton Ave & Belmont Ave" "Western Ave & Monroe St" "Lakeview Ave & Fullerton Pkwy" "Lakeview Ave & Fullerton Pkwy" ...
    ##  $ end_station_id    : num [1:3879822] 497 203 144 144 62 232 62 144 195 195 ...
    ##  $ end_station_name  : chr [1:3879822] "Kimball Ave & Belmont Ave" "Western Ave & 21st St" "Larrabee St & Webster Ave" "Larrabee St & Webster Ave" ...
    ##  $ member_casual     : chr [1:3879822] "Subscriber" "Customer" "Customer" "Customer" ...

``` r
skim_without_charts(all_trips)    #comprehensive summary of the datasets
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | all\_trips |
| Number of rows                                   | 3879822    |
| Number of columns                                | 9          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| character                                        | 5          |
| numeric                                          | 2          |
| POSIXct                                          | 2          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: character**

| skim\_variable       | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
|:---------------------|-----------:|---------------:|----:|----:|------:|----------:|-----------:|
| ride\_id             |          0 |              1 |   7 |  16 |     0 |   3879822 |          0 |
| rideable\_type       |          0 |              1 |   1 |  11 |     0 |      6004 |          0 |
| start\_station\_name |          0 |              1 |   5 |  43 |     0 |       643 |          0 |
| end\_station\_name   |          1 |              1 |   5 |  43 |     0 |       644 |          0 |
| member\_casual       |          0 |              1 |   6 |  10 |     0 |         4 |          0 |

**Variable type: numeric**

| skim\_variable     | n\_missing | complete\_rate |   mean |     sd |  p0 | p25 | p50 | p75 | p100 |
|:-------------------|-----------:|---------------:|-------:|-------:|----:|----:|----:|----:|-----:|
| start\_station\_id |          0 |              1 | 202.90 | 157.14 |   1 |  77 | 174 | 291 |  675 |
| end\_station\_id   |          1 |              1 | 203.76 | 157.19 |   1 |  77 | 174 | 291 |  675 |

**Variable type: POSIXct**

| skim\_variable | n\_missing | complete\_rate | min                 | max                 | median              | n\_unique |
|:---------------|-----------:|---------------:|:--------------------|:--------------------|:--------------------|----------:|
| started\_at    |          0 |              1 | 2019-04-01 00:02:22 | 2020-03-31 23:51:34 | 2019-08-14 17:43:38 |   3362333 |
| ended\_at      |          0 |              1 | 2019-04-01 00:09:48 | 2020-05-19 20:10:34 | 2019-08-14 18:02:04 |   3299507 |

``` r
summary(all_trips)                #Statistical summary of data. Mainly for numeric
```

    ##    ride_id            started_at                     ended_at                  
    ##  Length:3879822     Min.   :2019-04-01 00:02:22   Min.   :2019-04-01 00:09:48  
    ##  Class :character   1st Qu.:2019-06-23 07:49:09   1st Qu.:2019-06-23 08:20:27  
    ##  Mode  :character   Median :2019-08-14 17:43:38   Median :2019-08-14 18:02:04  
    ##                     Mean   :2019-08-26 00:49:59   Mean   :2019-08-26 01:14:37  
    ##                     3rd Qu.:2019-10-12 12:10:21   3rd Qu.:2019-10-12 12:36:16  
    ##                     Max.   :2020-03-31 23:51:34   Max.   :2020-05-19 20:10:34  
    ##                                                                                
    ##  rideable_type      start_station_id start_station_name end_station_id 
    ##  Length:3879822     Min.   :  1.0    Length:3879822     Min.   :  1.0  
    ##  Class :character   1st Qu.: 77.0    Class :character   1st Qu.: 77.0  
    ##  Mode  :character   Median :174.0    Mode  :character   Median :174.0  
    ##                     Mean   :202.9                       Mean   :203.8  
    ##                     3rd Qu.:291.0                       3rd Qu.:291.0  
    ##                     Max.   :675.0                       Max.   :675.0  
    ##                                                         NA's   :1      
    ##  end_station_name   member_casual     
    ##  Length:3879822     Length:3879822    
    ##  Class :character   Class :character  
    ##  Mode  :character   Mode  :character  
    ##                                       
    ##                                       
    ##                                       
    ## 

### Begin by seeing how many observations fall under each usertype

``` r
table(all_trips$member_casual)
```

    ## 
    ##     casual   Customer     member Subscriber 
    ##      48480     857474     378407    2595461

### In the “member\_casual” column, replace “Subscriber” with “member” and “Customer” with “casual”

``` r
all_trips <-  all_trips %>% 
  mutate(member_casual = recode(member_casual
                           ,"Subscriber" = "member"
                           ,"Customer" = "casual"))
```

### Check to make sure the proper number of observations were reassigned

``` r
table(all_trips$member_casual)
```

    ## 
    ##  casual  member 
    ##  905954 2973868

### Add columns that list the date, month, day, and year of each ride

notes: This will allow us to aggregate ride data for each month, day, or
year … before completing these operations we could only aggregate at the
ride level

``` r
all_trips$date <- as.Date(all_trips$started_at)          #The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")
```

### Add a “ride\_length” calculation to all\_trips (in seconds)

``` r
all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)
```

### Inspect the column

``` r
str(all_trips)
```

    ## tibble [3,879,822 × 15] (S3: tbl_df/tbl/data.frame)
    ##  $ ride_id           : chr [1:3879822] "23479388" "23479389" "23479390" "23479391" ...
    ##  $ started_at        : POSIXct[1:3879822], format: "2019-07-01 00:00:27" "2019-07-01 00:01:16" ...
    ##  $ ended_at          : POSIXct[1:3879822], format: "2019-07-01 00:20:41" "2019-07-01 00:18:44" ...
    ##  $ rideable_type     : chr [1:3879822] "3591" "5353" "6180" "5540" ...
    ##  $ start_station_id  : num [1:3879822] 117 381 313 313 168 300 168 313 43 43 ...
    ##  $ start_station_name: chr [1:3879822] "Wilton Ave & Belmont Ave" "Western Ave & Monroe St" "Lakeview Ave & Fullerton Pkwy" "Lakeview Ave & Fullerton Pkwy" ...
    ##  $ end_station_id    : num [1:3879822] 497 203 144 144 62 232 62 144 195 195 ...
    ##  $ end_station_name  : chr [1:3879822] "Kimball Ave & Belmont Ave" "Western Ave & 21st St" "Larrabee St & Webster Ave" "Larrabee St & Webster Ave" ...
    ##  $ member_casual     : chr [1:3879822] "member" "casual" "casual" "casual" ...
    ##  $ date              : Date[1:3879822], format: "2019-07-01" "2019-07-01" ...
    ##  $ month             : chr [1:3879822] "07" "07" "07" "07" ...
    ##  $ day               : chr [1:3879822] "01" "01" "01" "01" ...
    ##  $ year              : chr [1:3879822] "2019" "2019" "2019" "2019" ...
    ##  $ day_of_week       : chr [1:3879822] "Monday" "Monday" "Monday" "Monday" ...
    ##  $ ride_length       : 'difftime' num [1:3879822] 1214 1048 1554 1503 ...
    ##   ..- attr(*, "units")= chr "secs"

### Convert “ride\_length” from Factor to numeric so we can run calculations on the data

``` r
is.factor(all_trips$ride_length)
```

    ## [1] FALSE

``` r
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)
```

    ## [1] TRUE

### Remove “bad” data

<notes:The> dataframe includes a few hundred entries when bikes were
taken out of docks and checked for quality by Divvy or ride\_length was
negative

``` r
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]
```

## Step4: Conduct Descriptive Analysis

notes: Descriptive analysis on ride\_length

``` r
mean(all_trips_v2$ride_length)           #straight average (total ride length / rides)
```

    ## [1] 1479.139

``` r
median(all_trips_v2$ride_length)         #midpoint number in the ascending array of ride lengths
```

    ## [1] 712

``` r
max(all_trips_v2$ride_length)            #longest ride
```

    ## [1] 9387024

``` r
min(all_trips_v2$ride_length)            #shortest ride
```

    ## [1] 1

``` r
summary(all_trips_v2$ride_length)        # Condense four line into one summary() attributes
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##       1     412     712    1479    1289 9387024

### Compare member and casual riders

``` r
aggregate(all_trips_v2$ride_length~ all_trips_v2$member_casual, FUN = mean)
```

    ##   all_trips_v2$member_casual all_trips_v2$ride_length
    ## 1                     casual                3552.7502
    ## 2                     member                 850.0662

``` r
aggregate(all_trips_v2$ride_length~ all_trips_v2$member_casual, FUN = median)
```

    ##   all_trips_v2$member_casual all_trips_v2$ride_length
    ## 1                     casual                     1546
    ## 2                     member                      589

``` r
aggregate(all_trips_v2$ride_length~ all_trips_v2$member_casual, FUN = max)
```

    ##   all_trips_v2$member_casual all_trips_v2$ride_length
    ## 1                     casual                  9387024
    ## 2                     member                  9056634

``` r
aggregate(all_trips_v2$ride_length~ all_trips_v2$member_casual, FUN = min)
```

    ##   all_trips_v2$member_casual all_trips_v2$ride_length
    ## 1                     casual                        2
    ## 2                     member                        1

### See the average ride time by each day for members vs casual users

``` r
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
```

    ##    all_trips_v2$member_casual all_trips_v2$day_of_week all_trips_v2$ride_length
    ## 1                      casual                   Friday                3773.8351
    ## 2                      member                   Friday                 824.5305
    ## 3                      casual                   Monday                3372.2869
    ## 4                      member                   Monday                 842.5726
    ## 5                      casual                 Saturday                3331.9138
    ## 6                      member                 Saturday                 968.9337
    ## 7                      casual                   Sunday                3581.4054
    ## 8                      member                   Sunday                 919.9746
    ## 9                      casual                 Thursday                3682.9847
    ## 10                     member                 Thursday                 823.9278
    ## 11                     casual                  Tuesday                3596.3599
    ## 12                     member                  Tuesday                 826.1427
    ## 13                     casual                Wednesday                3718.6619
    ## 14                     member                Wednesday                 823.9996

### Notice that the days of the week are out of order. Let’s fix that

``` r
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
```

### analyze ridership data by type and weekday

``` r
all_trips_v2 %>% 
 mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()
  group_by(member_casual, weekday) %>%                 #groups by usertype and weekday
  summarise(number_of_rides = n()                                   #calculates the number of rides and average duration 
,average_duration = mean(ride_length)) %>%          # calculates the average duration
  arrange(member_casual, weekday)                                   # sorts
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.

    ## # A tibble: 14 x 4
    ## # Groups:   member_casual [2]
    ##    member_casual weekday number_of_rides average_duration
    ##    <chr>         <ord>             <int>            <dbl>
    ##  1 casual        Sun              181293            3581.
    ##  2 casual        Mon              103296            3372.
    ##  3 casual        Tue               90510            3596.
    ##  4 casual        Wed               92457            3719.
    ##  5 casual        Thu              102679            3683.
    ##  6 casual        Fri              122404            3774.
    ##  7 casual        Sat              209543            3332.
    ##  8 member        Sun              267965             920.
    ##  9 member        Mon              472196             843.
    ## 10 member        Tue              508445             826.
    ## 11 member        Wed              500329             824.
    ## 12 member        Thu              484177             824.
    ## 13 member        Fri              452790             825.
    ## 14 member        Sat              287958             969.

## Step 4: Creating a Visualization

Notes: Let’s visualize the number of rides by rider type

``` r
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.

![](Cyclistic_Data_Projects_files/figure-gfm/unnamed-chunk-21-1.png)<!-- -->
\#\#\# Let’s create a visualization for average duration

``` r
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.

![](Cyclistic_Data_Projects_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->
\#\#\# Creating the ‘counts’ data frame by calculating the
average\_ride\_length

``` r
counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
```

### Saving the avg\_ride\_length ‘count’ file in csv

``` r
write.csv(counts, file = '~/Desktop/Cyclistic_Tripdata/avg_ride_length.csv')
```
