import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/news/presentation/widgets/extract_sheet.dart';
import 'package:news_app/Features/discovery/presentation/cubit/view_post/view_cubit.dart';
import 'package:news_app/Features/news/presentation/widgets/icon_saved.dart';
import 'package:news_app/core/utils/date.dart';

class ViewNews extends StatelessWidget {
  const ViewNews({
    super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.publishedAt,
    required this.author,
    this.content,
    this.url,
    required this.article,
  });

  final String title;
  final String description;
  final String imageurl;
  final String publishedAt;
  final String author;
  final String? content;
  final String? url;
  final Map article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              await context.read<ViewPostsCubit>().saveViewPost(article);

              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return SheetNew(
                      image: imageurl,
                      content: content ?? '',
                      url: url ?? '',
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
                      child: (imageurl.isNotEmpty)
                          ? Image.network(
                              imageurl,
                              height: 230,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 230,
                                  width: double.infinity,
                                  color: Colors.grey[800],
                                  child: const Icon(Icons.broken_image,
                                      color: Colors.white),
                                );
                              },
                            )
                          : Container(
                              height: 230,
                              width: double.infinity,
                              color: Colors.grey[800],
                              child: const Icon(Icons.image_not_supported,
                                  color: Colors.white),
                            ),
                    ),
                    Text(
                      description,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Published At: ${Time.timeFormat(publishedAt)}",
                          ),
                        ),
                        SaveIcon(article: article),
                      ],
                    ),
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
