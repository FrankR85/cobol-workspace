       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUBMODULE.
       DATA DIVISION.
       LINKAGE SECTION.
       01 ZAHL PIC 999.
       PROCEDURE DIVISION USING ZAHL.
      *    Dieses Modul muss mit cobc -m kompiliert werden
           DISPLAY "Übergebene Zahl: " ZAHL

           GOBACK
          .

       END PROGRAM SUBMODULE.
