data cars;
    infile 'mtcars.csv' dlm=',' dsd firstobs=2;
    input model : $19. mpg cyl disp hp
          drat wt qsec vs am gear carb;
run;

proc print data=cars;
run;
