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
       01 WX-NUMERO PIC 9(5) VALUE 12345.
       01 WX-FRASE PIC A(5) VALUE 'HOLA'.


      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
       DISPLAY  "frase antes de inicializar: "WX-FRASE.
       INITIALIZE WX-FRASE.
       DISPLAY  "frase antes de inicializar: "WX-FRASE.
       DISPLAY  "numero antes de inicializar: "WX-NUMERO.
       INITIALIZE WX-NUMERO.
       DISPLAY  "numero despues de inicializar: "WX-NUMERO.
       STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
