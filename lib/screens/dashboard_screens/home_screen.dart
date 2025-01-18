import 'package:finance_guru/screens/dashboard_screens/info_screen.dart';
import 'package:finance_guru/widgets/sliver_app_bar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = const [
    'Stocks',
    'Mutual Funds',
    'Fixed Deposits',
    'Bonds',
  ];
  String selectedCategory = "Stocks";
  final List<Map<String, String>> _items = const [
    {
      'image': 'assets/images/tata_motors.png',
      'name': 'Tata Motors',
      'description': 'Indian multinational automotive company.',
      'price': "774.65"
    },
    {
      'image': 'assets/images/mahindra.png',
      'name': 'Mahindra',
      'description': 'Indian multinational automotive corporation.',
      'price': "3092.85"
    },
    {
      'image': 'assets/images/wipro.png',
      'name': 'Wipro',
      'description': 'Indian multinational IT corporation.',
      'price': "300.55"
    },
    {
      'image': 'assets/images/zomato.png',
      'name': 'Zomato',
      'description': 'Indian multinational food delivery company.',
      'price': "242.95"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              leading: Image.asset('assets/images/finance_logo.png'),
              title: const Text('Finance Guru'),
            ),
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: size.height * 0.05,
                maxHeight: size.height * 0.05,
                child: SizedBox(
                  height: size.height * 0.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) => Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, bottom: 5, top: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = _categories[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedCategory == _categories[index]
                                ? Colors.blue[50]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                _categories[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Recommended for You',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.5),
                    ),
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _items.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(data: _items[index],),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  _items[index]['image']!,
                                  height: size.height * 0.05,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Center(
                                child: Text(
                                  _items[index]['name']!,
                                  style: const TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "₹${_items[index]['price']!}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF2ec4b6)),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '30%',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF2ec4b6)),
                                        ),
                                        Text(
                                          '3Y',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Center(
                                child: Text(
                                  _items[index]['description']!,
                                  style: const TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Top Trending',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.5),
                    ),
                  ),
                  ListView.builder(
                    itemCount: _items.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 25),
                          child: Row(
                            children: [
                              Image.asset(
                                _items[index]['image']!,
                                height: 50,
                                width: 70,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _items[index]['name']!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600, letterSpacing: 1.5),
                                  ),
                                  Text(
                                    "₹${_items[index]['price']!}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF2ec4b6)),
                                  ),
                                ],
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '30%',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF2ec4b6)),
                                  ),
                                  Text(
                                    '3Y',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: const Text(
                        'News Picked For You',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.5),
                      )),
                  ListView.builder(
                    itemCount: _items.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 25),
                          child: Row(
                            children: [
                              Image.asset(
                                _items[index]['image']!,
                                height: 50,
                                width: 70,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _items[index]['name']!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600, letterSpacing: 1.5),
                                  ),
                                  Text(
                                    "₹${_items[index]['price']!}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF2ec4b6)),
                                  ),
                                ],
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '30%',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF2ec4b6)),
                                  ),
                                  Text(
                                    '3Y',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}