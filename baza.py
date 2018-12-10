import csv
from modeli import conn, commit

@commit
def pobrisi_tabele(cur):
    """
    Pobriše tabele iz baze.
    """
    cur.execute("DROP TABLE IF EXISTS igralci;")
    cur.execute("DROP TABLE IF EXISTS ekipe;")
    cur.execute("DROP TABLE IF EXISTS tekme;")
    cur.execute("DROP TABLE IF EXISTS statistika;")

@commit
def ustvari_tabele(cur):
    """
    Ustvari tabele v bazi.
    """
    cur.execute("""
        CREATE TABLE igralci (
            number          INTEGER PRIMARY KEY,
            name            TEXT,
            position        TEXT,
            height          STRING,
            weight          INTEGER,
            year of birth   INTEGER
        );
    """)
    cur.execute("""
        CREATE TABLE ekipe (
            tag        STRING PRIMARY KEY,
            trainer    TEXT,
            franchise  TEXT
        );
    """)
    cur.execute("""
        CREATE TABLE tekme (
            date            DATE PRIMARY KEY,
            opponent        STRING REFERENCES ekipe(franchise),
            outcome         STRING,
            pointsteam      INTEGER,
            pointsopponent  INTEGER
        );
    """)
        cur.execute("""
        CREATE TABLE statistika (
            playerREF    INTEGER REFERENCES igralci(number),
            dateREF      DATE REFERENCES tekme(date),
            rebounds     INTEGER,
            assists      INTEGER,
            steals       INTEGER,
            points       INTEGER
        );
    """)

@commit
def uvozi_igralci(cur):
    """
    Uvozi podatke o igralcih.
    """
    cur.execute("DELETE FROM igralci;")
    with open('Podatki/igralci.csv') as datoteka:
        podatki = csv.reader(datoteka)
        stolpci = next(podatki)
        poizvedba = """
            INSERT INTO igralci VALUES ({})
        """.format(', '.join(["?"] * len(stolpci)))
        for vrstica in podatki:
            cur.execute(poizvedba, vrstica)

@commit
def uvozi_ekipe(cur):
    """
    Uvozi podatke o osebah.
    """
    cur.execute("DELETE FROM oseba;")
    with open('podatki/oseba.csv') as datoteka:
        podatki = csv.reader(datoteka)
        stolpci = next(podatki)
        poizvedba = """
            INSERT INTO oseba VALUES ({})
        """.format(', '.join(["?"] * len(stolpci)))
        for vrstica in podatki:
            cur.execute(poizvedba, vrstica)

@commit
def uvozi_statistika(cur):
    """
    Uvozi podatke o vlogah.
    """
    cur.execute("DELETE FROM nastopa;")
    cur.execute("DELETE FROM vloga;")
    vloge = {}
    with open('podatki/vloge.csv') as datoteka:
        podatki = csv.reader(datoteka)
        stolpci = next(podatki)
        v = stolpci.index('vloga')
        poizvedba = """
            INSERT INTO nastopa VALUES ({})
        """.format(', '.join(["?"] * len(stolpci)))
        poizvedba_vloga = "INSERT INTO vloga (naziv) VALUES (?);"
        for vrstica in podatki:
            vloga = vrstica[v]
            if vloga not in vloge:
                cur.execute(poizvedba_vloga, [vloga])
                vloge[vloga] = cur.lastrowid
            vrstica[v] = vloge[vloga]
            cur.execute(poizvedba, vrstica)

@commit
def uvozi_tekme (cur):
    """
    Uvozi podatke o žanrih.
    """
    cur.execute("DELETE FROM pripada;")
    cur.execute("DELETE FROM zanr;")
    zanri = {}
    with open('podatki/zanri.csv') as datoteka:
        podatki = csv.reader(datoteka)
        stolpci = next(podatki)
        z = stolpci.index('zanr')
        poizvedba = """
            INSERT INTO pripada VALUES ({})
        """.format(', '.join(["?"] * len(stolpci)))
        poizvedba_zanr = "INSERT INTO zanr (naziv) VALUES (?);"
        for vrstica in podatki:
            zanr = vrstica[z]
            if zanr not in zanri:
                cur.execute(poizvedba_zanr, [zanr])
                zanri[zanr] = cur.lastrowid
            vrstica[z] = zanri[zanr]
            cur.execute(poizvedba, vrstica)

@commit
def ustvari_bazo(cur):
    """
    Opravi celoten postopek postavitve baze.
    """
    pobrisi_tabele.nocommit(cur)
    ustvari_tabele.nocommit(cur)
    uvozi_igralci.nocommit(cur)
    uvozi_ekipe.nocommit(cur)
    uvozi_statistika.nocommit(cur)
    uvozi_tekme.nocommit(cur)

def ustvari_bazo_ce_ne_obstaja():
    """
    Ustvari bazo, če ta še ne obstaja.
    """
    cur = conn.execute("SELECT COUNT(*) FROM sqlite_master")
    if cur.fetchone() == (0, ):
        ustvari_bazo()
