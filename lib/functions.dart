import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_app_with_http/const.dart';
import 'package:sample_app_with_http/team.dart';

List<Team> ourteams = [];

/// ----- > Work is old way to get data from API <-----

Future getTeams() async {
  var headers = {'x-rapidapi-key': apiKey, 'x-rapidapi-host': apiHost};
  var responce = await http.get(Uri.parse(url), headers: headers);

  var jsonData = jsonDecode(responce.body);
  for (int i = 1; i < jsonData['response'].length; i++) {
    if (jsonData['response'][i]['team']['name'].toString().contains("Egypt"))
      continue;
    final team = Team(
      id: jsonData['response'][i]['team']['id'],
      name: jsonData['response'][i]['team']['name'],
      country: jsonData['response'][i]['team']['country'],
      logo: jsonData['response'][i]['team']['logo'],
    );

    ourteams.add(team);
  }
}
