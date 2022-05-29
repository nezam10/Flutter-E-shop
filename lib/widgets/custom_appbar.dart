import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            radius: 18,
            child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
          ),
        ),
      ],
      leading: IconButton(
          onPressed: () {
            _globalKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.black, size: 28)),
    );
  }
}
