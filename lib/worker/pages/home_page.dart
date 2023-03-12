import 'package:flutter/material.dart';
import 'package:swd_project_clatt/models/workers.dart';
import 'package:swd_project_clatt/user/components/home/banner_slider.dart';
import 'package:swd_project_clatt/models/services.dart';

import 'package:swd_project_clatt/worker/pages/service_details.dart';

class HomePage extends StatelessWidget {
  final Worker worker = new Worker(
      id: 1,
      name: "Linh",
      image: "assets/images/lisa_avatar.jpg",
      address: "Vinhome Grand Park",
      introduce:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      price: 40);
  List<Service> services = [
    Service(
      id: 1,
      name: "Tham Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
      price: 400,
    ),
    Service(
      id: 2,
      name: "123 Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
      price: 400,
    ),
    Service(
      id: 3,
      name: "456 Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
      price: 400,
    ),
    Service(
      id: 4,
      name: "789 Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
      price: 400,
    ),
    Service(
      id: 5,
      name: "JQK Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
      price: 400,
    ),
    Service(
      id: 6,
      name: "Cleaning",
      icon: "assets/images/lisa_avatar.jpg",
      price: 400,
    ),
  ];

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
                    "Services you are serving",
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
                                  builder: (context) => ServiceDetailsScreen(
                                      worker: worker, service: services[i])));
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
