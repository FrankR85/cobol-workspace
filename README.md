# COBOL Workspace

## Installation
**Easy Install**

Für diesen Kurs gibt es ein Dockerimage, welches fertig eingerichtet ist. Wir empfehlen dieses zu verwenden.
1. Docker installieren [Windows install](https://docs.docker.com/docker-for-windows/install)

2. Dieses Repository clonen

3. Ein Terminal öffnen, in den cobol-workspace Ordner navigieren und die folgenden Befehle ausführen:

```bash
docker rmi frankr85/cobol:latest -f
docker run -it --mount src="$(pwd)",target=/root/cobol,type=bind frankr85/cobol:latest bash
```

4. Testen, ob alles funktioniert hat. **TODO Hello World ist leer**

5. IDE eurer Wahl installieren. Unsere Empfehlung: Visual Studio Code mit der Extension bitlang.cobol

**DIY Install**

Ihr könnt den GnuCOBOL-Compiler und evtl. die verwendeten Projekte auch selber installieren. Allerdings müsst ihr das Ganze dann selber zum Laufen bringen. 

Für die Unittests verwenden wir das Projekt [cobol-unit-test von neopragma](https://github.com/neopragma/cobol-unit-test) 

## Dokumentation
Für diesen Kurs wurde eine Kurzeinweisung in COBOL geschrieben. Ihr findet sie [hier](https://frankr85.github.io/cobol-handbuch/)

Die komplette Dokumentation für den GnuCOBOL-Compiler findet ihr [hier](https://gnucobol.sourceforge.io/guides/GnuCOBOL%202.2%20NOV2017%20Programmers%20Guide%20(A4).pdf) **TODO Das ist nur Version 2.2 Wo sind die neueren?**

## Start des eigenen Projekts
Damit ihr euch auf das Entwickeln und nicht das Einrichten des Entwicklungs- und Testtools konzentrieren könnt, haben wir euch eine Kopierbasis bereitgestellt, an der ihr nur wenige Anpassungen durchführen müsst
1. Kopiert euch den Ordner base
2. Ersetzt alle Vorkommnisse von base durch euren Projektnamen, bspw. mypgm
2.1 ./base in ./mypgm
2.2 ./base/src/BASE**M**.CBL in ./mypgm/src/MYPGMM.CBL (Euer Hauptprogramm)
2.3 ./base/test/BASE**T**.CBL in ./mypgm/test/MYPGMT.CBL (Eure Tests)
2.4 ./base/test/resources/BASE**C** in ./mypgm/test/resources/MYPGMC
2.5 Ändert in der Datei /base/run-ut.sh das Wort base in mypgm bzw. MYPGM
3. Bereit für dein Projekt

 

