import 'package:covid_tracker_app/ViewModel/Utilities/Widgets/reuseble_row.dart';
import 'package:flutter/material.dart';

class CountryRecordScreen extends StatefulWidget {
  final String name, flag;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  const CountryRecordScreen({
    Key? key,
    required this.name,
    required this.flag,
    required this.totalCases,
    required this.active,
    required this.critical,
    required this.totalDeaths,
    required this.todayRecovered,
    required this.totalRecovered,
    required this.test,
  }) : super(key: key);

  @override
  State<CountryRecordScreen> createState() => _CountryRecordScreenState();
}

class _CountryRecordScreenState extends State<CountryRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name.toUpperCase()),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.067),
                  child: Card(
                    child: Column(
                      children: [
                        ReusebleRow(
                            title: 'Total Cases',
                            value: widget.totalCases.toString()),
                        ReusebleRow(
                            title: 'Recovered',
                            value: widget.totalRecovered.toString()),
                        ReusebleRow(
                            title: 'Deaths',
                            value: widget.totalDeaths.toString()),
                        ReusebleRow(
                            title: 'Active', value: widget.active.toString()),
                        ReusebleRow(
                            title: 'Test', value: widget.test.toString()),
                        ReusebleRow(
                            title: 'Critical',
                            value: widget.critical.toString()),
                        ReusebleRow(
                            title: 'Today Recovered',
                            value: widget.totalRecovered.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(widget.flag),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
