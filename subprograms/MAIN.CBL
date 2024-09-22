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
                     ZAHL2
           DISPLAY "Inhalt von Zahl vor UP: '" ZAHL "'"
           
           CALL "SUBMODULE" USING ZAHL
           
           DISPLAY "Inhalt von Zahl nach UP: '" ZAHL "'"
           
           
      *    Wie schaut es mit Zahl 2 aus?     
           DISPLAY "Inhalt von Zahl2 nach UP: '" ZAHL2"'"

      *    Warum ist der Wert von Zahl2 nun anders,
      *    obwohl die Variable nicht übergeben wurde? 
      *    ->          
           MOVE ADDRESS OF ZAHL TO TMP
           DISPLAY "Adresse von Zahl:  " TMP

           MOVE ADDRESS OF ZAHL2 TO TMP2
           DISPLAY "Adresse von Zahl2: " TMP2

           GOBACK
          .
       END PROGRAM MAIN.
