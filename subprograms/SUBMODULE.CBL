       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUBMODULE.
       DATA DIVISION.
       LINKAGE SECTION.
       01 ZAHL PIC X(100).
       PROCEDURE DIVISION USING ZAHL.
      *    Dieses Modul muss mit cobc -m kompiliert werden
           DISPLAY "Übergebene Zahl: '" ZAHL"'"

           MOVE SPACES TO ZAHL

           DISPLAY "Überschriebene Zahl: '" ZAHL "'"

           GOBACK.

       END PROGRAM SUBMODULE.
