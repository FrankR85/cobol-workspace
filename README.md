[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/FrankR85/cobol-workspace)

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

4. Testen, ob der GnuCOBOL bei euch läuft. Gebt dazu folgendes in das Terminal ein:

```bash
cobc -x -j helloworld/HELLWORLD.CBL 
```
Die Ausgabe sollte so aussehen:
```bash
Hallo WWU!
```

5. Testen, ob das Testframework bei euch läuft: 

```bash
./testframework/run-ut.sh 
```
Die letzten Zeilen der Ausgabe sollte in etwa so aussehen:
```bash
  1 TEST CASES WERE EXECUTED
  1 PASSED
  0 FAILED
=================================================
```

6. IDE eurer Wahl installieren. Unsere Empfehlung: Visual Studio Code mit der Extension bitlang.cobol.

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

## Eigenes Projekt mit dem Testframework
Damit ihr euch auf das Entwickeln und nicht das Einrichten des Entwicklungs- und Testtools konzentrieren könnt, haben wir euch eine Kopierbasis bereitgestellt, an der ihr nur wenige Anpassungen durchführen müsst:
1. Kopiert den Ordner kopierbasis
2. Ersetzt alle Vorkommnisse von kopierbasis durch euren Projektnamen, bspw. mypgm:
    1. ./kopierbasis in ./mypgm.
    2. ./kopierbasis/src/KOPIERBASIS_**M**.CBL in ./mypgm/src/MYPGM_M.CBL (Euer Hauptprogramm)
    3. ./kopierbasis/test/KOPIERBASIS_**T**.CBL in ./mypgm/test/MYPGM_T.CBL (Eure Tests)
    4. ./kopierbasis/test/resources/KOPIERBASIS_**C** in ./mypgm/test/resources/MYPGM_C (Copies)
    5. Ändert in der Datei /kopierbasis/run-ut.sh kopierbasis in mypgm und KOPIERBASIS in MYPGM.
