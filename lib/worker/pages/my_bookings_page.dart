import 'package:flutter/material.dart';
import 'package:swd_project_clatt/worker/components/my_booking/upcoming_card.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener((_handleTabSelection));
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "My Booking",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.deepPurple.shade300,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 2, color: Colors.deepPurple.shade300)),
                  tabs: [
                    Tab(text: 'Pending'),
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Completed'),
                    Tab(text: 'Cancelled'),
                  ]),
              const SizedBox(height: 10),
              Container(
                  child: [
                Container(
                  color: Colors.blue,
                ),
                UpcomingCard(),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
              ][_tabController.index])
            ],
          ),
        )),
      ),
    );
  }
}
