       IDENTIFICATION DIVISION.
       PROGRAM-ID.  MAIN.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
             SELECT ZAHLEN-IN ASSIGN TO 'zahlen.txt'
             ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
          FD ZAHLEN-IN.
          01 ZAHLEN-IN-FILE.
             05 ZAHL-FILE PIC 9(5).
       WORKING-STORAGE SECTION.
       01 ZAHL PIC 9(05).
       01 WS-EOF PIC X(1).
       PROCEDURE DIVISION.
           DISPLAY 'HELLO WORLD'
           OPEN INPUT ZAHLEN-IN
              PERFORM UNTIL WS-EOF="Y"
                 READ ZAHLEN-IN INTO ZAHL
                   AT END MOVE "Y" TO WS-EOF
                   NOT AT END
                      PERFORM HANDLE-ZAHL
                 END-READ
              END-PERFORM
           CLOSE ZAHLEN-IN
           STOP RUN.
        HANDLE-ZAHL SECTION.
           DISPLAY ZAHL
           .
