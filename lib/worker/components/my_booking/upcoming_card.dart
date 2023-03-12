import 'package:flutter/material.dart';
import 'package:swd_project_clatt/models/bookings.dart';

class UpcomingCard extends StatefulWidget {
  const UpcomingCard({super.key});

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  late List<bool> _isExpanded = List.filled(bookings.length, false);
  List<Bookings> bookings = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < bookings.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded[i] = !_isExpanded[i];
                });
              },
              child: Container(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: _isExpanded[i] ? 258 : 165,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Lisa",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Service1",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple.shade300,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "Upcoming",
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
                        visible: _isExpanded[i],
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15, top: 3),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date & Time",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  Text(
                                    "Dec 23, 2024 | 10:00 - 12:00 AM",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  Text(
                                    "S102 Vinhomes Grand Park",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.deepPurple.shade300,
                                        width: 2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Cancel booking",
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                      Icon(_isExpanded[i]
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
              ),
            ),
        ]);
  }
}
