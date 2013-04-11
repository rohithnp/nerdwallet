
$(document).ready(function() {

    /* Globals */ 
    var stockIdsAdded = [];
    
    var options = {
        chart: {
            type: 'line',
            renderTo: 'chart'
        },
        title: {
            text: 'Vangaurd Sample Chart',
        },
        xAxis: {
            categories: ['May 30', 'May 31', 'June 1']
        },
        yAxis: {
            title: {
                text: 'Price ($)'
            }
        },
        tooltip: {
            formatter: function () {
              var color = "red";
              var s = this.point.category + '<br/>';
              s+='<span style="font-weight:bold;color:' + this.series.color + ';">' + this.series.name.symbol +'</span><br/>';
              s+='Open <b>' + this.point.open + '</b><br/>';
              s+='Low <b>' + this.point.low + '</b><br/>';
              s+='High <b>' + this.point.high + '</b><br/>';
              s+='Close <b>' + this.point.y + '</b><br/>';
              if (this.point.changeFromLastClose > 0 )
                 color = "green";
              s+='Change <span style="font-weight:bold;color:' + color +';">' + Highcharts.numberFormat(this.point.changeFromLastClose,2,'.') + '%</span><br/>';
              s+='Yield <b>' + Highcharts.numberFormat(this.point.yield,2,'.') + '%</b><br/>';
              s+='Volume <b>' + this.point.volume + '</b>';
              return s
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -10,
            y: 100,
            borderWidth: 1,
            title: {
                text: 'Security<br/><span style="font-size: 9px; color: #666; font-weight: normal">(Click to hide)</span>'
            },
            labelFormatter: function() {
                console.log(this);
                return this.name.fullName +' ('+this.name.symbol+')';
            }
        }
    }

    var chart = new Highcharts.Chart(options);

  // set up event listener on button
  // clear chart and reset data
    $('#button').click(function() {
        chart.destroy();
        chart = new Highcharts.Chart(options);
        stockIdsAdded = [];     

    });

    //intialize typeahead on input box
    $('#searchInput')
        .typeahead({
          prefetch: {
            url: "/securities.json",
          },
          valueKey: 'symbol'                                                            
        })
        .on('typeahead:selected', onAutocompleted)
        .on('typeahead:autocompleted', onSelected);

    //gets called when user uses 'tab' to complete query
    function onAutocompleted($e, datum){

        //fetch price data for the selected security
        $.getJSON('/getPrice/'+datum.id+'.json', function(data){
        //massage data into proper format for highcharts
        /*
            {
                data
                    [{
                        y: 1,
                        open: ,
                        low: ,
                        high: ,
                        volume: ,
                        changeFromLastClose: ,
                        yield: ,
                        volume: 
                    },
                    {
                        y: 2,
                    },
                    {
                        y: 3,
                    }]
                name: spy
            }
            */
        var prices = [];
        for (var i = 0; i < data.length && data;i++){
            prices.push({
                y : eval(data[i].last), 
                open : eval(data[i].open), 
                low : eval(data[i].low), 
                high : eval(data[i].high), 
                volume : eval(data[i].volume),
                changeFromLastClose: eval(data[i].changeFromLastClose),
                yield : eval(data[i].cummulativeCashDividend)/eval(data[i].last) * 100,
                volume : eval(data[i].volume),
            });
        }

        //only add stock if not added already
        if (!stockIdsAdded[datum.id]){
             var name = {symbol:datum.symbol,fullName:datum.name};
             chart.addSeries({data:prices,name:name});
             stockIdsAdded[datum.id] = true;
        }
        //clear input box
        $('#searchInput').typeahead('setQuery', '');
      });
    }

    //gets called when user selects item from dropdown
    function onSelected($e, datum) {
      onAutocompleted($e,datum);
    }
});
    
