import 'package:flutter/material.dart';
import 'package:hy_sportswear/home_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.latest}) : super(key: key);
  final latestGreatest latest;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

int current = 0;
int qty = 1;
List<String> selectSize = [
  'XS',
  'S',
  'M',
  'L',
];

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: selectSize.length,
        child: Stack(
          children: [
            Container(
              height: 548,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.latest.imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0xFF000000),
                          ),
                        ),
                        Icon(
                          Icons.favorite_border_rounded,
                          color: Color(0xFF000000),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 376,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.vertical(
                    top: Radius.circular(36),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 6,
                          width: 38,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 14),
                          Text(
                            widget.latest.productName,
                            style: TextStyle(
                              color: Color(0xff3c3c3c),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            widget.latest.categoryProduct,
                            style: TextStyle(
                              color: Color(0xff3c3c3c).withOpacity(0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 14),
                          Text(
                            'Select Size',
                            style: TextStyle(
                              color: Color(0xff3c3c3c),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 44,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: selectSize.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: current == index
                                          ? Color(0xFF2B2A2A)
                                          : Color(0xFFF5F5F5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        selectSize[index],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: current == index
                                              ? Color(0xFFF5F5F5)
                                              : Color(0xFF2B2A2A),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Qty',
                            style: TextStyle(
                              color: Color(0xff3c3c3c),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 48,
                                width: 134,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                      child: Center(
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                    Text(
                                      qty.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF3C3C3C),
                                      ),
                                    ),
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                      child: Center(
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 48,
                                width: 134,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Total Price',
                                      style: TextStyle(
                                        color:
                                            Color(0xff3c3c3c).withOpacity(0.5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '\$18.00',
                                      style: TextStyle(
                                        color: Color(0xff3c3c3c),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: 60,
                            width: 315,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B2A2A),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 24,
                                  color: Color(0xFFFFFFFF),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Add to Bag',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
