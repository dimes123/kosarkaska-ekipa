import sqlite3
import baza

conn = sqlite3.connect('kosarka.db')
baza.ustvari_bazo_ce_ne_obstaja(conn)
conn.execute('PRAGMA foreign_keys = ON')

def commit(fun):
    """
    Dekorator, ki ustvari kurzor, ga poda dekorirani funkciji,
    in nato zapiše spremembe v bazo.

    Originalna funkcija je na voljo pod atributom nocommit.
    """
    def funkcija(*largs, **kwargs):
        ret = fun(conn.cursor(), *largs, **kwargs)
        conn.commit()
        return ret
    funkcija.__doc__ = fun.__doc__
    funkcija.__name__ = fun.__name__
    funkcija.__qualname__ = fun.__qualname__
    fun.__qualname__ += '.nocommit'
    funkcija.nocommit = fun
    return funkcija

def id_igralca(igralec):
    """
    Vrne ID če je igralec v ekipi.
    Če igralca ni, vrne False.
    """
    vrstica = conn.execute("SELECT number FROM igralci WHERE igralci.name = ?",[igralec]).fetchone()
    if vrstica is not None:
        return vrstica
    return False

def ime_igralca(st):
    """
    Vrne ime igralca na podlagi njegove številke
    """
    return  ''.join(conn.execute("SELECT name FROM igralci WHERE number = ?",[st]).fetchone())


def ali_ekipa_obstaja(imeNasprotnika):
    """
    Preveri ali dana ekipa obstaja
    """
    return conn.execute("SELECT franchise FROM ekipe WHERE franchise = ?",[imeNasprotnika]).fetchone() is None

def poisci_datume(imeNasprotnika):
    """
    Poišče vse datume, ko je naša  ekipa igrala proti nasprotniku imeNasprotnika
    """
    rez = conn.execute("SELECT date FROM tekme WHERE tekme.opponent = ?",[imeNasprotnika]).fetchall()
    #Pretvorimo dobljene podatke v seznam
    return [podatek[0] for podatek in rez]

def pridobi_podatke(id):
    """
    Vrne podatke o igralcu. Vemo zagotovo, da je igralec v ekipi
    """
    return conn.execute("SELECT * FROM igralci WHERE igralci.number = ?",[id]).fetchone()

def najvec_tock(datum):
    """
    Vrne igralca z največ točk na določeni tekmi in
    število točk
    """
    return conn.execute("SELECT playerRef, max(points) FROM statistika WHERE statistika.dateREF = ?",[datum]).fetchone()

def najvec_skoki(datum):
    """
    Vrne igralca z največ skoki na določeni tekmi in
    število skokov
    """
    return conn.execute("SELECT playerRef, max(rebounds) FROM statistika WHERE statistika.dateREF = ?",[datum]).fetchone()

def najvec_podaj(datum):
    """
    Vrne igralca z največ podaj na določeni tekmi in
    število podaj
    """
    return conn.execute("SELECT playerRef, max(assists) FROM statistika WHERE statistika.dateREF = ?",[datum]).fetchone()

def najvec_ukradene(datum):
    """
    Vrne igralca z največ ukradenimi žogami na določeni tekmi in
    število ukradenih žog
    """
    return conn.execute("SELECT playerRef, max(steals) FROM statistika WHERE statistika.dateREF = ?",[datum]).fetchone()

def tekme_v_obdobju(zacDatum, konDatum):
    """
    Vrne seznam tekm, ki jih je ekipa odigrala med dvema datumoma
    """
    rez = conn.execute("""SELECT opponent,count(opponent) FROM tekme 
                        WHERE date >= ? AND date <= ?
                        GROUP BY opponent""",[zacDatum, konDatum]).fetchall()
    return rez

def tekme_v_obdobju_vse(zacDatum, konDatum):
    """
    Vrne seznam tekm, ki jih je ekipa odigrala med dvema datumoma
    """
    rez = conn.execute("""SELECT * FROM tekme 
                        WHERE date >= ? AND date <= ?
                        """,[zacDatum, konDatum]).fetchall()
    return rez

def stevilo_zmag(zacDatum, konDatum):
    """
    Vrne število zmag ekipe v določenem času
    """
    return conn.execute("""SELECT count(outcome) FROM tekme
                        WHERE date >= ? AND 
                        date <= ? AND 
                        outcome = 'W'
                        """,[zacDatum, konDatum]).fetchone()

def stevilo_porazov(zacDatum, konDatum):
    """
    Vrne število porazov ekipe v določenem času
    """
    return conn.execute("""SELECT count(outcome) FROM tekme
                        WHERE date >= ? AND 
                        date <= ? AND 
                        outcome = 'L'
                        """,[zacDatum, konDatum]).fetchone()

def stevilo_igralcev():
    """
    Vrne število vseh igralcev, ki so igrali v Miami Heat v sezoni 2017-2018
    """
    return conn.execute("""SELECT count(*) FROM igralci""").fetchone()

def stevilo_tekem():
    """
    Vrne število vseh igralcev, ki so igrali v Miami Heat v sezoni 2017-2018
    """
    return conn.execute("""SELECT count(*) FROM tekme""").fetchone()

def igralci_vsi():
    """
    Vrne seznam vseh igralcev, ki so igrali v Miami Heat v sezoni 2017-2018
    """
    return conn.execute("""SELECT number, name, position FROM igralci""").fetchall()

def statistika_igralca_s_tekem(id):
    """
    Vrne seznam vseh tekem, na katerih je ta igralec igral
    """
    return conn.execute("""SELECT * FROM statistika 
                            JOIN tekme ON date = dateREF
                           WHERE playerREF = ?
                        """, [id]).fetchall()

def max_stevilo_tock(id):
    """
    Vrne maksimalno število vse statistike iz tekem za igralca z nekim id-jem
    """
    return conn.execute("SELECT MAX(rebounds), MAX(assists), MAX(steals), MAX(points) FROM statistika WHERE statistika.playerREF = ?;",[id]).fetchall()

def avg_stevilo_tock(id):
    """
    Vrne maksimalno število vse statistike iz tekem za igralca z nekim id-jem
    """
    return conn.execute("SELECT AVG(rebounds), AVG(assists), AVG(steals), AVG(points) FROM statistika WHERE statistika.playerREF = ?;",[id]).fetchall()


def podatki_o_ekipi():
    """
    Funckija vrne osnovne podatke o ekipi Miami heat
    """
    return conn.execute("""SELECT * FROM ekipe
                            WHERE Tag = 'MIA' """, ).fetchone()

