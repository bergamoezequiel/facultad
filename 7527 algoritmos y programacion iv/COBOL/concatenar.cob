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
       01 WX-CAMPO1    PIC X(17) VALUE 'CONSULTORIO COBOL'.
       01 WX-CAMPO2    PIC X(10) VALUE ' SON GUAYS'.
       01 WX-RESULTADO PIC X(40).
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
      *Donde DELIMITED BY SIZE indica que los campos se unirán según el
      *tamaño que ocupen, y el INTO indicará el campo donde guardar
      *la información concatenada.

       STRING 'LOS TIPOS DEL ' WX-CAMPO1 WX-CAMPO2
       DELIMITED BY SIZE
       INTO WX-RESULTADO
       DISPLAY WX-RESULTADO
       STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
