import 'package:rxdart/rxdart.dart';

import 'package:car_price_prediction/brands/brands.model.dart';
import 'package:car_price_prediction/brands/brands.api.dart';

class BrandsBloc {
  final _brandsFetcher = PublishSubject<List<Brand>>();

  Observable<List<Brand>> get brands => _brandsFetcher.stream;

  fetchAllBrands() async {
    BrandsApi brandsProvider = BrandsApi();
    List<Brand> brands = await brandsProvider.getBrands();
    _brandsFetcher.sink.add(brands);
  }

  BrandsBloc() {
    fetchAllBrands();
  }

  void dispose() {
    _brandsFetcher.close();
  }
}
