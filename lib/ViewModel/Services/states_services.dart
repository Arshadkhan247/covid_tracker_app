import 'dart:convert';

import 'package:covid_tracker_app/Models/world_states_model.dart';
import 'package:covid_tracker_app/ViewModel/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
// calling Api data ...

  Future<WorldStatesModel> fetchWorldStatesData() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error Occured');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    dynamic data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error Occured');
    }
  }
}
