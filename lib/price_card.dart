import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    super.key,
    required this.name,
    required this.price,
    required this.img,
  });

  final String name;
  final String price;
  final String img;

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
      child: Stack(
        children: [
          Row(
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
                      Padding(
                        padding: EdgeInsets.only(right: 110.0),
                        child: Text(
                          '₹ $price',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 4, 205, 14),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
          Positioned(
            right: 0,
            child: ClipPath(
              clipper: MyCustomClipper(),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 150.0,
                height: 110.0,
                color: Colors.green,
                child: Image(image: AssetImage('images/$img.jpeg')),
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
    double radius = 8.0;

    Path path = Path()
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width - radius, size.height) // Add line p2p3
      ..arcToPoint(Offset(size.width, size.height - radius),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width, radius)
      ..arcToPoint(Offset(size.width - radius, 0),
          radius: Radius.circular(radius), clockwise: false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
