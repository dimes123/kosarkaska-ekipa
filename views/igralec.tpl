% rebase('osnova')
<head>
<style>
table
{
    width:80%;
}
table td, table th {
  border: 1px solid black;
  text-align: center;
}

</style>
</head>

<body>
<h1 class="title is-3 is-spaced"> {{podatki_o_igralcu[1]}} </h1>
<ol>
    <li>
        <b>Številka</b>: {{podatki_o_igralcu[0]}}
    </li>
    <li>
        <b>Višina</b>: {{podatki_o_igralcu[3]}} 
    </li>
    <li>
        <b>Teža</b>: {{podatki_o_igralcu[4]}} pounds
    </li>
    <li>
        <b>Leto rojstva</b>: {{podatki_o_igralcu[5]}}
    </li>
</ol>

<br />
<h2 class="title is-3 is-spaced">Statistika igralca</h2>
<table>
<tr>
    <th>Datum</th>
    <th>Nasprotnik</th>
    <th>Skoki</th>
    <th>Podaje</th>
    <th>Ukradene žoge</th>
    <th>Točke</th>
</tr>
    %for tekma in seznam_tekem:
    <tr>
    <td>{{tekma[1]}}</td>
    <td>{{tekma[7]}}</td>
    <td>{{tekma[2]}}</td>
    <td>{{tekma[3]}}</td>
    <td>{{tekma[4]}}</td>
    <td>{{tekma[5]}}</td>
    </tr>
    %end
</table>
</body>