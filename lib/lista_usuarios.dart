import 'package:flutter/material.dart';
import 'package:myapp/model/usuario.dart';

class ListaUsuarios extends StatefulWidget {
  const ListaUsuarios({
    super.key
  });

  @override
  State<ListaUsuarios> createState() => ListaUsuariosState();

}

class ListaUsuariosState extends State<ListaUsuarios> {

  TextEditingController nomeControl = TextEditingController();
  TextEditingController telefoneControl = TextEditingController();
  List<Usuario> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista usuários")),
      body: Column(
        children: [
          TextField(
            controller: nomeControl,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(hintText: "Nome"),
          ),
          TextField(
            controller: telefoneControl,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "Telefone"),
          ),
          ElevatedButton(
            onPressed: () {
              Usuario u = Usuario(
                nome: nomeControl.text, telefone: telefoneControl.text, imagem: ""
              );
              setState(() {
                lista.add(u);
              });

            }, 
            child: Text("Cadastrar")
          ),
          Divider(),
          Expanded(child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              Usuario user = lista[index];
              return ListTile(
                title: Text(user.nome),
                subtitle: Row(
                  children: [
                    Icon(Icons.phone),
                    Text(user.telefone)
                  ],
                ),
                onLongPress: () {
                  showModalBottomSheet(
                    context: context, 
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(user.nome),
                            Text(user.telefone)
                          ],
                        ),
                      ),
                      );
                    },
                  );
                },
              );
            }
          ))
        ],
      ),
    );
  }
}