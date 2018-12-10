import modeli

def izberi_moznost(moznosti):
    """
    Funkcija, ki izpiše seznam možnosti in vrne indeks izbrane možnosti

    Če ne voljo ni nobene možnosti, izpiše opozorilo in vrne None
    Če je na voljo samo ena možnost, vrne 0
    >>> izberi_moznost(['dimitar','blaz'])
    1)dimitar
    2)blaz
    Vnesite izbiro: 1
    0
    >>> izberi_moznost([])
    >>> izberi_moznost(['blaz'])
    0
    """

    if len(moznosti) == 0:
        return
    elif len(moznosti) == 1:
        return 0
    else:
        for i, moznost in enumerate(moznosti, 1):
            print('{}){}'.format(i,moznost))
        
        st_moznosti = len(moznosti)
        while True:
            izbira = input("Vnesite izbiro: ")
            if not izbira.isdigit():
                print("NAPAKA: vnesti morate število")
            else:
                n = int(izbira)
                if 1 <= n <= st_moznosti:
                    return n-1
                else:
                    print("NAPAKA: vnesti morate število med 1 in {}!".format(
                        st_moznosti))

def prikazi_podatke_o_igralcu():
    ime = input("Vnesi ime igralca: ")
    if not modeli.id_igralca(ime):
        print("Igralec s tem imenom ne obstaja")
    else:
        podatki = list(modeli.pridobi_podatke(ime))
        #print(podatki[2])
        print("Št dresa: {0}, polno ime: {1}, pozicija: {2}, visina: {3}, teza: {4}, letnica rojstva: {5}".format(*podatki))

def prikazi_podatke_najboljsi():
    st = int(input("Vnesi zaporedno številko tekme (1-82): "))
    if st<=0 or st > 82:
        print("NAPAKA: Število je napačno!") 
    else:
        podatki = list(modeli.podatki_tekma(st))
        print("{} je bila odigrna tekma proti ekipi {}.".format(*podatki))
        najvec_tock = list(modeli.najvec_tock(podatki[0]))
        najvec_podaj = list(modeli.najvec_podaj(podatki[0]))
        najvec_skoki = list(modeli.najvec_skoki(podatki[0]))
        najvec_ukradenih = list(modeli.najvec_ukradene(podatki[0]))
        print("Največ točk je imel {}: {}".format(modeli.ime_igralca(najvec_tock[0]),najvec_tock[1]))
        print("Največ skokov je imel {}: {}".format(modeli.ime_igralca(najvec_skoki[0]),najvec_skoki[1]))
        print("Največ podaj je imel {}: {}".format(modeli.ime_igralca(najvec_podaj[0]),najvec_podaj[1]))
        print("Največ ukradenih žog je imel {}: {}".format(modeli.ime_igralca(najvec_ukradenih[0]),najvec_ukradenih[1]))

def pokazi_moznosti():
    print(50 * '-')
    izbira = izberi_moznost([
        'prikaži podatke o določenem igralcu',
        'prikaži najboljšega igralca na posamezni tekmi',
        'izpiše tekme med dvema datumoma',
        'izhod',
    ])
    if izbira == 0:
        prikazi_podatke_o_igralcu()
    elif izbira == 1:
        prikazi_podatke_najboljsi()
    elif izbira == 2:
        dodaj_vlogo()
    else:
        print('Nasvidenje!')
        exit()
    


def main():
    print('Pozdravljeni v bazi najboljših filmov!')
    while True:
        pokazi_moznosti()

main()
