hmdR- Use  the "Human Mortality Population Database"  and more ggplot2 enhancements
===========================================================================

> *Copyright 2016 [Ramanathan Perumal](http://github.com/ramamet). Licensed under
> the MIT license.*

Installation
------------

`hmdR` is available through GitHub.

To install the latest version from GitHub:

    install.packages("devtools")
    devtools::install_github("ramamet/hmdR")
    

Usage
-----

We'll first load the package, and then see how all the
functions work.

   
    library("hmdR")
  
  
As a simple first example, let's load a `hmd_pop` dataset with 453927 rows and 10 columns where
the Year values are recorded time periods and the Age values are classified from 0-100 years
, and plot a simple ggplot2 scatterplot.
     
     data(hmd_pop)
     
Understanding the database with basic descriptive statistics;
    
    head(hmd_pop)
    
      Year Age   Female     Male    Total  agebins sex.ratio sex.ratio.bins country  code
    1 1921   1 57777.30 60216.58 117993.9 Age;0-25  1.042219       1.0-1.25     AUS  AUS
    2 1921   2 56940.78 59047.16 115987.9 Age;0-25  1.036992       1.0-1.25     AUS  AUS
    3 1921   3 58272.29 60217.82 118490.1 Age;0-25  1.033387       1.0-1.25     AUS  AUS
    4 1921   4 58718.95 60773.16 119492.1 Age;0-25  1.034984       1.0-1.25     AUS  AUS
    5 1921   5 59887.79 61686.66 121574.4 Age;0-25  1.030037       1.0-1.25     AUS  AUS
    6 1921   6 61033.62 62332.64 123366.3 Age;0-25  1.021284       1.0-1.25     AUS  AUS


Number of datapoints available by country;

     table(hmd_pop$country)
     
         AUS     AUT     BEL     BGR     BLR     CAN     CHE     CHL     CZE   DEUTE 
        9290    6965   16919    6565    5757    9191   13953    1515    6666    5959 
      DEUTNP   DEUTW     DNK     ESP     EST     FIN  FRACNP  FRATNP GBRCENW GBR_NIR 
        2525    5959   18058   10807    5639   13506   19392   19392   17574    9388 
      GBR_NP GBR_SCO GBRTENW     GRC     HUN     IRL     ISL     ISR     ITA     JPN 
        9393   16132   17574    3434    6661    6666   17468    3333   13888    6868 
         LTU     LUX     LVA     NLD     NOR  NZL_MA  NZL_NM  NZL_NP     POL     PRT 
        5656    5581    5656   16429   17124    5923   10752    6666    5757    7474 
         RUS     SVK     SVN     SWE     TWN     UKR     USA 
        5454    6651    3320   26564    4545    5656    8282 
     
## Basic ggplot type;
 
     gghmd(hmd_pop)  
     
 ![hmd](https://cloud.githubusercontent.com/assets/16385390/20598873/83bf00a4-b24b-11e6-9a31-a420c648f261.png)
        
There are several more parameters can be add in the plot, here is an example with a few more
being used. Note that you can use any function that the `gghmd_loc` or `gghmd_yr`
layers accept, and additional ggplot layers will be passed to base layers, such as `facet_wrap(~country)`
and `Year` in the following example. 


## gghmd_map() function;
    #gghmd_map(hmd_pop,yrMin,yrMax,yrDiv,aAge) format
    gghmd_map(hmd_pop,1980,2010,10,30) 
    
![gghmd_map](https://cloud.githubusercontent.com/assets/16385390/20610491/d650b908-b29a-11e6-9bfb-f1d59e32619d.png)

## gghmd_yr() function;

    gghmd_yr(hmd_pop,1940,2000)
    
![hmd_yr](https://cloud.githubusercontent.com/assets/16385390/20598970/faa1abc2-b24b-11e6-9141-fb381fa97274.png)


## gghmd_time() function;

      gghmd_time(hmd_pop,1970,2000)
    
![gghmd_time](https://cloud.githubusercontent.com/assets/16385390/20610608/390ad3d4-b29c-11e6-98d8-3c45ad77a658.png)


## gghmd_bar() function;

    gghmd_bar(hmd_pop,"USA",80,90,1970,2000)

![gghmd_bar](https://cloud.githubusercontent.com/assets/16385390/20610539/65765e9e-b29b-11e6-9b9f-3570a31beb88.png)


## gghmd_loc() function;

    gghmd_loc(hmd_pop,'USA',1930,2000)
    
![hmd_loc](https://cloud.githubusercontent.com/assets/16385390/20599040/5f27084e-b24c-11e6-9c1f-202c85d4ea10.png)


rawData
-----
National Center for Health Statistics. Vital Statistics of the United States, Volume II: Mortality, Part A. Washington, D.C.: Government Printing Office, various years. (Data obtained through the Human Mortality Database, www.mortality.org or www.humanmortality.de, on [date].)

@
-----
For further development or bugs in the package, please contact me by `ramamet4@gmail.com`.    
