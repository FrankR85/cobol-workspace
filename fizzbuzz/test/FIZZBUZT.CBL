           TESTSUITE 'UNIT TESTS FOR FIZZBUZZ.CBL'

           TESTCASE 'Für die Zahl 1 wird 1 ausgegeben.'
           MOVE 1 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           EXPECT CURRENT-RESULT TO BE " 1"

           TESTCASE 'Für die Zahl 3 wird FIZZ ausgegeben'
           MOVE 3 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           EXPECT CURRENT-RESULT TO BE "FIZZ"


           TESTCASE 'Für 5 wird BUZZ ausgegeben'
           MOVE 5 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           EXPECT CURRENT-RESULT TO BE "BUZZ"
