       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ZAHL  PIC 9.
       PROCEDURE DIVISION.
      *    Programmlogik kommt hier.
           DISPLAY "Hallo. Bitte eine Zahl eingeben, danke!"
           ACCEPT ZAHL
           IF ZAHL = 5 THEN
              DISPLAY "Hello, World!"
           ELSE
              DISPLAY "Hallo, Welt!"
           END-IF
           GOBACK
          .
       END PROGRAM HELLOWORLD.