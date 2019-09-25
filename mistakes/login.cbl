       IDENTIFICATION DIVISION.
       PROGRAM-ID. Login.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FBZ PIC 9.
       01 PASSWORT PIC X(06).
          88 PASSWORT-KORREKT VALUE "GEHEIM".

       PROCEDURE DIVISION.
      *    Programmlogik kommt hier.
            PERFORM UNTIL PASSWORT-KORREKT
               PERFORM PASSWORT-ABFRAGE
            END-PERFORM
            IF NOT FBZ >= 3 THEN
               DISPLAY "Ihr Kontostand beträgt 100€."
            END-IF
            GOBACK
           .
       PASSWORT-ABFRAGE SECTION.
            DISPLAY "Bitte Passwort eingeben:"
            ACCEPT PASSWORT

            IF NOT PASSWORT-KORREKT THEN
              PERFORM PRUEFE-LOGIN-SPERRE
            END-IF
            EXIT.
        PRUEFE-LOGIN-SPERRE SECTION.
            ADD 1 TO FBZ
            IF FBZ >= 3 THEN
               DISPLAY "Zugang ist gesperrt!"
            END-IF
            EXIT.
       END PROGRAM Login.
