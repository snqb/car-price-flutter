import 'package:car_price_prediction/base_provider.dart';
import 'package:car_price_prediction/results/results.bloc.dart';
import 'package:car_price_prediction/routes.dart';
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
          title: "Simple Material App",
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
