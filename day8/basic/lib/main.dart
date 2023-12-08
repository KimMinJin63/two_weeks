// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class People {
  final String name;
  final String height;
  final String mass;
  final String hair_color;
  final String skin_color;
  final String eye_color;
  final String birth_year;
  final String gender;
  final String homeworld;
  final List films;
  final List species;
  final List vehicles;
  final List starships;
  final DateTime created;
  final DateTime edited;
  final String url;
  People({
    required this.name,
    required this.height,
    required this.mass,
    required this.hair_color,
    required this.skin_color,
    required this.eye_color,
    required this.birth_year,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory People.fromMap(Map<String, dynamic> map) {
    return People(
      name: map['name'] as String,
      height: map['height'] as String,
      mass: map['mass'] as String,
      hair_color: map['hair_color'] as String,
      skin_color: map['skin_color'] as String,
      eye_color: map['eye_color'] as String,
      birth_year: map['birth_year'] as String,
      gender: map['gender'] as String,
      homeworld: map['homeworld'] as String,
      films: List.from((map['films'] as List)),
      species: List.from((map['species'] as List)),
      vehicles: List.from((map['vehicles'] as List)),
      starships: List.from((map['starships'] as List)),
      created: map['created'] != null
          ? DateTime.parse(map['created'] as String)
          : DateTime.now(),
      edited: map['edited'] != null
          ? DateTime.parse(map['edited'] as String)
          : DateTime.now(),
      url: map['url'] as String,
    );
  }

  factory People.fromJson(String source) =>
      People.fromMap(json.decode(source) as Map<String, dynamic>);
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController1 = TextEditingController(text: "sky");
  Future<List<People>>? futurePeople; // Nullable Future

  @override
  void initState() {
    super.initState();
  }

  Future<List<People>> fetchPost(String search) async {
    final url = Uri.parse('https://swapi.dev/api/people/?search=');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Iterable<dynamic> data = json.decode(response.body)['results'];
      List<People> peopleList = data.map((e) => People.fromMap(e)).toList();

      if (search.isNotEmpty) {
        peopleList = peopleList
            .where((person) =>
                person.name.toLowerCase().contains(search.toLowerCase()))
            .toList();
      }

      return peopleList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                        ),
                        onPressed: () {
                          // Update the future result when the button is pressed
                          setState(() {
                            futurePeople = fetchPost(textEditingController1.text);
                          });
                        },
                        child: const Text(
                          'Search!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<People>>(
                  future: futurePeople,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: Text('Loading...'));
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const SizedBox();
                    } else {
                      if (textEditingController1.text.isNotEmpty) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var person = snapshot.data![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Text(
                                        person.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('${person.height} / ${person.mass}'),
                                      Text(
                                          'Hair Color : ${person.hair_color} | Skin Color : ${person.skin_color}')
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const SizedBox();
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
