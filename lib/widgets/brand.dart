import 'package:flutter/material.dart';

class BrandList extends StatelessWidget {
  String brandName;
  String? brandicon;
  BrandList({Key? key, this.brandicon, required this.brandName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: ClipRect(
                  child: Image.asset("$brandicon"),
                ),
                //backgroundImage: AssetImage("$brandicon"),
              ),
              Text(
                "$brandName",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
