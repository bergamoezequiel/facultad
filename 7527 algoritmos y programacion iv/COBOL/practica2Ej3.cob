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
       SELECT maestroCC ASSIGN TO "EntradaEjercicio3.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT resumen ASSIGN TO "resumen.dat"
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
           05 WS-MONTO_TOTAL_CLIENTE PIC S9(14).



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
       01 WS-PRIMER-SUBCUENTA PIC A(1) VALUE 'S'.
       01 WS-PRIMER-CUENTA PIC A(1) VALUE 'S'.
       01 WS-PRIMER-SUCURSAL-BANCO PIC A(1) VALUE 'S'.

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
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-FIELDS
           MOVE WS-CURRENT-YEAR2 TO AA-ENC.
           MOVE WS-CURRENT-MONTH TO MM-ENC.
           MOVE WS-CURRENT-DAY  TO DD-ENC.

           OPEN INPUT maestroCC.
           OPEN OUTPUT resumen.
           PERFORM UNTIL WS-EOF='Y'
               READ maestroCC INTO WS-BANCOS-FILE
                   AT END MOVE 'Y' TO WS-EOF
                   NOT AT END
                       display WS-BANCOS-FILE
                       PERFORM PROCESAR-REGISTRO
               END-READ
           END-PERFORM.
      *Se escribe el total del ultimo cliente y el total final
           CLOSE maestroCC.
           CLOSE resumen.
           STOP RUN.

       PROCESAR-REGISTRO.

           IF (WS-PRIMER-SUCURSAL-BANCO= 'S') OR
               (WS-BANCO-ANTERIOR <> L_BANCO-ID) OR
               (L_SUCURSAL-ID <> WS-SUCURSAL-ANTERIOR)THEN
               PERFORM INICIALIZACION_BANCOoSUCURSAL.
      *         PERFORM ESCRIBIR_DATOS
           display "llego"

           IF WS-CUENTA-ANTERIOR <> L_CUENTA OR
               WS-PRIMER-CUENTA ='S' THEN
                   display "paso"
                   MOVE L_CUENTA TO CUENTA-DET
                   MOVE L_SUBCUENTA TO SUBCUENTA-DET
                   MOVE DIA TO  DD
                   MOVE MES TO MM
                   MOVE ANIO TO AAAA
                   MOVE L_IMPORTE TO IMPORTE-DET
                   MOVE L_CODIGO TO COD-DET
                   WRITE  RESGISTRO-GRABAR FROM  WS-DETALLE
                   MOVE L_CUENTA TO WS-CUENTA-ANTERIOR
                   MOVE L_SUBCUENTA TO WS-SUBCUENTA-ANTERIOR
                   MOVE 'N' TO WS-PRIMER-SUBCUENTA
                   MOVE 'N' TO WS-PRIMER-CUENTA
            ELSE
                IF WS-SUBCUENTA-ANTERIOR =  L_SUBCUENTA THEN
                   MOVE SPACE TO SUBCUENTA-DET
                ELSE
                   MOVE L_SUBCUENTA TO SUBCUENTA-DET
                   PERFORM GRABAR_SALDO_SUBCUENTA
                END-IF
                MOVE SPACE TO CUENTA-DET
                MOVE DIA TO  DD
                MOVE MES TO MM
                MOVE ANIO TO AAAA
                MOVE L_IMPORTE TO IMPORTE-DET
                MOVE L_CODIGO TO COD-DET
                WRITE  RESGISTRO-GRABAR FROM  WS-DETALLE
                MOVE L_CUENTA TO WS-CUENTA-ANTERIOR
                MOVE L_SUBCUENTA TO WS-SUBCUENTA-ANTERIOR
           END-IF.








       INICIALIZACION_BANCOoSUCURSAL.

           MOVE L_BANCO-ID TO WS-BANCO-ANTERIOR
           MOVE  L_BANCO-ID  TO BANCO-ENC-ID
           MOVE  L_SUCURSAL-ID  TO SUCURSAL-CODE
           MOVE  L_SUCURSAL-ID  TO WS-SUCURSAL-ANTERIOR
           ADD 1 TO NRO-HOJA
           WRITE RESGISTRO-GRABAR FROM  WS-ENCABEZADO1 AFTER PAGE
           WRITE  RESGISTRO-GRABAR FROM WS-ENCABEZADO2
           WRITE RESGISTRO-GRABAR FROM WS-GUIONES
           WRITE RESGISTRO-GRABAR FROM WS-NOMBRES-COLUMNAS
           WRITE RESGISTRO-GRABAR FROM WS-GUIONES
           MOVE "S" TO WS-PRIMER-SUBCUENTA
           MOVE "S" TO WS-PRIMER-CUENTA
           MOVE "N" TO WS-PRIMER-SUCURSAL-BANCO.

       GRABAR_SALDO_SUBCUENTA.
                   MOVE SALDO_TOTAL_SUBCUENTA TO WS-MONTO_TOTAL_CLIENTE.




       END PROGRAM YOUR-PROGRAM-NAME.
