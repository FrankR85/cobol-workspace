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
