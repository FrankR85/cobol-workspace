       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIAMONDM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
            COPY ZUTZCWS     .
       01  TEMP-FELDER.
           05 HOEHE PIC 99.
           05 AUSGABE OCCURS 40.
             07 ZEILE PIC X(40).

       PROCEDURE DIVISION.
           PERFORM UT-INITIALIZE

           DISPLAY SPACE
           DISPLAY "TEST SUITE:"
           DISPLAY
           'Testfälle für unseren Diamanten'
           DISPLAY SPACE

           MOVE 'Diamant der Höhe 1 ist X'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
           MOVE 1 TO HOEHE
           PERFORM ZEICHNE-DIAMANT
           ADD 1 TO UT-TEST-CASE-COUNT
           SET UT-NORMAL-COMPARE TO TRUE
           MOVE ZEILE(1) TO UT-ACTUAL
           MOVE "X"
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


           GOBACK
           .
          .

           .
       ZEICHNE-DIAMANT SECTION.
           MOVE "X"
             TO ZEILE (1)

           EXIT
           .
       END PROGRAM DIAMONDM.
