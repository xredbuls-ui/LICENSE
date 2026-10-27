
#!/bin/bash

echo "================================"
echo " CALCOLATORE DI INTERESSI SEMPLICI"
echo "================================"

# Input dell'utente
read -p "Inserisci il capitale iniziale (€): " capitale
read -p "Inserisci il tasso di interesse annuo (%): " tasso
read -p "Inserisci il periodo di tempo (anni): " tempo

# Controllo degli input
for valore in "$capitale" "$tasso" "$tempo"; do
    if ! [[ "$valore" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Errore: inserisci solo numeri positivi (usa il punto per i decimali)."
        exit 1
    fi
done

# Calcolo tramite awk
interesse=$(awk -v c="$capitale" -v r="$tasso" -v t="$tempo" \
    'BEGIN { printf "%.2f", (c * r * t) / 100 }')

totale=$(awk -v c="$capitale" -v i="$interesse" \
    'BEGIN { printf "%.2f", c + i }')

# Risultati
echo ""
echo "========== RISULTATI =========="
echo "Capitale iniziale: € $capitale"
echo "Tasso annuo: $tasso%"
echo "Durata: $tempo anni"
echo "--------------------------------"
echo "Interessi maturati: € $interesse"
echo "Capitale finale: € $totale"
echo "================================"
