<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApplication4.WebForm4" %>

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
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.stock.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="chart" style="height:450px;width: 100%;"></div>
       <h1 class="text-center">Bit Coin price Data</h1>
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
                    $.getJSON("https://canvasjs.com/data/docs/btcusd2018.json",
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
            title: {
                text: "BIT Coin Open and Close/USD"
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
                    title: "BTC/USD",
                    prefix: "$",
                    suffix: "M"
                },
                data: [{
                    type: "column", //Change it to "spline", "area", "column"
                    yValueFormatString: "$#,###.##M",
                    xValueFormatString: "MMM YYYY",
                    dataPoints: dataPoints
                }]
            }],
            navigator: {
                slider: {
                    minimum: new Date(2018, 04, 01),
                    maximum: new Date(2018, 06, 01)
                }
            }
        });

        $.getJSON("https://canvasjs.com/data/docs/btcusd2018.json", function (data) {
            for (var i = 0; i < data.length; i++) {
                dataPoints.push({ x: new Date(data[i].date), y: Number(data[i].volume_usd) });
            }
            for (var j = 0; j < data.length; j++) {
                dataPoints.push({ x: new Date(data[j].date), y: Number(data[j].high) });
            }
            stockChart.render();
        });
    }

</script>
    </form>
</body>
</html>
