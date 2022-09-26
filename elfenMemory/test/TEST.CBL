           TESTSUITE 'Beispiel Testsuite'

           TESTCASE 'Letzter Zug wird korrekt geparst'
           MOVE "4;5"
             TO SAVED-MOVES-TEMP
           PERFORM PARSE-SAVED-MOVES
           EXPECT LAST-MOVE-NUMBER TO BE NUMERIC 4
           EXPECT SECOND-LAST-MOVE-NUMBER TO BE NUMERIC 5

           TESTCASE 'Letzten Zug speichern vertauscht'
           MOVE "4;5"
             TO SAVED-MOVES-TEMP
           MOVE 7 
             TO CURRENT-MOVE-NUMBER
           PERFORM SAVE-MOVE
           EXPECT SAVED-MOVES-TEMP TO BE "0007;0004"

           TESTCASE 'Ersten Zug speichern'
           MOVE SPACES
             TO SAVED-MOVES-TEMP
           MOVE 7 
             TO CURRENT-MOVE-NUMBER
           PERFORM SAVE-MOVE
           EXPECT SAVED-MOVES-TEMP TO BE "0007;0000"