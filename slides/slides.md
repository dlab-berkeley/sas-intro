% Introduction to SAS
% Juan Shishido, D-Lab, UC Berkeley
% Month Day, 2016

# Introduction

## What is SAS

>SAS is an integrated system of software solutions

It enables:

- data management
- report generation
- plotting
- statistical and mathematical analyses
- and more

## Products

- Base SAS
- SAS/STAT
- SAS/ETS
- SAS Text Miner
- SAS Energy Forecasting
- and much, much more

[Products & Solutions A-Z](http://www.sas.com/en_us/software/all-products.html)

# Base SAS

## Base SAS

Includes:

- a programming language
- a data management facility
- data analysis and reporting utilities

## Programming Language

>The SAS language contains statements, expressions, functions and CALL
routines, options, formats, and informats

There are two main components:

* data steps
* procedure steps

SAS programs&mdash;files ending in the `.sas` file extension&mdash;typically
include several DATA and PROC steps

## Programming Language

Example of a DATA step

```
data example;
    infile 'path/to/file';
    input x1 x2 x3;
run;
```

## Programming Language

#### Syntax

One of the most important rules is that **SAS statements must end with a
semicolon**

SAS statements can span multiple lines

Multiple SAS statements can appear on the same line, so long as each is
separated by a semicolon

`run;` statements aren't necessary in some cases, but their use is recommended

## Programming Language

#### SAS Names

Are used for data sets, variables, and other items

In general, these names must:

- contain only letters, numbers, or underscores (`_`)
- begin with a letter or underscore
- have a length betwen one and 32 characters
    - maximum length varies by name type (e.g., variable names versus library
      references)
- not contain blanks

Names are *not* case sensitive

## Data Representation

In SAS, data is organized into rows and columns in what is called a SAS data
set

x1   |  x2  | x3
:--: | :--: | --
25   |  m   | berkeley
26   |  f   | san francisco
23   |  f   | oakland
24   |  m   | marin

Each row is sometimes called an "observation" and each column a "variable"

## DATA Step

DATA steps begin with the `data` statement and are typically used to create,
modify, or replace SAS data sets

Data can either be read inline or from external sources, such as `.txt`,
`.csv`, or `.sas7bdat` files

SAS data sets can either be temporary or permanent

## DATA Step

## PROC Step

# References

## Links

- http://www.stat.berkeley.edu/~spector/s100/sas.pdf
- http://www.ats.ucla.edu/stat/sas/library/SASRead_os.htm
- http://www2.sas.com/proceedings/sugi31/246-31.pdf
- https://www.ssc.wisc.edu/sscc/pubs/4-18.htm
