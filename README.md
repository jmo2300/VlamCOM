# VlamCOM
Vlaamse Comm en SW
Fictief Communicatie en software bedrijf in Vlaanderen.

Samenvatting installatie VlamcomDB:
```bash
cd
git clone https://github.com/jmo2300/VlamCOM
```


```bash
cd VlamCOM/
chmod +x setup.sh
chmod +x hints.sh
./setup.sh
```


Extra SQL tips kan je in je Linux command line vragen met:
```bash
~/VlamCOM/hints.sh
```


---

# VlamCom Database Setup

Dit repository bevat de SQL-scripts en een geautomatiseerd Bash-script om de database voor **VlamCom** (een fictief communicatie- en softwarebedrijf in Vlaanderen) op te zetten.

Alle databasestructuren, tabelnamen en kolomnamen zijn volledig in **lowercase** geschreven om het gebruik voor leerlingen eenvoudig en eenduidig te maken.

---

## Bestandsstructuur

* **`01_setup_user_db.sql`**: Wordt uitgevoerd met **root**-rechten. Het verwijdert eventuele bestaande versies van `vlamcomdb` en de gebruiker `vlamcom`, maakt deze opnieuw aan en kent de nodige rechten toe.
* **`02_create_and_fill.sql`**: Wordt uitgevoerd onder de gebruiker **`vlamcom`**. Het verwijdert bestaande tabellen, maakt de tabellen `afdelingen` en `medewerkers` aan en vult deze met testdata.
* **`setup.sh`**: Een Bash-script dat het volledige proces automatisch in de juiste volgorde uitvoert.
* **`hints.sh`**: Een Bash-script dat SQL hints toont.

---

## Databasestructuur & Gegevens

### 1. Gebruikersgegevens MySQL
* **Database:** `vlamcomdb`
* **Gebruikersnaam:** `vlamcom`
* **Wachtwoord:** `vlamcompw`

### 2. Tabellen
* **`afdelingen`**
  * `afdelingid` (INT, Primary Key, Auto Increment)
  * `afdelingnaam` (VARCHAR 50)
* **`medewerkers`**
  * `medewerkerid` (INT, Primary Key, Auto Increment)
  * `voornaam` (VARCHAR 50)
  * `achternaam` (VARCHAR 50)
  * `functie` (VARCHAR 50)
  * `afdelingid` (INT, Foreign Key -> `afdelingen.afdelingid`)
  * `locatie` (VARCHAR 50)
  * `salaris` (DECIMAL 10,2)

---

## Snelstart (Installatie)

### Vereisten
* MySQL Server (versie 5.7+ of MariaDB 10.3+)
* Bash shell (Linux, macOS of WSL op Windows)

### Uitvoering via Bash (Aanbevolen)
Maak het Bash-script uitvoerbaar en start de installatie:

```bash
chmod +x setup.sh
./setup.sh
```

Het script vraagt om het MySQL `root`-wachtwoord en handelt daarna alles automatisch af.

---

## Handmatige Uitvoering

Als je het liever handmatig via de CLI wilt uitvoeren:

1. **Database & Gebruiker aanmaken (als Root):**
   ```bash
   mysql -u root -p < 01_setup_user_db.sql
   ```

2. **Tabellen en Data importeren (als User `vlamcom`):**
   ```bash
   mysql -u vlamcom -pvlamcompw vlamcomdb < 02_create_and_fill.sql
   ```

3. **Verbinding maken met de database:**
   ```bash
   mysql -u vlamcom -pvlamcompw vlamcomdb
   ```
