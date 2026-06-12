import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: AppColor.grey,
          ),
          ListTile(
            leading: Icon(Icons.color_lens, color: AppColor.white),
            title: Text(
              'Themes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.white,
              ),
            ),
            onTap: () {},
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: AppColor.grey,
          ),
          ListTile(
            leading: Icon(CupertinoIcons.globe, color: AppColor.white),
            title: Text(
              'Language',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.white,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
