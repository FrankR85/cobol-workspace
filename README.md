# COBOL Workspace
Dieses Repository clonen und mit einem Terminal anschließend
```bash
docker run -it --mount src="$(pwd)",target=/home/cobol,type=bind frankr85/cobol:latest bash
```
aufrufen.

Um stets das aktuelleste Image zu ziehen, kann es notwendig sein, das bestehende lokale Image zu löschen:
```bash
docker rmi frankr85/cobol:latest -f
```
