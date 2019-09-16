           TESTSUITE 'Testfälle für unseren Diamanten'

           TESTCASE 'Diamant der Höhe 1 ist X'
           MOVE 1 TO HOEHE
           PERFORM ZEICHNE-DIAMANT
           EXPECT ZEILE(1) TO BE "X"
