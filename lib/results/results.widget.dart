import 'package:car_price_prediction/providers/base_provider.dart';
import 'package:car_price_prediction/results/results.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultsWidget extends StatefulWidget {
  @override
  _ResultsWidgetState createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  static ResultsBloc resultsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsBloc = Provider.of<ResultsBloc>(context);
    resultsBloc.fetchResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Результат')),
        body: StreamBuilder(
            stream: resultsBloc.result.stream,
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data);
              }
              return CircularProgressIndicator();
            }));
  }
}
