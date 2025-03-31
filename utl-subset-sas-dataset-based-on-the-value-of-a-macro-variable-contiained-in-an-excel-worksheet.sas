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


























































|
|
|
|
|
|



















































































































;

%symdel sex / nowarn;



















%utl_rbeginx;
parmcards4;
library(openxlsx)
source("c:/oto/fn_tosas9x.R")
wb<-loadWorkbook("d:/xls/class.xlsx")
have<-read.xlsx(wb,"class")
have
writeClipboard(have$SEX)
;;;;
%utl_rendx(return=SEX);

%put &=sex;

data class_m;
 set class(where=(sex="M"));
run;quit;

  NAME     SEX    AGE

 Alfred     M      14
 Henry      M      14

writeClipboard(text_to_copy)



https://github.com/rogerjdeangelis/utl_natural_language_processing_nlp_in_r_identify_nouns_pronouns_adjectives


https://github.com/rogerjdeangelis/utl-count-of-three-word-phrases-in-a-paragraph-ngrams-nlp
https://github.com/rogerjdeangelis/utl-finding-the-syllables-of-words-AI-NLP
https://github.com/rogerjdeangelis/utl_how_to_find_the_union_and_intersection_of_words_in_two_strings_nlp
https://github.com/rogerjdeangelis/utl_natural_language_processing_nlp_in_r_identify_nouns_pronouns_adjectives





/*--- create a worksheet with a row containg the gender you need for subsetting ----*/

%utlfkil(d:/xls/have.xlsx);

%utl_rbeginx;
parmcards4;
library(openxlsx)
have<-read.table(
  header = TRUE
 ,text = "
NAME SEX
ROGER M
")
wb <- createWorkbook()
addWorksheet(wb, "have")
writeData(wb, sheet = "have", x = have)
saveWorkbook(
    wb
   ,"d:/xls/have.xlsx"
   ,overwrite=TRUE)
have
;;;;
%utl_rendx;













library(sqldf)
library(haven)
phase1<-read_sas("d:/sd1/phase1.sas7bdat")
phase2<-read_sas("d:/sd1/phase2.sas7bdat")
wb <- createWorkbook()
addWorksheet(wb, "phase1")
writeData(wb, sheet = "phase1", x = phase1)
addWorksheet(wb, "phase2")
writeData(wb, sheet = "phase2", x = phase2)
saveWorkbook(
    wb
   ,"d:/xls/wantxl.xlsx"
   ,overwrite=TRUE)
;;;;
%utl_rendx(return=sex);


data sex;
 name="ROGER";
 sex="M";
run;quit;



%utlfkil(d:/xls/wantxl.xlsx);

%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
library(haven)
phase1<-read_sas("d:/sd1/phase1.sas7bdat")
phase2<-read_sas("d:/sd1/phase2.sas7bdat")
wb <- createWorkbook()
addWorksheet(wb, "phase1")
writeData(wb, sheet = "phase1", x = phase1)
addWorksheet(wb, "phase2")
writeData(wb, sheet = "phase2", x = phase2)
saveWorkbook(
    wb
   ,"d:/xls/wantxl.xlsx"
   ,overwrite=TRUE)
;;;;
%utl_rendx(return=sex);


data sex;
 name="ROGER";
 sex="M";
run;quit;





filename tmp temp;
data _null_;
 file tmp;
 do lyn=2 to 20;
  put @2 '-- |----------+---------+---------+---------+---------+---------+---------+---------+---------+---------|';
  row=put(lyn, 2. -r);
  put @1 row $2.
   @5 '|          |         |         |         |         |         |         |         |         |         |';
 end;
  put @2 '-- |----------+---------+---------+---------+---------+---------+---------+---------+---------+---------|';
 stop;
run;quit;

/*__ _ _ _            _ _
 / _(_) | |   ___ ___| | |___
| |_| | | |  / __/ _ \ | / __|
|  _| | | | | (_|  __/ | \__ \
|_| |_|_|_|  \___\___|_|_|___/

*/
data _null_;
  infile tmp sharebuffers;
  file tmp;
  input;
  put _infile_;
  input;
  set sex;
  put @6 name   @16 sex;
  call symput('lines',2*_n_+1);
  if _n_=numobs then stop;
run;quit;
/*         _     _   _                    _
  __ _  __| | __| | | |__   ___  __ _  __| | ___ _ __
 / _` |/ _` |/ _` | | `_ \ / _ \/ _` |/ _` |/ _ \ `__|
| (_| | (_| | (_| | | | | |  __/ (_| | (_| |  __/ |
 \__,_|\__,_|\__,_| |_| |_|\___|\__,_|\__,_|\___|_|

*/
data _null_;
  infile tmp;
  input;
  if _n_=1 then do;
     put "-----------------------+";
     put "| A1| fx    |DAYNUM    |";
     put "---------------------------------------------------------------------------------------------------------+";
     put "[_] |    A     |    B    |    C    |    E    |    F    |    G    |    H    |    I    |    J    |    K    |";
     put "---------------------------------------------------------------------------------------------------------|";
     PUT " 1  | NAME     |   SEX   |   AGE   | HEIGHT  | WEIGHT  |         |         |         |         |         |";
  end;
  putlog _infile_;
  if _n_=&lines then do;
     putlog '[CLASS}';
     stop;
  end;
run;quit;



 run;quit;;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;




























































































%let pgm=utl-find-airlines-that-use-mutiple-vendors-for-in-flight-services-sql-sas-r-python-excel;

%stop_submission;

Find airlines that use mutiple vendors for in flight services sql sas r python excel;

https://communities.sas.com/t5/SAS-Procedures/Finding-inconsistencies-within-a-group/m-p/841506#M82174


  CONTENTS

      1 sas sql
        ksharp
        https://communities.sas.com/t5/user/viewprofilepage/user-id/18408

      2 sql r python excel
        only r presented same code in python and excel
        see
        https://tinyurl.com/4e6yaap8

github
https://tinyurl.com/mr4bf6t2
https://github.com/rogerjdeangelis/utl-find-airlines-that-use-mutiple-vendors-for-in-flight-services-sql-sas-r-python-excel

related (use for python and excel solutions to this problem - use same sql code
github
https://tinyurl.com/4e6yaap8
https://github.com/rogerjdeangelis/utl-identify-changes-in-all-variable-values-between-phase1-and-phase2-trials

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*             INPUT                  |        PROCESS                          |   OUTPUT                                */
/*             =====                  |        =======                          |                                         */
/*                                    |                                         |                                         */
/*   PLAN  PRODUCT VENDOR LOCALVENDOR | 1 SAS SQL                               |  PLAN  PRODUCT VENDOR LOCALVENDOR       */
/*                                    | ==========                              |                                         */
/*   DELTA  WIFI     NY     ALBANY    |                                         |  DELTA  WIFI     NY     HUDSON          */
/*   DELTA  WIFI     NY     ALBANY    | proc sql;                               |  DELTA  WIFI     NY     ALBANY          */
/*   DELTA  WIFI     NY     HUDSON**  |   create                                |  DELTA  WIFI     NY     ALBANY          */
/*                                    |     table want as                       |                                         */
/*   TRANS  NUTS     GA     ROSWEL    |   select                                |                                         */
/*   TRANS  NUTS     GA     ROSWEL    |      Plan                               |                                         */
/*                                    |     ,Product                            |                                         */
/*   ** more than one local vendor    |     ,Vendor                             |                                         */
/*                                    |     ,LocalVendor                        |                                         */
/*  options validvarname=upcase;      |   from                                  |                                         */
/*  libname sd1 "d:/sd1";             |      sd1.have                           |                                         */
/*  data sd1.have;                    |   group                                 |                                         */
/*    infile datalines truncover;     |      by plan, product                   |                                         */
/*    input                           |   having                                |                                         */
/*    (Plan Product Vendor            |      count(distinct                     |                                         */
/*      LocalVendor) ($);             |      cats(Vendor,LocalVendor))>1        |                                         */
/*  cards4;                           | ;quit;                                  |                                         */
/*  DELTA WIFI NY  ALBANY             |                                         |                                         */
/*  DELTA WIFI NY  ALBANY             |-----------------------------------------------------------------------------------*/
/*  DELTA WIFI NY  HUDSON             |                                         |                                         */
/*  TRANS NUTS GA  ROSWEL             | 2 SQL R PYTHON EXCEL                    |                                         */
/*  TRANS NUTS GA  ROSWEL             | ====================                    |  PLAN  PRODUCT VENDOR LOCALVENDOR       */
/*  ;;;;                              | for python  excel see                   |                                         */
/*  run;quit;                         | https://tinyurl.com/4e6yaap8            |  DELTA  WIFI     NY     HUDSON          */
/*                                    | sqllite does do automatic remerging     |  DELTA  WIFI     NY     ALBANY          */
/*                                    |                                         |  DELTA  WIFI     NY     ALBANY          */
/*                                    | %utl_rbeginx;                           |                                         */
/*                                    | parmcards4;                             |                                         */
/*                                    | library(haven)                          |                                         */
/*                                    | library(sqldf)                          |                                         */
/*                                    | source("c:/oto/fn_tosas9x.R")           |                                         */
/*                                    | have<-read_sas("d:/sd1/have.sas7bdat")  |                                         */
/*                                    | have                                    |                                         */
/*                                    | want <- sqldf('                         |                                         */
/*                                    |   with                                  |                                         */
/*                                    |      grp as (                           |                                         */
/*                                    |   select                                |                                         */
/*                                    |      Plan                               |                                         */
/*                                    |     ,Product                            |                                         */
/*                                    |   from                                  |                                         */
/*                                    |      have                               |                                         */
/*                                    |   group                                 |                                         */
/*                                    |       by plan, product                  |                                         */
/*                                    |   having                                |                                         */
/*                                    |       count(distinct                    |                                         */
/*                                    |         Vendor||LocalVendor)>1 )        |                                         */
/*                                    |   select                                |                                         */
/*                                    |      l.Plan                             |                                         */
/*                                    |     ,l.Product                          |                                         */
/*                                    |     ,l.Vendor                           |                                         */
/*                                    |     ,l.LocalVendor                      |                                         */
/*                                    |   from                                  |                                         */
/*                                    |     have as l inner join grp as r       |                                         */
/*                                    |   on                                    |                                         */
/*                                    |         l. Plan   = r. Plan             |                                         */
/*                                    |     and l.Product = r.Product           |                                         */
/*                                    |  ')                                     |                                         */
/*                                    | print(want)                             |                                         */
/*                                    | fn_tosas9x(                             |                                         */
/*                                    |       inp    = want                     |                                         */
/*                                    |      ,outlib ="d:/sd1/"                 |                                         */
/*                                    |      ,outdsn ="want"                    |                                         */
/*                                    |      )                                  |                                         */
/*                                    | ;;;;                                    |                                         */
/*                                    | %utl_rendx;                             |                                         */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

 options validvarname=upcase;
 libname sd1 "d:/sd1";
 data sd1.have;
   infile datalines truncover;
   input
   (Plan Product Vendor
     LocalVendor) ($);
 cards4;
 DELTA WIFI NY  ALBANY
 DELTA WIFI NY  ALBANY
 DELTA WIFI NY  HUDSON
 TRANS NUTS GA  ROSWEL
 TRANS NUTS GA  ROSWEL
 ;;;;
 run;quit;

/**************************************************************************************************************************/
/* PLAN  PRODUCT VENDOR LOCALVENDOR                                                                                       */
/*                                                                                                                        */
/* DELTA  WIFI     NY     ALBANY                                                                                          */
/* DELTA  WIFI     NY     ALBANY                                                                                          */
/* DELTA  WIFI     NY     HUDSON**                                                                                        */
/*                                                                                                                        */
/* TRANS  NUTS     GA     ROSWEL                                                                                          */
/* TRANS  NUTS     GA     ROSWEL                                                                                          */
/*                                                                                                                        */
/* ** more than one local vendor                                                                                          */
/**************************************************************************************************************************/

/*                             _
/ |  ___  __ _ ___   ___  __ _| |
| | / __|/ _` / __| / __|/ _` | |
| | \__ \ (_| \__ \ \__ \ (_| | |
|_| |___/\__,_|___/ |___/\__, |_|
                            |_|
*/

proc sql;
  create
    table want as
  select
     Plan
    ,Product
    ,Vendor
    ,LocalVendor
  from
     sd1.have
  group
     by plan, product
  having
     count(distinct
     cats(Vendor,LocalVendor))>1
;quit;

/**************************************************************************************************************************/
/* PLAN  PRODUCT VENDOR LOCALVENDOR                                                                                       */
/*                                                                                                                        */
/* DELTA  WIFI     NY     HUDSON                                                                                          */
/* DELTA  WIFI     NY     ALBANY                                                                                          */
/* DELTA  WIFI     NY     ALBANY                                                                                          */
/**************************************************************************************************************************/

/*___              _                      _   _                                    _
|___ \   ___  __ _| |  _ __   _ __  _   _| |_| |__   ___  _ __    _____  _____ ___| |
  __) | / __|/ _` | | | `__| | `_ \| | | | __| `_ \ / _ \| `_ \  / _ \ \/ / __/ _ \ |
 / __/  \__ \ (_| | | | |    | |_) | |_| | |_| | | | (_) | | | ||  __/>  < (_|  __/ |
|_____| |___/\__, |_| |_|    | .__/ \__, |\__|_| |_|\___/|_| |_| \___/_/\_\___\___|_|
                |_|          |_|    |___/
*/

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
have
want <- sqldf('
  with
     grp as (
  select
     Plan
    ,Product
  from
     have
  group
      by plan, product
  having
      count(distinct
        Vendor||LocalVendor)>1 )
  select
     l.Plan
    ,l.Product
    ,l.Vendor
    ,l.LocalVendor
  from
    have as l inner join grp as r
  on
        l. Plan   = r. Plan
    and l.Product = r.Product
 ')
print(want)
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/*  ROWNAMES    PLAN     PRODUCT    VENDOR    LOCALVENDOR                                                                 */
/*                                                                                                                        */
/*      1       DELTA     WIFI        NY        ALBANY                                                                    */
/*      2       DELTA     WIFI        NY        ALBANY                                                                    */
/*      3       DELTA     WIFI        NY        HUDSON                                                                    */
/**************************************************************************************************************************/

/*           _ _
  __ _ _   _(_) |_
 / _` | | | | | __|
| (_| | |_| | | |_
 \__, |\__,_|_|\__|
    |_|
*/
