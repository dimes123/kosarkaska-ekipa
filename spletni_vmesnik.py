from bottle import route, run, template, get, static_file, post, request, redirect
import modeli

@get('/')
def glavna_stran():
    (st_tekem,) = modeli.stevilo_tekem()
    (st_igralcev,) = modeli.stevilo_igralcev()
    return template('glavna_stran',
                    st_tekem = st_tekem,
                    st_igralcev = st_igralcev
                    )

@get('/igralci/')
def igralci():
    vsi = modeli.igralci_vsi()
    return template('igralci',
                     igralci = vsi
                     )

@get('/igralci/<id:int>/')
def igralec(id):
    podatki_o_igralcu = modeli.pridobi_podatke(id)
    seznam_tekem = modeli.statistika_igralca_s_tekem(id)
    return template('igralec',
                     podatki_o_igralcu = podatki_o_igralcu,
                     seznam_tekem = seznam_tekem
                     )

@get('/ekipa/')
def ekipa():
    podatki = modeli.podatki_o_ekipi()
    seznam_igralcev = modeli.igralci_vsi()
    return template('ekipa',
                    podatki_o_ekipi = podatki,
                    seznam_igralcev = seznam_igralcev)

@get('/ekipa/tekme/')
def tekme():
    zacDatum = request.query.zacetek
    konDatum = request.query.konec
    tekme = modeli.tekme_v_obdobju_vse(zacDatum, konDatum)
    return template('tekme',
                    zac_datum = zacDatum,
                    kon_datum = konDatum,
                    tekme = tekme)


@get("/static/<filepath>")
def js(filepath):
    return static_file(filepath, root="static")

@get('/povprecja/')
def povprecja():
    igralci = modeli.igralci_vsi()
    return template('povprecja',
                    vse_osebe = igralci)

@get('/povprecja/povpigralec/')
def povpigralec():
    ime = request.query.igralci
    id = modeli.id_igralca(ime)[0]
    maximum = modeli.max_stevilo_tock(id)
    average = modeli.avg_stevilo_tock(id)
    print(average)
    #avg = modeli.avg_stevilo_tock(id)
    return template('povpigralec',
                    ime = ime,
                    max = maximum,
                    avg = average)

@get('/povpekipa/')
def povpekipa():
    return template('povpekipa')

@get('/dodaj_igralca/')
def dodaj_igralca():
    return template('dodaj_igralca')

@post('/dodaj_igralca/')
def dodajanje_igralca():
    if (int(request.forms.stDresa) >= 0) and (int(request.forms.teza) > 0):
        id = modeli.dodaj_igralca(
            stDresa = request.forms.stDresa,
            imeIgralca = request.forms.imeIgralca,
            pozicija = request.forms.pozicija,
            visina = request.forms.visina,
            teza = request.forms.reza,
            letoRojstva = request.forms.letoRojstva
        )
    redirect("/igralci/")   



run(host='localhost', port=8080, reloader=True, debug=True)