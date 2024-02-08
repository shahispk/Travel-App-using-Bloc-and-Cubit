import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:remainder/model/datamodel.dart';

class Dataservices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getinfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
