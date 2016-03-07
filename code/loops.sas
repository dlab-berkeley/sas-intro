data squares;
    do x = 2 to 10 by 2;
        x_squared = x ** 2;
        output;
    end;
run;
