       IDENTIFICATION DIVISION.
       PROGRAM-ID.  BASEM.
      *****************************************************************
      * Implementation des TIC TACT TOE Spiels.
      *****************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
            COPY ZUTZCWS     .
       PROCEDURE DIVISION.
           PERFORM UT-INITIALIZE

           DISPLAY SPACE
           DISPLAY "TEST SUITE:"
           DISPLAY
           'Beispiel Testsuite'
           DISPLAY SPACE

           MOVE 'Beispiel Testcase'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
           Display 'Das ist ein Testcase'
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

           DISPLAY 'HELLO WORLD'
           STOP RUN
           .
