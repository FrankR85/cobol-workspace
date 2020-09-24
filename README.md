[![Gitter](https://badges.gitter.im/wwucobol/Aufgaben.svg)](https://gitter.im/wwucobol/Aufgaben?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
# COBOL Workspace

## Installation
**Easy Install**

Für diesen Kurs gibt es ein Dockerimage, welches fertig eingerichtet ist. Wir empfehlen dieses zu verwenden.
1. Docker installieren auf [Windows](https://docs.docker.com/docker-for-windows/install).

2. Dieses Repository clonen.

3. Ein Terminal öffnen, in den cobol-workspace Ordner navigieren und die folgenden Befehle ausführen:

```bash
docker rmi frankr85/cobol:latest -f
docker run -it --mount src="$(pwd)",target=/root/cobol,type=bind frankr85/cobol:latest bash
```

4. Testen, ob alles funktioniert hat. Gebt dazu folgendes in das Terminal ein:
```bash
./ttt/run-ut.sh 
```
Die letzten Zeilen der Ausgabe sollte in etwa so aussehen:
```bash
  9 TEST CASES WERE EXECUTED
  9 PASSED
  0 FAILED
=================================================
```

5. IDE eurer Wahl installieren. Unsere Empfehlung: Visual Studio Code mit der Extension bitlang.cobol.

**DIY Install**

Ihr könnt den GnuCOBOL-Compiler und evtl. die verwendeten Projekte auch selber installieren. Allerdings müsst ihr das Ganze dann selber zum Laufen bringen. 

Für die Unittests verwenden wir das Projekt [cobol-unit-test von neopragma](https://github.com/neopragma/cobol-unit-test) 

## Dokumentation
Für diesen Kurs wurde eine Kurzeinweisung in COBOL geschrieben. Ihr findet sie [hier](https://frankr85.github.io/cobol-handbuch/).

Die komplette Dokumentation für den GnuCOBOL-Compiler der Version 3.1 findet ihr [hier](https://sourceforge.net/p/gnucobol/code/HEAD/tree/external-doc/guide/PDFs/gnucobpg-a4.pdf?format=raw).

## Hallo Welt
Gewöhnlich beginnt man das Erlernen einer neuen Programmiersprache mit einem `Hallo Welt`-Beispiel.
Dieses Beispiel findet ihr im Ordner `helloworld`. Nachdem ihr den Container gestartet habt und euch mit einer Shell verbunden habt, könnt ihr in das Verzeichnis wechseln:
```
cd helloworld
```
Und die Datei `HELLOWORLD.CBL` anschließend kompilieren:
```
cobc -x HELLOWORLD.CBL
```
Der Compiler erzeugt ein Binary `HELLOWORLD`, welches ihr ausführen könnt:
```
./HELLOWORLD
```
Die Ausgabe sollte
```
Hallo Wwu!
``` 
sein.

## Start des eigenen Projekts
Damit ihr euch auf das Entwickeln und nicht das Einrichten des Entwicklungs- und Testtools konzentrieren könnt, haben wir euch eine Kopierbasis bereitgestellt, an der ihr nur wenige Anpassungen durchführen müsst:
1. Kopiert den Ordner base
2. Ersetzt alle Vorkommnisse von base durch euren Projektnamen, bspw. mypgm:
    1. ./base in ./mypgm.
    2. ./base/src/BASE**M**.CBL in ./mypgm/src/MYPGMM.CBL (Euer Hauptprogramm)
    3. ./base/test/BASE**T**.CBL in ./mypgm/test/MYPGMT.CBL (Eure Tests)
    4. ./base/test/resources/BASE**C** in ./mypgm/test/resources/MYPGMC
    5. Ändert in der Datei /base/run-ut.sh das Wort base in mypgm bzw. BASE in MYPGM.
