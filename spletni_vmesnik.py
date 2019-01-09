from bottle import route, run, template, get
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
    seznam_tekem = modeli.seznam_tekem(id)
    return template('igralec',
                     podatki_o_igralcu = podatki_o_igralcu,
                     seznam_tekem = seznam_tekem
                     )


run(host='localhost', port=8080, reloader=True, debug=True)