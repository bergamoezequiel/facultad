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

        01 WS-TABLE.
           05 WS-A OCCURS 3 TIMES.
               10 WS-B PIC A(2).
               10 WS-C OCCURS 2 TIMES.
                   15 WS-D PIC X(3).

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
            MOVE '12ABCDEF34GHIJKL56MNOPQR' TO WS-TABLE.
       DISPLAY 'WS-TABLE  : ' WS-TABLE.
      *Imprime el primer tercio del string ("la primer pasada de ws-a")
       DISPLAY 'WS-A(1)   : ' WS-A(1).
      *Desde arriba de todo, la primer vuelta(ws-a), el primer lugar
       DISPLAY 'WS-C(1,1) : ' WS-C(1,1).
       DISPLAY 'WS-C(1,2) : ' WS-C(1,2).
       DISPLAY 'WS-A(2)   : ' WS-A(2).
       DISPLAY 'WS-C(2,1) : ' WS-C(2,1).
       DISPLAY 'WS-C(2,2) : ' WS-C(2,2).
       DISPLAY 'WS-A(3)   : ' WS-A(3).
      *Dde arriba de todo, la tercer vuelta(ws-a), el primer lugar(ws-c)
       DISPLAY 'WS-C(3,1) : ' WS-C(3,1).
       DISPLAY 'WS-C(3,2) : ' WS-C(3,2).

            STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
