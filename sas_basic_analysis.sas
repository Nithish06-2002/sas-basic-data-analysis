proc print data=sashelp.class;
run;

/* Sort data by Sex */
proc sort data=SASHELP.CLASS out=class_sorted;
    by Sex;
run;

/* Frequency analysis */
proc freq data=class_sorted;
    by Sex;
    tables Name / plots=(freqplot);
run;

/* Descriptive statistics */
proc means data=class_sorted n nmiss min max std median;
    var Age;
run;

/* Histogram */
proc univariate data=class_sorted noprint;
    by Sex;
    histogram Age;
run;

/* SQL summary */
proc sql;
    select 
        "Weight" label="Data Variable",
        min(Weight) label="Minimum Value",
        max(Weight) label="Maximum Value",
        Sex
    from class_sorted
    group by Sex;
quit;
