import 'package:car_price_prediction/brands/brands.bloc.dart';
import 'package:car_price_prediction/brands/brands.widget.dart';
import 'package:car_price_prediction/car_models/car_models.bloc.dart';
import 'package:car_price_prediction/car_models/car_models.widget.dart';
import 'package:car_price_prediction/form/form.widget.dart';
import 'package:car_price_prediction/providers/base_provider.dart';
import 'package:car_price_prediction/results/results.widget.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var brandsHandler = Handler(handlerFunc: (BuildContext context, _) {
  return BlocProvider<BrandsBloc>(
      builder: (_, bloc) => bloc ?? BrandsBloc(),
      child: BrandsListWidget(),
      onDispose: (_, BrandsBloc bloc) {
        bloc.dispose();
      });
});

var carModelsHandler = Handler(handlerFunc: (BuildContext context, _) {
  return BlocProvider<CarModelsBloc>(
      builder: (_, bloc) => bloc ?? CarModelsBloc(),
      child: CarModelsListWidget(),
      onDispose: (_, CarModelsBloc bloc) {
        bloc.dispose();
      });
});

var formHandler = Handler(handlerFunc: (BuildContext context, _) {
  return FormWidget();
});

var resultsHandler = Handler(handlerFunc: (BuildContext context, _) {
  return ResultsWidget();
});
