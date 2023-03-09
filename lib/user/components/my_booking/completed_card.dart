import 'package:flutter/material.dart';
import '../../../models/bookings.dart';
import '../../../services/create_booking_api.dart';
import 'package:intl/intl.dart';

class CompletedCard extends StatefulWidget {
  final String status;
  final int userId;
  const CompletedCard({super.key, required this.status, required this.userId});

  @override
  State<CompletedCard> createState() => _CompletedCardState();
}

class _CompletedCardState extends State<CompletedCard> {
  bool _isExpanded = false;
  List<Bookings> bookings = [];

  // void _reloadPage() {
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState;
    fetchBooking(widget.userId, widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: _isExpanded ? 212 : 165,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              for (int i = 0; i < bookings.length; i++)
                Column(children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/images/lisa_avatar.jpg",
                            width: 70,
                            height: 70,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bookings[i].empName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  bookings[i].jobName,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "Completed",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                  Visibility(
                    visible: _isExpanded,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date & Time",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                DateFormat('yyyy-MM-dd – HH:mm')
                                    .format(bookings[i].timestamp),
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                bookings[i].location,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ),
                  Icon(_isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down)
                ])
            ],
          ),
        ),
      ),
    );
  }

  void fetchBooking(int userId, String status) async {
    final listBookings = await BookingApi.fetchBooking(userId, status);
    setState(() {
      bookings = listBookings;
    });
  }
}
