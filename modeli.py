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

def podatki_tekma(st):
    """
    Vrne datum in nasportnik za zaporedno številko tekme
    """
    
    return conn.execute("SELECT date,opponent FROM tekme LIMIT 1 OFFSET ?",[st]).fetchone()

#def najvec

def pridobi_podatke(igralec):
    """
    Vrne podatke o igralcu. Vemo zagotovo, da je igralec v ekipi
    """
    return conn.execute("SELECT * FROM igralci WHERE igralci.name = ?",[igralec]).fetchone()

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

