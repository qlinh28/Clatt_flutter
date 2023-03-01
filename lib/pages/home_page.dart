import 'package:flutter/material.dart';
import 'package:swd_project_clatt/components/home/banner_slider.dart';
import 'package:swd_project_clatt/models/services.dart';
import 'package:swd_project_clatt/pages/workers_service_page.dart';

class HomePage extends StatelessWidget {
  List<Service> services = [
    Service(
      name: "Tham Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
    ),
    Service(
      name: "123 Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
    ),
    Service(
      name: "456 Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
    ),
    Service(
      name: "789 Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
    ),
    Service(
      name: "JQK Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
    ),
    Service(
      name: "Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/lisa_avatar.jpg'),
                  radius: 25,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, how are you today?",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Linh",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                          child: Image.asset(
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
  }
}
