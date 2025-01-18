import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InfoScreen extends StatelessWidget {
  final Map<String, String> data;
  const InfoScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stock Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      data['image']!,
                      height: size.height * 0.06,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      data['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Stock Performance (Last 3 Years)',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: size.height * 0.25,
                width: size.width * 0.95,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(width: 1),
                        bottom: BorderSide(width: 1),
                      ),
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 3),
                          const FlSpot(1, 2),
                          const FlSpot(2, 5),
                          const FlSpot(3, 3.5),
                          const FlSpot(4, 4.8),
                          const FlSpot(5, 6),
                          const FlSpot(6, 5.5),
                        ],
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 3,
                        belowBarData: BarAreaData(show: true, color:
                          Colors.green.withOpacity(0.2),),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InfoCard(title: 'Risk', value: 'Moderate'),
                  const InfoCard(
                      title: 'Min Investment', value: '\₹1,000'),
                  const InfoCard(title: '3-Year Change', value: '+30%'),
                ],
              ),
              const SizedBox(height: 20.0),
              // Short Description
              const Text(
                'Description',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
              const SizedBox(height: 8.0),
              Text(
                data['description']!,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20.0),
              // Why this is fit for you
              const Text(
                'Why this is fit for you',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'This stock is suitable for moderate-risk investors looking for consistent returns and exposure to the tech industry. It also provides an excellent opportunity for long-term growth.',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2ec4b6),
            ),
          ),
        ],
      ),
    );
  }
}
