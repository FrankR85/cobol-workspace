       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ZAHL PIC 999.
       01 ZAHL2 PIC 999.
       01 TMP USAGE IS POINTER.
       01 TMP2 USAGE IS POINTER.
       PROCEDURE DIVISION.
      *    Programmlogik kommt hier.
           DISPLAY "Willkommen im Hauptprogramm!"

           MOVE 3 TO ZAHL
           MOVE ZEROS TO ZAHL2
           DISPLAY "Inhalt von Zahl2 vor UP: " ZAHL2
           CALL "SUBMODULE" USING ZAHL
           MOVE ADDRESS OF ZAHL TO TMP
           DISPLAY "Zahl:  " TMP

           MOVE ADDRESS OF ZAHL2 TO TMP2
           DISPLAY "Zahl2: " TMP2

           DISPLAY "Zahl2: " ZAHL2
           GOBACK
          .
       END PROGRAM MAIN.
