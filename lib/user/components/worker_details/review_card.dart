import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/lisa_avatar.jpg'),
                  radius: 20,
                ),
                const SizedBox(width: 15),
                Text(
                  "Lisa",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border:
                      Border.all(color: Colors.deepPurple.shade300, width: 2)),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.deepPurple.shade300,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "5",
                    style: TextStyle(
                        fontSize: 13, color: Colors.deepPurple.shade300),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 8),
        Text(
          "Awesome! This is what i was looking for, i recommend to everyone",
          style: TextStyle(fontSize: 13),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 8),
        Text(
          "2 weeks ago",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ]),
    );
  }
}
