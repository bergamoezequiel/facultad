
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  SeqWrite.

      * Example program showing how to create a sequential file
      * using the ACCEPT and the WRITE verbs.
      * Note: In this version of COBOL pressing the Carriage Return (CR)
      * without entering any data results in StudentDetails being filled
      * with spaces.


       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT StudentFile ASSIGN TO "STUDENTS.DAT"
             ORGANIZATION IS LINE SEQUENTIAL.

       SELECT CLIENTES ASSIGN TO "CLIENTES.DAT"
             ORGANIZATION IS INDEXED
             ACCESS IS DYNAMIC
             RECORD KEY IS CLIENTES_CLAVE
             STATUS IS WS-STATUS.

       DATA DIVISION.
       FILE SECTION.

       FD CLIENTES LABEL RECORD IS STANDARD.
       01 CLIENTES_REC.
           03 CLIENTES_CLAVE.
               05 CLIENTES_COD     PIC 9(5).
           03 CLIENTES_NOMBRE      PIC X(50).
           03 CLIENTES_APELLIDO    PIC X(50).
           03 CLIENTES_FNAC.
               05 CLIENTES_AA      PIC 9(4).
               05 CLIENTES_MM      PIC 9(2).
               05 CLIENTES_DD      PIC 9(2).

       FD StudentFile.
       01 StudentDetails.
           02  StudentId       PIC 9(7).
           02  StudentName.
               03 Surname      PIC X(8).
               03 Initials     PIC XX.
           02  DateOfBirth.
               03 YOBirth      PIC 9(4).
               03 MOBirth      PIC 9(2).
               03 DOBirth      PIC 9(2).
           02  CourseCode      PIC X(4).
           02  Gender          PIC X.
       WORKING-STORAGE SECTION.
      *ws-ok se pone en true cuando ws-status es 00
       01 WS-STATUS            PIC X(2).
           88 WS-OK            VALUE "00".



       PROCEDURE DIVISION.
       Begin.
           OPEN OUTPUT StudentFile
           DISPLAY "Enter student details using template below.  Ente"
           PERFORM GetStudentDetails
           WRITE StudentDetails

           OPEN OUTPUT CLIENTES

           INITIALIZE CLIENTES_REC

           MOVE 1         TO CLIENTES_COD
           MOVE "Pepe"    TO CLIENTES_NOMBRE
           MOVE "Lopez"   TO CLIENTES_APELLIDO
           MOVE 19810417  TO CLIENTES_FNAC

           WRITE CLIENTES_REC

           MOVE 2         TO CLIENTES_COD
           MOVE "Pedro"    TO CLIENTES_NOMBRE
           MOVE "Gomez"   TO CLIENTES_APELLIDO
           MOVE 19810613  TO CLIENTES_FNAC

           WRITE CLIENTES_REC

           MOVE 3         TO CLIENTES_COD
           MOVE "Juan"    TO CLIENTES_NOMBRE
           MOVE "Perez"   TO CLIENTES_APELLIDO
           MOVE 19810711  TO CLIENTES_FNAC

           WRITE CLIENTES_REC

           CLOSE CLIENTES

           OPEN INPUT CLIENTES.

           INITIALIZE CLIENTES_CLAVE

           MOVE 2 TO CLIENTES_COD

           READ CLIENTES INVALID KEY
               DISPLAY "CLIENTE INEXISTENTE."
           NOT INVALID KEY
               DISPLAY CLIENTES_NOMBRE
           END-READ

           CLOSE CLIENTES

           OPEN I-O CLIENTES

           MOVE 2 TO CLIENTES_COD

           READ CLIENTES INVALID KEY
               DISPLAY "CLIENTE INEXISTENTE."
           NOT INVALID KEY
               MOVE "Otro"  TO CLIENTES_NOMBRE
               REWRITE CLIENTES_REC INVALID KEY
                   DISPLAY "Error al grabar"
               END-REWRITE
           END-READ

           CLOSE CLIENTES

           OPEN INPUT CLIENTES.

           INITIALIZE CLIENTES_CLAVE

           MOVE 2 TO CLIENTES_COD

           READ CLIENTES INVALID KEY
               DISPLAY "CLIENTE INEXISTENTE."
           NOT INVALID KEY
               DISPLAY CLIENTES_NOMBRE
           END-READ

           CLOSE CLIENTES

           OPEN I-O CLIENTES

           MOVE 2 TO CLIENTES_COD

           READ CLIENTES INVALID KEY
               DISPLAY "CLIENTE INEXISTENTE."
           NOT INVALID KEY
               DELETE CLIENTES INVALID KEY
                   DISPLAY "Error al grabar"
               END-DELETE
           END-READ

           CLOSE CLIENTES

           OPEN INPUT CLIENTES

           INITIALIZE CLIENTES_CLAVE

           MOVE 2 TO CLIENTES_COD

           READ CLIENTES INVALID KEY
               DISPLAY "CLIENTE INEXISTENTE."
           NOT INVALID KEY
               DISPLAY CLIENTES_NOMBRE
           END-READ

           CLOSE CLIENTES

           CLOSE StudentFile
           OPEN INPUT CLIENTES

           INITIALIZE CLIENTES_CLAVE

           START CLIENTES KEY NOT LESS THAN CLIENTES_CLAVE
               INVALID KEY
                   DISPLAY "IMPOSIBLE INICIAR RECORRIDO"
               NOT INVALID KEY

                   READ CLIENTES NEXT
                   PERFORM UNTIL NOT WS-OK
                       DISPLAY CLIENTES_NOMBRE
                       READ CLIENTES NEXT
                   END-PERFORM

           END-START

           CLOSE CLIENTES

           STOP RUN.

       GetStudentDetails.
           DISPLAY "Enter - StudId, Surname, Initiader".
           DISPLAY "NNNNNNNSSSSSSSSIIYYYYMMDDCCCCG".
           ACCEPT  StudentDetails.
