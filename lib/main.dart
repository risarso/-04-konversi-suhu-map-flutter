import 'package:flutter/material.dart';
import 'package:konversi_suhu_map_flutter/widgetmap/dropdown.dart';
import 'package:konversi_suhu_map_flutter/widgetmap/input.dart';
import 'package:konversi_suhu_map_flutter/widgetmap/listhasil.dart';
import 'package:konversi_suhu_map_flutter/widgetmap/result.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  List listHasil = [];
  var listSatuanSuhu = ['Kelvin', 'Reamur'];
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _inputUser = 0;
  double _result = 0;
  onDropdownChange(newValue) {
    setState(() {
      _newValue = newValue;
      perhitunganSuhu();
    });
  }


  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listHasil.add('Kelvin : $_result');
      } else {
        _result = (4 / 5) * _inputUser;
        listHasil.add('Reamur : $_result');
      }
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum 4 ',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Konversi Suhu\nRISA ROSDIANA 22"),
          ),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Input(inputController: inputController),
                Dropdown(
                  listSatuanSuhu: listSatuanSuhu,
                  newValue: _newValue,
                  onDropdownChange: onDropdownChange,
                ),
                Result(result: _result),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      'Riwayat Konversi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                ListHasil(listHasil: listHasil)
              ],
            ),
          )),
    );
  }
}