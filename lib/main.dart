import 'package:flutter/material.dart';
import 'package:myapp/calculadora.dart';
import 'package:myapp/lista_usuarios.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.blue,
          useMaterial3: true
      ),
      // A widget which will be started on application startup
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text("Lista de usuários"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaUsuarios()),
                );
              },
            ),
            ListTile(
              title: Text("Calculadora"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculadora()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
