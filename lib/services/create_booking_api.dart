import 'dart:convert';

import 'package:swd_project_clatt/common/constants.dart';
import 'package:http/http.dart' as http;

import '../models/bookings.dart';

class BookingApi {
  static Future<int> fetchWorkerByService(
      int userId,
      int empId,
      int jobId,
      int address_id,
      String timestamp,
      String status,
      String desciption,
      int workTime) async {
    final url =
        '$BASE_URL/booking/create-booking?userId=2&employeeId=2&jobId=1&timestamp=$timestamp&address_id=$address_id&status=unconfirm&description=$desciption&workTime=$workTime';
    final uri = Uri.parse(url);
    final response = await http.post(uri);
    final body = response.statusCode;
    return body;
  }

  static Future<List<Bookings>> fetchBooking(
    int userId,
    String status,
  ) async {
    final url = '$BASE_URL/booking/get-bookings?status=$status&user_id=$userId';
    final uri = Uri.parse(url);
    final response = await http.post(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final users = json['data'] as List<dynamic>;
    final booking = await users.map((e) {
      return Bookings(
        id: e['id'],
        userId: e['userId'],
        usename: e['userName'],
        empId: e['empId'],
        empName: e['empName'],
        price: e['price'],
        workTime: e['workTime'],
        description: e['description'],
        // empPicture: e['empPicture'],
        empPicture: '',
        jobId: e['jobId'],
        jobName: e['jobName'],
        location: e['location'],
        status: e['status'],
        timestamp: DateTime.parse(e['timestamp']),
      );
    }).toList();
    return booking;
  }
}
