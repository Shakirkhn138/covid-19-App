import 'dart:convert';

import 'package:c_virus/Services/Utilities/app_url.dart';
import 'package:c_virus/screen/countries_list.dart';
import 'package:http/http.dart' as https;

import '../../Models/World_States_Model.dart';

class StatesServices{

  Future<WorldStatesModel> fetchWorldStatesRecords() async {

    final response = await https.get(Uri.parse('https://disease.sh/v3/covid-19/all'));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }

  }

  Future<List<dynamic>> CountriesListApi() async {
    var data;
    final response = await https.get(Uri.parse(AppUrl.CountriesList));

    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception('Error');
    }

  }

}