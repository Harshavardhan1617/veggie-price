import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({super.key, required this.img});

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
      child: Row(
        children: [
          Expanded(
            child: Container(
                // Left white space
                ),
          ),
          ClipPath(
            clipper: MyCustomClipper(),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 150.0,
              height: 110.0,
              child: Image(
                image: NetworkImage(img),
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
