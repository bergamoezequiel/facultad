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
       01 cantidad pic 9(1) value "3".
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
             PERFORM RUTINA1 THRU RUTINA3 cantidad TIMES .
            DISPLAY "FIN".
            STOP RUN.

       RUTINA1.
         DISPLAY "Se realizo rutina1".
       RUTINA2.
         DISPLAY "Se realizo rutina2".
       RUTINA3.
         DISPLAY "Se realizo rutina3".
         DISPLAY "---------------------".
       RUTINA4.
         DISPLAY "Se realizo rutina4".
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
