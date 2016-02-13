data cars;
    infile 'mtcars.csv' dlm=',' dsd firstobs=2;
    input model : $19. mpg cyl disp hp
          drat wt qsec vs am gear carb;
    liters = disp / 61.024;
    hp_per_liter = hp / liters;
run;

proc sort data=cars
    out=power_density
        (keep=model hp_per_liter);
    by descending hp_per_liter;
run;

proc print data=cars;
run;

proc print data=power_density;
run;
