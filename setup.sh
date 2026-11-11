#!/usr/bin/env bash

# ==============================================================================
# VlamCom Database Setup Script
# ==============================================================================

set -e

# Kleurcodes (helder cyan, groen en rood voor uitstekend contrast op een donker scherm)
GREEN='\033[1;32m'
CYAN='\033[1;36m'
RED='\033[1;31m'
NC='\033[0m' # Reset kleur

echo -e "${CYAN}=== Starting VlamCom Database Setup ===${NC}"
echo ""

# 1. Voer de root setup uit via sudo mysql
echo -e "${CYAN}[1/2] Database 'vlamcomdb' en gebruiker 'vlamcom' aanmaken via root (sudo)...${NC}"
echo "Voer (indien gevraagd) je sudo-wachtwoord van Linux in:"
echo ""

sudo mysql < 01_setup_user_db.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Root setup succesvol afgerond.${NC}"
else
    echo -e "${RED}✗ Root setup mislukt.${NC}"
    exit 1
fi

echo ""

# 2. Voer het aanmaken en vullen van de tabellen uit als de nieuwe gebruiker 'vlamcom'
echo -e "${CYAN}[2/2] Tabellen aanmaken en vullen als gebruiker 'vlamcom'...${NC}"

mysql -u vlamcom -pvlamcompw vlamcomdb < 02_create_and_fill.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Tabellen en data succesvol aangemaakt.${NC}"
else
    echo -e "${RED}✗ Gebruikerssetup mislukt.${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}=== Setup succesvol afgerond! ===${NC}"
echo ""

# Voer het hints-script uit voor de instructies
if [ -f "./hints.sh" ]; then
    bash ./hints.sh
fi
