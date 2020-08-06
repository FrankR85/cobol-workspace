       IDENTIFICATION DIVISION.
       PROGRAM-ID.  TTTM.
      *****************************************************************
      * Implementation des TIC TACT TOE Spiels.
      *****************************************************************       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * 3x3 Matrix des Spielfeldes
       01 SPIELFELD.
         02 Y-SPALTE OCCURS 3 TIMES.
           03 X-SPALTE OCCURS 3 TIMES.
             04 FELD PIC X.
      * Welches Spieler am Zug ist
       01 AKTIVER-SPIELER PIC X.
         88 AKTIVER-SPIELER-X VALUE 'X'.
         88 AKTIVER-SPIELER-O VALUE 'O'.

      * Status nach der letzten Eingabe
       01 SPIEL-STATUS PIC X(500).
         88 STATUS-LAUFEND VALUE 'Laufend'.
         88 STATUS-SIEG VALUE 'Sieg'.
         88 STATUS-UNENTSCHIEDEN VALUE 'Unentschieden'.
         88 STATUS-FEHLER-EINGABE
            VALUE 'FEHLER: Ungültige Eingabe'.
      * Eingabe des Spieler
       01 EINGABE.
         02 EINGABE-X PIC 9.
         02 FILLER PIC X.
         02 EINGABE-Y PIC 9.
      * Nummer des Zuges
       01 ZUG PIC 9.
      * Indices
       01 IX.
         02 IX-Y PIC 9.
       PROCEDURE DIVISION.
           PERFORM INIT
           
           PERFORM UNTIL NOT STATUS-LAUFEND
             PERFORM DISPLAY-SPIELFELD
             DISPLAY AKTIVER-SPIELER ' ist am Zug.'
               ' Bitte 2 mit einem Zeichen getrennte Zahlen eingeben'
             PERFORM WITH TEST AFTER UNTIL STATUS-LAUFEND
               ACCEPT EINGABE
               PERFORM PRUEFE-LESE-EINGABE
             END-PERFORM
             PERFORM PRUEFE-SPIELSTATUS
           END-PERFORM

           STOP RUN.

      *-----------------------------------------------------------------   
      * Programminitialisierung     
       INIT SECTION.
           MOVE SPACE TO SPIELFELD
           SET AKTIVER-SPIELER-X TO TRUE
           SET STATUS-LAUFEND TO TRUE
           MOVE SPACE TO EINGABE
           MOVE 1 TO ZUG
           EXIT.
      
      *-----------------------------------------------------------------
      * Displayed das Spielfeld
        DISPLAY-SPIELFELD SECTION.
           DISPLAY '+X123'
           DISPLAY 'Y+---'
           PERFORM VARYING IX-Y FROM 1 BY 1 UNTIl IX-Y > 3
             DISPLAY IX-Y '|' Y-SPALTE(IX-Y)
           END-PERFORM
           EXIT.
      *-----------------------------------------------------------------
      * Prueft ob die Eingabe gültig ist 
      * und liest sie in diesem Fall ein.   
       PRUEFE-LESE-EINGABE SECTION.
           EVALUATE TRUE
             WHEN EINGABE-X IS NOT NUMERIC
             WHEN EINGABE-Y IS NOT NUMERIC
             WHEN EINGABE-X > 3
             WHEN EINGABE-Y > 3
             WHEN FELD(EINGABE-Y,EINGABE-X) NOT = SPACE
               SET STATUS-FEHLER-EINGABE TO TRUE
               DISPLAY 'Fehlerhafte Eingabe. Bitte neu eingeben. '
             WHEN OTHER
      *        Gültige Eingabe
               MOVE AKTIVER-SPIELER TO FELD (EINGABE-Y,EINGABE-X)
               SET STATUS-LAUFEND TO TRUE
               ADD 1 TO ZUG
           END-EVALUATE   
           EXIT.
      
      *-----------------------------------------------------------------
      * Prüft den Spielstatus nach dem letzten Zug
      * (gewonnen, unentschieden, laufend)
       PRUEFE-SPIELSTATUS SECTION.
      
      * 1. Prüfung waagerecht
      * 2. Prüfung senkrecht
      * 3. Pürfung diagonal
      * 4. Spielerwechsel
      * INFO Der COBOL-UNIT-TEST verträgt keine Kommentare im Evaluate.
      *      Führt zu Punkten im Sourc-Code
           EVALUATE TRUE
           WHEN Y-SPALTE(EINGABE-Y)  = ('OOO' OR 'XXX')
           WHEN FELD(1,EINGABE-X) = FELD(2,EINGABE-X) AND
                FELD(2,EINGABE-X) = FELD(3,EINGABE-X) AND
                FELD(3,EINGABE-X) = AKTIVER-SPIELER
           WHEN FELD(2,2) = AKTIVER-SPIELER AND
                 ( (FELD(1,1) = FELD(3,3) AND
                    FELD(1,1) = FELD(2,2) ) 
                OR
                 (FELD(1,3) = FELD(3,1) AND
                  FELD(1,3) = FELD(2,2) ) )
             SET STATUS-SIEG TO TRUE  
             DISPLAY AKTIVER-SPIELER 'hat gewonnen.'
           WHEN ZUG = 9
             SET STATUS-UNENTSCHIEDEN TO TRUE 
           WHEN OTHER
             IF AKTIVER-SPIELER-O 
             THEN 
               SET AKTIVER-SPIELER-X TO TRUE
             ELSE
               SET AKTIVER-SPIELER-O TO TRUE
             END-IF
           END-EVALUATE 

           EXIT.

           
