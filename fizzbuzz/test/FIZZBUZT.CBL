           TESTSUITE 'UNIT TESTS FOR FIZZBUZZ.CBL'

           TESTCASE 'Für die Zahl 3 wird FIZZ ausgegeben.'
           MOVE 3 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           EXPECT CURRENT-RESULT TO BE "FIZZ"
