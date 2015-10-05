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
       SELECT pagosFile ASSIGN TO "EntradaEjercicio1.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT listadoDePagosFile ASSIGN TO "listadoDePagos.dat"
             ORGANIZATION IS LINE SEQUENTIAL.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD pagosFile.
       01 PAGO-FILE.
          05 CLIENTE-ID PIC X(5).
    º     05 CANTIDAD-PAGOS PIC 9(2).
          05 FECHA-PAGOS PIC 9(2).
          05 MONTO_TOTAL PIC 9(8).

       FD listadoDePagosFile.
       01 REGISTRO-FILE PIC X(60).
      *-----------------------
       WORKING-STORAGE SECTION.



       01 WS-ENCABEZADO1.
           05 FILLER PIC A(16) VALUE 'LISTADO DE PAGOS'.
           05 FILLER PIC A(24) VALUE SPACES.
           05 FECHA-ENC.
               08 DD-ENC PIC 9(2).
              08 FILLER PIC X VALUE '/'.
              08 MM-ENC PIC 9(2).
              08 FILLER PIC X VALUE '/'.
              08 AA-ENC PIC 9(2).
           05 FILLER PIC X(8) value '  HOJA: '.
           05 NRO-HOJA PIC 9(4) VALUE 0.

       01 WS-ENCABEZADO2.
           05 FILLER  PIC X(20) VALUE 'CODIGO DE CLIENTE : '.
           05 CLIENTE-CODE PIC  X(5).
           05 FILLER PIC A(35) VALUE SPACES.

       01 WS-NOMBRES-COLUMNAS.
               05 FILLER PIC A(20) VALUE "CANTIDAD DE PAGOS".
               05 FILLER PIC A(20) VALUE "FECHA DE PAGO".
               05 FILLER PIC A(20) VALUE "MONTO TOTAL PAGADO".

       77 WS-LINEA-BL PIC A(60) VALUE SPACES.

       01 WS-DETALLE.
          05 WS-CANT PIC 9(2).
          05 FILLER PIC A(18).
          05 FECHA.
               08 DD PIC 9(2) .
               08 FILLER PIC X VALUE '/'.
               08 MM PIC 9(2).
               08 FILLER PIC X VALUE '/'.
               08 AAAA PIC 9(2).
          05 FILLER PIC A(12).
          05 MONTO PIC 9(8).
          05 FILLER PIC X(12).


       01 WS-FINAL-LINEA.
           05 WS-CANT_PAGOS_CLIENTE PIC 9(3).
           05 FILLER PIC X(35) VALUE SPACE.
           05 FILLER PIC X(14) VALUE "TOTAL CLIENTE ".
           05 WS-MONTO_TOTAL_CLIENTE PIC 9(8).

       01 WS-FINAL-ARCH.
           05 WS-CANT_PAGOS_FINAL PIC 9(3) value zeroes.
           05 FILLER PIC X(33) VALUE SPACE.
           05 FILLER PIC X(16) VALUE "TOTAL FINAL ".
           05 WS-MONTO_TOTAL_FINAL PIC 9(8) value zeroes.

      *Registro leido de archivo
       01 WS-PAGO-FILE.
          05 WS-CLIENTE-ID PIC X(5).
    º     05 WS-CANTIDAD-PAGOS PIC 9(2).
          05 WS-FECHA-PAGOS PIC 9(2).
          05 WS-MONTO_TOTAL PIC 9(8).
       01 WS-EOF PIC A(1) VALUE 'N'.
       01 WS-PRIMERO PIC A(1) VALUE 'S'.
       01 WS-CLIENTE-ANTERIOR PIC X(5).

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



      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-FIELDS
           MOVE WS-CURRENT-YEAR2 TO AA-ENC.
           MOVE WS-CURRENT-MONTH TO MM-ENC.
           MOVE WS-CURRENT-DAY  TO DD-ENC.

           OPEN INPUT pagosFile.
           OPEN OUTPUT listadoDePagosFile.
           PERFORM UNTIL WS-EOF='Y'
               READ pagosFile INTO WS-PAGO-FILE
                   AT END MOVE 'Y' TO WS-EOF
                   NOT AT END
                     PERFORM PROCESAR-REGISTRO
               END-READ
           END-PERFORM.
      *Se escribe el total del ultimo cliente y el total final
           PERFORM ESCRIBIR_TOTAL_CLIENTE
           WRITE REGISTRO-FILE FROM WS-FINAL-ARCH.
           CLOSE pagosFile.
           CLOSE listadoDePagosFile.
           STOP RUN.

       PROCESAR-REGISTRO.

           IF (WS-PRIMERO= 'S') THEN
               PERFORM INICIALIZACION_CAMBIO_CLIENTE
               PERFORM ESCRIBIR_ENCABEZADO
           ELSE
               CONTINUE.

           IF (WS-PRIMERO= 'S'
             or WS-CLIENTE-ANTERIOR= WS-CLIENTE-ID) THEN
               PERFORM  SETEAR_VALORES_DE_DETALLE
               WRITE REGISTRO-FILE FROM WS-DETALLE
               MOVE 'N' TO WS-PRIMERO
               MOVE WS-CLIENTE-ID TO WS-CLIENTE-ANTERIOR
               PERFORM INCREMENTAR_MONTO_TOTAL_Y_FINAL
           ELSE
               PERFORM ESCRIBIR_TOTAL_CLIENTE
               PERFORM INICIALIZACION_CAMBIO_CLIENTE
               PERFORM ESCRIBIR_ENCABEZADO
               PERFORM  SETEAR_VALORES_DE_DETALLE
               WRITE REGISTRO-FILE FROM WS-DETALLE
               MOVE WS-CLIENTE-ID TO WS-CLIENTE-ANTERIOR
               PERFORM INCREMENTAR_MONTO_TOTAL_Y_FINAL.



       INICIALIZACION_CAMBIO_CLIENTE.
            MOVE 0 TO WS-MONTO_TOTAL_CLIENTE
            MOVE 0 TO WS-CANT_PAGOS_CLIENTE
            MOVE WS-CLIENTE-ID TO CLIENTE-CODE.

       SETEAR_VALORES_DE_DETALLE.
           MOVE WS-CANTIDAD-PAGOS TO WS-CANT
           MOVE WS-CURRENT-YEAR2 TO AAAA
           MOVE WS-CURRENT-MONTH TO MM
           MOVE WS-FECHA-PAGOS  TO DD
           MOVE WS-MONTO_TOTAL TO MONTO.


       INCREMENTAR_MONTO_TOTAL_Y_FINAL.
           ADD WS-CANTIDAD-PAGOS TO WS-CANT_PAGOS_CLIENTE
           ADD  WS-MONTO_TOTAL TO WS-MONTO_TOTAL_CLIENTE
           ADD WS-MONTO_TOTAL TO WS-MONTO_TOTAL_FINAL
           ADD WS-CANTIDAD-PAGOS TO WS-CANT_PAGOS_FINAL.


       ESCRIBIR_ENCABEZADO.
           ADD 1 TO NRO-HOJA
           WRITE REGISTRO-FILE FROM WS-ENCABEZADO1 AFTER PAGE
           WRITE REGISTRO-FILE FROM WS-ENCABEZADO2
           WRITE REGISTRO-FILE FROM WS-LINEA-BL
           WRITE REGISTRO-FILE FROM WS-NOMBRES-COLUMNAS.

       ESCRIBIR_TOTAL_CLIENTE.
           WRITE REGISTRO-FILE FROM WS-LINEA-BL
           WRITE REGISTRO-FILE FROM WS-FINAL-LINEA.

      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
