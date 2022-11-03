import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LinearGrafico extends StatelessWidget {
  const LinearGrafico({Key? key}) : super(key: key);
  static String? pointerAmount;
  static String? poniterDay;

  @override
  Widget build(BuildContext context) {
    final data = [
      Expenses(1, 100),
      Expenses(2, 170),
      Expenses(3, 70),
      Expenses(4, 90),
      Expenses(5, 200),
    ];

    List<charts.Series<Expenses, int>> series = [
      charts.Series<Expenses, int>(
        id: "Lineal",
        domainFn: (v, i) => v.day,
        measureFn: (v, i) => v.expense,
        data: data,
      )
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Gasto do mês"),
        ),
        body: ListView(children: [
          SizedBox(
            height: 350.0,
            child: charts.LineChart(
              series,
              selectionModels: [
                charts.SelectionModelConfig(
                    changedListener: (charts.SelectionModel model) {
                  if (model.hasDatumSelection) {
                    pointerAmount = model.selectedSeries[0]
                        .measureFn(model.selectedDatum[0].index)
                        ?.toStringAsFixed(2);
                    poniterDay = model.selectedSeries[0]
                        .domainFn(model.selectedDatum[0].index)
                        ?.toString();
                  }
                }),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
            ),
            child: const Text('Voltar'),
          ),
        ]),
      ),
    );
  }
}

class Expenses {
  final int day;
  final double expense;

  Expenses(this.day, this.expense);
}
