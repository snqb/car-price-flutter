import 'package:car_price_prediction/base_provider.dart';
import 'package:car_price_prediction/brands/brands.bloc.dart';
import 'package:car_price_prediction/brands/brands.model.dart';
import 'package:car_price_prediction/results/results.bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BrandsListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BrandsListWidgetState();
  }
}

class BrandsListWidgetState extends State<BrandsListWidget> {
  static BrandsBloc brandsBloc;
  static ResultsBloc formBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    formBloc = Provider.of<ResultsBloc>(context);
    brandsBloc = Provider.of<BrandsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Price Prediction'),
      ),
      body: StreamBuilder(
          stream: brandsBloc.brands,
          builder: (context, AsyncSnapshot<List<Brand>> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot, formBloc.brand);
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget buildList(AsyncSnapshot<List<Brand>> snapshot, BehaviorSubject<Brand> brandSubject) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: brandTitle(snapshot.data[index].name),
            onTap: () {
              brandSubject.add(snapshot.data[index]);
              Navigator.pushNamed(context, '/models');
            });
      },
    );
  }

  Widget brandTitle(String brand) {
    return Text(brand);
  }
}
