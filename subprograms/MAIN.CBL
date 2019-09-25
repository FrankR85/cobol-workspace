       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ZAHL PIC 999.
       PROCEDURE DIVISION.
      *    Programmlogik kommt hier.
           DISPLAY "Willkommen im Hauptprogramm!"

           MOVE 3 TO ZAHL

           CALL "SUBMODULE" USING ZAHL

           GOBACK
          .
       END PROGRAM MAIN.
