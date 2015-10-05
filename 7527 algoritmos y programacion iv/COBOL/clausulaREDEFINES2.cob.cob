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
       01  TABLA-D.
                  05 FILLER     PIC X(10) VALUE "LUNES    ".
                  05 FILLER     PIC X(10) VALUE "MARTES   ".
                  05 FILLER     PIC X(10) VALUE "MIERCOLES".
                  05 FILLER     PIC X(10) VALUE "JUEVES   ".
                  05 FILLER     PIC X(10) VALUE "VIERNES  ".
                  05 FILLER     PIC X(10) VALUE "SABADO   ".
                  05 FILLER     PIC X(10) VALUE "DOMINIGO ".
       01  TABLA-DIAS  REDEFINES TABLA-D.
                  05  DIA        PIC X(10) OCCURS 7 TIMES.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
            DISPLAY TABLA-DIAS.
            STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
