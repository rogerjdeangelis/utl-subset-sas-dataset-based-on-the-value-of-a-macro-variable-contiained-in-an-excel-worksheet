%let pgm=utl-subset-sas-dataset-based-on-the-value-of-a-macro-variable-contiained-in-an-excel-worksheet;

%stop_submission;

Subset a sas dataset based on the value of a macro variable imported from excel

Specific problem: select males from the sas sample dataset, sashelp.class.

github
https://tinyurl.com/4r4fb6rf
https://github.com/rogerjdeangelis/utl-subset-sas-dataset-based-on-the-value-of-a-macro-variable-contiained-in-an-excel-worksheet/issues

communities.sas
https://tinyurl.com/4euxz3dk
https://communities.sas.com/t5/SAS-Programming/create-a-dynamic-macro-variable-based-on-different-data-sets/m-p/841404#M332701

/**************************************************************************************************************************/
/*           INPUT              |        PROCESS                          |     OUTPUT                                    */
/*           =====              |        =======                          |     ======                                    */
/*                              |                                         |                                               */
/*                              |                                         |                                               */
/* WORK.CLASS                   | READ: d:/xls/class.xlsx                 | Use the macro varable from excel to subset    */
/*                              | worksheet class                         |                                               */
/*   NAME      SEX    AGE       | and create global                       |  NAME     SEX    AGE                          */
/*                              | macro variable SEX                      |                                               */
/*  Alfred      M      14       |                                         | Alfred     M      14                          */
/*  Alice       F      13       | GLOBAL SEX M                            | Henry      M      14                          */
/*  Barbara     F      13       |                                         |                                               */
/*  Carol       F      14       | %utl_rbeginx;                           | set class(where=(sex="&sex"));                */
/*  Henry       M      14       | parmcards4;                             |                                               */
/*                              | library(openxlsx)                       |                                               */
/*                              | source("c:/oto/fn_tosas9x.R")           |                                               */
/* d:/xls/class.xlsx            | wb<-loadWorkbook("d:/xls/class.xlsx")   |                                               */
/* -------------------------+   | have<-read.xlsx(wb,"class")             |                                               */
/* | A1| fx       | NAME    |   | have                                    |                                               */
/* --------------------------   | writeClipboard(have$SEX)                |                                               */
/* [_] |    A     |    B    |   | ;;;;                                    |                                               */
/* --------------------------   | %utl_rendx(return=SEX);                 |                                               */
/*  1  | NAME     |   SEX   |   |                                         |                                               */
/*  -- |----------+---------+   | GLOBAL SEX M                            |                                               */
/*  2  |ROGER     |    M    |   |                                         |                                               */
/*  -- |----------+---------+   | data class_m;                           |                                               */
/* [CLASS]                      |  set class(where=(sex="&sex"));         |                                               */
/*                              | run;quit;                               |                                               */
/* CREATE EXCEL INPUT           |                                         |                                               */
/*                              | The r clipboard and sas is used to      |                                               */
/* %utl_rbeginx;                | create the global macro variable        |                                               */
/* parmcards4;                  |                                         |                                               */
/* library(openxlsx)            |                                         |                                               */
/* class<-read.table(           |                                         |                                               */
/*   header = TRUE              |                                         |                                               */
/*  ,text = "                   |                                         |                                               */
/* NAME SEX                     |                                         |                                               */
/* ROGER M                      |                                         |                                               */
/* ")                           |                                         |                                               */
/* wb <- createWorkbook()       |                                         |                                               */
/* addWorksheet(wb,"class")     |                                         |                                               */
/* writeData(wb                 |                                         |                                               */
/*   ,sheet = "class"           |                                         |                                               */
/*   ,x = class)                |                                         |                                               */
/* saveWorkbook(                |                                         |                                               */
/*     wb                       |                                         |                                               */
/*    ,"d:/xls/class.xlsx"      |                                         |                                               */
/*    ,overwrite=TRUE)          |                                         |                                               */
/* class                        |                                         |                                               */
/* ;;;;                         |                                         |                                               */
/* %utl_rendx;                  |                                         |                                               */
/*                              |                                         |                                               */
/* CREATE SAS DATASET           |                                         |                                               */
/*                              |                                         |                                               */
/* data class;                  |                                         |                                               */
/*   set sashelp.class(         |                                         |                                               */
/*   obs=5                      |                                         |                                               */
/*   keep=name age sex);        |                                         |                                               */
/* run;quit                     |                                         |                                               */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

