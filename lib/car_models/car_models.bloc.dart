import 'package:car_price_prediction/brands/brands.model.dart';
import 'package:rxdart/rxdart.dart';

import 'car_models.api.dart';
import 'car_models.model.dart';

class CarModelsBloc {
  final _carModelsFetcher = PublishSubject<List<CarModel>>();

  Observable<List<CarModel>> get carModels => _carModelsFetcher.stream;

  fetchCarModels(Brand brand) async {
    List<CarModel> carModels = await CarModelsApi().getCarModels(brand);
    _carModelsFetcher.sink.add(carModels);
  }

  dispose() {
    _carModelsFetcher.close();
  }
}
