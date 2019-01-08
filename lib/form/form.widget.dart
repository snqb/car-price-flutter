import 'package:car_price_prediction/form/form.validators.dart';
import 'package:car_price_prediction/form/form_options.dart';
import 'package:car_price_prediction/providers/base_provider.dart';
import 'package:car_price_prediction/results/results.bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FormWidget extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CarFormState();
  }
}

class CarFormState extends State<FormWidget> {
  static ResultsBloc resultsBloc;

  final _formKey = GlobalKey<FormState>();
  var _isOnAutoValidate = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsBloc = Provider.of<ResultsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form')),
      body: Form(
        key: _formKey,
        autovalidate: _isOnAutoValidate,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              buildNumberInput(resultsBloc.year, FormValidators.validateYear, 'Год'),
              buildNumberInput(resultsBloc.mileage, FormValidators.validateMileage, 'Пробег'),
              buildNumberInput(resultsBloc.capacity, FormValidators.validateCapacity, 'Объем'),
              buildDropdownInput(resultsBloc.wheel, WHEEL_OPTIONS, 'Руль'),
              buildDropdownInput(resultsBloc.fuel, FUEL_OPTIONS, 'Тип топлива'),
              buildDropdownInput(resultsBloc.color, COLOR_OPTIONS, 'Цвет'),
              buildDropdownInput(resultsBloc.carcass, CARCASS_OPTIONS, 'Тип кузова'),
              buildDropdownInput(resultsBloc.drive, DRIVE_OPTIONS, 'Привод'),
              buildDropdownInput(resultsBloc.transmission, TRANSMISSION_OPTIONS, 'Коробка передач'),
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pushNamed(context, '/results');
                  } else {
                    setState(() {
                      _isOnAutoValidate = true;
                    });
                  }
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildNumberInput(BehaviorSubject<int> subject, String validator(val), String hintText) {
    return StreamBuilder(
        stream: subject.stream,
        builder: (context, AsyncSnapshot<int> snapshot) {
          return TextFormField(
              decoration: InputDecoration(hintText: hintText),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                subject.add(int.tryParse(value) ?? 0);
              },
              validator: validator);
        });
  }

  Widget buildDropdownInput(BehaviorSubject<String> subject, List<String> options, String hintText) {
    if (subject.value == null || subject.value.isEmpty) {
      subject.add(options[0]);
    }
    return StreamBuilder(
        stream: subject.stream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Container(
            child: DropdownButton<String>(
                hint: Text(hintText),
                value: snapshot.data,
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  subject.add(value);
                }),
          );
        });
  }
}
