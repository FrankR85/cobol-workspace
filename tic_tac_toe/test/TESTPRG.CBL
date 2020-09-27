       IDENTIFICATION DIVISION.
       PROGRAM-ID.  TTTM.
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
           'TIC TACT TOE TEST'
           DISPLAY SPACE

           MOVE 'TESTCASE'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
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

