import 'dart:async';
import 'package:car_price_prediction/brands/brands.model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class BrandsApi {
  Future<List<Brand>> getBrands() async {
    final String brandsJsonString =
        await rootBundle.loadString('assets/json/brands.json');


    List<dynamic> brandsRaw = json.decode(brandsJsonString);
    List<Brand> brands = brandsRaw
        .map((brand) => Brand((brand as String).trim()))
        .toList(growable: false);

    return brands;
  }
}
