import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  const PriceCard(
      {super.key, required this.img, required this.name, required this.price});

  final String img;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      height: 110.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                  ),
                  Expanded(
                    child: Text(
                      //name of the vegetable
                      name,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '₹ $price',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 4, 205, 14),
                    ),
                  ),
                ],
              )
            ],
          )),
          ClipPath(
            clipper: MyCustomClipper(),
            // ignore: sized_box_for_whitespace
            child: SizedBox(
              width: 150.0,
              height: 110.0,
              child: Image(
                image: AssetImage('images/$img.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, size.height) // Add line p2p3
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
