% rebase('osnova')


<h1 class="title is-3 is-spaced"> {{podatki_o_igralcu[1]}} </h1>
<p>
<ol>
    <li>
        Številka: {{podatki_o_igralcu[0]}}
    </li>
    <li>
        Višina: {{podatki_o_igralcu[3]}} 
    </li>
    <li>
        Teža: {{podatki_o_igralcu[4]}} paunds
    </li>
    <li>
        Leto rojstva: {{podatki_o_igralcu[5]}}
    </li>
</ol>
</p>

<h5 class="subtitle is-5"> Igralec je igral na naslednjih tekmah:</h5>
<p>
    <ol>
        % for tekma in seznam_tekem: 
            <p>
                <ol>
                <li>
                    Datum: {{tekma[1]}}
                </li>
                <li>
                    Nasprotnik: {{tekma[7]}}
                </li>
                <li>
                    Throwbacks: {{tekma[2]}}
                </li>
                <li>
                    Asistence: {{tekma[3]}}
                </li>
                <li>
                    STL: {{tekma[4]}}
                </li>
                <li>
                    Točke: {{tekma[5]}}
                </li>
                </ol>
            </p>
        % end
    </ol>
</p>


