#!/usr/bin/env bash

# ==============================================================================
# VlamCom Database - Hints & SQL Tips voor Leerlingen
# ==============================================================================

GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}------------------------------------------------------------------${NC}"
echo -e "${CYAN}  VlamCom Database - Hoe inloggen en de database gebruiken?${NC}"
echo -e "${CYAN}------------------------------------------------------------------${NC}"
echo ""

echo -e "${YELLOW}1. Inloggen in MySQL via de terminal:${NC}"
echo -e "   ${GREEN}mysql -u vlamcom -p vlamcomdb${NC}"
echo "   (Wachtwoord: vlamcompw)"
echo ""

echo -e "${YELLOW}2. Welke tabellen bestaan er?${NC}"
echo -e "   ${GREEN}SHOW TABLES;${NC}"
echo "   -> Toont alle aanwezige tabellen in de huidige database."
echo ""

echo -e "${YELLOW}3. Structuur (kolommen & types) van een tabel bekijken:${NC}"
echo -e "   ${GREEN}DESCRIBE medewerkers;${NC}"
echo "   -> Laat zien welke kolommen er zijn (zoals voornaam, salaris, afdelingid) en hun datatypes."
echo ""

echo -e "${YELLOW}4. Alle gegevens uit een tabel opvragen:${NC}"
echo -e "   ${GREEN}SELECT * FROM afdelingen;${NC}"
echo "   -> * betekent 'alle kolommen'. Haalt alle rijen uit de tabel afdelingen op."
echo ""

echo -e "${YELLOW}5. Gegevens beperken (eerste N resultaten):${NC}"
echo -e "   ${GREEN}SELECT * FROM medewerkers LIMIT 5;${NC}"
echo "   -> LIMIT 5 zorgt ervoor dat je niet alle 150+ medewerkers tegelijk op je scherm krijgt."
echo ""

echo -e "${YELLOW}6. Filteren op een voorwaarde (WHERE):${NC}"
echo -e "   ${GREEN}SELECT voornaam, achternaam, functie FROM medewerkers WHERE locatie = 'Geel';${NC}"
echo "   -> Toont enkel de medewerkers die in Geel wonen."
echo ""

echo -e "${YELLOW}7. Sorteren van gegevens (ORDER BY):${NC}"
echo -e "   ${GREEN}SELECT voornaam, achternaam, salaris FROM medewerkers ORDER BY salaris DESC LIMIT 5;${NC}"
echo "   -> Sorteert de medewerkers van hoog naar laag salaris (DESC) en toont de top 5 verdieners."
echo ""

echo -e "${YELLOW}8. Gegevens uit 2 tabellen combineren (JOIN):${NC}"
echo -e "   ${GREEN}SELECT m.voornaam, m.achternaam, m.functie, a.afdelingnaam FROM medewerkers m JOIN afdelingen a ON m.afdelingid = a.afdelingid ORDER BY a.afdelingid;${NC}"
echo "   -> Koppelt de tabel medewerkers (m) aan afdelingen (a) via de sleutel afdelingid"
echo "      en sorteert het resultaat netjes per afdeling."
echo ""

echo -e "${YELLOW}9. Tellen en groeperen (COUNT & GROUP BY):${NC}"
echo -e "   ${GREEN}SELECT afdelingid, COUNT(*) AS aantal FROM medewerkers GROUP BY afdelingid;${NC}"
echo "   -> Telt hoeveel medewerkers er per afdelingid werken."
echo ""

echo -e "${YELLOW}10. Afsluiten:${NC}"
echo -e "   ${GREEN}EXIT;${NC}"
echo "   -> Sluit de MySQL-sessie netjes af en keert terug naar Bash."
echo ""
