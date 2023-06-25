import 'dart:convert';

import 'package:first_project/pages/cities/model/cities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({Key? key}) : super(key: key);

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  var _cities = <City>[];

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    // Recuperando arquivo, convertendo para List<dynamic> e depois para List<City>
    // final citiesList = await rootBundle.loadStructuredData<List<City>>(
    //   'assets/cities_json.json',
    //   (value) async {
    //     return await json
    //         .decode(value)
    //         .map<City>((city) => City.fromMap(city))
    //         .toList();
    //   },
    // );

    // Buscando e convertendo para List<dynamic>
    // final citiesList = await rootBundle.loadStructuredData<List<dynamic>>(
    //   'assets/cities_json.json',
    //   (value) async => await json.decode(value),
    // );

    // Buscando e retornando JSON
    final citiesJSON = await rootBundle.loadString('assets/cities_json.json');

    // Convertendo JSON para List<Map>
    final List<dynamic> citiesList = json.decode(citiesJSON);

    setState(() {
      _cities = citiesList.map<City>((city) => City.fromMap(city)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities'),
      ),
      body: ListView.builder(
        itemCount: _cities.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_cities[index].city),
          subtitle: Text(_cities[index].state),
        ),
      ),
    );
  }
}
