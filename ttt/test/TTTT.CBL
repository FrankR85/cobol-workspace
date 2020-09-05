           TESTSUITE 'TIC TACT TOE TEST'
           BEFORE-EACH
             PERFORM INIT
           END-BEFORE

           TESTCASE 'Gewinnt waagerecht'
           MOVE 'X' TO FELD(1,1)
                       FELD(1,2)
           SET AKTIVER-SPIELER-X TO TRUE
           MOVE '3,1' TO EINGABE
           PERFORM PRUEFE-LESE-EINGABE
           PERFORM PRUEFE-SPIELSTATUS
           PERFORM DISPLAY-SPIELFELD
           EXPECT SPIEL-STATUS TO BE
             'Sieg'

           TESTCASE 'Gewinnt senkrecht'
           MOVE 'X' TO FELD(1,1)
                       FELD(2,1)
           SET AKTIVER-SPIELER-X TO TRUE
           MOVE '1,3' TO EINGABE
           PERFORM PRUEFE-LESE-EINGABE
           PERFORM PRUEFE-SPIELSTATUS
           PERFORM DISPLAY-SPIELFELD
           EXPECT SPIEL-STATUS TO BE
             'Sieg'

           TESTCASE 'Gewinnt diagonal'
           MOVE 'X' TO FELD(1,1)
                       FELD(2,2)
           SET AKTIVER-SPIELER-X TO TRUE
           MOVE '3,3' TO EINGABE
           PERFORM PRUEFE-LESE-EINGABE
           PERFORM PRUEFE-SPIELSTATUS
           PERFORM DISPLAY-SPIELFELD
           EXPECT SPIEL-STATUS TO BE
             'Sieg'
           
           TESTCASE 'Normaler Zug mit Spielerwechsel'
           MOVE '3,3' TO EINGABE
           SET AKTIVER-SPIELER-X TO TRUE
           PERFORM PRUEFE-LESE-EINGABE
           PERFORM PRUEFE-SPIELSTATUS
           EXPECT SPIEL-STATUS TO BE 'Laufend'
           EXPECT AKTIVER-SPIELER TO BE 'O'

           TESTCASE 'Alle Felder belegt'
           MOVE 'XOXXOXOX' TO SPIELFELD
           MOVE 8 TO ZUG
           SET AKTIVER-SPIELER-O TO TRUE
           MOVE '3,3' TO EINGABE
           PERFORM PRUEFE-LESE-EINGABE
           PERFORM PRUEFE-SPIELSTATUS
           PERFORM DISPLAY-SPIELFELD
           EXPECT SPIEL-STATUS TO BE
             'Unentschieden'

           TESTCASE 'Feld schon belegt'
           MOVE 'X' TO FELD(2,1)
           MOVE '1,2' TO EINGABE
           PERFORM PRUEFE-LESE-EINGABE
           PERFORM DISPLAY-SPIELFELD
           EXPECT SPIEL-STATUS TO BE
             'FEHLER: Ungültige Eingabe'
 
           TESTCASE 'Außerhalb des Spielfeldes'
           MOVE '5,7' TO EINGABE
           PERFORM PRUEFE-LESE-EINGABE
           EXPECT SPIEL-STATUS TO BE 
            'FEHLER: Ungültige Eingabe'
         
           TESTCASE 'Ungültige Eingabe'
           MOVE 'a,b' TO EINGABE
           PERFORM PRUEFE-LESE-EINGABE
           EXPECT SPIEL-STATUS TO BE 
             'FEHLER: Ungültige Eingabe'