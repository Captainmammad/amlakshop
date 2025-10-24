import 'package:flutter/material.dart';
import 'package:shop_amlak/tools/border.dart';
import 'package:shop_amlak/tools/colors.dart';
import 'package:shop_amlak/tools/text_style.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            Text("Welcome", style: textColor9),
                            Text("Mho.ziaee", style: textColor3),
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
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: width * 0.03,
                ),
                margin: EdgeInsets.all(width * 0.02),
                decoration: BoxDecoration(
                  color: searchBarColor,
                  borderRadius: getBorderRadiusWidget(context, 0.022),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 28, color: greyColor),
                    Text("search in store", style: textColor9),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
