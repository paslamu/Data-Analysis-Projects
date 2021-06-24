Penguin\_Analysis
================
PASLAMU
6/15/2021

## Setting up my r enviornment

notes: Uploading ‘palmerpenguins’ r data set for practice analysis

``` r
library(tidyverse)
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
library(palmerpenguins)
library(skimr)
```

## Inspecting the penguins dataset

``` r
colnames(penguins)
```

    ## [1] "species"           "island"            "bill_length_mm"   
    ## [4] "bill_depth_mm"     "flipper_length_mm" "body_mass_g"      
    ## [7] "sex"               "year"

``` r
str(penguins) 
```

    ## tibble [344 × 8] (S3: tbl_df/tbl/data.frame)
    ##  $ species          : Factor w/ 3 levels "Adelie","Chinstrap",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ island           : Factor w/ 3 levels "Biscoe","Dream",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ bill_length_mm   : num [1:344] 39.1 39.5 40.3 NA 36.7 39.3 38.9 39.2 34.1 42 ...
    ##  $ bill_depth_mm    : num [1:344] 18.7 17.4 18 NA 19.3 20.6 17.8 19.6 18.1 20.2 ...
    ##  $ flipper_length_mm: int [1:344] 181 186 195 NA 193 190 181 195 193 190 ...
    ##  $ body_mass_g      : int [1:344] 3750 3800 3250 NA 3450 3650 3625 4675 3475 4250 ...
    ##  $ sex              : Factor w/ 2 levels "female","male": 2 1 1 NA 1 2 1 2 NA NA ...
    ##  $ year             : int [1:344] 2007 2007 2007 2007 2007 2007 2007 2007 2007 2007 ...

``` r
glimpse(penguins)
```

    ## Rows: 344
    ## Columns: 8
    ## $ species           <fct> Adelie, Adelie, Adelie, Adelie, Adelie, Adelie, Adel…
    ## $ island            <fct> Torgersen, Torgersen, Torgersen, Torgersen, Torgerse…
    ## $ bill_length_mm    <dbl> 39.1, 39.5, 40.3, NA, 36.7, 39.3, 38.9, 39.2, 34.1, …
    ## $ bill_depth_mm     <dbl> 18.7, 17.4, 18.0, NA, 19.3, 20.6, 17.8, 19.6, 18.1, …
    ## $ flipper_length_mm <int> 181, 186, 195, NA, 193, 190, 181, 195, 193, 190, 186…
    ## $ body_mass_g       <int> 3750, 3800, 3250, NA, 3450, 3650, 3625, 4675, 3475, …
    ## $ sex               <fct> male, female, female, NA, female, male, female, male…
    ## $ year              <int> 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007…

``` r
summary(penguins)
```

    ##       species          island    bill_length_mm  bill_depth_mm  
    ##  Adelie   :152   Biscoe   :168   Min.   :32.10   Min.   :13.10  
    ##  Chinstrap: 68   Dream    :124   1st Qu.:39.23   1st Qu.:15.60  
    ##  Gentoo   :124   Torgersen: 52   Median :44.45   Median :17.30  
    ##                                  Mean   :43.92   Mean   :17.15  
    ##                                  3rd Qu.:48.50   3rd Qu.:18.70  
    ##                                  Max.   :59.60   Max.   :21.50  
    ##                                  NA's   :2       NA's   :2      
    ##  flipper_length_mm  body_mass_g       sex           year     
    ##  Min.   :172.0     Min.   :2700   female:165   Min.   :2007  
    ##  1st Qu.:190.0     1st Qu.:3550   male  :168   1st Qu.:2007  
    ##  Median :197.0     Median :4050   NA's  : 11   Median :2008  
    ##  Mean   :200.9     Mean   :4202                Mean   :2008  
    ##  3rd Qu.:213.0     3rd Qu.:4750                3rd Qu.:2009  
    ##  Max.   :231.0     Max.   :6300                Max.   :2009  
    ##  NA's   :2         NA's   :2

``` r
skim_without_charts(penguins) 
```

|                                                  |          |
|:-------------------------------------------------|:---------|
| Name                                             | penguins |
| Number of rows                                   | 344      |
| Number of columns                                | 8        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |          |
| Column type frequency:                           |          |
| factor                                           | 3        |
| numeric                                          | 5        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |          |
| Group variables                                  | None     |

Data summary

**Variable type: factor**

| skim\_variable | n\_missing | complete\_rate | ordered | n\_unique | top\_counts                 |
|:---------------|-----------:|---------------:|:--------|----------:|:----------------------------|
| species        |          0 |           1.00 | FALSE   |         3 | Ade: 152, Gen: 124, Chi: 68 |
| island         |          0 |           1.00 | FALSE   |         3 | Bis: 168, Dre: 124, Tor: 52 |
| sex            |         11 |           0.97 | FALSE   |         2 | mal: 168, fem: 165          |

**Variable type: numeric**

| skim\_variable      | n\_missing | complete\_rate |    mean |     sd |     p0 |     p25 |     p50 |    p75 |   p100 |
|:--------------------|-----------:|---------------:|--------:|-------:|-------:|--------:|--------:|-------:|-------:|
| bill\_length\_mm    |          2 |           0.99 |   43.92 |   5.46 |   32.1 |   39.23 |   44.45 |   48.5 |   59.6 |
| bill\_depth\_mm     |          2 |           0.99 |   17.15 |   1.97 |   13.1 |   15.60 |   17.30 |   18.7 |   21.5 |
| flipper\_length\_mm |          2 |           0.99 |  200.92 |  14.06 |  172.0 |  190.00 |  197.00 |  213.0 |  231.0 |
| body\_mass\_g       |          2 |           0.99 | 4201.75 | 801.95 | 2700.0 | 3550.00 | 4050.00 | 4750.0 | 6300.0 |
| year                |          0 |           1.00 | 2008.03 |   0.82 | 2007.0 | 2007.00 | 2008.00 | 2009.0 | 2009.0 |

## Sorting bill length in descending order

notes: Applying piping operator for multiple operation ‘%&gt;%’

``` r
penguins %>%
  arrange(-bill_length_mm) # arrange() sorts the row in asc and -desc order 
```

    ## # A tibble: 344 x 8
    ##    species   island bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##    <fct>     <fct>           <dbl>         <dbl>             <int>       <int>
    ##  1 Gentoo    Biscoe           59.6          17                 230        6050
    ##  2 Chinstrap Dream            58            17.8               181        3700
    ##  3 Gentoo    Biscoe           55.9          17                 228        5600
    ##  4 Chinstrap Dream            55.8          19.8               207        4000
    ##  5 Gentoo    Biscoe           55.1          16                 230        5850
    ##  6 Gentoo    Biscoe           54.3          15.7               231        5650
    ##  7 Chinstrap Dream            54.2          20.8               201        4300
    ##  8 Chinstrap Dream            53.5          19.9               205        4500
    ##  9 Gentoo    Biscoe           53.4          15.8               219        5500
    ## 10 Chinstrap Dream            52.8          20                 205        4550
    ## # … with 334 more rows, and 2 more variables: sex <fct>, year <int>

## Creating a penguin subset using a large dataset

``` r
penguins_subset <- penguins %>%
  sample_n(12)
```

## Selecting the required variable from penguins\_subset

``` r
penguins_subset %>%
  select(species, island, sex)
```

    ## # A tibble: 12 x 3
    ##    species   island sex   
    ##    <fct>     <fct>  <fct> 
    ##  1 Gentoo    Biscoe male  
    ##  2 Gentoo    Biscoe female
    ##  3 Chinstrap Dream  male  
    ##  4 Chinstrap Dream  female
    ##  5 Adelie    Dream  male  
    ##  6 Chinstrap Dream  male  
    ##  7 Gentoo    Biscoe female
    ##  8 Adelie    Dream  male  
    ##  9 Chinstrap Dream  female
    ## 10 Chinstrap Dream  female
    ## 11 Gentoo    Biscoe male  
    ## 12 Chinstrap Dream  male

## Just filtering the ‘Chinstrap’ species

notes: Creating new dataframe with filter()

``` r
species_Chinstrap <- filter(penguins, penguins$species == "Chinstrap")
```

## grouping and summarizing the avergae bill length by island variable

notes: Using group\_by, drop\_na(), and summarize()function to alter
certain data from dataset

``` r
penguins %>% group_by(island) %>% 
  drop_na()%>% # drops any null values from the data
  summarize(mean_bill_length_mm= mean(bill_length_mm))# create a variable name and apply mean()function
```

    ## # A tibble: 3 x 2
    ##   island    mean_bill_length_mm
    ##   <fct>                   <dbl>
    ## 1 Biscoe                   45.2
    ## 2 Dream                    44.2
    ## 3 Torgersen                39.0

## grouping by species

notes: Group\_by() two variable and summarizing with function max() and
mean() and min() function

``` r
penguins %>% group_by(species) %>%
  drop_na() %>%
  summarize(max_bl= max(bill_length_mm), mean_bl= mean(bill_length_mm), min_bl= min(bill_length_mm))
```

    ## # A tibble: 3 x 4
    ##   species   max_bl mean_bl min_bl
    ##   <fct>      <dbl>   <dbl>  <dbl>
    ## 1 Adelie      46      38.8   32.1
    ## 2 Chinstrap   58      48.8   40.9
    ## 3 Gentoo      59.6    47.6   40.9

## Extracting, summarizing from pemguin subset

notes: Removing the null values from the variable using na.rm() where
na= None & rm= remove

``` r
penguins_subset %>%
  group_by(island) %>%
  summarize(mean_bm= mean(body_mass_g, na.rm= TRUE),max_bl= max(bill_length_mm, na.rm = TRUE))
```

    ## # A tibble: 2 x 3
    ##   island mean_bm max_bl
    ##   <fct>    <dbl>  <dbl>
    ## 1 Biscoe   5250    49.8
    ## 2 Dream    3781.   52.8

## Converting bodymass & filpper length from gram to kilogram

notes: Adding new columns and calculate the conversion using mutate()

``` r
penguins %>%
  mutate(body_mass_kg= body_mass_g/1000, flipper_length_m= flipper_length_mm/1000)
```

    ## # A tibble: 344 x 10
    ##    species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##    <fct>   <fct>              <dbl>         <dbl>             <int>       <int>
    ##  1 Adelie  Torgersen           39.1          18.7               181        3750
    ##  2 Adelie  Torgersen           39.5          17.4               186        3800
    ##  3 Adelie  Torgersen           40.3          18                 195        3250
    ##  4 Adelie  Torgersen           NA            NA                  NA          NA
    ##  5 Adelie  Torgersen           36.7          19.3               193        3450
    ##  6 Adelie  Torgersen           39.3          20.6               190        3650
    ##  7 Adelie  Torgersen           38.9          17.8               181        3625
    ##  8 Adelie  Torgersen           39.2          19.6               195        4675
    ##  9 Adelie  Torgersen           34.1          18.1               193        3475
    ## 10 Adelie  Torgersen           42            20.2               190        4250
    ## # … with 334 more rows, and 4 more variables: sex <fct>, year <int>,
    ## #   body_mass_kg <dbl>, flipper_length_m <dbl>

## Creating a Visualization

notes: Here we go through a series of visualization

``` r
ggplot(data=penguins)+
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, alpha= species))
```

    ## Warning: Using alpha for a discrete variable is not advised.

    ## Warning: Removed 2 rows containing missing values (geom_point).
![penguins](https://user-images.githubusercontent.com/80533243/123299967-0c5f3780-d4e8-11eb-99df-47d73aed0821.jpeg)


### Dividing the charts vertically by “sex” of the penguin species

``` r
ggplot(data = penguins)+
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species))+
  facet_grid(~sex )
```
![palmer penguin](https://user-images.githubusercontent.com/80533243/123300011-17b26300-d4e8-11eb-8475-c1cc24b8ba01.png)



    ## Warning: Removed 2 rows containing missing values (geom_point).


### Adding Title, subtitle, and providing data source information in graphic plot

``` r
ggplot(data = penguins)+
  geom_point(mapping = aes(x= flipper_length_mm, y= body_mass_g, color= species))+ 
  labs(title = "Palmer Penguins: Body Mass vs. Flipper Length", subtitle = "Sample of Three Penguins Species", caption = 
         "Data Collected by Dr. Kristen Gorman") + annotate("text", x= 220, y = 3500, label = "The Gentoo are the largest", color = "purple")
```


    ## Warning: Removed 2 rows containing missing values (geom_point).


