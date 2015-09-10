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
       SELECT STUDENT ASSIGN TO '../input.txt'
           ORGANIZATION IS INDEXED
               ACCESS IS RANDOM
               RECORD KEY IS STUDENT-ID
               FILE STATUS IS FS.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD STUDENT.
        01 STUDENT-FILE.
           05 STUDENT-ID PIC 9(5).
           05 NAME PIC A(25).
      *-----------------------
       WORKING-STORAGE SECTION.
       01 WS-STUDENT.
           05 WS-STUDENT-ID PIC 9(5).
           05 WS-NAME PIC A(25).
       01 WS-EOF PIC A(1).
      *-----------------------

       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
         OPEN INPUT STUDENT.
       PERFORM UNTIL WS-EOF='Y'
         READ STUDENT INTO WS-STUDENT
            AT END MOVE 'Y' TO WS-EOF
            NOT AT END DISPLAY WS-STUDENT
         END-READ
        END-PERFORM.
       CLOSE STUDENT.
       STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
