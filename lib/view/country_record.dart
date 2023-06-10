import 'package:flutter/material.dart';

class CountryRecordScreen extends StatefulWidget {
  const CountryRecordScreen({super.key});

  @override
  State<CountryRecordScreen> createState() => _CountryRecordScreenState();
}

class _CountryRecordScreenState extends State<CountryRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Country_Record'),
      ),
    );
  }
}
