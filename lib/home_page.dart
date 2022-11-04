// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hy_sportswear/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, bottom: 20, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 21,
                    width: 58,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  // SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 344,
                      // width: 315,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFF5F5F5),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              height: 226,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/shoes.png'),
                            ),
                          ),
                          SizedBox(height: 28),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Made For Miles',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  'The perfect place to find your new favorite running shoes',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'The Latest And Greatest',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 196,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  latest: listLatestGreatest[index],
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 196,
                            width: 140,
                            // color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        listLatestGreatest[index].imageUrl,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Text(
                                  listLatestGreatest[index].productName,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                                Text(
                                  listLatestGreatest[index].categoryProduct,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF3C3C3C).withOpacity(0.5),
                                  ),
                                ),
                                Text(
                                  '\$${listLatestGreatest[index].price.toString()}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 16);
                      },
                      itemCount: listLatestGreatest.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFFFF),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF3C3C3C),
        unselectedItemColor: Color(0xFF3C3C3C),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class latestGreatest {
  final String imageUrl;
  final String productName;
  final String categoryProduct;
  final double price;

  latestGreatest({
    required this.imageUrl,
    required this.productName,
    required this.categoryProduct,
    required this.price,
  });
}

List<latestGreatest> listLatestGreatest = [
  latestGreatest(
    imageUrl: 'assets/images/im1.jpg',
    productName: 'Tech Fleece',
    categoryProduct: 'Men\'s Pullover Hoodie',
    price: 110,
  ),
  latestGreatest(
    imageUrl: 'assets/images/im2.jpg',
    productName: 'Indy Luxe',
    categoryProduct: 'Women\'s Light-Support',
    price: 120,
  ),
  latestGreatest(
    imageUrl: 'assets/images/im3.jpg',
    productName: 'Space Hippi',
    categoryProduct: 'Women\'s Shoes',
    price: 150,
  ),
];
