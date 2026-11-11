#!/usr/bin/env bash==============================================================================Script Name : setup.shDescription : Geautomatiseerde installatie van vlamcomdb & gebruiker vlamcom==============================================================================set -eKleurcodes voor nette outputGREEN='\030[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Colorecho -e "${YELLOW}=== VlamCom Database Initialisatie Script ===${NC}\n"Vraag naar het MySQL Root wachtwoordread -sp "Voer het MySQL root wachtwoord in: " MYSQL_ROOT_PASSWORD
echo -e "\n"Stap 1: Uitvoeren van root setup (Database, User & Privileges)echo -e "[1/2] Database 'vlamcomdb' en gebruiker 'vlamcom' aanmaken via root..."
if mysql -u root -p"${MYSQL_ROOT_PASSWORD}" < 01_setup_user_db.sql 2>/dev/null; then
echo -e "${GREEN}✓ Root setup succesvol afgerond.${NC}\n"
else
echo -e "${RED}✗ Fout tijdens het uitvoeren van root setup. Controleer je root wachtwoord.${NC}"
exit 1
fiStap 2: Tabellen en Data importeren als gebruiker 'vlamcom'echo -e "[2/2] Tabellen aanmaken en vullen als gebruiker 'vlamcom'..."
if mysql -u vlamcom -pvlamcompw vlamcomdb < 02_create_and_fill.sql 2>/dev/null; then
echo -e "${GREEN}✓ Tabellen succesvol aangemaakt en gevuld met data!${NC}\n"
else
echo -e "${RED}✗ Fout bij het importeren van de tabellen/data met gebruiker vlamcom.${NC}"
exit 1
fiecho -e "${GREEN}=== Setup Succesvol Voltooid! ===${NC}"
echo -e "Je kunt nu inloggen met:"
echo -e "  mysql -u vlamcom -pvlamcompw vlamcomdb"
