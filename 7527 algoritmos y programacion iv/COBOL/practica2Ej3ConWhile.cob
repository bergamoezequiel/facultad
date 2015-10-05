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
       SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.

      *-----------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT maestroCC ASSIGN TO "EntradaEjercicio3.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT resumen ASSIGN TO "resumen.dat"
             ORGANIZATION IS LINE SEQUENTIAL.
       SELECT resumen2 ASSIGN TO "resumen2.dat"
             ORGANIZATION IS LINE SEQUENTIAL.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD maestroCC.
       01 MAESTRO-FILE.
          05 BANCO-ID PIC X(3).
    º     05 SUCURSAL-ID PIC X(3).
          05 CUENTA PIC X(4).
          05 SUBCUENTA PIC X(4).
          05 FECHA PIC X(6).
          05 IMPORTE PIC 9(9).
          05 CODIGO PIC A(1).

       FD resumen2.
       01 resumen2-file.
           05 BANCO pic X(3).
           05 SUCURSAL pic X(3).
           05 CANTIDADD PIC 9(4).
           05 MONTOD PIC 9(9).
           05 CANTIDADE PIC 9(4).
           05 MONTOE PIC 9(9).

       FD resumen.
       01 RESGISTRO-GRABAR PIC X(65).
      *-----------------------
       WORKING-STORAGE SECTION.


       01 WS-ENCABEZADO1.
           05 FILLER PIC X(8) VALUE 'BANCO : '.
           05 BANCO-ENC-ID PIC  X(3).
           05 FILLER PIC A(34) VALUE SPACES.
           05 FECHA-ENC.
               08 DD-ENC PIC 9(2).
              08 FILLER PIC X VALUE '/'.
              08 MM-ENC PIC 9(2).
              08 FILLER PIC X VALUE '/'.
              08 AA-ENC PIC 9(2).
           05 FILLER PIC X(8) value '  HOJA: '.
           05 NRO-HOJA PIC 9(4) VALUE 0.

       01 WS-ENCABEZADO2.
           05 FILLER  PIC X(11) VALUE 'SUCURSAL : '.
           05 SUCURSAL-CODE PIC  X(3).
           05 FILLER PIC A(35) VALUE SPACES.

       01 WS-GUIONES.
           05 FILLER PIC X(1) OCCURS 65 TIMES VALUE '-'.


       01 WS-NOMBRES-COLUMNAS.
               05 FILLER PIC X(13) VALUE "| CUENTA   ".
               05 FILLER PIC X(13) VALUE "| SUBCUENTA  ".
               05 FILLER PIC X(13) VALUE "| FECHA   ".
               05 FILLER PIC X(13) VALUE "| IMPORTE   ".
               05 FILLER PIC X(13) VALUE "| CODIGO   |".

       77 WS-LINEA-BL PIC A(60) VALUE SPACES.

       01 WS-DETALLE.
          05 CUENTA-DET PIC X(13).
          05 SUBCUENTA-DET PIC X(13).
          05 FECHA.
               08 DD PIC 9(2) .
               08 FILLER PIC X VALUE '/'.
               08 MM PIC 9(2).
               08 FILLER PIC X VALUE '/'.
               08 AAAA PIC 9(2).
               08 FILLER PIC X(5) VALUE SPACES.
          05 IMPORTE-DET PIC 9(9).
          05 FILLER PIC A(4) VALUE SPACES.
          05 COD-DET PIC A(1).


      *SE UTILIZ EL MISMO PARA SUBCUENTA
       01 WS-FINAL-CUENTA.
           05 FILLER PIC X(34) VALUE SPACE.
           05 FILLER PIC X(17) VALUE "SALDO CUENTA   : ".
           05 WS-MONTO_TOTAL_CLIENTE PIC  --.---.---.--9.

       01 WS-FINAL-SUBCUENTA.
           05 FILLER PIC X(31) VALUE SPACE.
           05 FILLER PIC X(20) VALUE "SALDO SUBCUENTA   : ".
           05 WS-MONTO_TOTAL_CLIENTE_SUB PIC --.---.---.--9.

      *Registro leido de archivo
       01 WS-BANCOS-FILE.
          05 L_BANCO-ID PIC X(3).
    º     05 L_SUCURSAL-ID PIC X(3).
          05 L_CUENTA PIC X(4).
          05 L_SUBCUENTA PIC X(4).
          05 L_FECHA .
               08 DIA PIC X(2).
               08 MES PIC X(2).
               08 ANIO PIC X(2).
          05 L_IMPORTE PIC 9(9).
          05 L_CODIGO PIC A(1).

       01 WS-EOF PIC A(1) VALUE 'N'.
      * 01 WS-PRIMER-SUBCUENTA PIC A(1) VALUE 'S'.
      * 01 WS-PRIMER-CUENTA PIC A(1) VALUE 'S'.
      * 01 WS-PRIMER-SUCURSAL-BANCO PIC A(1) VALUE 'S'.

       01 WS-BANCO-ANTERIOR PIC X(4).
       01 WS-SUCURSAL-ANTERIOR PIC X(4).
       01 WS-CUENTA-ANTERIOR PIC X(4).
       01 WS-SUBCUENTA-ANTERIOR PIC X(4).

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

       01 SALDO_TOTAL_SUBCUENTA  PIC S9(14).
       01 SALDO_TOTAL_CUENTA  PIC S9(14).

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **

           PERFORM INICIO.
           PERFORM LEO-MOVIMIENTO.
           PERFORM PROCESO UNTIL WS-EOF='Y'.
           PERFORM FIN.

           STOP RUN.

       INICIO.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-FIELDS
           MOVE WS-CURRENT-YEAR2 TO AA-ENC.
           MOVE WS-CURRENT-MONTH TO MM-ENC.
           MOVE WS-CURRENT-DAY  TO DD-ENC.
           OPEN INPUT maestroCC.
           OPEN OUTPUT resumen.
           OPEN OUTPUT resumen2.

       FIN.
           CLOSE maestroCC.
           CLOSE resumen.
           close resumen2.

       LEO-MOVIMIENTO.
           READ maestroCC INTO WS-BANCOS-FILE
                   AT END MOVE 'Y' TO WS-EOF.

       PROCESO.
             MOVE L_BANCO-ID TO WS-BANCO-ANTERIOR.
             MOVE L_SUCURSAL-ID TO WS-SUCURSAL-ANTERIOR.
             MOVE L_BANCO-ID TO BANCO.
             MOVE L_SUCURSAL-ID TO SUCURSAL.
             MOVE 0 TO CANTIDADD.
             MOVE 0 TO MONTOD.
             MOVE 0 TO CANTIDADE.
             MOVE 0 TO MONTOE.
             PERFORM GRABAR-ENCABEZADO.
             PERFORM MISMO-BANCO-SUCURSAL UNTIL
                 WS-EOF='Y' OR WS-SUCURSAL-ANTERIOR <> L_SUCURSAL-ID
                 OR L_BANCO-ID <> WS-BANCO-ANTERIOR.

             WRITE resumen2-file.



       MISMO-BANCO-SUCURSAL.
           MOVE L_CUENTA TO WS-CUENTA-ANTERIOR.
           MOVE 0 TO SALDO_TOTAL_CUENTA.
           PERFORM MISMA-CUENTA UNTIL WS-EOF='Y' OR
               WS-SUCURSAL-ANTERIOR <> L_SUCURSAL-ID OR
               L_BANCO-ID <> WS-BANCO-ANTERIOR OR
               L_CUENTA <> WS-CUENTA-ANTERIOR.
           PERFORM GRABO-CUENTA.


       GRABO-CUENTA.

           MOVE SALDO_TOTAL_CUENTA TO WS-MONTO_TOTAL_CLIENTE
           WRITE  RESGISTRO-GRABAR FROM WS-FINAL-CUENTA AFTER 1.

       MISMA-CUENTA.
           MOVE L_SUBCUENTA TO WS-SUBCUENTA-ANTERIOR.
           MOVE 0 TO SALDO_TOTAL_SUBCUENTA.
           PERFORM MISMA-SUBCUENTA UNTIL WS-EOF='Y' OR
               WS-SUCURSAL-ANTERIOR <> L_SUCURSAL-ID OR
               L_BANCO-ID <> WS-BANCO-ANTERIOR OR
               L_CUENTA <> WS-CUENTA-ANTERIOR OR
               L_SUBCUENTA <> WS-SUBCUENTA-ANTERIOR.
           PERFORM GRABAR-SUBCUENTA.

       MISMA-SUBCUENTA.
          IF L_CODIGO='D'
           ADD L_IMPORTE TO SALDO_TOTAL_SUBCUENTA
           ADD L_IMPORTE TO SALDO_TOTAL_CUENTA
           ADD L_IMPORTE TO MONTOD
           ADD 1 TO CANTIDADD
          ELSE
              SUBTRACT L_IMPORTE FROM SALDO_TOTAL_SUBCUENTA
              SUBTRACT L_IMPORTE FROM SALDO_TOTAL_CUENTA
              ADD L_IMPORTE TO MONTOE
              ADD 1 TO CANTIDADE.
          PERFORM GRABAR-LINEA


           PERFORM LEO-MOVIMIENTO.

       GRABAR-SUBCUENTA.
           MOVE SALDO_TOTAL_SUBCUENTA TO WS-MONTO_TOTAL_CLIENTE_SUB
           WRITE  RESGISTRO-GRABAR FROM WS-FINAL-SUBCUENTA AFTER 1.


       GRABAR-LINEA.


          MOVE L_SUBCUENTA TO SUBCUENTA-DET
          MOVE L_CUENTA TO CUENTA-DET
          MOVE DIA TO DD
          MOVE MES TO MM
          MOVE ANIO TO AAAA
          MOVE L_IMPORTE TO IMPORTE-DET
          MOVE L_CODIGO TO  COD-DET.
          WRITE  RESGISTRO-GRABAR FROM  WS-DETALLE.




       GRABAR-ENCABEZADO.
           MOVE  WS-BANCO-ANTERIOR  TO BANCO-ENC-ID
           MOVE  WS-SUCURSAL-ANTERIOR  TO SUCURSAL-CODE
           ADD 1 TO NRO-HOJA
           WRITE RESGISTRO-GRABAR FROM  WS-ENCABEZADO1 AFTER PAGE
           WRITE RESGISTRO-GRABAR FROM WS-ENCABEZADO2
           WRITE RESGISTRO-GRABAR FROM WS-GUIONES
           WRITE RESGISTRO-GRABAR FROM WS-NOMBRES-COLUMNAS
           WRITE RESGISTRO-GRABAR FROM WS-GUIONES.


       END PROGRAM YOUR-PROGRAM-NAME.
