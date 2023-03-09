import 'dart:convert';
import 'package:swd_project_clatt/common/constants.dart';
import 'package:swd_project_clatt/models/workers.dart';
import 'package:http/http.dart' as http;

class WorkerAPI {
  static Future<List<Worker>> fetchWorkerByService(int serviceId) async {
    final url = '$BASE_URL/worker/$serviceId';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final users = json['data'] as List<dynamic>;
    final services = await users.map((e) {
      return Worker(
        id: e['empId'],
        name: e['empName'],
        image: e['srcPicture'],
        address: e['location'],
        introduce: e['description'],
        price: e['priceJob'],
      );
    }).toList();
    return services;
  }
}
