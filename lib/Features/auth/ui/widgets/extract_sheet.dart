import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/utils/url_launcher.dart';

class SheetNew extends StatelessWidget {
  const SheetNew({
    super.key,
    required this.image,
    required this.content,
    required this.url,
  });

  final String image;
  final String content;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        margin: EdgeInsets.all(8),
        height: 450,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(content,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.black,
                    )),
                SizedBox(
                  width: 345,
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        try {
                          UrlLauncher.urllauncher(url);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text(
                        "View ALL Article",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColor.black,
                        side: BorderSide(color: AppColor.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
        //),
      ),
    );
  }
}
