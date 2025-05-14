import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatistikPage extends StatelessWidget {
  const StatistikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_CandidateData> candidateData = [
      _CandidateData('Moch. Lukman', 133),
      _CandidateData('Aurelia Naura', 151),
      _CandidateData('Andra Gio F.', 76),
    ];

    return Container(
      color: const Color(0xFFF5FDF9),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quick Count",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(color: Colors.white),
                axisLine: const AxisLine(color: Colors.white),
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                labelStyle: const TextStyle(color: Colors.white),
                axisLine: const AxisLine(color: Colors.white),
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: Colors.white.withOpacity(0.3),
                  dashArray: [5, 5],
                ),
              ),
              plotAreaBorderWidth: 0,
              series: <BarSeries<_CandidateData, String>>[
                BarSeries<_CandidateData, String>(
                  dataSource: candidateData,
                  xValueMapper: (_CandidateData data, _) => data.name,
                  yValueMapper: (_CandidateData data, _) => data.votes,
                  name: 'Jumlah Suara',
                  color: Colors.greenAccent[400],
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CandidateData {
  final String name;
  final int votes;

  _CandidateData(this.name, this.votes);
}
