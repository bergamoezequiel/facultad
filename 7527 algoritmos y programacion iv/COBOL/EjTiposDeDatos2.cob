      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      *-----------------------
       WORKING-STORAGE SECTION.

       01 WX-VARIABLE-NUM PIC S9(7)V9(2) VALUE -39994.56.
       01 WX-VARIABLE-EDI PIC -Z,ZZZ,ZZ9.99 .
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
       DISPLAY 'WX-VARIABLE-NUM:'WX-VARIABLE-NUM

       MOVE WX-VARIABLE-NUM TO WX-VARIABLE-EDI

       DISPLAY 'WX-VARIABLE-EDI:'WX-VARIABLE-EDI
       STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
