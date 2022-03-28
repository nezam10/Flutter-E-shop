import 'package:flutter/material.dart';
import 'package:flutter_e_shop/screen/message_page.dart';
import 'package:flutter_e_shop/screen/settings_page.dart';
import 'package:flutter_e_shop/widgets/drawer_navigaton.dart';
import 'package:flutter_e_shop/widgets/product_view.dart';

import '../class/brandList.dart';
import '../widgets/brand.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20);

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // int _selectIndex = 0;

  // void _navigationBottonBar(int index) {
  //   setState(() {
  //     _selectIndex = index;
  //   });
  // }

  // final List<Widget> _pages = [
  //   HomePage(),
  //   MessagePage(),
  //   SettingsPage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.blue,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 212, 233, 240),
                  Color.fromARGB(255, 231, 208, 241),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              _globalKey.currentState?.openDrawer();
                            },
                            icon: Icon(Icons.menu)),
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          height: 35,
                          width: 35,
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Find Product",
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text("BRAND"),
                    SizedBox(height: 20),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: blist().brandList.length,
                        itemBuilder: (context, index) {
                          var show = blist().brandList[index];
                          var showbrandicon = blist().brandimage[index];
                          return BrandList(
                            brandicon: "$showbrandicon",
                            brandName: "$show",
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("POPULAR", style: textStyle),
                          Text("NEWST"),
                          Text("FAVORITES"),
                        ],
                      ),
                    ),
                    ProductListView(),
                  ],
                ),
              ),
            ),
          ),

          key: _globalKey,
          drawer: DrawerNavigaton(),

          // drawer: Drawer(
          //backgroundColor: Color.fromARGB(255, 215, 208, 235),
          // ),

          // create a Button Navigation bar

          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: _selectIndex,
          //   onTap: _navigationBottonBar,
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.message), label: "Message"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.settings), label: "Setting"),
          //   ],
          // ),
        ),
      ),
    );
  }
}
