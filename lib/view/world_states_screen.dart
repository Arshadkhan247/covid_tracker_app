import 'package:covid_tracker_app/Models/world_states_model.dart';

import 'package:covid_tracker_app/View/country_list.dart';
import 'package:covid_tracker_app/ViewModel/Services/states_services.dart';
import 'package:covid_tracker_app/ViewModel/Utilities/Widgets/pie_chart_widget.dart';
import 'package:covid_tracker_app/ViewModel/Utilities/Widgets/reuseble_row.dart';
import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _controller.dispose(); // to free the space after use...
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // creating object for services class to call it attributes & functions here...
    StatesServices statesServices = StatesServices();

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // Define custom behavior when the user tries to navigate back
          // For example, show a confirmation dialog
          bool confirm = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Are you sure to exit?'),
              actions: [
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
          );

          // Return true to allow navigation if the user confirms, false otherwise
          return confirm;
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              FutureBuilder(
                future: statesServices.fetchWorldStatesData(),
                builder: ((context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 35,
                        controller: _controller,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChartWidget(
                          total: 'Total',
                          totalval: snapshot.data!.cases.toString(),
                          recovered: 'Recovered',
                          recoveredval: snapshot.data!.recovered.toString(),
                          death: 'Death',
                          deathval: snapshot.data!.deaths.toString(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * .06),
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                ReusebleRow(
                                  title: 'Total',
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReusebleRow(
                                    title: 'Death',
                                    value: snapshot.data!.deaths.toString()),
                                ReusebleRow(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered.toString()),
                                ReusebleRow(
                                    title: 'Active',
                                    value: snapshot.data!.active.toString()),
                                ReusebleRow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString()),
                                ReusebleRow(
                                    title: 'Today Cases',
                                    value:
                                        snapshot.data!.todayCases.toString()),
                                ReusebleRow(
                                    title: 'Today Death',
                                    value:
                                        snapshot.data!.todayDeaths.toString()),
                                ReusebleRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CountryListScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1aa260),
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
      ),
    );
  }
}
