INTRO
BASE SAS


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

## Base SAS

Includes:

- a programming language
- a data management facility
- data analysis and reporting utilities

Base SAS is at the core of the SAS System

# Programming Language

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

### Syntax

One of the most important rules is that **SAS statements must end with a
semicolon**

SAS statements can span multiple lines

Multiple SAS statements can appear on the same line, so long as each is
separated by a semicolon

A `run;` statement, which creates a "step boundary," marking the end of a step,
isn't required between steps in a program, but is recommended

## Programming Language

### SAS Names

Are used for data sets, variables, and other items

In general, these names must:

- contain only letters, numbers, or underscores (`_`)
- begin with a letter or underscore
- have a length betwen one and 32 characters
    - maximum length varies by name type (e.g., variable names versus library
      references)
- not contain blanks

Names are *not* case sensitive

# Data Management

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

Temporary data sets are stored in the `WORK` library and are deleted at the end
of each SAS session

Permanent data sets are saved to disk

## DATA Step

SAS data sets are temporary, by default

In the code above, `example` is a temporary SAS data set

To read or write a *permanent* SAS data set, use dot notation such as
`libref.dataset`

The `libref` is a name associated with a SAS library or directory location

It is possible to use `work.dataset` to be explicit about temporary data sets

## DATA Step

To set up a `libref` use the `libname` keyword

```
libname mylib 'path/to/dir';
```

In this example, `mylib` is a variable representing the `path/to/dir` location

Note that `libref` names can only be 8 character long and should appear before
any references are made to it in your program

## DATA Step

```
data mylib.example;
    ...
run;
```

In the code above, the data set `example` will be saved to the location
associated with `mylib`

## DATA Step

There are several ways to read data into a SAS data set

* `datalines`: for inline data
* `infile`: for data from an external file
* `set`: for a SAS data set

It's important to note that both the `datalines` and `infile` approaches
require the use of an `input` statement, which

>Describes the arrangement of values in the input data record and assigns input 
values to the corresponding SAS variables

We'll see these in more detail when we start writing our programs

# Data Analysis

## PROC Step

SAS procedures are built-in programs that use SAS data set values to produce
specific output

These are called using PROC Steps, which begin with the `proc` keyword

There are three main types of SAS procedures:

* report writing
* statistics
* utilities

## PROC Step

>[Report writing] procedures display useful information, such as data listings
(detail reports), summary reports, calendars, letters, labels, multipanel
reports, and graphical reports.

## PROC Step

>[Statistics] procedures compute elementary statistical measures that include
descriptive statistics based on moments, quantiles, confidence intervals,
frequency counts, crosstabulations, correlations, and distribution tests. They
also rank and standardize data.

## PROC Step

>[Utility] procedures perform basic utility operations. They create, edit,
sort, and transpose data sets, create and restore transport data sets, create
user-defined formats, and provide basic file maintenance such as to copy,
append, and compare data sets.

## PROC Step

One of the most basic procedures is PROC PRINT

```
proc print data=example;
run;
```

This prints the SAS data set `example`

## PROC Step

PROC Steps often have several optional arguments

With PROC PRINT, for example, we can specify the number of observations (rows)
as well as the variables (columns) we want printed

```
proc print data=example (obs=10);
    var x1 x2;
run;
```

# Coding

## Your First Program

## Output

## Comments

## Reading

## Analyzing

# References

## Links

- http://www.stat.berkeley.edu/~spector/s100/sas.pdf
- http://www.ats.ucla.edu/stat/sas/library/SASRead_os.htm
- http://www2.sas.com/proceedings/sugi31/246-31.pdf
- https://www.ssc.wisc.edu/sscc/pubs/4-18.htm
- https://support.sas.com/documentation/cdl/en/proc/61895/PDF/default/proc.pdf
