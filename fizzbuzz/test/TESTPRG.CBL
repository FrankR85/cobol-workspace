       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WEBINPUT ASSIGN TO KEYBOARD
           FILE STATUS IS IN-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD WEBINPUT.
          01 CHUNK-OF-POST     PIC X(1024).

       WORKING-STORAGE SECTION.
            COPY ZUTZCWS     .
       01 IN-STATUS            PIC 9999.
       01 NEWLINE              PIC X     VALUE X'0A'.

       01 POST-PARAMETER.
          05 PARAMETER-NAME    PIC X(20).
          05 PARAMETER-VALUE   PIC X(20).

       01  TEMP-FELDER.
           05  END-NUMBER         PIC 9(20).
           05  CURRENT-NUMBER     PIC 9(20).
           05  CURRENT-RESULT     PIC X(20).
           05  REMAINDER-BY-3     PIC 9(10).
       		 05  REMAINDER-BY-5     PIC 9(10).
           05  DIV-RESULT         PIC 9(10).
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
           MOVE 'IT RETURNS BUZZ FOR THE NUMBER 5 (DIVISIBLE BY 5)'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
           MOVE 5 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           ADD 1 TO UT-TEST-CASE-COUNT
           SET UT-NORMAL-COMPARE TO TRUE
           MOVE CURRENT-RESULT TO UT-ACTUAL
           MOVE "BUZZ"
                       TO UT-EXPECTED
           SET UT-COMPARE-DEFAULT TO TRUE
           PERFORM UT-ASSERT-EQUAL

           PERFORM UT-AFTER
           MOVE 'IT RETURNS FIZZBUZZ FOR THE 15 (DIV BY 3 and 5)'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
           MOVE 15 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           ADD 1 TO UT-TEST-CASE-COUNT
           SET UT-NORMAL-COMPARE TO TRUE
           MOVE CURRENT-RESULT TO UT-ACTUAL
           MOVE "FIZZBUZZ"
                       TO UT-EXPECTED
           SET UT-COMPARE-DEFAULT TO TRUE
           PERFORM UT-ASSERT-EQUAL

           PERFORM UT-AFTER
           MOVE 'IT RETURNS 1 FOR THE NUMBER 1'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
           MOVE 1 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           ADD 1 TO UT-TEST-CASE-COUNT
           SET UT-NORMAL-COMPARE TO TRUE
           MOVE CURRENT-RESULT TO UT-ACTUAL
           MOVE "                   1"
                       TO UT-EXPECTED
           SET UT-COMPARE-DEFAULT TO TRUE
           PERFORM UT-ASSERT-EQUAL

           PERFORM UT-AFTER
           MOVE 'IT RETURNS 101 FOR THE NUMBER 101'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
           MOVE 101 TO CURRENT-NUMBER
           PERFORM 1000-PROCESS-NUMBER
           ADD 1 TO UT-TEST-CASE-COUNT
           SET UT-NORMAL-COMPARE TO TRUE
           MOVE CURRENT-RESULT TO UT-ACTUAL
           MOVE "                 101"
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
           ADD 1 TO UT-FILE-COUNT
           SET UT-FILE-IX TO UT-FILE-COUNT
           MOVE 'LECT' TO UT-INTERNAL-FILENAME(UT-FILE-IX)
           MOVE 'IN-STATUS' TO
                      UT-FILE-STATUS-FIELD-NAME(UT-FILE-IX)
           SET UT-FIND-FILE-MOCK TO TRUE
           MOVE 'WEBINPUT' TO UT-MOCK-FIND-FILENAME
           PERFORM UT-LOOKUP-MOCK
           PERFORM UT-LOOKUP-FILE
           MOVE '01' TO UT-RECORD-FIELD-NAME(UT-FILE-IX)

           .
       UT-END.

           PERFORM U01-PRINT-HEADER

           PERFORM U02-PARSE-INPUT

           PERFORM VARYING CURRENT-NUMBER FROM 1 BY 1
            UNTIL CURRENT-NUMBER >= END-NUMBER
              PERFORM 1000-PROCESS-NUMBER
              DISPLAY CURRENT-RESULT
              DISPLAY "<br>"
           END-PERFORM

           GOBACK
           .
          .

           .
       1000-PROCESS-NUMBER SECTION.

           IF CURRENT-NUMBER = 5 THEN
             MOVE 'BUZZ' TO CURRENT-RESULT
           ELSE
             MOVE 'FIZZ' TO CURRENT-RESULT
           END-IF

           .
          .
           .
       1000Z.
           EXIT

           .
       U01-PRINT-HEADER SECTION.
           DISPLAY "CONTENT-TYPE: TEXT/HTML"
                    NEWLINE
           .
          .
           .
       U02-PARSE-INPUT SECTION.
           OPEN INPUT WEBINPUT
           IF IN-STATUS < 10 THEN
            READ WEBINPUT END-READ
            IF IN-STATUS > 9 THEN
              MOVE SPACES TO CHUNK-OF-POST
            END-IF
           END-IF
           CLOSE WEBINPUT

           UNSTRING CHUNK-OF-POST
            DELIMITED BY "="
            INTO PARAMETER-NAME
            PARAMETER-VALUE

           UNSTRING PARAMETER-VALUE
            DELIMITED BY SPACE
            INTO END-NUMBER

           IF END-NUMBER IS NUMERIC THEN
            PERFORM 1000-PROCESS-NUMBER
           ELSE
            DISPLAY "Ungültige Eingabe!"
           END-IF
           .
          .
           .
       END PROGRAM FIZZBUZZ.
