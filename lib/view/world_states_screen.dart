import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  final colorList = <Color>[Colors.blue, Colors.green, Colors.red];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            PieChart(
              dataMap: const {
                "Total": 100,
                "Recovered": 75,
                "Death": 25,
              },
              chartType: ChartType.ring,
              animationDuration: const Duration(seconds: 2),
              baseChartColor: Colors.white,
              chartLegendSpacing: 130,
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions: const LegendOptions(
                legendPosition: LegendPosition.left,
              ),
              colorList: colorList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .06),
              child: const Card(
                elevation: 3,
                child: Column(
                  children: [
                    ReusableRow(
                      title: 'Total',
                      value: '100',
                    ),
                    ReusableRow(
                      title: 'Recovered',
                      value: '75',
                    ),
                    ReusableRow(
                      title: 'Death',
                      value: '25',
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //TODO tap function needed.
                print('I am Tapped');
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFF1aa260,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Track Countries'),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const Divider(
            color: Colors.transparent,
          )
        ],
      ),
    );
  }
}
