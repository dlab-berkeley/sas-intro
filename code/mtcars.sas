* load `mtcars.csv` and create variables;
data cars;
    infile '../data/mtcars.csv' dlm=',' dsd firstobs=2;
    input model : $19. mpg cyl disp hp
          drat wt qsec vs am gear carb;
    liters = disp / 61.024;
    hp_per_liter = hp / liters;
    make = scan(model, 1, ' ');
run;

* import `mtcars.csv`;
proc import datafile='../data/mtcars.csv'
    out=cars_imported
    dbms=csv
    replace;
    getnames=yes;
run;

* sort by `hp_per_liter` in descending order;
proc sort data=cars out=power_density
        (keep=model hp liters hp_per_liter);
    by descending hp_per_liter;
run;

* totals and means with `proc summary`;
proc summary data=cars;
    var hp;
    output out=cars_summ (drop=_TYPE_)
        sum=hp_total mean=hp_mean;
run;

* totals and means with `proc sql`;
proc sql;
    create table cars_sql as
    select count(*) as _FREQ_,
           sum(hp) as hp_total,
           mean(hp) as hp_mean
    from cars;
quit;

* IF-THEN/ELSE;
data toyota mazda;
    set cars;
    if make = 'Toyota' then output toyota;
    else if make = 'Mazda' then output mazda;
run;

* export data;
proc export data=power_density;
    outfile='../data/power_density.csv'
    replace;
run;

* frequency;
proc freq data=cars;
    table cyl;
run;

* subset data;
data cars_4_8;
    set cars (where=(cyl = 4 or cyl = 8));
run;

* sort `cars_4_8`;
proc sort data=cars_4_8;
    by cyl;
run;

* ttest;
proc ttest data=cars_4_8;
    class cyl;
    var hp;
run;
