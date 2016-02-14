data cars;
    infile 'mtcars.csv' dlm=',' dsd firstobs=2;
    input model : $19. mpg cyl disp hp
          drat wt qsec vs am gear carb;
    liters = disp / 61.024;
    hp_per_liter = hp / liters;
    make = scan(model, 1, ' ');
run;

proc sort data=cars out=power_density
        (keep=model hp liters hp_per_liter);
    by descending hp_per_liter;
run;

proc summary data=cars;
    var hp;
    output out=cars_summ (drop=_TYPE_)
        sum=hp_total mean=hp_mean;
run;

proc sql;
    create table cars_sql as
    select count(*) as _FREQ_,
           sum(hp) as hp_total,
           mean(hp) as hp_mean
    from cars;
quit;

data squares;
    do x = 2 to 10 by 2;
        x_squared = x ** 2;
        output;
    end;
run;

data toyota mazda;
    set cars;
    if make = 'Toyota' then output toyota;
    else if make = 'Mazda' then output mazda;
run;

proc print data=cars;
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
