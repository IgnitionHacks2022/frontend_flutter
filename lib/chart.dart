import 'package:flutter/material.dart'; 
import 'package:fl_chart/fl_chart.dart';
import 'reqs.dart';

class LineChartWidget extends StatelessWidget {
    final List<GarbageItem> items;
    const LineChartWidget({Key? key,required this.items})
      : super(key: key);
    @override
    Widget build(BuildContext context){
        return ListView(
            children:<Widget>[
                SizedBox(height:50),
                AspectRatio(
                    aspectRatio: 2,
                    child: LineChart(
                        LineChartData(
                            lineBarsData: [
                                LineChartBarData(
                                    spots: points(getWeek()),
                                    isCurved: false,
                                    dotData: FlDotData(show: false),
                                    color: Colors.green
                                )
                            ],
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                ),
                        )
                        
                    )
                ),
                SizedBox(
                    width:100,
                    height:250
                ),
                AspectRatio(
                    aspectRatio: 2,
                    child: BarChart(BarChartData(
                        barGroups: chartGroups(),
                        borderData: FlBorderData(
                            border: const Border(bottom: BorderSide(), left: BorderSide())),
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            )
                        )))
                        
                        

            ]
        );

    }
    List<List<GarbageItem>> getWeek(){
        DateTime now = DateTime.now();
        List<List<GarbageItem>> week = [];
        for(int i = 0; i<7;i++){
            DateTime day = now.subtract(Duration(days: i));
            var dayGarb = items.where((i) => DateUtils.isSameDay(day, i.createdAt)).toList();
            week.add(dayGarb);


        }
        return week;

        

    }
    List<FlSpot> points(List<List<GarbageItem>> week){
        return List<FlSpot>.generate(week.length,(index) => FlSpot(index.toDouble(),week[index].length.toDouble()));
    }

    List<BarChartGroupData> chartGroups(){

        List<BarChartGroupData> bars = [];

        getWeek().asMap().forEach((key,value) =>
            bars.add(
                BarChartGroupData(
                    x:key,
                    barRods: [
                        BarChartRodData(
                            toY: value.where((i) => i.type=="blue").length.toDouble()
                        ),
                        BarChartRodData(
                            toY: value.where((i) => i.type=="red").length.toDouble()
                        ),
                        BarChartRodData(
                            toY: value.where((i)=> i.type=="garbage").length.toDouble()
                        )
                    ]
                )


                ),

            );
        return bars;



    }
    SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {

        return Text(value.toInt().toString());
    },
  );
    
}
