import 'package:flutter/material.dart';
import 'package:shop_amlak/screens/third_screen.dart';
import 'package:shop_amlak/tools/border.dart';
import 'package:shop_amlak/tools/colors.dart';
import 'package:shop_amlak/tools/text_style.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _buttonsVisible = false;
  bool _textVisible = false;

  @override
  void initState() {
    super.initState();

    // منتظر می‌مانیم تا اولین فریم کامل رندر شود
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // کمی تاخیر می‌دهیم تا Hero تصویر انتقال یابد
      await Future.delayed(const Duration(milliseconds: 500));
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
    const String descroption =
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea";

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Stack(
                children: [
                  // عکس Hero بدون انیمیشن اضافی
                  Hero(
                    tag: "image",
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: const Duration(
                              milliseconds: 1000,
                            ),
                            pageBuilder: (_, __, ___) => const ThirdScreen(),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/image/pic1.jpg",
                          width: width * 1,
                          height: height * 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // متن پایین عکس بدون انیمیشن اضافی
                  Positioned(
                    bottom: 0,
                    child: Hero(
                      tag: "text",
                      child: Container(
                        width: width * 0.96,
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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

                  // دکمه‌ها با انیمیشن بعد از پایان Hero
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: width * 0.035,
                    ),
                    child: Hero(tag: "btn",
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 1000),
                        opacity: _buttonsVisible ? 1 : 0,
                        curve: Curves.easeInOut,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: _closePage,
                              child: Container(
                                padding: EdgeInsets.all(width * 0.015),
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: width * 0.07,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(width * 0.015),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Icon(
                                Icons.favorite_border_sharp,
                                color: Colors.white,
                                size: width * 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // متن Description بدون تغییر
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: _textVisible ? 1 : 0,
              curve: Curves.easeInOut,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description", style: textColor2),
                    SizedBox(height: height * 0.02),
                    Text(descroption, style: textColor11),
                    SizedBox(height: height * 0.02),
                    Text("Home options", style: textColor2),
                    SizedBox(height: height * 0.02),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.3,
                          height: height * 0.05,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: searchBarColor,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.bed),
                              SizedBox(width: width * 0.02),
                              Text("4"),
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.3,
                          height: height * 0.05,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: searchBarColor,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.local_parking_outlined),
                              SizedBox(width: width * 0.02),
                              Text("1"),
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.3,
                          height: height * 0.05,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: searchBarColor,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.restaurant),
                              SizedBox(width: width * 0.02),
                              Text("1"),
                            ],
                          ),
                        ),
                      ],
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
