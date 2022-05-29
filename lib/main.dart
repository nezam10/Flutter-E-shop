import 'package:flutter/material.dart';
import 'package:flutter_e_shop/provider_class/provider_data.dart';
import 'package:flutter_e_shop/screen/home_page.dart';
import 'package:flutter_e_shop/screen/message_page.dart';
import 'package:flutter_e_shop/screen/settings_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProviderClass>(create: (context) => ProviderClass()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottonNavigationBarPage(),
    );
  }
}

class BottonNavigationBarPage extends StatefulWidget {
  const BottonNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottonNavigationBarPage> createState() =>
      _BottonNavigationBarPageState();
}

class _BottonNavigationBarPageState extends State<BottonNavigationBarPage> {
  int _selectIndex = 1;

  void _navigationBottonBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _pages = [
    MessagePage(),
    HomePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          onTap: _navigationBottonBar,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ],
        ),
      ),
    );
  }
}
