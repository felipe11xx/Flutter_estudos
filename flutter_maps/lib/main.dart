import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Capitais do Brasil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> entries = <String>[
    'Rio Branco (Acre)',
    'Maceió (Alagoas)',
    'Macapá (Amapá)',
    'Manaus (Amazonas)',
    'Salvador (Bahia)',
    'Fortaleza (Ceará)',
    'Vitória (Espírito Santo)',
    'Goiânia (Goiás)',
    'São Luís (Maranhão)',
    'Cuiabá (Mato Grosso)',
    'Campo Grande (Mato Grosso do Sul)',
    'Belo Horizonte (Minas Gerais)',
    'Belém (Pará)',
    'João Pessoa (Paraíba)',
    'Curitiba (Paraná)',
    'Recife (Pernambuco)',
    'Teresina (Piauí)',
    'Rio de Janeiro (Rio de Janeiro)',
    'Natal (Rio Grande do Norte)',
    'Porto Alegre (Rio Grande do Sul)',
    'Porto Velho (Rondônia)',
    'Boa Vista (Roraima)',
    'Florianópolis (Santa Catarina)',
    'São Paulo (São Paulo)',
    'Aracaju (Sergipe)',
    'Palmas (Tocantins)',
    'Brasília (Distrito Federal)'
  ];

  List<bool> checks = [
    false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          title: Text('${entries[index]}'),
          value: checks[index],
          onChanged: (bool value) {
            setState(() {
              checks[index] = value;
            }
            );
          }, secondary: const Icon(Icons.add_location),
        );
      }, separatorBuilder: (BuildContext context, int index) => const
    Divider(),
    ),
    );
  }
}
