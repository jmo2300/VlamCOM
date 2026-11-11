#!/usr/bin/env bash

# ==============================================================================
# VlamCom Database Setup Script
# ==============================================================================

set -e

# Kleurcodes (helder cyan, groen en rood voor uitstekende contrast op zwart)
GREEN='\033[1;32m'
CYAN='\033[1;36m'
RED='\033[1;31m'
NC='\033[0m'

echo -e "${CYAN}=== Starting VlamCom Database Setup ===${NC}"

# 1. Voer de root setup uit via sudo mysql
echo -e "${CYAN}[1/2] Database 'vlamcomdb' en gebruiker 'vlamcom' aanmaken via root (sudo)...${NC}"
echo "Voer (indien gevraagd) je sudo-wachtwoord van Linux in:"

sudo mysql < 01_setup_user_db.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Root setup succesvol afgerond.${NC}"
else
    echo -e "${RED}✗ Root setup mislukt.${NC}"
    exit 1
fi

# 2. Voer het aanmaken en vullen van de tabellen uit als de nieuwe gebruiker 'vlamcom'
echo -e "${CYAN}[2/2] Tabellen aanmaken en vullen als gebruiker 'vlamcom'...${NC}"
mysql -u vlamcom -pvlamcompw vlamcomdb < 02_create_and_fill.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Tabellen en data succesvol aangemaakt.${NC}"
else
    echo -e "${RED}✗ Gebruikerssetup mislukt.${NC}"
    exit 1
fi

echo -e "${GREEN}=== Setup succesvol afgerond! ===${NC}"
