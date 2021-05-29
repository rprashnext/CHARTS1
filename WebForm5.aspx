<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebApplication4.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Charts</title>
    <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <link href="Content/bootstrap.css" rel="stylesheet" />
   <link href="Content/bootstrap.min.css" rel="stylesheet" />
   <link href="Content/bootstrap-theme.css" rel="stylesheet" />
  <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
  <link href="Content/Site.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" />
 <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.css' />
 <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.stock.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
    table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
         <div id="chart" style="width:100%;height:450px"></div>
         <h1 class="text-center">Etherium price Data</h1>

        <!-- TABLE CONSTRUCTION-->
        <table id='table' class="table">
            <!-- HEADING FORMATION -->
            <tr>
                <th>Date</th>
                <th>Open</th>
                <th>High</th>
                <th>Low</th>
                <th>Close</th>

            </tr>

            <script>
                $(document).ready(function () {

                    // FETCHING DATA FROM JSON FILE
                    $.getJSON("https://canvasjs.com/data/docs/ethusd2018.json",
                        function (data) {
                            var item = '';

                            // ITERATING THROUGH OBJECTS
                            $.each(data, function (key, value) {

                                //CONSTRUCTION OF ROWS HAVING
                                // DATA FROM JSON OBJECT
                                item += '<tr>';
                                item += '<td>' +
                                    value.date + '</td>';
                                item += '<td>' +
                                    value.open + '</td>';
                                item += '<td>' +
                                    value.high + '</td>';
                                item += '<td>' +
                                    value.low + '</td>';
                                item += '<td>' +
                                    value.close + '</td>';
                                item += '</tr>';
                            });

                            //INSERTING ROWS INTO TABLE
                            $('#table').append(item);
                        });
                });
            </script>
        </table>
         <script type="text/javascript">
             window.onload = function () {
                 var dataPoints = [];

                 var stockChart = new CanvasJS.StockChart("chart", {
                     theme: "light2",
                     title: {
                         text: "ETH/USD"
                     },
                     animationEnabled: true,
                     animationDuration: 4000,
                     exportEnabled: true,
                     charts: [{
                         axisX: {
                             crosshair: {
                                 enabled: true
                             }
                         },
                         axisY: {
                             prefix: "$",
                             suffix: "M"
                         },
                         data: [{
                             type: "candlestick",
                             yValueFormatString: "$#,###.##M",
                             xValueFormatString: "MMM YYYY",
                             dataPoints: dataPoints
                         }]
                     }],
                     navigator: {
                         backgroundColor: "#D3D3D3",
                         slider: {
                             minimum: new Date(2018, 02, 01),
                             maximum: new Date(2018, 04, 01)
                         }
                     }
                 });

                 $.getJSON("https://canvasjs.com/data/docs/ethusd2018.json", function (data) {
                     for (var i = 0; i < data.length; i++) {
                         dataPoints.push({ x: new Date(data[i].date), y: [Number(data[i].open), Number(data[i].high), Number(data[i].low), Number(data[i].close)] });
                     }
                     stockChart.render();
                 });

             }
             var el_up = document.getElementById("GFG_UP");

             var list = [
                 { "Date:": "2018-01-01", "Open": " 741.27", "High": "764.97", "Low": "727.14", "Close": "759.03" },
                 { "Date:": "2018-01-02", "Open": "759.03", "High": "878.5", "Low": "759.02", "Close": "865" },
                 { "Date:": "2018-01-03", "Open": "865", "High": "949.98", "Low": "850.11", "Close": "938.31" },
                 { "Date:": "2018-01-04", "Open": " 938.31", "High": "994.89", "Low": "906.01", "Close": "949" },
                 { "Date:": "2018-01-05", "Open": "949", "High": "1015", "Low": "935", "Close": "969.27" },
                 { "Date:": "2018-01-06", "Open": "969.27", "High": "1001.11", "Low": "961.23", "Close": "1006.68" },
                 { "Date:": "2018-01-07", "Open": " 1006.68", "High": "1118.3", "Low": "1003.02", "Close": "1118.3" },
                 { "Date:": "2018-01-08", "Open": "1137.01", "High": "1297.58", "Low": "1119", "Close": "1290.01" },
                 { "Date:": "2018-01-09", "Open": "1290.01", "High": "1386.99", "Low": "1207.61", "Close": "1246.95" },
                 { "Date:": "2018-01-10", "Open": " 1246.95", "High": "1335", "Low": "1083.97", "Close": "1137.01" },
                 { "Date:": "2018-01-11", "Open": "1137.01", "High": "878.5", "Low": "759.02", "Close": "1260" },
                 { "Date:": "2018-01-12", "Open": "1260", "High": "949.98", "Low": "850.11", "Close": "1386" },
                 { "Date:": "2018-01-13", "Open": " 1386", "High": "994.89", "Low": "906.01", "Close": "1365" },
                 { "Date:": "2018-01-14", "Open": "1365.46", "High": "1015", "Low": "935", "Close": "1278.63" },
                 { "Date:": "2018-01-15", "Open": "969.27", "High": "1001.11", "Low": "961.23", "Close": "1006.68" },
                 { "Date:": "2018-01-16", "Open": " 1006.68", "High": "1118.3", "Low": "1003.02", "Close": "1118.3" },
                 { "Date:": "2018-01-17", "Open": "1137.01", "High": "1297.58", "Low": "1119", "Close": "1290.01" },
                 { "Date:": "2018-01-18", "Open": "1290.01", "High": "1386.99", "Low": "1207.61", "Close": "1246.95" },
             ];
             el_up.innerHTML = "Click on the button to create the "
                 + "table from the JSON data.<br><br>"
                 + JSON.stringify(list[0]) + "<br>"
                 + JSON.stringify(list[1]) + "<br>"
                 + JSON.stringify(list[2]) + "<br>"
                 + JSON.stringify(list[3]) + "<br>"
                 + JSON.stringify(list[4]);
             function GFG_FUN() {
                 var cols = [];

                 for (var i = 0; i < list.length; i++) {
                     for (var k in list[i]) {
                         if (cols.indexOf(k) === -1) {

                             // Push all keys to the array
                             cols.push(k);
                         }
                     }
                 }

                 // Create a table element
                 var table = document.createElement("table");

                 // Create table row tr element of a table
                 var tr = table.insertRow(-1);

                 for (var i = 0; i < cols.length; i++) {

                     // Create the table header th element
                     var theader = document.createElement("th");
                     theader.innerHTML = cols[i];

                     // Append columnName to the table row
                     tr.appendChild(theader);
                 }

                 // Adding the data to the table
                 for (var i = 0; i < list.length; i++) {

                     // Create a new row
                     trow = table.insertRow(-1);
                     for (var j = 0; j < cols.length; j++) {
                         var cell = trow.insertCell(-1);

                         // Inserting the cell at particular place
                         cell.innerHTML = list[i][cols[j]];
                     }
                 }
                 // Add the newely created table containing json data
                 var el = document.getElementById("table");
                 el.innerHTML = "table";
                 el.appendChild(table);
             }
         </script>
    </form>
<//body>
</html>
