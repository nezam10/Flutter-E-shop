import 'package:flutter/material.dart';
import 'package:flutter_e_shop/class/brandList.dart';
import 'package:flutter_e_shop/provider_class/provider_data.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postModel = Provider.of<ProviderClass>(context, listen: false);
    postModel.getPostData();
    postModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<ProviderClass>(context);
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          GridView.builder(
            //physics: ScrollPhysics(),
            physics: NeverScrollableScrollPhysics(),
            //itemCount: 2,
            itemCount: postModel.prodectList?.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              //var showbrandicon = blist().brandimage[index];
              if (postModel.prodectList?.length == null) {
                return CircularProgressIndicator();
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFEFFFF),
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
                            Text(
                                "${postModel.prodectList?[index].price.toString()}\$"),
                            Icon(Icons.favorite, color: Colors.red),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 1.5,
                            //color: Colors.blue,
                            child: Image.network(postModel
                                    .prodectList?[index].image
                                    .toString() ??
                                ""),
                          ),
                        ),
                        Text(
                          postModel.prodectList?[index].description
                                  .toString() ??
                              "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
