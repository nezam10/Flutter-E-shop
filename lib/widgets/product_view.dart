import 'package:flutter/material.dart';
import 'package:flutter_e_shop/class/brandList.dart';
import 'package:flutter_e_shop/widgets/brand.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.vertical,
      child: GridView.builder(
        physics: ScrollPhysics(),
        itemCount: blist().brandList.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
        itemBuilder: (context, index) {
          var showbrandicon = blist().brandimage[index];
          return Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 235, 241),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price: 20\$"),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 1.5,
                      //color: Colors.blue,
                      child: Image.asset("$showbrandicon"),
                    ),
                  ),
                  Text(
                    "This is product details, product name etc",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
