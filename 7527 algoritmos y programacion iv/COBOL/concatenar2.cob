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
       01 WX-DIA   PIC 9(2) VALUE 31.
       01 WX-MES   PIC X(10).
       01 WX-FECHA PIC X(19).
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
       MOVE 'MAYO' TO WX-MES
      * Ahora WX-MES valdrá 'MAYO      '
       STRING 'HOY ES ' WX-DIA ' DE ' DELIMITED BY SIZE
       WX-MES DELIMITED BY SPACE
       '.' DELIMITED BY SIZE
       INTO WX-FECHA.
            DISPLAY WX-FECHA.
            STOP RUN.

      *Recordad: el DELIMITED BY se aplica a todos los campos que lo
      *preceden. Usad el DELIMITED BY correcto en cada caso!
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
