import 'package:car_price_prediction/brands/brands.model.dart';
import 'package:car_price_prediction/car_models/car_models.model.dart';

class ResultRequestParams {
  final Brand brand;
  final CarModel carModel;
  final int year;
  final int mileage;
  final int capacity;
  final String wheel;
  final String fuel;
  final String color;
  final String carcass;
  final String drive;
  final String transmission;

  ResultRequestParams(
      {this.brand,
      this.carModel,
      this.year,
      this.mileage,
      this.capacity,
      this.wheel,
      this.fuel,
      this.color,
      this.carcass,
      this.drive,
      this.transmission});

  Map<String, dynamic> toMap() {
    return {
      "brand": brand.name,
      "model": carModel.value,
      "year": year.toString(),
      "mileage": mileage.toString(),
      "capacity": capacity.toString(),
      "wheel": wheel,
      "fuel": fuel,
      "color": color,
      "carcass": carcass,
      "drive": drive,
      "transmission": transmission
    };
  }
}
