import 'dart:convert';

import 'package:cv/ui/page/portfolio/data/response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  Future<List<Repository>> getRepos() async {
    final response =
        await http.get('https://api.github.com/users/VizGhar/repos');
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<Repository>((e) => Repository.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<Repository>>(
            future: getRepos(),
            initialData: List<Repository>(),
            builder: (context, snapshot) => ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, pos) {
                  final item = snapshot.data[pos];
                  return ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text(item.name ?? ""),
                    subtitle: Text(item.description ?? ""),
                  );
                })));
  }

  @override
  void initState() {
    getRepos();
  }
}
