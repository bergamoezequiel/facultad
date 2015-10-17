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
       SELECT NovTimes1 ASSIGN TO "NovTimes1.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT NovTimes2 ASSIGN TO "NovTimes2.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT NovTimes3 ASSIGN TO "NovTimes3.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT Times1 ASSIGN TO "Times.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT TimesAct ASSIGN TO "TimesAct.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT PROFESORES ASSIGN TO "Profesores.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT SUCURSALES ASSIGN TO "Sucursales.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT TIPOS_CLASE ASSIGN TO "TiposClase.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT LISTADO_DE_HORAS ASSIGN TO "ListadoDeHoras.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD LISTADO_DE_HORAS LABEL RECORD IS STANDARD.
       01 LISTADO_DE_HORAS_REG PIC X(85).

       FD NovTimes1 LABEL RECORD IS STANDARD.
       01 NovTimes1_REG.
           03 NovTimes1_CLAVE.
               05 NOV1-NUMERO     PIC X(5).
               05 NOV1-FECHA.
                   07 NOV1_ANIO PIC 9(4).
                   07 NOV1_MES  PIC 9(2).
                   07 NOV1_DIA  PIC 9(2).
               05 NOV1-SUCURSAL PIC X(3).
           03 NOV1-TIP_CLASE PIC X(4).
           03 NOV1-HORAS PIC 9(2)V99.

       FD NovTimes2 LABEL RECORD IS STANDARD.
       01 NovTimes2_REG.
           03 NovTimes2_CLAVE.
               05 NOV2-NUMERO     PIC X(5).
               05 NOV2-FECHA.
                   07 NOV2_ANIO PIC 9(4).
                   07 NOV2_MES  PIC 9(2).
                   07 NOV2_DIA  PIC 9(2).
               05 NOV2-SUCURSAL PIC X(3).
           03 NOV2-TIP_CLASE PIC X(4).
           03 NOV2-HORAS PIC 9(2)V99.

       FD NovTimes3 LABEL RECORD IS STANDARD.
       01 NovTimes3_REG.
           03 NovTimes3_CLAVE.
               05 NOV3-NUMERO     PIC X(5).
               05 NOV3-FECHA.
                   07 NOV3_ANIO PIC 9(4).
                   07 NOV3_MES  PIC 9(2).
                   07 NOV3_DIA  PIC 9(2).
               05 NOV3-SUCURSAL PIC X(3).
           03 NOV3-TIP_CLASE PIC X(4).
           03 NOV3-HORAS PIC 9(3)V99.

       FD Times1 LABEL RECORD IS STANDARD.
       01 Times1_REG.
           03 Times1_CLAVE.
               05 TIM-NUMERO     PIC X(5).
               05 TIM-FECHA.
                   07 TIM_ANIO PIC 9(4).
                   07 TIM_MES  PIC 9(2).
                   07 TIM_DIA  PIC 9(2).
               05 TIM-SUCURSAL PIC X(3).
           03 TIM-TIP_CLASE PIC X(4).
           03 TIM-HORAS PIC 9(3)V99.

       FD TimesAct LABEL RECORD IS STANDARD.
       01 TimesAct_REG.
           03 TimesAct_CLAVE.
               05 TIMACT-NUMERO     PIC X(5).
               05 TIMACT-FECHA.
                   07 TIMACT_ANIO PIC 9(4).
                   07 TIMACT_MES  PIC 9(3).
                   07 TIMACT_DIA  PIC 9(3).
               05 TIMACT-SUCURSAL PIC X(3).
           03 TIMACT-TIP_CLASE PIC X(4).
           03 TIMACT-HORAS PIC 9(3)V99.



       FD PROFESORES LABEL RECORD IS STANDARD.
       01 PROFESORES_REG.
           03 PROF-NUMERO PIC X(5).
           03 PROF-DNI PIC 9(8).
           03 PROF-NOMBRE PIC X(25).
           03 PROF-DIRE PIC X(20).
           03 PROF-TEL PIC X(20).

       FD SUCURSALES LABEL RECORD IS STANDARD.
       01 SUCURSALES_REG.
           03 SUC-SUCURSAL PIC X(3).
           03 SUC-RAZON PIC X(25).
           03 SUC-DIRE PIC X(20).
           03 SUC-TEL PIC X(20).
           03 SUC-CUIT PIC 9(11).

       FD TIPOS_CLASE LABEL RECORD IS STANDARD.
       01 TIPOS_CLASE_REG.
           03 TIP-TIP_CLASE PIC X(4).
           03 TIP-DESC PIC X(20).
           03 TIP-TARIFA PIC 9(5)V99.
      *-----------------------
       WORKING-STORAGE SECTION.
       01 WS-EOF-NOV1 PIC X(2) VALUE "NO".
       01 WS-EOF-NOV2 PIC X(2) VALUE "NO".
       01 WS-EOF-NOV3 PIC X(2) VALUE "NO".
       01 WS-EOF-TIMES PIC X(2) VALUE "NO".
       01 WS-EOF-SUCURSALES PIC X(2) VALUE "NO".
       01 WS-EOF-PROFESORES PIC X(2) VALUE "NO".
       01 WS-EOF-TIPOS-CLASE PIC X(2) VALUE "NO".

       01 SUBINDICE PIC 9(2) VALUE ZERO.

       01 TABLA-TIPOS-CLASE.
           03 ELEMENTO OCCURS 50 TIMES.
               05 VEC-TIP_CLASE PIC X(4).
               05 VEC-DESC PIC X(20).
               05 VEC-TARIFA PIC 9(5)V99.

       01 MENOR.
             03 MENOR-NUMERO PIC X(5).
             03 MENOR-FECHA PIC 9(8).
             03 MENOR-SUCURSAL PIC X(3).


       01 IMPORTE-TOTAL-X-PROFESOR PIC 9(9)V99.
       01 HORAS-TOTAL-X-PROFESOR PIC 9(4)V99.

       01 PROFESOR-ANTERIOR PIC X(5).

       01 IMPORTE-TOTAL-X-FECHA PIC 9(8)V99.
       01 HORAS-TOTAL-X-FECHA PIC 9(3)V99.

       01 IMPORTE-TOTAL-GRAL PIC 9(10)V99.


       01 FECHA-ANTERIOR PIC 9(8).

       01 WS-LINEAS PIC 9(2).
      *LONGITUD DE ENCABEZADO1 = 60
       01  ENCABEZADO1.
           03 FILLER PIC X(7) VALUE "Fecha: ".
           03 ENC1-FECHA.
               05 ENC1-DD PIC X(2).
               05 FILLER PIC X VALUE "/".
               05 ENC1-MM PIC X(2).
               05 FILLER PIC X VALUE "/".
               05 ENC1-AAAA PIC X(4).
           03 FILLER PIC X(35) VALUE SPACES.
           03 FILLER PIC X(5) VALUE "Hoja ".
           03 ENC1-NRO-HOJA PIC 999.

       01 ENCABEZADO2.
           03 FILLER PIC X(16) VALUE SPACES.
           03 FILLER PIC X(26) VALUE "Listado de horas aplicadas".
           03 FILLER PIC X(18) VALUE SPACES.

       01 ENCABEZADO3.
           03 FILLER PIC X(10) VALUE "Profesor: ".
           03 ENC3-NUMERO PIC X(5).
           03 FILLER PIC X(10).
           03 FILLER PIC X(8) VALUE "Nombre: ".
           03 ENC3-NOMBRE PIC X(25).
           03 FILLER PIC X(12) VALUE SPACES.

       01 ENCABEZADO4.
           03 FILLER PIC X(3) VALUE SPACES.
           03 FILLER PIC X(5) VALUE "Fecha".
           03 FILLER PIC X(3) VALUE SPACES.
           03 FILLER PIC X(8) VALUE "Sucursal".
           03 FILLER PIC X(3) VALUE SPACES.
           03 FILLER PIC X(13) VALUE "Tipo de clase".
           03 FILLER PIC X(8) VALUE SPACES.
           03 FILLER PIC X(6) VALUE "Tarifa".
           03 FILLER PIC X(3) VALUE SPACES.
           03 FILLER PIC X(5) VALUE "Horas".
           03 FILLER PIC X(4) VALUE SPACES.
           03 FILLER PIC X(7) VALUE "Importe".
           03 FILLER PIC X(3) VALUE SPACES.

       01 ENCABEZADO5.
           03 GUION OCCURS 60 TIMES.
              05 FILLER PIC X VALUE "-" .

       01  WS-CURRENT-DATE-FIELDS.
             05  WS-CURRENT-DATE.
                 10  WS-CURRENT-YEAR    PIC  9(4).
                 10  WS-CURRENT-MONTH   PIC  9(2).
                 10  WS-CURRENT-DAY     PIC  9(2).
             05  WS-CURRENT-TIME.
                 10  WS-CURRENT-HOUR    PIC  9(2).
                 10  WS-CURRENT-MINUTE  PIC  9(2).
                 10  WS-CURRENT-SECOND  PIC  9(2).
                 10  WS-CURRENT-MS      PIC  9(2).
             05  WS-DIFF-FROM-GMT       PIC S9(4).

       01 REGISTRO-LISTADO.
           05 REG-FECHA.
               07 REG-DD PIC X(2).
               07 FILLER PIC X VALUE "/".
               07 REG-MM PIC X(2).
               07 FILLER PIC X VALUE "/".
               07 REG-AAAA PIC X(4).
           05 FILLER PIC X(3) VALUE SPACES.
           05 REG-SUC PIC X(3).
           05 FILLER PIC X(5) VALUE SPACES.
           05 REG-TIPO-DE-CLASE PIC X(20).
           05 FILLER PIC X VALUE SPACES.
           05 REG-TARIFA PIC ZZZZ9,99.
           05 FILLER PIC X VALUE SPACES.
           05 REG-HORAS PIC z9,99.
           05 FILLER PIC X(3) VALUE SPACES.
           05 REG-IMPORTE PIC ZZZZZZ9,99.

       01 IMPORTE-AUX PIC 9(7)V99.

       01 TIPO-A-BUSCAR PIC X(4).


       01 MENOR-ACTUAL.
           03 MENOR-ACTUAL_CLAVE.
               05 MENOR-ACTUAL-NUMERO     PIC X(5).
               05 MENOR-ACTUAL-FECHA.
                   07 MENOR-ACTUAL_ANIO PIC 9(4).
                   07 MENOR-ACTUAL_MES  PIC 9(2).
                   07 MENOR-ACTUAL_DIA  PIC 9(2).
               05 MENOR-ACTUAL-SUCURSAL PIC X(3).
           03 MENOR-ACTUAL-TIP_CLASE PIC X(4).
           03 MENOR-ACTUAL-HORAS PIC 9(2)V99.


       01 LINEA_TOTALXFECHA.
           03 FILLER PIC X(50) VALUE "TOTALES POR FECHA".
           03 L_TOTALXFECHA_HORAS  PIC ZZ9,99.
           03 FILLER PIC X(2) VALUE SPACES.
           03 L_TOTALXFECHA_IMPORTE PIC ZZZZZZZ9,99.

       01 LINEA_TOTALXPROF.
           03 FILLER PIC X(50) VALUE "TOTALES POR PROFESOR".
           03 L_TOTALXPROF_HORAS  PIC ZZ9,99.
           03 FILLER PIC X VALUE SPACES.
           03 L_TOTALXPROF_IMPORTE PIC ZZZZZZZZ9,99.

       01 LINEA_SEP_TOTALXFECHA.
        03 FILLER PIC X(40) VALUE SPACES.
        03 FILLER PIC X(20) VALUE "-------------".

       03 BLANCO PIC X(40) VALUE SPACES.

       01 LINEA_TOTALGRAL.
           03 FILLER PIC X(56) VALUE "TOTAL GENERAL".
           03 L_TOTALGRAL_IMPORTE PIC ZZZZZZZZZ9,99.

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **

            PERFORM INICIO
            PERFORM INICIALIZAR_PARTE_B
            PERFORM LEER_NOV1
            PERFORM LEER_NOV2
            PERFORM LEER_NOV3
            PERFORM LEER_Times
            PERFORM LEER_PROFESOR
            PERFORM CARGAR-TIPOS-CLASE-A-VECTOR.
            MOVE 0 TO IMPORTE-TOTAL-GRAL
            PERFORM DETERMINAR-MENOR.
            PERFORM HAY-ARCHIVOS-CON-REGISTROS UNTIL
                WS-EOF-NOV1="SI" AND WS-EOF-NOV2="SI" AND
               WS-EOF-NOV3="SI" AND WS-EOF-TIMES="SI".


            PERFORM IMPRIMIR-ESTADISTICO.

            PERFORM GRABAR-TOTAL-GENERAL.
            PERFORM FIN
            STOP RUN.

       INICIO.
           OPEN INPUT NovTimes1
           OPEN INPUT NovTimes2
           OPEN INPUT NovTimes3
           OPEN INPUT Times1
           OPEN INPUT PROFESORES
      *     OPEN INPUT SUCURSALES
           OPEN INPUT TIPOS_CLASE
           OPEN OUTPUT TimesAct.
           OPEN OUTPUT LISTADO_DE_HORAS.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-FIELDS
           MOVE WS-CURRENT-YEAR TO ENC1-AAAA.
           MOVE WS-CURRENT-MONTH TO ENC1-MM.
           MOVE WS-CURRENT-DAY  TO ENC1-DD.

       FIN.
           CLOSE NovTimes1
           CLOSE NovTimes2
           CLOSE NovTimes3
           CLOSE Times1
           CLOSE PROFESORES
      *     CLOSE SUCURSALES
           CLOSE TIPOS_CLASE
           CLOSE TimesAct
           CLOSE LISTADO_DE_HORAS.

       LEER_NOV1.
           READ NovTimes1
               AT END
                   MOVE "SI" TO WS-EOF-NOV1
                   MOVE  HIGH-VALUE TO NovTimes1_CLAVE.

       LEER_NOV2.
           READ NovTimes2
               AT END
                   MOVE "SI" TO WS-EOF-NOV2
                   MOVE  HIGH-VALUE TO NovTimes2_CLAVE.

       LEER_NOV3.
            READ NovTimes3
               AT END
                   MOVE "SI" TO WS-EOF-NOV3
                   MOVE  HIGH-VALUE TO NovTimes3_CLAVE.

       LEER_Times.
            READ Times1
               AT END
                   MOVE "SI" TO WS-EOF-TIMES
                   MOVE  HIGH-VALUE TO Times1_CLAVE.

       LEER_PROFESOR.
              READ PROFESORES
                   AT END
                       MOVE "SI" TO  WS-EOF-PROFESORES
                       MOVE HIGH-VALUE TO PROF-NUMERO.

       LEER_TIPOS_CLASE.

           READ TIPOS_CLASE
               AT END
                   MOVE "SI" TO WS-EOF-TIPOS-CLASE.

       CARGAR-REGISTRO.
           MOVE TIPOS_CLASE_REG TO ELEMENTO(SUBINDICE)
           ADD 1 TO SUBINDICE

           PERFORM LEER_TIPOS_CLASE.


       CARGAR-TIPOS-CLASE-A-VECTOR.

           PERFORM LEER_TIPOS_CLASE
           MOVE 1 TO SUBINDICE

           PERFORM CARGAR-REGISTRO UNTIL
               WS-EOF-TIPOS-CLASE="SI" or SUBINDICE>50.


       DETERMINAR-MENOR.
           MOVE Times1_CLAVE TO MENOR.
           IF MENOR>NovTimes1_CLAVE THEN
               MOVE NovTimes1_CLAVE TO MENOR

           END-IF
           IF MENOR>NovTimes2_CLAVE THEN
               MOVE NovTimes2_CLAVE TO MENOR

           END-IF
           IF MENOR>NovTimes3_CLAVE THEN
               MOVE NovTimes3_CLAVE TO MENOR

           END-IF.



       HAY-ARCHIVOS-CON-REGISTROS.
           MOVE 0 TO IMPORTE-TOTAL-X-PROFESOR
           MOVE 0 TO HORAS-TOTAL-X-PROFESOR
           MOVE MENOR-NUMERO TO PROFESOR-ANTERIOR
           DISPLAY "EL PROFESOR ANTERIOR ES"PROFESOR-ANTERIOR
           MOVE 60 TO WS-LINEAS
           DISPLAY WS-LINEAS
           PERFORM MISMO-PROFESOR UNTIL
                   (WS-EOF-NOV1="SI" AND WS-EOF-NOV2="SI" AND
                   WS-EOF-NOV3="SI" AND WS-EOF-TIMES="SI") OR
                   PROFESOR-ANTERIOR<>MENOR-NUMERO.
           PERFORM GRABAR-TOTAL-X-PROFESOR.


       MISMO-PROFESOR.
           MOVE 0 TO IMPORTE-TOTAL-X-FECHA.
           MOVE 0 TO HORAS-TOTAL-X-FECHA.
           MOVE MENOR-FECHA TO FECHA-ANTERIOR.
           PERFORM MISMO-PROFESOR-Y-FECHA UNTIL
               (WS-EOF-NOV1="SI" AND WS-EOF-NOV2="SI" AND
                WS-EOF-NOV3="SI" AND WS-EOF-TIMES="SI") OR
                PROFESOR-ANTERIOR<>MENOR-NUMERO OR
                FECHA-ANTERIOR<>MENOR-FECHA.
      *FALTAN AGREGAR GUIONES
           PERFORM GRABAR-TOTAL-X-FECHA.



       MISMO-PROFESOR-Y-FECHA.
           PERFORM POS-NOV1  UNTIL
                           WS-EOF-NOV1='SI' OR
                           NovTimes1_CLAVE<>MENOR.
           PERFORM POS-NOV2 UNTIL
                           WS-EOF-NOV2='SI' OR
                           NovTimes2_CLAVE<>MENOR.
           PERFORM POS-NOV3 UNTIL
                           WS-EOF-NOV3='SI' OR
                           NovTimes3_CLAVE<>MENOR.
           PERFORM POS-TIMES UNTIL
                           WS-EOF-TIMES='SI' OR
                           Times1_CLAVE<>MENOR.

           PERFORM DETERMINAR-MENOR.

       POS-NOV1.

           MOVE NovTimes1_REG TO MENOR-ACTUAL
           PERFORM PROCESAR-MENOR-ACTUAL.
           PERFORM LEER_NOV1.

       PROCESAR-MENOR-ACTUAL.

           WRITE TimesAct_REG FROM MENOR-ACTUAL.
           PERFORM ACTUALIZAR-ESTADISTICO.

           MOVE MENOR-ACTUAL_ANIO TO REG-AAAA.
           MOVE MENOR-ACTUAL_MES TO REG-MM.
           MOVE MENOR-ACTUAL_DIA TO REG-DD.

           MOVE MENOR-ACTUAL-SUCURSAL TO REG-SUC.
           MOVE MENOR-ACTUAL-TIP_CLASE TO TIPO-A-BUSCAR

           PERFORM BUSCAR-TIPO-DE-CLASE.
           IF SUBINDICE<=50 THEN
               MOVE VEC-DESC(SUBINDICE) TO REG-TIPO-DE-CLASE

               MOVE VEC-TARIFA(SUBINDICE) TO REG-TARIFA
               MOVE MENOR-ACTUAL-HORAS TO REG-HORAS
               COMPUTE IMPORTE-AUX = MENOR-ACTUAL-HORAS *
                                           VEC-TARIFA(SUBINDICE)
                MOVE IMPORTE-AUX TO REG-IMPORTE


            END-IF
            PERFORM VERIFICAR-CANTIDAD-DE-LINEAS
            WRITE LISTADO_DE_HORAS_REG FROM REGISTRO-LISTADO.
            ADD 1 TO WS-LINEAS.
            DISPLAY WS-LINEAS.
            ADD MENOR-ACTUAL-HORAS TO HORAS-TOTAL-X-PROFESOR.
            ADD MENOR-ACTUAL-HORAS TO HORAS-TOTAL-X-FECHA.
            IF VEC-TIP_CLASE(SUBINDICE)=TIPO-A-BUSCAR THEN
               ADD IMPORTE-AUX TO IMPORTE-TOTAL-X-PROFESOR
               ADD IMPORTE-AUX TO IMPORTE-TOTAL-X-FECHA
               ADD IMPORTE-AUX TO IMPORTE-TOTAL-GRAL
            END-IF.
       POS-NOV2.

            MOVE NovTimes2_REG TO MENOR-ACTUAL
            PERFORM PROCESAR-MENOR-ACTUAL.
            PERFORM LEER_NOV2.
       POS-NOV3.

            MOVE NovTimes3_REG TO MENOR-ACTUAL
            PERFORM PROCESAR-MENOR-ACTUAL.
            PERFORM LEER_NOV3.
       POS-TIMES.

            MOVE Times1_REG TO MENOR-ACTUAL
            PERFORM PROCESAR-MENOR-ACTUAL.
            PERFORM LEER_Times.
       BUSCAR-TIPO-DE-CLASE.
           MOVE 1 TO SUBINDICE.
           PERFORM AVANZAR-SUBINDICE UNTIL
                               SUBINDICE>50 OR
                               VEC-TIP_CLASE(SUBINDICE)=TIPO-A-BUSCAR.

       AVANZAR-SUBINDICE.
           ADD 1 TO SUBINDICE.

       GRABAR-TOTAL-X-FECHA.
           PERFORM VERIFICAR-CANTIDAD-DE-LINEAS.
           WRITE LISTADO_DE_HORAS_REG FROM LINEA_SEP_TOTALXFECHA.
           ADD 1 TO WS-LINEAS.
           DISPLAY WS-LINEAS.

           MOVE HORAS-TOTAL-X-FECHA TO L_TOTALXFECHA_HORAS.
           MOVE IMPORTE-TOTAL-X-FECHA TO L_TOTALXFECHA_IMPORTE.
           PERFORM VERIFICAR-CANTIDAD-DE-LINEAS
           WRITE LISTADO_DE_HORAS_REG FROM LINEA_TOTALXFECHA.
           ADD 1 TO WS-LINEAS.
           display WS-LINEAS.
           IF PROFESOR-ANTERIOR = MENOR-NUMERO THEN
               PERFORM VERIFICAR-CANTIDAD-DE-LINEAS
               WRITE LISTADO_DE_HORAS_REG FROM BLANCO
               ADD 1 TO WS-LINEAS
               PERFORM VERIFICAR-CANTIDAD-DE-LINEAS
               WRITE LISTADO_DE_HORAS_REG FROM ENCABEZADO4
               ADD 1 TO WS-LINEAS
               PERFORM VERIFICAR-CANTIDAD-DE-LINEAS
               WRITE LISTADO_DE_HORAS_REG FROM ENCABEZADO5
               ADD 1 TO WS-LINEAS
               DISPLAY WS-LINEAS
            END-IF.
       GRABAR-TOTAL-X-PROFESOR.
           MOVE HORAS-TOTAL-X-PROFESOR TO L_TOTALXPROF_HORAS.
           MOVE IMPORTE-TOTAL-X-PROFESOR TO L_TOTALXPROF_IMPORTE.
           PERFORM VERIFICAR-CANTIDAD-DE-LINEAS.
           WRITE LISTADO_DE_HORAS_REG FROM LINEA_TOTALXPROF.
           ADD 1 TO WS-LINEAS.
           DISPLAY WS-LINEAS.


       GRABAR-TOTAL-GENERAL.
           MOVE IMPORTE-TOTAL-GRAL TO L_TOTALGRAL_IMPORTE.
           PERFORM VERIFICAR-CANTIDAD-DE-LINEAS.
           WRITE LISTADO_DE_HORAS_REG FROM LINEA_TOTALGRAL.
       GRABAR-ENCABEZADO.
           ADD 1 TO ENC1-NRO-HOJA
           MOVE MENOR-NUMERO TO ENC3-NUMERO
           PERFORM LEER_PROFESOR UNTIL WS-EOF-PROFESORES='SI' OR
               PROF-NUMERO>=MENOR-NUMERO.
           IF PROF-NUMERO=MENOR-NUMERO THEN
               MOVE PROF-NOMBRE TO ENC3-NOMBRE
           ELSE
               MOVE SPACES TO ENC3-NOMBRE
           END-IF
           WRITE LISTADO_DE_HORAS_REG FROM ENCABEZADO1 AFTER PAGE.
           WRITE LISTADO_DE_HORAS_REG FROM ENCABEZADO2.
           WRITE LISTADO_DE_HORAS_REG FROM ENCABEZADO3 AFTER 1.
           WRITE LISTADO_DE_HORAS_REG FROM ENCABEZADO4 AFTER 1.
           WRITE LISTADO_DE_HORAS_REG FROM ENCABEZADO5.
           MOVE 7 TO WS-LINEAS.
           DISPLAY "LA CANTIDAD DE LINEAS ES"WS-LINEAS.
º
       VERIFICAR-CANTIDAD-DE-LINEAS.
           IF WS-LINEAS >= 60 THEN
               PERFORM GRABAR-ENCABEZADO
           END-IF.

       INICIALIZAR_PARTE_B.
       IMPRIMIR-ESTADISTICO.
       ACTUALIZAR-ESTADISTICO.

      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
