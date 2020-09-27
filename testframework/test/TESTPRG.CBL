       IDENTIFICATION DIVISION.
       PROGRAM-ID.  BASEM.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
            COPY ZUTZCWS     .
       01 W-TEXTFELD                                   PIC X(10).
       PROCEDURE DIVISION.
           PERFORM UT-INITIALIZE

           DISPLAY SPACE
           DISPLAY "TEST SUITE:"
           DISPLAY
           'Testsuite'
           DISPLAY SPACE

           MOVE 'Test, ob Testframework funktioniert'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
               PERFORM S-MAIN
           ADD 1 TO UT-TEST-CASE-COUNT
           SET UT-NORMAL-COMPARE TO TRUE
           MOVE W-TEXTFELD TO UT-ACTUAL
           MOVE "HALLO WELT"
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

           STOP RUN

           .
       S-MAIN SECTION.
           MOVE 'HALLO WELT' TO W-TEXTFELD
           EXIT
           .
