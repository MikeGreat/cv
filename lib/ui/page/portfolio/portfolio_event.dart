import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'data/response.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];

}

class RequestLoadEvent extends PortfolioEvent {

  const RequestLoadEvent();

  Future<List<Repository>> invoke() async {
    final response = await http.get('https://api.github.com/users/VizGhar/repos');
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<Repository>((e) => Repository.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load github repo');
    }
  }

}
