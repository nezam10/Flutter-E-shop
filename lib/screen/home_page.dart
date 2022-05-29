import 'package:flutter/material.dart';
import 'package:flutter_e_shop/widgets/custom_appbar.dart';
import 'package:flutter_e_shop/widgets/drawer_navigaton.dart';
import 'package:flutter_e_shop/widgets/product_view.dart';

import '../class/brandList.dart';
import '../widgets/brand.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    TabController _tabController = TabController(vsync: this, length: 3);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffD7E5F0),
          appBar: AppBar(
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
              icon: Icon(Icons.menu, color: Colors.black, size: 28),
            ),
          ),
          //backgroundColor: Colors.blue,
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
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
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
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
                      SizedBox(height: 15),
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
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            //color: Color(0xffF5F5F5),
                            child: TabBar(
                              indicatorWeight: 0,
                              indicator: BoxDecoration(
                                color: Color(0xff13A54F),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              indicatorPadding: const EdgeInsets.only(
                                  top: 3, left: 5, right: 5),
                              //isScrollable: true,
                              controller: _tabController,
                              labelColor: Colors.white,
                              unselectedLabelColor: Color(0xff868686),
                              tabs: const [
                                Tab(text: "POPULAR"),
                                Tab(text: "NEWST"),
                                Tab(text: "FAVOROTES"),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height,
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                //MarketTab(),
                                ProductListView(),
                                Text("NEWST"),
                                Text("FAVOROTES"),
                              ],
                            ),
                          ),
                          //SizedBox(height: 400),
                        ],
                      ),
                      //ProductListView(),
                    ],
                  ),
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
