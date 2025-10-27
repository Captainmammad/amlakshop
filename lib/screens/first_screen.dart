import 'package:flutter/material.dart';
import 'package:shop_amlak/screens/second_screen.dart';
import 'package:shop_amlak/tools/border.dart';
import 'package:shop_amlak/tools/colors.dart';
import 'package:shop_amlak/tools/text_style.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _visible = false;
  bool _buttonsVisible = false;
  bool _textVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() => _visible = true);
      await Future.delayed(const Duration(milliseconds: 1000));
      if (mounted) {
        setState(() => _buttonsVisible = true);
        setState(() => _textVisible = true);
      }
    });
  }

  Future<void> _closePage() async {
    setState(() => _buttonsVisible = false);
    setState(() => _textVisible = false);
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _textVisible ? 1 : 1,
            curve: Curves.easeInOut,
            child: Column(
              children: [
                // بخش بالای صفحه (پروفایل و نوتیفیکیشن)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: width * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: getBorderRadiusWidget(context, .2),
                            child: Image.asset(
                              "assets/image/pic0.jpg",
                              width: width * 0.2,
                              height: width * 0.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                  color: greyColor,
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Mho.ziaee",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(width * 0.025),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: getBorderRadiusWidget(context, 0.04),
                        ),
                        child: Icon(
                          Icons.notifications_rounded,
                          color: greyColor,
                          size: width * 0.08,
                        ),
                      ),
                    ],
                  ),
                ),

                // نوار جستجو
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: width * 0.015,
                  ),
                  margin: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                    color: searchBarColor,
                    borderRadius: getBorderRadiusWidget(context, 0.022),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: width * 0.07, color: greyColor),
                      Text(
                        "search in store",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                // منوها
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "home",
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: primaryColor,
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.06),
                      Text(
                        "motel",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: width * 0.06),
                      Text(
                        "bed room",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: width * 0.06),
                      Text(
                        "hotel",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // عکس Hero بدون انیمیشن
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(
                            milliseconds: 1000,
                          ),
                          pageBuilder: (_, __, ___) => const SecondScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Hero(
                          tag: "image",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "assets/image/pic1.jpg",
                              width: width * 1,
                              height: height * 0.64,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // متن پایین عکس Hero بدون انیمیشن اضافی
                        Positioned(
                          bottom: 0,
                          child: Hero(
                            tag: "text",
                            child: Container(
                              width: width * 0.92,
                              height: 100,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.transparent, primaryColor3],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "kanlaya Eryie",
                                      style: TextStyle(
                                        color: backGroundColor,
                                        fontSize: width * 0.06,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_sharp,
                                              color: Colors.white,
                                              size: width * 0.06,
                                            ),
                                            Text(
                                              "Pang mapha, Thailand",
                                              style: TextStyle(
                                                color: backGroundColor,
                                                fontSize: width * 0.045,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$100/',
                                              style: TextStyle(
                                                color: backGroundColor,
                                                fontSize: width * 0.045,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Night',
                                              style: TextStyle(
                                                color: backGroundColor,
                                                fontSize: width * 0.045,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
