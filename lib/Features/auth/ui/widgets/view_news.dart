
import 'package:flutter/material.dart';

import 'package:news_app/Features/auth/ui/widgets/extract_sheet.dart';

class ViewNews extends StatelessWidget {
  const ViewNews({
    super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.publishedAt,
    required this.author,
    this.content, this.url,
  });

  final String title;
  final String description;
  final String imageurl;
  final String publishedAt;
  final String author;
  final String? content;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return SheetNew(
                      image: imageurl,
                      content: content ?? '',
                      url:url??'',
                    );
                  });
              // Handle tap event
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        imageurl,
                        height: 230,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(publishedAt)),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          author,
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
