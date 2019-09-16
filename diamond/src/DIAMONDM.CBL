       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIAMONDM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  TEMP-FELDER.
           05 HOEHE PIC 99.
           05 AUSGABE OCCURS 40.
             07 ZEILE PIC X(40).

       PROCEDURE DIVISION.

           GOBACK
          .

       ZEICHNE-DIAMANT SECTION.
           MOVE "X"
             TO ZEILE (1)
           .
           EXIT.
       END PROGRAM DIAMONDM.
