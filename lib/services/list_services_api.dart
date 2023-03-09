import 'dart:convert';
import 'package:swd_project_clatt/common/constants.dart';
import 'package:swd_project_clatt/models/services.dart';
import 'package:http/http.dart' as http;

class ServicesApi {
  static Future<List<Service>> fetchServices() async {
    const url = '$BASE_URL/job/get-jobs';
    final uri = Uri.parse(url);
    final response = await http.post(uri);
    final body = response.body;
    final json = jsonDecode(body);

    final users = json['data'] as List<dynamic>;

    final services = await users.map((e) {
      return Service(
        id: e['id'],
        name: e['jobName'],
        icon: e['thumbnailImage'],
        price: e['price'],
      );
    }).toList();
    return services;
  }
}
