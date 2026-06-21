import 'package:flutter/material.dart';
import 'package:news_app/Features/news/presentation/widgets/drpodown_button2.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/routes/app_routes_named.dart';

class Drawer_home extends StatelessWidget {
  const Drawer_home({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColor.white),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'News App ',
                style: TextStyle(
                  color: AppColor.babyblack,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, color: AppColor.white),
            title: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoutesNamed.Home_screen);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Go to Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            indent: 16,
            endIndent: 16,
            color: AppColor.grey,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.color_lens_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Theme",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
       
       
        ],
      ),
    );
  }
}
