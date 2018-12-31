import 'dart:async';
import 'package:car_price_prediction/brands/brands.model.dart';
import 'package:http/http.dart' as http;
import 'package:car_price_prediction/car_models/car_models.model.dart';
import 'dart:convert';

const URL = 'https://car-prediction-kg.herokuapp.com/api/v1/models';

class CarModelsApi {
  Future<List<CarModel>> getCarModels(Brand brand) async {
    final url = '$URL?brand=${brand.name}';
    final http.Response res = await http.get(url);
    final List<dynamic> carModelsJson = jsonDecode(res.body);
    final modelList = carModelsJson.map((it) => CarModel(it[0], it[1]));
    return modelList.toList();
  }
}
