import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

final List<List<CircularStackEntry>> _UsageData = [
  <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Dishwasher'),
        new CircularSegmentEntry(1800.0, Colors.green[200], rankKey: 'Fridge'),
        new CircularSegmentEntry(200.0, Colors.blue[200], rankKey: 'Washing Machine'),
        new CircularSegmentEntry(2500.0, Colors.yellow[200], rankKey: 'Hot Water System'),
      ],
      rankKey: 'Daily Usage Data',
    )
  ],
  <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(900.0, Colors.red[200], rankKey: 'Dishwasher'),
        new CircularSegmentEntry(2800.0, Colors.green[200], rankKey: 'Fridge'),
        new CircularSegmentEntry(600.0, Colors.blue[200], rankKey: 'Washing Machine'),
        new CircularSegmentEntry(300.0, Colors.yellow[200], rankKey: 'Hot Water System'),
      ],
      rankKey: 'Daily Usage Data',
    )
  ],
  <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(1500.0, Colors.red[200], rankKey: 'Dishwasher'),
        new CircularSegmentEntry(600.0, Colors.green[200], rankKey: 'Fridge'),
        new CircularSegmentEntry(20.0, Colors.blue[200], rankKey: 'Washing Machine'),
        new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Hot Water System'),
      ],
      rankKey: 'Daily Usage Data',
    )
  ],
];


class AccumulatedData extends StatefulWidget
{
  @override
  _AccumulatedDataState createState() => new _AccumulatedDataState();
}

class _AccumulatedDataState extends State<AccumulatedData>
{
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<
      AnimatedCircularChartState>();
  final _chartSize = const Size(300.0, 300.0);
  int sampleIndex = 0;


  void cycleSamples()
  {
    setState(()
    {
      sampleIndex++;
      List<CircularStackEntry> data = _UsageData[sampleIndex % 3];
      _chartKey.currentState.updateData(data);
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
      (
      appBar: new AppBar
        (
        title: new Text("Accumulated Data"),
      ),
      body: new Container
        (
        child: new Center
          (
            child: new AnimatedCircularChart
              (
              key: _chartKey,
              size: _chartSize,
              initialChartData: _UsageData[0],
              chartType: CircularChartType.Pie,
            )
        ),
      ),
      floatingActionButton: new FloatingActionButton
        (
        child: new Icon(Icons.refresh),
        onPressed: cycleSamples,
      ),
    );
  }
}

