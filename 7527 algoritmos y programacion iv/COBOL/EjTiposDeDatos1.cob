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
      * 9	Numeric
      * A	Alphabetic
      * X	Alphanumeric
      * V	Implicit Decimal
      * S	Sign
      * P	Assumed Decimal
      *Si no pongo nada inicializa con 000.00
      *01 WS-NUM1 PIC S9(3)V9(2) VALUE +123.32.
      *01 WS-NUM1 PIC S9(3)V9(2) VALUE 123.32. asume positivo
       01 WS-NUM1 PIC S9(3)V9(2) VALUE -123.32.
       01 WS-NUM2 PIC PPP999.
       01 WS-NUM3 PIC S9(3)V9(2) VALUE -123.45.
       01 WS-NAME PIC A(6) VALUE 'ABCDEF'.
       01 WS-ID PIC X(5) VALUE 'A121$'.
      *No lleva signo, ssi pones signo rompe
       01 WS-NUM4 PIC 9(3)V9(2) VALUE 89.72.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
       DISPLAY "WS-NUM1 : "WS-NUM1.
       DISPLAY "WS-NUM2 : "WS-NUM2.
       DISPLAY "WS-NUM3 : "WS-NUM3.
       DISPLAY "WS-NAME : "WS-NAME.
       DISPLAY "WS-ID : "WS-ID.
       DISPLAY "WS-NUM4 : "WS-NUM4.
            STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
