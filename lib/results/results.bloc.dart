import 'package:car_price_prediction/brands/brands.model.dart';
import 'package:car_price_prediction/car_models/car_models.model.dart';
import 'package:car_price_prediction/results/results.api.dart';
import 'package:car_price_prediction/results/results.model.dart';
import 'package:rxdart/rxdart.dart';

class ResultsBloc {
  final _brand = BehaviorSubject<Brand>();
  final _carModel = BehaviorSubject<CarModel>();
  final _year = BehaviorSubject<int>();
  final _mileage = BehaviorSubject<int>();
  final _capacity = BehaviorSubject<int>();
  final _wheel = BehaviorSubject<String>();
  final _fuel = BehaviorSubject<String>();
  final _color = BehaviorSubject<String>();
  final _carcass = BehaviorSubject<String>();
  final _drive = BehaviorSubject<String>();
  final _transmission = BehaviorSubject<String>();

  final _result = BehaviorSubject<String>();

  BehaviorSubject<Brand> get brand => _brand;

  BehaviorSubject<CarModel> get carModel => _carModel;

  BehaviorSubject<int> get year => _year;

  BehaviorSubject<int> get mileage => _mileage;

  BehaviorSubject<int> get capacity => _capacity;

  BehaviorSubject<String> get wheel => _wheel;

  BehaviorSubject<String> get fuel => _fuel;

  BehaviorSubject<String> get color => _color;

  BehaviorSubject<String> get carcass => _carcass;

  BehaviorSubject<String> get drive => _drive;

  BehaviorSubject<String> get transmission => _transmission;

  BehaviorSubject<String> get result => _result;

  get requestParams => ResultRequestParams(
      brand: _brand.value,
      carModel: _carModel.value,
      year: _year.value,
      mileage: _mileage.value,
      capacity: _capacity.value,
      wheel: _wheel.value,
      fuel: _fuel.value,
      color: _color.value,
      carcass: _carcass.value,
      drive: _drive.value,
      transmission: _transmission.value);

  fetchResults() async {
    String results = await ResultsApi().getResults(requestParams);
    _result.add(results);
  }

  dispose() {
    _brand.close();
    _carModel.close();
    _year.close();
    _mileage.close();
    _capacity.close();
    _wheel.close();
    _fuel.close();
    _color.close();
    _carcass.close();
    _drive.close();
    _transmission.close();
    _result.close();
  }
}

final bloc = ResultsBloc();
