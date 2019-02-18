% rebase('osnova')
<head>
<script src = "/static/sorttable.js"></script>
<style>
table
{
    width:80%;
}
table td, table th {
  border: 1px solid black;
  text-align: center;
}
h2 {
    text-align: center;
}

</style>
</head>

<body>
<h1 class = "title is-3 is-spaced"> Tekme </h1>

<p> Izbrali ste tekme med {{ zac_datum }} in {{ kon_datum }}. <p/>
<p>  V tem obdobju je Miami Heat igral naslednje tekme: <p/>

<br/>

<br/>
<table class="table-sm table-sortable">
<tr>
    <th>Datum</th>
    <th>Nasprotnik</th>
    <th>Rezultat</th>
    <th>Točke Miami</th>
    <th>Točke nasprotnik</th>
</tr>
    %for tekma in tekme:
    <tr>
    <td>{{tekma[0]}}</td>
    <td>{{tekma[1]}}</td>
    <td>{{tekma[2]}}</td>
    <td>{{tekma[3]}}</td>
    <td>{{tekma[4]}}</td>
    </tr>
    %end
</table>
<br/>

<body/>