       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGM.
      *******************************************************************
      * ALGORITMOS III  -  CURSO  ING. MURMAN                           *
      * PROGRAMA EJEMPLO DE CORTE DE CONTROL                            *
      *******************************************************************
      * EJERCICIO 1 (PRACTICA 2)                                        *
      *                                                                 *
      * Emitir el listado de un archivo de pagos con totales por cliente*
      * y final.                                                        *
      *                                                                 *
      *******************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PAGOS       ASSIGN TO DISK
                              ORGANIZATION IS LINE SEQUENTIAL
                              FILE STATUS IS PAG-ESTADO.



       DATA DIVISION.
       FILE SECTION.
       FD  PAGOS  LABEL RECORD IS STANDARD
                  VALUE OF FILE-ID IS "PAGOS.DAT".

       01  PAG.
           03 PAG-COD-CLI    PIC X(5).
           03 PAG-PAGOS      PIC 99.
           03 PAG-FECHA      PIC 9(6).
           03 PAG-PAGADO     PIC 9(8).



       01  LINEA             PIC X(80).

       WORKING-STORAGE SECTION.
       77 PAG-EOF          PIC XX    VALUE "NO".
          88 EOF                     VALUE "SI".
       77 PAG-ESTADO       PIC XX.
       77 WS-COD-CLI-ANT   PIC X(5).
       77 WS-TOT-CLI       PIC 9(9)  VALUE 0.
       77 WS-TOT-TOT       PIC 9(9)  VALUE 0.
       77 WS-PAG-CLI       PIC 9(3)  VALUE 0.
       77 WS-PAG-TOT       PIC 9(3)  VALUE 0.
       77 WS-LINEA         PIC 9(2)  VALUE 0.

       01 FECHA.
          03 FECHA-AA      PIC 9(2).
          03 FECHA-MM      PIC 9(2).
          03 FECHA-DD      PIC 9(2).

       01 PTR-DETALLE.
          03  FILLER       PIC X(7)  VALUE SPACES.
          03  PTR-PAGOS    PIC Z9.
          03  FILLER       PIC X(18) VALUE SPACES.
          03  PTR-FECHA    PIC Z9/99/99.
          03  FILLER       PIC X(12) VALUE SPACES.
          03  PTR-PAGADO   PIC ZZ.Z(3).Z(3).

       01 PTR-TOTAL-CLIENTE.
          03  FILLER       PIC X(6)  VALUE SPACES.
          03  PTR-PAG-CLI  PIC ZZ9.
          03  FILLER       PIC X(37) VALUE SPACES.
          03  PTR-TOT-CLI  PIC ZZZ.ZZZ.ZZZ.
          03  FILLER       PIC X(3)  VALUE SPACES.
          03  FILLER       PIC X(13) VALUE 'TOTAL CLIENTE'.

       01 PTR-TOTAL-FINAL.
          03  FILLER       PIC X(6)  VALUE SPACES.
          03  PTR-PAG-TOT  PIC ZZ9.
          03  FILLER       PIC X(37) VALUE SPACES.
          03  PTR-TOT-TOT  PIC ZZZ.ZZZ.ZZZ.
          03  FILLER       PIC X(16) VALUE '   TOTAL FINAL'.

       01 PE1-ENCABE.
          03  FILLER       PIC X(50) VALUE 'LISTADO DE PAGOS'.
          03  PE1-FECHA-DD PIC Z9.
          03  FILLER       PIC X     VALUE '/'.
          03  PE1-FECHA-MM PIC 99.
          03  FILLER       PIC X     VALUE '/'.
          03  PE1-FECHA-AA PIC 99.
          03  PE1-FECHA    PIC X(8).
          03  FILLER       PIC X(10) VALUE '   HOJA:'.
          03  PE1-HOJA     PIC 9999  VALUE ZERO.

       01 PE2-ENCABE.
          03  FILLER       PIC X(20)  VALUE 'CODIGO DE CLIENTE :'.
          03  PE2-COD-CLI  PIC Z(4)9.

       01 PE3-ENCABE.
          03  FILLER       PIC X(25)  VALUE 'CANTIDAD DE PAGOS '.
          03  FILLER       PIC X(25)  VALUE 'FECHA DE PAGO'.
          03  FILLER       PIC X(25)  VALUE 'MONTO TOTAL PAGADO'.

       01 PE4-ENCABE.
          03  FILLER       PIC X(80)  VALUE ALL '_'.

       PROCEDURE DIVISION.
       COMIENZO.

           PERFORM INICIO.
           PERFORM LEO-PAGOS.
           PERFORM PROCESO UNTIL PAG-EOF = "SI".
           PERFORM IMPRIME-TOTAL.
           PERFORM FIN.
           STOP RUN.
      *----------------------------------------------------------
      ********
       INICIO.
      ********
           OPEN INPUT PAGOS.
           IF PAG-ESTADO NOT = ZERO
              DISPLAY "ERROR EN OPEN   FS: " PAG-ESTADO
              STOP RUN.

           ACCEPT FECHA FROM DATE.
           MOVE FECHA-AA   TO PE1-FECHA-AA.
           MOVE FECHA-MM   TO PE1-FECHA-MM.
           MOVE FECHA-DD   TO PE1-FECHA-DD.
      *----------------------------------------------------------
      ***********
       LEO-PAGOS.
      ***********
           READ PAGOS
                AT END MOVE "SI" TO PAG-EOF.

           IF PAG-ESTADO NOT = ZERO AND 10
              DISPLAY "ERROR EN READ   FS: " PAG-ESTADO
              STOP RUN.

      *----------------------------------------------------------
      *****
       FIN.
      *****
           CLOSE PAGOS
                 .
           DISPLAY "FIN DE PROGRAMA.".

      *----------------------------------------------------------
      *********
       PROCESO.
      *********
           MOVE    PAG-COD-CLI   TO WS-COD-CLI-ANT.
           MOVE    90            TO WS-LINEA.
           MOVE    ZERO          TO WS-TOT-CLI.

           PERFORM UN-CLIENTE UNTIL EOF
                                 OR WS-COD-CLI-ANT NOT = PAG-COD-CLI.

           PERFORM IMPRIME-TOT-CLIENTE.
           ADD     WS-TOT-CLI  TO WS-TOT-TOT.
           ADD     WS-PAG-CLI  TO WS-PAG-TOT.

      *----------------------------------------------------------
      ************
       UN-CLIENTE.
      ************
           IF WS-LINEA > 70
              PERFORM  ENCABEZADO.

           PERFORM IMPRIMO-LINEA.
           ADD     PAG-PAGADO  TO WS-TOT-CLI.
           ADD     PAG-PAGOS   TO WS-PAG-CLI.

           PERFORM LEO-PAGOS.

      *----------------------------------------------------------
      ***************
       IMPRIMO-LINEA.
      ***************
           MOVE PAG-PAGOS   TO PTR-PAGOS.
           MOVE PAG-FECHA   TO PTR-FECHA.
           MOVE PAG-PAGADO  TO PTR-PAGADO.
           WRITE LINEA FROM PTR-DETALLE.
           ADD     1        TO WS-LINEA.

      *----------------------------------------------------------
      ***************
       IMPRIME-TOTAL.
      ***************
           MOVE WS-PAG-TOT   TO PTR-PAG-TOT.
           MOVE WS-TOT-TOT   TO PTR-TOT-TOT.
           WRITE LINEA FROM PTR-TOTAL-FINAL AFTER 2.

      *----------------------------------------------------------
      *********************
       IMPRIME-TOT-CLIENTE.
      *********************
           MOVE WS-PAG-CLI   TO PTR-PAG-CLI.
           MOVE WS-TOT-CLI   TO PTR-TOT-CLI.
           WRITE LINEA FROM PTR-TOTAL-CLIENTE AFTER 2.

      *----------------------------------------------------------
      ************
       ENCABEZADO.
      ************
           ADD     1             TO PE1-HOJA.
           WRITE LINEA FROM PE1-ENCABE AFTER PAGE.
           MOVE PAG-COD-CLI  TO PE2-COD-CLI.
           WRITE LINEA FROM PE2-ENCABE.
           WRITE LINEA FROM PE3-ENCABE.
           WRITE LINEA FROM PE4-ENCABE.
           MOVE    6         TO WS-LINEA.
