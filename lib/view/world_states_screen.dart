import 'package:covid_tracker_app/Models/world_states_model.dart';
import 'package:covid_tracker_app/Services/states_services.dart';
import 'package:covid_tracker_app/View/country_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  // colors list for pie chart ...
  final colorList = <Color>[Colors.blue, Colors.green, Colors.red];

  @override
  void dispose() {
    _controller.dispose(); // to free the space after use...
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FutureBuilder(
              future: statesServices.fetchWorldStatesData(),
              builder: ((context, AsyncSnapshot<WorldStatesModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 45,
                      controller: _controller,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: const {
                          "Total": 1000,
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
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
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

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CountryListScreen()));
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
                    ],
                  );
                }
              }),
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
          const Divider(color: Colors.transparent)
        ],
      ),
    );
  }
}
