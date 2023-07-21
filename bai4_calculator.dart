import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _numberAController = TextEditingController();
  final TextEditingController _numberBController = TextEditingController();
  String kq = "";

  void _cong() {
    setState(() {
      double a = double.parse(_numberAController.text);
      double b = double.parse(_numberBController.text);
      double temp = a + b;
      kq = temp.toString();
    });
  }

  void _tru() {
    setState(() {
      double a = double.parse(_numberAController.text);
      double b = double.parse(_numberBController.text);
      double temp = a - b;
      kq = temp.toString();
    });
  }

  void _nhan() {
    setState(() {
      double a = double.parse(_numberAController.text);
      double b = double.parse(_numberBController.text);
      double temp = a * b;
      kq = temp.toString();
    });
  }

  void _chia() {
    setState(() {
      double a = double.parse(_numberAController.text);
      double b = double.parse(_numberBController.text);
      double temp = a / b;
      kq = temp.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
        ),
        body: SafeArea(
          child: Container(
              alignment: Alignment.center,
              width: 590,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.network(
                        'https://media.wired.com/photos/5c83066025da7204699767c7/16:9/w_2400,h_1350,c_limit/calculator-1470.jpg',
                        width: 200),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextField(
                            controller: _numberAController,
                            decoration: const InputDecoration(
                                labelText: "Nhập số A",
                                labelStyle: TextStyle(fontSize: 20)),
                            autofocus: false,
                            keyboardType:
                                const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              ReplaceCommaFormatter(),
                            ],
                          ),
                          TextField(
                            controller: _numberBController,
                            decoration: const InputDecoration(
                                labelText: "Nhập số B",
                                labelStyle: TextStyle(fontSize: 20)),
                            autofocus: false,
                            keyboardType:
                                const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              ReplaceCommaFormatter(),
                            ],
                          ),
                        ],
                      )),
                  Text("Kết quả $kq",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black)),
                  SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: _cong,
                              child: const FaIcon(FontAwesomeIcons.plus,
                                  size: 20)),
                          ElevatedButton(
                              onPressed: _tru,
                              child: const FaIcon(FontAwesomeIcons.minus,
                                  size: 20)),
                          ElevatedButton(
                              onPressed: _nhan,
                              child: const FaIcon(FontAwesomeIcons.times,
                                  size: 20)),
                          ElevatedButton(
                              onPressed: _chia,
                              child: const FaIcon(FontAwesomeIcons.divide,
                                  size: 20)),
                        ],
                      )),
                ],
              )),
        ),
      ),
    );
  }
}

class ReplaceCommaFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.replaceAll(',', '.'),
      selection: newValue.selection,
    );
  }
}
