* load `mtcars.csv`;
data cars;
    infile '../data/mtcars.csv' dlm=',' dsd firstobs=2;
    input model : $19. mpg cyl disp hp
          drat wt qsec vs am gear carb;
run;

proc print data=cars;
run;

* with additional variables;
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

* loops;
data squares;
    do x = 2 to 10 by 2;
        x_squared = x ** 2;
        output;
    end;
run;

* IF-THEN/ELSE;
data toyota mazda;
    set cars;
    if make = 'Toyota' then output toyota;
    else if make = 'Mazda' then output mazda;
run;

proc print data=cars;
run;

proc print data=cars_imported;
run;

proc print data=power_density;
run;

proc print data=cars_summ;
run;

proc print data=cars_sql;
run;

proc print data=squares;
run;

proc print data=toyota;
run;

proc print data=mazda;
run;
