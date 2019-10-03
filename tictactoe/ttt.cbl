	IDENTIFICATION DIVISION. 
	PROGRAM-ID. TIC-TAC_TOE.
	ENVIRONMENT DIVISION.
	INPUT-OUTPUT SECTION.
	FILE-CONTROL.
		SELECT highscores ASSIGN TO 'highscores.txt'
		ORGANIZATION IS LINE SEQUENTIAL.
		SELECT temp-OUT ASSIGN TO 'temp.txt' 
		ORGANIZATION IS LINE SEQUENTIAL.

	DATA DIVISION.
		FILE SECTION.
			FD highscores.
			01 highscores-FILE. 
				05 highscores-NAME PIC X(20).
				05 highscores-score PIC 9(3).
			FD temp-OUT.
          	01 temp-OUT-FILE.
            	05 highscores-NAME PIC X(20).
            	05 highscores-score PIC 9(3).


	WORKING-STORAGE SECTION. 
	01 FELD.
		05 Y-ACHSE OCCURS 3.
   			07 ZELLE PIC 9 OCCURS 3 VALUES 0.
   	01 Spieler PIC 9 VALUE 1.
   	01 X PIC 9.
   	01 Y PIC 9.
   	01 Zeile PIC 9 VALUE 1.
   	01 Spalte PIC 9 VALUE 1.
   	01 Nick1 PIC X(20).
   	01 Nick2 PIC X(20).

   	01 WS-highscores.
		05 WS-highscores-NAME PIC X(20).
		05 WS-highscores-score PIC 9(3).
	01 WS-EOF PIC X(1).

   	01 Gewinner PIC X(20).
   	01 Gewinner-Score PIC 9(3).

	01 gefunden PIC 9 Value 0.
	01 nameCheck PIC 9 VALUE 0.
	01 eingefügt PIC 9 VALUE 0.

	01 temp PIC 9 VALUE 0.


	PROCEDURE DIVISION.
	CALL "SYSTEM" USING "printf '\e[8;13;24t'"
	CALL "SYSTEM" USING "clear"

	DISPLAY "########################"
	DISPLAY "#     TIC-TAC-TOE      #"
	DISPLAY "########################"

	DISPLAY "Spieler 1 Name eingeben:"
	ACCEPT Nick1

	CALL "SYSTEM" USING "clear"

	DISPLAY "########################"
	DISPLAY "#     TIC-TAC-TOE      #"
	DISPLAY "########################"


	DISPLAY "Spieler 2 Name eingeben:"
	ACCEPT Nick2


	PERFORM 9 Times

		perform FeldAusgeben
		perform zug
		perform istBeendet


	IF Spieler = 1 THEN
		MOVE 2 TO Spieler
	ELSE
		MOVE 1 TO Spieler
	END-IF


	END-PERFORM
	DISPLAY "Unentschieden"
	PERFORM FeldAusgeben
	STOP RUN.


	FeldAusgeben.
		CALL "SYSTEM" USING "clear"
		DISPLAY "########################"
		DISPLAY "#     TIC-TAC-TOE      #"
		DISPLAY "########################"
		
		DISPLAY " "ZELLE(1,1) " | " ZELLE(1,2) " | "ZELLE(1,3).
		DISPLAY "----------"
		DISPLAY " "ZELLE(2,1) " | " ZELLE(2,2) " | "ZELLE(2,3).
		DISPLAY "----------"
		
		DISPLAY " "ZELLE(3,1) " | " ZELLE(3,2) " | "ZELLE(3,3).
	
		DISPLAY "########################".
	zug.
		DISPLAY "Spieler " Spieler" ist am Zug".

		DISPLAY "X : " WITH NO ADVANCING.
		ACCEPT X.

		IF X = 9 THEN
		PERFORM beenden.

		DISPLAY "Y : "WITH NO ADVANCING.
		ACCEPT Y.

		IF ZELLE(X,Y) NOT = 0
		OR X > 3
		OR Y > 3 THEN

			PERFORM FeldAusgeben
			DISPLAY "falsche Eingabe"
			perform zug
		ELSE 
			MOVE Spieler TO ZELLE (X,Y)	
		END-IF.
		
	istBeendet.


		MOVE 1 TO Zeile
		MOVE 1 TO Spalte

		PERFORM 3 Times
			IF ZELLE(Zeile,1) = ZELLE(Zeile,2)
			AND ZELLE(Zeile,1) = ZELLE(Zeile,3)
			AND ZELLE(Zeile,1) = Spieler 
			THEN PERFORM beenden
			END-IF

			ADD 1 TO Zeile
		END-PERFORM

		PERFORM 3 Times
			IF ZELLE(1, Spalte) = ZELLE(2,Spalte)
			AND ZELLE(1, Spalte) = ZELLE(3,Spalte)
			AND ZELLE(1,Spalte) = Spieler 
			THEN PERFORM beenden
			END-IF

			ADD 1 TO Spalte
		END-PERFORM


		IF ZELLE(1,1) = ZELLE(2,2)
			AND ZELLE(1,1) = ZELLE(3,3)
			AND ZELLE(1,1) = Spieler
			THEN PERFORM beenden
		END-IF


		IF ZELLE(3,1) = ZELLE(2,2)
			AND ZELLE(3,1) = ZELLE(1,3)
			AND ZELLE(3,1) = Spieler
			THEN PERFORM beenden
		END-IF
		.

	beenden.
		CALL "SYSTEM" USING "clear".
		if Spieler = 1 THEN
			COMPUTE temp = 
			((23-
			(LENGTH OF FUNCTION TRIM (Nick1)
				))/2)

			PERFORM temp TIMES 
				DISPLAY " " WITH NO ADVANCING
			END-PERFORM

			
			DISPLAY FUNCTION TRIM (Nick1) 

			DISPLAY "   ist der Sieger!"
			MOVE Nick1 TO Gewinner
		END-IF

		if Spieler = 2 THEN

		
		 

		COMPUTE temp = 
			((23-
			(LENGTH OF FUNCTION TRIM (Nick2)
				))/2)

			PERFORM temp TIMES 
				DISPLAY " " WITH NO ADVANCING
			END-PERFORM

			DISPLAY FUNCTION TRIM (Nick2) 
			DISPLAY "   ist der Sieger!"
			MOVE Nick2 TO Gewinner
		END-IF

		PERFORM spielerSpeichern.

		PERFORM highscoresAusgeben.

		STOP RUN.

	spielerSpeichern.
		PERFORM tempFileErstellen.
		PERFORM tempFileKopieren.

	tempFileErstellen.
		OPEN INPUT highscores.
		OPEN OUTPUT temp-OUT 
		
		PERFORM UNTIL WS-EOF="Y" 
			READ highscores INTO WS-highscores 
				AT END MOVE "Y" TO WS-EOF 
					
				NOT AT END 


				PERFORM checkName

					IF nameCheck = 0 THEN 

						MOVE WS-highscores-NAME
	                   	TO highscores-NAME IN temp-OUT-FILE

	                	MOVE WS-highscores-score
	                   	TO highscores-score IN temp-OUT-FILE 
	                  	WRITE temp-OUT-FILE FROM temp-OUT-FILE
	                ELSE 
	                	MOVE 0 TO nameCheck
	                END-IF
                  	 
			END-READ
		END-PERFORM

		PERFORM spielerHinzufügen.

		CLOSE highscores.
		CLOSE temp-OUT.
		

	tempFileKopieren.
		MOVE 0 TO WS-EOF
		
		OPEN INPUT temp-OUT 
		OPEN OUTPUT highscores.
		
		PERFORM UNTIL WS-EOF="Y" 
			READ temp-OUT INTO WS-highscores 
				AT END MOVE "Y" TO WS-EOF 
					
				NOT AT END 

					IF Gewinner-Score 
					> WS-highscores-score 
					AND eingefügt = 0
					THEN
						MOVE 1 
						TO eingefügt

						MOVE Gewinner
                   		TO highscores-NAME 
                   		IN highscores-FILE

                		MOVE Gewinner-Score
                   		TO highscores-score 
                   		IN highscores-FILE 

                  		WRITE highscores-FILE 
                  		FROM highscores-FILE
                  	END-IF

					MOVE WS-highscores-NAME
                   	TO highscores-NAME IN highscores-FILE

                	MOVE WS-highscores-score
                   	TO highscores-score IN highscores-FILE 

                  	WRITE highscores-FILE FROM highscores-FILE 



	
			END-READ
		END-PERFORM

		if eingefügt = 0 THEN
			MOVE 1 TO eingefügt

			MOVE Gewinner 
			TO highscores-NAME IN highscores-FILE

    		MOVE Gewinner-Score
       		TO highscores-score IN highscores-FILE 

      		WRITE highscores-FILE 
      		FROM highscores-FILE
      	END-IF


		CLOSE temp-OUT.
		CLOSE highscores.
		


	spielerHinzufügen.

		IF gefunden = 0 THEN 
			MOVE Gewinner
	        TO highscores-NAME IN temp-OUT-FILE

			MOVE 1
	       	TO highscores-score IN temp-OUT-FILE 

	       	MOVE 1
	       	TO eingefügt

	      	WRITE temp-OUT-FILE FROM temp-OUT-FILE
	    END-IF.


	checkName.
		IF WS-highscores-NAME IS EQUAL TO Gewinner 

			ADD 1 TO WS-highscores-score
			MOVE WS-highscores-score TO Gewinner-Score
			MOVE 1 TO gefunden
			Move 1 TO nameCheck
		END-IF.



	highscoresAusgeben.

		DISPLAY "########################"
		DISPLAY "         TOP 3"
		DISPLAY "########################"
		DISPLAY " ------- Platz 1 ------"
		CALL "system" 
		USING "cat highscores.txt | head -1 | tail -1".
		DISPLAY " ------- Platz 2 ------"


		CALL "system" 
		USING "cat highscores.txt | head -2 | tail -1".
		DISPLAY " ------- Platz 3 ------"

		CALL "system" 
		USING "cat highscores.txt | head -3 | tail -1".
		DISPLAY "########################".
		ACCEPT TEMP.
















