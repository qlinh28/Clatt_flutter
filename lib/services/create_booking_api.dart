import 'package:swd_project_clatt/common/constants.dart';
import 'package:http/http.dart' as http;

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
        '$BASE_URL/booking/create-booking?userId=$userId&employeeId=$empId&jobId=$jobId&timestamp=$timestamp&address_id=$address_id&status=$status&description=$desciption&workTime=$workTime';
    final uri = Uri.parse(url);
    final response = await http.post(uri);
    final body = response.statusCode;
    return body;
  }
}
