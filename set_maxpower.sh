#!/bin/bash

# Absoluter Pfad zum deyeat-Binary
DEYEAT="/config/scripts/deyeat"

# Ziel-IP und Port des Wechselrichters
TARGET="192.168.178.177:48899"

# Prüfen, ob ein Parameter übergeben wurde
if [ -z "$1" ]; then
  echo "Fehlender Parameter. Bitte gib eine Zahl zwischen 1 und 100 an."
  exit 1
fi

# Prüfen, ob es sich um eine gültige Ganzzahl zwischen 1 und 100 handelt
if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 1 ] || [ "$1" -gt 100 ]; then
  echo "Ungültiger Parameter: $1. Erlaubt sind nur ganze Zahlen von 1 bis 100."
  exit 1
fi

# Dezimalwert in 2-stelligen Hexwert umwandeln (z. B. 15 -> 0F)
HEX=$(printf "%02X" "$1")

# Befehl senden
$DEYEAT -t "$TARGET" -xmbw "002800010200${HEX}"
