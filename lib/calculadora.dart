import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({
    super.key
  });

  @override
  State<Calculadora> createState() => CalculadoraState();
}

class CalculadoraState extends State<Calculadora> {

  double temperaturaAtual = 50;
  bool grauCelsius = true;
  double temperaturaConvertida = 0;

  void atualizaTemperatura() {
    if (grauCelsius) {
      temperaturaConvertida = (temperaturaAtual*9.0/5.0) + 32;
    }
    else {
      temperaturaConvertida =  (temperaturaAtual - 32)* 5.0/9.0;
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      atualizaTemperatura();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conversor de temperatura")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Valor selecionado: ${temperaturaAtual.toInt()}',
            style: TextStyle(fontSize: 20),
          ),
          Slider(
            value: temperaturaAtual,
            min: -100,
            max: 100,
            divisions: 200,
            label: temperaturaAtual.round().toString(),
            onChanged: (double value) {
              setState(() {
                temperaturaAtual = value;
                atualizaTemperatura();
              });
            },
          ),
          Text(
            'Estado: ${grauCelsius ? 'Celsius para Farenheit' : 'Farentheit para Celsius'}',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Switch(
            value: grauCelsius,
            onChanged: (value) {
              setState(() {
                grauCelsius = value;
                atualizaTemperatura();
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.device_thermostat),
              Text("${temperaturaConvertida.toStringAsFixed(2)}")
            ],
          )
        ],
      ),
    );
  }
}