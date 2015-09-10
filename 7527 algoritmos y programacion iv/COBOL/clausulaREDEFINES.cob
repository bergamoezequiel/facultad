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

       01 WS-ID PIC X(3) VALUE '123'.
       01 WX-CAMPO1 PIC X(3).
       01 WX-CAMPO2 REDEFINES WX-CAMPO1 PIC 9(3).
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
       MOVE WS-ID TO WX-CAMPO1
       DISPLAY "valor campo 1: "WX-CAMPO1.
       DISPLAY "valor campo 2: "WX-CAMPO2.
       STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
