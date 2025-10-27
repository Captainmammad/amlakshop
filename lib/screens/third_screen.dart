import 'package:flutter/material.dart';
import 'package:animations/animations.dart'; // فقط اگر خواستی نسخه حرفه‌ای‌تر

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _buttonsVisible = false;
  String _currentImage = "assets/image/pic1.jpg";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) setState(() => _buttonsVisible = true);
    });
  }

  void _changeImage(String image) {
    if (_currentImage != image) {
      setState(() => _currentImage = image);
    }
  }

  Future<void> _closePage() async {
    setState(() => _buttonsVisible = false);
    await Future.delayed(const Duration(milliseconds: 100));
    if (mounted) Navigator.pop(context);
  }

  Widget _buildImage(String image) {
    return Image.asset(
      image,
      key: ValueKey<String>(image),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.7,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          Container(color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // عکس اصلی با PageTransitionSwitcher برای انیمیشن یکپارچه
              SizedBox(
                width: width,
                height: height * 0.7,
                child: PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                    return SharedAxisTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child,
                    );
                  },
                  child: _buildImage(_currentImage),
                ),
              ),

              // دکمه برگشت و قلب
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: width * 0.035,
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _buttonsVisible ? 1 : 0,
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

              // دکمه های جهت نما چپ و راست
              Positioned(
                left: 10,
                top: height * 0.3,
                child: GestureDetector(
                  onTap: () {
                    if (_currentImage == "assets/image/pic1.jpg") _changeImage("assets/image/pic4.jpg");
                    else if (_currentImage == "assets/image/pic2.jpg") _changeImage("assets/image/pic1.jpg");
                    else if (_currentImage == "assets/image/pic3.jpg") _changeImage("assets/image/pic2.jpg");
                    else if (_currentImage == "assets/image/pic4.jpg") _changeImage("assets/image/pic3.jpg");
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: height * 0.3,
                child: GestureDetector(
                  onTap: () {
                    if (_currentImage == "assets/image/pic1.jpg") _changeImage("assets/image/pic2.jpg");
                    else if (_currentImage == "assets/image/pic2.jpg") _changeImage("assets/image/pic3.jpg");
                    else if (_currentImage == "assets/image/pic3.jpg") _changeImage("assets/image/pic4.jpg");
                    else if (_currentImage == "assets/image/pic4.jpg") _changeImage("assets/image/pic1.jpg");
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          // منوی پایین اسکرول افقی
          SizedBox(
            height: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                children: [
                  _thumbnail("assets/image/pic1.jpg"),
                  _thumbnail("assets/image/pic2.jpg"),
                  _thumbnail("assets/image/pic3.jpg"),
                  _thumbnail("assets/image/pic4.jpg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _thumbnail(String image) {
    return GestureDetector(
      onTap: () => _changeImage(image),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: _currentImage == image ? Colors.green : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey[300], width: 100, height: 100),
          ),
        ),
      ),
    );
  }
}
