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
       01 NUMERO_CERO PIC 9(3) VALUE ZERO.
       01 NUMERO_CERO2 PIC 9(3) VALUE 0.
       01 NUMERO_CERO3 PIC 9(3) VALUE ZEROS.
       01 NUMERO_CERO4 PIC 9(3) VALUE ZEROES.
       01 STRING_CERO1 PIC X(3) VALUE ZERO.
       01 STRING_CERO2 PIC X(3) VALUE ZEROS.
       01 STRING_CERO3 PIC X(3) VALUE ZEROES.
       01 STRING_SPACE1 PIC X(3) VALUE SPACE.
       01 STRING_SPACE2 PIC X(3).
       01 STRING_SPACE3 PIC X(3) VALUE SPACES.
      *01 NUMERO_SPACE1 PIC 9(3) VALUE SPACE. ---INVALIDO,SOLO ALPHA --
       01 STRING_QUOTE1 PIC X(3) VALUE QUOTE.
       01 STRING_QUOTE2 PIC X(3) VALUE QUOTES.
       01 NUMERO_HIGH PIC 9(3) VALUE HIGH-VALUE.
       01 NUMERO_HIGH2 PIC 9(3) VALUE HIGH-VALUES.
       01 STRING_HIGH PIC X(3) VALUE HIGH-VALUE.
       01 STRING_HIGH2 PIC X(3) VALUE HIGH-VALUES.
       01 NUMERO_LOW PIC 9(3) VALUE LOW-VALUE.
       01 NUMERO_LOW2 PIC 9(3) VALUE LOW-VALUES.
       01 STRING_LOW PIC X(3) VALUE LOW-VALUE.
       01 STRING_LOW2 PIC X(3) VALUE LOW-VALUES.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
            DISPLAY 'variable NUMERO_CERO: 'NUMERO_CERO.
            DISPLAY 'variable NUMERO_CERO2: 'NUMERO_CERO2.
            DISPLAY 'variable NUMERO_CERO3: 'NUMERO_CERO3.
            DISPLAY 'variable NUMERO_CERO4: 'NUMERO_CERO4.
            DISPLAY 'variable STRING_CERO1: 'STRING_CERO1.
            DISPLAY 'variable STRING_CERO2: 'STRING_CERO2.
            DISPLAY 'variable STRING_CERO3: 'STRING_CERO3.
            DISPLAY 'variable STRING_SPACE1: 'STRING_SPACE1.
            DISPLAY 'variable STRING_SPACE2: 'STRING_SPACE2.
            DISPLAY 'variable STRING_SPACE3: 'STRING_SPACE3.
            DISPLAY 'variable STRING_QUOTE1: 'STRING_QUOTE1.
            DISPLAY 'variable STRING_QUOTE2: 'STRING_QUOTE2.
            DISPLAY 'variable NUMERO_HIGH: 'NUMERO_HIGH.
            DISPLAY 'variable NUMERO_HIGH2: 'NUMERO_HIGH2.
            DISPLAY 'variable STRING_HIGH: 'STRING_HIGH.
            DISPLAY 'variable STRING_HIGH2: 'STRING_HIGH2.
            DISPLAY 'variable NUMERO_LOW: 'NUMERO_LOW.
            DISPLAY 'variable NUMERO_LOW2: 'NUMERO_LOW2.
            DISPLAY 'variable STRING_LOW: 'STRING_LOW.
            DISPLAY 'variable STRING_LOW2: 'STRING_LOW2.
            STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
