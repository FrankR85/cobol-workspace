       IDENTIFICATION DIVISION.
       PROGRAM-ID. Login.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEMP-FELDER.
          05 ZAEHLER1 PIC 9.
          05 ZAEHLER2 PIC 9.
          05 KRYPTO-HASH-VALUES.
             07 HASH1 VALUE "ABCDEF".
             07 HASH2 VALUE "EFGHIJ".

       PROCEDURE DIVISION.
      *    Programmlogik kommt hier.
            DISPLAY "Hallo Welt"

            MOVE ZERO TO ZAEHLER1
                         ZAEHLER2

            INITIALIZE TEMP-FELDER

      *     Noch gaaanz viel weiterer Code


            DISPLAY HASH1
            GOBACK
           .

       END PROGRAM Login.
