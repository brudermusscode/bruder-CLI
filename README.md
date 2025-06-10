# Bruder, update!

Wenn du deine Docker Services auch in `/var/opt` speicherst und
du aaabsolut keinen Bock hast, diese selber zu updaten - dann bist du hier
genau richtig! Echte ♂️ Männer lassen updaten!

<p align=center>…………… 🫴 ……………</p>

### Eeeasy setup, mach einfach alles wie beschrieben.

#### ▶️ 1. Cloniere dieses Repo! ¬

`cd /var/opt` und dann `git clone
https://github.com/brudermusscode/bruder-CLI.git _bruder` laufen
lassen. Danach `cd _bruder` und ab da werden alle folgenden
Commands und erstellten Dateien in dieser Directory abgefeuert und
erstellt ~ Danke 💏.

#### ▶️ 2. Deine Update-Struktur erstellen ¬

Erstelle eine Datei `list.update`! In dieser Datei stehen alle deine
Ordnernamen von Services in `/var/opt`, die eine `compose.yml`
oder `docker-compose.yml` enthalten und die automatisch
geupdated werden sollen _(je ein Pfad pro Zeile)_.

Beispiel Struktur deiner Services unter Linux:

```TXT
/var/opt
├── /cloudflared
├── /gitea
├── /matomo
└── /cloud
    └─ /immich
```

Passend dazu dann die Beispiel-Struktur deiner `list.update`:

```TXT
cloudflared
matomo
gitea
cloud/immich
```

**Wichtig**: Am Ende der Datei muss eine _Newline_ stehen, sonst wird der letzte Service ignoriert, sorry!

#### ▶️ 3. Eine log-file erstellen ¬

Damit du den Überblick behälst und immer weißt, was abgeht und
ging, erstellst du eine Datei `all.log`! Hier werden alle Logs gespeichert.

#### ▶️ 4. Installiere & starte cron ¬

`sudo apt install cron && cron`

#### ▶️ 5. Lass cron für dich updaten ¬

`crontab -e` um deinen Crontab zu bearbeiten. Wähl deinen liebsten
Editor aus, meiner ist die `1` » Nano und leg einen Cronjob für
deine Zeit an. Meiner läuft jeden Tag um 3 Uhr morgens:

```bash
# daily 3am - Run updates for docker images.
0 3 * * * /var/opt/_bruder/bruder muss updaten >> /var/opt/_bruder/all.log 2>&1
```

Dann Speichern und exiten. Der speichert schon den gesamten Output von den Updates in der von dir
zuvor erstellen `all.log`.

#### ▶️ IIIII. _Muss nicht_, aber du kannst cron für dich aufräumen lassen

Erstelle einen Cronjob, um deine Log files
regelmäßig zu cleanen, damits nicht so voll wird. Ich lasse jeden
Montag um 2:00 Uhr morgens einen laufen:

```bash
# monday 2am - Clear all »all.log« files.
0 2 * * 1 find /var/opt -type f -name "all.log" -exec truncate -s 0 {} \;
```

Dieser job geht durch alle Directories in `/var/opt`, sucht nach
einer `all.log` und löscht den Inhalt. So behalte ich nur die Logs von einer Woche und vscode stirbt
nicht jedes mal, wenn ich eine Logfile öffne - Kein Ding Brudi 💋

<p align=center>…………… 🥵 ……………</p>
