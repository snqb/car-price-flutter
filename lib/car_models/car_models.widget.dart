import 'package:car_price_prediction/car_models/car_models.bloc.dart';
import 'package:car_price_prediction/providers/base_provider.dart';
import 'package:car_price_prediction/results/results.bloc.dart';
import 'package:flutter/material.dart';

import 'car_models.model.dart';

class CarModelsListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarModelsListWidgetState();
  }
}

class CarModelsListWidgetState extends State<CarModelsListWidget> {
  static ResultsBloc resultsBloc;
  static CarModelsBloc carModelsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    resultsBloc = Provider.of<ResultsBloc>(context);
    carModelsBloc = Provider.of<CarModelsBloc>(context);

    resultsBloc.brand.listen((brand) {
      carModelsBloc.fetchCarModels(brand);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Выберите модель'),
        ),
        body: StreamBuilder(
            stream: carModelsBloc.carModels,
            builder: (context, AsyncSnapshot<List<CarModel>> snapshot) {
              if (snapshot.hasData) {
                return buildList(snapshot);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget buildList(AsyncSnapshot<List<CarModel>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: buildTitle(snapshot.data[index]),
            onTap: () {
              resultsBloc.carModel.add(snapshot.data[index]);
              Navigator.pushNamed(context, '/form');
            });
      },
    );
  }

  Widget buildTitle(CarModel brand) {
    return Text(brand.name);
  }
}
