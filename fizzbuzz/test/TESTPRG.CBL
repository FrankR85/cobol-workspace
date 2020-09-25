       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
            COPY ZUTZCWS     .
       01 CURRENT-NUMBER PIC 99.
       01 CURRENT-RESULT PIC X(8).

       PROCEDURE DIVISION.
           PERFORM UT-INITIALIZE

           DISPLAY SPACE
           DISPLAY "TEST SUITE:"
           DISPLAY
           'UNIT TESTS FOR FIZZBUZZ.CBL'
           DISPLAY SPACE

           MOVE 'IT RETURNS FIZZ FOR THE NUMBER 3 (DIVISIBLE BY 3)'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
           MOVE 3 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           ADD 1 TO UT-TEST-CASE-COUNT
           SET UT-NORMAL-COMPARE TO TRUE
           MOVE CURRENT-RESULT TO UT-ACTUAL
           MOVE "FIZZ"
                       TO UT-EXPECTED
           SET UT-COMPARE-DEFAULT TO TRUE
           PERFORM UT-ASSERT-EQUAL
           PERFORM UT-AFTER
            COPY ZUTZCPD     .
           .
       UT-BEFORE.

           .
       UT-AFTER.

           .
       UT-INITIALIZE.
           MOVE SPACE TO UT-FILE-INFORMATION

           .
       UT-END.

           DISPLAY "FIZZ"

           GOBACK
           .
       1000-PROCESS-NUMBER SECTION.
           MOVE "FIZZ"
             TO CURRENT-RESULT
           EXIT
           .
       END PROGRAM FIZZBUZZ.
