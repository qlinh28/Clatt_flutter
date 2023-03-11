import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swd_project_clatt/services/list_services_api.dart';
import 'package:swd_project_clatt/services/login_api.dart';
import 'package:swd_project_clatt/user/components/home/banner_slider.dart';
import 'package:swd_project_clatt/models/services.dart';
import 'package:swd_project_clatt/user/pages/workers_service_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Service> services = [];
 
  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  Future<void> fetchServices() async {
    final listServices = await ServicesApi.fetchServices();
    setState(() {
      services = listServices;
    });
  }

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<Auth>(context).token;
    return Consumer<Auth>(
      builder: (context, auth, child) {
        if (!auth.isLoggedIn) {
          Navigator.pushReplacementNamed(context, '/login');
          return SizedBox.shrink();
        }
        return Scaffold(
          body: SafeArea(
              child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: ListView(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/lisa_avatar.jpg'),
                      radius: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hello, ",
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Linh",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Colors.deepPurple.shade300,
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "S102 Vinhomes Grand Park",
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Token: ",
                          //       style: const TextStyle(
                          //         fontSize: 15,
                          //       ),
                          //     ),
                          //     Text(
                          //       token,
                          //       style: const TextStyle(
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "What's news?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Center(child: BannerSlider()),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Service",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade300,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.count(
                  crossAxisCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: (80 / 70),
                  children: [
                    for (int i = 0; i < services.length; i++)
                      Container(
                        child: Column(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorkerServiceScreen(
                                          service: services[i])));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Image.network(
                                services[i].icon,
                                width: 100,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              services[i].name,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ]),
                      ),
                  ],
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
