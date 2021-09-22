           TESTSUITE 'UNIT TESTS FOR FIZZBUZZ.CBL'

           TESTCASE 'Für die Zahl 1 wird 1 ausgegeben.'
           MOVE 1 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           EXPECT CURRENT-RESULT TO BE "1"
