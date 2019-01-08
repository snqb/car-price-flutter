import 'package:car_price_prediction/providers/base_provider.dart';
import 'package:car_price_prediction/results/results.bloc.dart';
import 'package:car_price_prediction/route_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  Router router;

  AppState() {
    router = buildRouter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResultsBloc>(
        builder: (_, ResultsBloc bloc) => bloc ?? ResultsBloc(),
        child: MaterialApp(
          title: "Car Price Prediction",
          onGenerateRoute: router.generator,
        ),
        onDispose: (_, ResultsBloc bloc) {
          bloc.dispose();
        });
  }
}

Router buildRouter() {
  final router = Router();
  router.define('/', handler: brandsHandler);
  router.define('/models', handler: carModelsHandler);
  router.define('/form', handler: formHandler);
  router.define('/results', handler: resultsHandler);
  return router;
}
