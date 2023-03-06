import 'dart:convert';
import 'package:swd_project_clatt/models/services.dart';
import 'package:http/http.dart' as http;

class ServicesApi {
  static Future<List<Service>> fetchServices() async {
    const url = 'http://10.1.104.200:8080/job/get-jobs';
    final uri = Uri.parse(url);
    final response = await http.post(uri);
    final body = response.body;
    final json = jsonDecode(body) as List<dynamic>;
    final services = await json.map((e)  {
      return Service(
        id: e['id'],
        name: e['job_name'],
        icon: e['thumbnail_image'],
        price: e['price'],
      );
    }).toList();
    return services;
  }
}
