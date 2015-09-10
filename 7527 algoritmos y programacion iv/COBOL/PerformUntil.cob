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
       01 numero pic 9(1) value 5.
       01 numero2 pic 9(1) value 5.
       01 c pic 9(1) value 5.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **

         PERFORM RUTINA1 until numero = ZERO.

            DISPLAY "--------------".
            DISPLAY "--------------".
            PERFORM RUTINA2 WITH TEST AFTER UNTIL numero2<5.


            perform until c >= 10
                add 1 to c.

            END-PERFORM
             DISPLAY "FIN".
            STOP RUN.


       RUTINA1.
         SUBTRACT 1 FROM numero.
         DISPLAY "Se realizo rutina 1".
         DISPLAY "numero: " numero.
       RUTINA2.
         DISPLAY "Se realizo rutina2".
         SUBTRACT 1 FROM numero2.
       RUTINA3.
         DISPLAY "Se realizo rutina3".
         DISPLAY "---------------------".
       RUTINA4.
         DISPLAY "Se realizo rutina4".
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
