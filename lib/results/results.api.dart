import 'dart:async';
import 'dart:convert';

import 'package:car_price_prediction/results/results.model.dart';
import 'package:http/http.dart' as http;

const URL = 'https://car-prediction-kg.herokuapp.com/api/v1/prediction';

class ResultsApi {
  Future<String> getResults(ResultRequestParams requestParams) async {
    final body = jsonEncode(requestParams.toMap());
    final Map<String, String> headers = {'Content-type': 'application/json'};

    final http.Response res = await http.post(URL, headers: headers, body: body);
    final result = res.body;
    return result;
  }
}
