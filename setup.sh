#!/usr/bin/env bash

# ==============================================================================
# VlamCom Database Setup Script
# ==============================================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}=== Starting VlamCom Database Setup ===${NC}"

# Vraag veilig om het MySQL root wachtwoord
read -sp "Geef MySQL root password: " ROOT_PASS
echo ""

# 1. Voer de root setup uit (Database en Gebruiker aanmaken)
echo -e "${BLUE}[1/2] Database 'vlamcomdb' en gebruiker 'vlamcom' aanmaken via root...${NC}"
mysql -u root -p"$ROOT_PASS" < 01_setup_user_db.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Root setup succesvol afgerond.${NC}"
else
    echo -e "${RED}✗ Root setup mislukt.${NC}"
    exit 1
fi

# 2. Voer het aanmaken en vullen van de tabellen uit als gebruiker 'vlamcom'
echo -e "${BLUE}[2/2] Tabellen aanmaken en vullen als gebruiker 'vlamcom'...${NC}"
mysql -u vlamcom -pvlamcompw vlamcomdb < 02_create_and_fill.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Tabellen en data succesvol aangemaakt.${NC}"
else
    echo -e "${RED}✗ Gebruikerssetup mislukt.${NC}"
    exit 1
fi

echo -e "${GREEN}=== Setup succesvol afgerond! ===${NC}"
