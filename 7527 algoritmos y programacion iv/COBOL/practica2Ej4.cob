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
       FILE-CONTROL.
       SELECT MAESTRO ASSIGN TO "EntradaEjercicio4.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT SALIDA-RESUMEN ASSIGN TO "resumenMaterias.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT SALIDA-ESTADMATERIAS ASSIGN TO "estadisticoMaterias2.dat"
             ORGANIZATION IS LINE SEQUENTIAL.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD SALIDA-ESTADMATERIAS.
       01 SALIDA-ESTADMATERIAS-FILE PIC X(60).


       FD MAESTRO.
       01 MAESTRO-FILE.
          05 UNIV-ID PIC X(2).
    º     05 FACULTAD-ID PIC X(2).
          05 DEPTO-ID PIC X(3).
          05 MATERIA-ID PIC X(3).
          05 NRO-PADRON PIC X(5).
          05 CODIGO PIC A(1).



       FD SALIDA-RESUMEN.
       01 SALIDA-RESUMEN-FILE.
          05 RES-UNIV-ID PIC X(2).
    º     05 RES-FACULTAD-ID PIC X(2).
          05 RES-DEPTO-ID PIC X(3).
          05 RES-MATERIA-ID PIC X(3).
          05 RES-TOTALAP PIC X(3).
          05 RES-TOTALAD PIC X(3).
          05 RES-TOTALC PIC X(3).


      *-----------------------
       WORKING-STORAGE SECTION.

       01 WS-CANTIDAD-LINEAS PIC 9(2).
       01 UNIV-ANTERIOR PIC X(2).
       01 FACU-ANTERIOR PIC X(2).
       01 DEPTO-ANTERIOR PIC X(3).
       01 MATERIA-ANTERIOR PIC X(3).

       01 WS-EOF PIC A(1) VALUE 'N'.

       01 APROBADAS PIC 9(3).
       01 CURSADAS PIC 9(3).
       01 ADEUDADAS PIC 9(3).

       01 WS-ENCABEZADO1.
           05 FILLER PIC X(31) VALUE 'LISTADO ESTADISTICO P/MATERIA :'.
           05 FILLER PIC A(9) VALUE SPACES.
           05 FECHA-ENC.
               08 DD-ENC PIC 9(2).
              08 FILLER PIC X VALUE '/'.
              08 MM-ENC PIC 9(2).
              08 FILLER PIC X VALUE '/'.
              08 AA-ENC PIC 9(2).
           05 FILLER PIC X(8) value '  HOJA: '.
           05 NRO-HOJA PIC 9(4) VALUE 0.

       01 WS-ENCABEZADO2.
           05 FILLER  PIC X(14) VALUE 'UNIVERSIDAD : '.
           05 E2-UNIV-ID PIC  X(3).
           05 FILLER PIC A(43) VALUE SPACES.

       01 WS-ENCABEZADO3.
           05 FILLER  PIC X(11) VALUE 'FACULTAD : '.
           05 E3-FACU-ID PIC  X(3).
           05 FILLER PIC A(41) VALUE SPACES.

       01 WS-GUIONES.
           05 FILLER PIC X(1) OCCURS 60 TIMES VALUE '-'.

       01 WS-NOMBRES-COLUMNAS.
               05 FILLER PIC X(15) VALUE "  MATERIA   ".
               05 FILLER PIC X(15) VALUE "  APROBARON  ".
               05 FILLER PIC X(15) VALUE "  CURSARON   ".
               05 FILLER PIC X(15) VALUE "  LA ADEUDAN ".

       01  WS-CURRENT-DATE-FIELDS.
             05  WS-CURRENT-DATE.
                 10  WS-CURRENT-YEAR    PIC  9(2).
                 10  WS-CURRENT-YEAR2   PIC  9(2).
                 10  WS-CURRENT-MONTH   PIC  9(2).
                 10  WS-CURRENT-DAY     PIC  9(2).
             05  WS-CURRENT-TIME.
                 10  WS-CURRENT-HOUR    PIC  9(2).
                 10  WS-CURRENT-MINUTE  PIC  9(2).
                 10  WS-CURRENT-SECOND  PIC  9(2).
                 10  WS-CURRENT-MS      PIC  9(2).
             05  WS-DIFF-FROM-GMT       PIC S9(4).

       01 WS-DPTO.
           05 FILLER PIC X(15) VALUE 'DEPARTAMENTO : '.
           05 DEPTO-PRT PIC X(3).

       01 WS-LINEA.
           05 FILLER PIC X(5) VALUE SPACES.
           05 LINEA-MATERIA PIC X(3).
           05 FILLER PIC X(13) VALUE SPACES.
           05 LINEA-APROBARON PIC X(3).
           05 FILLER PIC X(11) VALUE SPACES.
           05 LINEA-CURSARON PIC X(3).
           05 FILLER PIC X(11) VALUE SPACES.
           05 LINEA-ADEUDAN PIC X(3).


      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **

           PERFORM INICIO.

           PERFORM LEO-ARCH.

           PERFORM PROCESO UNTIL WS-EOF='S'.
           PERFORM FIN.

            STOP RUN.
      ** add other procedures here

       INICIO.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-FIELDS
           MOVE WS-CURRENT-YEAR2 TO AA-ENC.
           MOVE WS-CURRENT-MONTH TO MM-ENC.
           MOVE WS-CURRENT-DAY  TO DD-ENC.
           OPEN OUTPUT SALIDA-RESUMEN.
           OPEN INPUT MAESTRO.
           OPEN OUTPUT SALIDA-ESTADMATERIAS.

       FIN.
           CLOSE SALIDA-RESUMEN.
           CLOSE MAESTRO.
           CLOSE SALIDA-ESTADMATERIAS.

       LEO-ARCH.
           READ MAESTRO INTO MAESTRO-FILE
                   AT END MOVE 'S' TO WS-EOF.


       PROCESO.
           MOVE UNIV-ID TO UNIV-ANTERIOR
           MOVE 90 TO WS-CANTIDAD-LINEAS
      *     PERFORM GRABAR-ENCABEZADO

           PERFORM MISMA-UNIVERSIDAD UNTIL
               WS-EOF='S' OR
               UNIV-ID <> UNIV-ANTERIOR.






       GRABAR-ENCABEZADO.
           MOVE  UNIV-ID  TO E2-UNIV-ID
           ADD 1 TO NRO-HOJA
           WRITE SALIDA-ESTADMATERIAS-FILE
               FROM  WS-ENCABEZADO1 AFTER PAGE.
           WRITE SALIDA-ESTADMATERIAS-FILE FROM WS-ENCABEZADO2.

           WRITE SALIDA-ESTADMATERIAS-FILE FROM WS-GUIONES
           WRITE SALIDA-ESTADMATERIAS-FILE FROM WS-NOMBRES-COLUMNAS
           WRITE SALIDA-ESTADMATERIAS-FILE FROM WS-GUIONES.
           MOVE 5 TO WS-CANTIDAD-LINEAS.

       GRABA-FACU.
           MOVE  FACULTAD-ID TO E3-FACU-ID
           WRITE SALIDA-ESTADMATERIAS-FILE FROM WS-ENCABEZADO3.
           ADD 1 TO WS-CANTIDAD-LINEAS.

      *MISMA FACULTAD O MISMA UNIVERSIDAD
       MISMA-UNIVERSIDAD.
           MOVE FACULTAD-ID TO FACU-ANTERIOR
           display WS-CANTIDAD-LINEAS
           IF WS-CANTIDAD-LINEAS >65 THEN

               PERFORM GRABAR-ENCABEZADO
           END-IF
           PERFORM GRABA-FACU.
           PERFORM MISMA-FACU UNTIL
               WS-EOF='S' OR
               UNIV-ID <> UNIV-ANTERIOR OR
               FACULTAD-ID <> FACU-ANTERIOR.



       MISMA-FACU.
           MOVE DEPTO-ID TO DEPTO-ANTERIOR
           display WS-CANTIDAD-LINEAS
           IF WS-CANTIDAD-LINEAS >65 THEN

                PERFORM GRABAR-ENCABEZADO
           END-IF
           PERFORM GRABAR-DEPTO.
           PERFORM MISMO-DPTO  UNTIL
               WS-EOF='S' OR
               UNIV-ID <> UNIV-ANTERIOR OR
               FACULTAD-ID <> FACU-ANTERIOR OR
               DEPTO-ID <> DEPTO-ANTERIOR.



       GRABAR-DEPTO.
            MOVE DEPTO-ANTERIOR TO DEPTO-PRT.
            WRITE SALIDA-ESTADMATERIAS-FILE FROM WS-DPTO.
            ADD 1 TO WS-CANTIDAD-LINEAS.





       MISMO-DPTO.
           MOVE MATERIA-ID TO MATERIA-ANTERIOR
           MOVE 0 TO APROBADAS
           MOVE 0 TO ADEUDADAS
           MOVE 0 TO CURSADAS
           PERFORM MISMA-MATERIA  UNTIL
               WS-EOF='S' OR
               UNIV-ID <> UNIV-ANTERIOR OR
               FACULTAD-ID <> FACU-ANTERIOR OR
               DEPTO-ID <> DEPTO-ANTERIOR OR
               MATERIA-ID <> MATERIA-ANTERIOR.
           display WS-CANTIDAD-LINEAS
           IF WS-CANTIDAD-LINEAS >65 THEN

              PERFORM GRABAR-ENCABEZADO
           END-IF
           PERFORM GRABO-LINEA
           MOVE APROBADAS TO RES-TOTALAP
           MOVE ADEUDADAS TO RES-TOTALAD
           MOVE CURSADAS TO RES-TOTALC
           MOVE UNIV-ANTERIOR TO RES-UNIV-ID
           MOVE FACU-ANTERIOR TO RES-FACULTAD-ID
           MOVE DEPTO-ANTERIOR TO RES-DEPTO-ID
           MOVE MATERIA-ANTERIOR TO RES-MATERIA-ID
           WRITE SALIDA-RESUMEN-FILE.




       GRABO-LINEA.
           MOVE CURSADAS TO LINEA-CURSARON
           MOVE APROBADAS TO LINEA-APROBARON
           MOVE ADEUDADAS TO LINEA-ADEUDAN
           MOVE MATERIA-ANTERIOR TO LINEA-MATERIA
           WRITE SALIDA-ESTADMATERIAS-FILE FROM WS-LINEA.
           ADD 1 TO WS-CANTIDAD-LINEAS.

       MISMA-MATERIA.
           IF CODIGO='A' THEN
               ADD 1 TO APROBADAS
           ELSE
               IF CODIGO='B' THEN
                   ADD 1 TO ADEUDADAS
               ELSE
                IF CODIGO='C' THEN
                    ADD 1 TO CURSADAS
                END-IF
               END-IF
            END-IF

            PERFORM LEO-ARCH.

       END PROGRAM YOUR-PROGRAM-NAME.
