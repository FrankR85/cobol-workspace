       IDENTIFICATION DIVISION.
       PROGRAM-ID. FizzBuzz.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ZAHL PIC 999.
       01 MOD3 PIC 999.
       01 MOD5 PIC 999.
       01 DUMP PIC 999.
       PROCEDURE DIVISION.
      *    Programmlogik kommt hier.
           PERFORM 100 TIMES
             ADD 1 TO ZAHL

             DIVIDE ZAHL
             BY 3
             GIVING DUMP
             REMAINDER MOD3

             DIVIDE ZAHL
             BY 5
             GIVING DUMP
             REMAINDER MOD5

             EVALUATE MOD3 ALSO MOD5
             WHEN 0 ALSO 0
               DISPLAY "fizzbuzz"
             WHEN 0 ALSO NOT 0
               DISPLAY "fizz"
             WHEN NOT 0 ALSO 0
               DISPLAY "buzz"
             WHEN OTHER
               DISPLAY ZAHL
             END-EVALUATE
           END-PERFORM

           GOBACK
          .

       END PROGRAM FizzBuzz.
