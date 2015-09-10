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
       01 NUMERO1 PIC 9(3) VALUE 43 .
       01 NUMERO2 PIC 9(3) VALUE 157 .
       01 NUMERO3 PIC 9(3) VALUE 500 .
       01 RESULTADO_RESTA PIC 9(3) .
       01 WX-RESTO PIC 9(3).

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
      *
      *SUBTRACT: operador resta. "SUBTRACT 1 FROM WX-CAMPO"
      *MULTIPLY: operador multiplicación. "MULTIPLY WX-CAMPO BY 1"
      *DIVIDE: operador división. "DIVIDE WX-CAMPO BY 1"
      *REMAINDER: es el resto de una división. "DIVIDE WX-CAMPO BY 1
      *
       ADD NUMERO2 TO NUMERO1.
            DISPLAY NUMERO1.
      * tambien se puede utilizar + - * /
            COMPUTE RESULTADO_RESTA = NUMERO3 - NUMERO1.
            DISPLAY "RESULTADO= "RESULTADO_RESTA.
            STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
