import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/news/presentation/widgets/extract_sheet.dart';
import 'package:news_app/Features/discovery/presentation/cubit/view_post/view_cubit.dart';
import 'package:news_app/Features/news/presentation/widgets/icon_saved.dart';
import 'package:news_app/core/constant/app_color.dart';

class SavedPost extends StatelessWidget {
  const SavedPost({
    super.key,
    required this.title,
    this.description,
    this.imageurl,
    required this.publishedAt,
    required this.author,
    this.content,
    this.url,
    required this.article,
  });

  final String title;
  final String? description;
  final String? imageurl;
  final String publishedAt;
  final String author;
  final String? content;
  final String? url;
  final Map<String, dynamic> article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.w),
      child: Material(
        color: AppColor.babyblack,
        child: InkWell(
          onTap: () async {
            await context.read<ViewPostsCubit>().saveViewPost(article);

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return SheetNew(
                  image: imageurl ??'',
                  content: content ?? '',
                  url: url ?? '',
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.blue, width: 1.w),
              borderRadius: BorderRadius.circular(6.r),
            ),
            padding:  EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                 SizedBox(height: 10.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      publishedAt,
                      style:  TextStyle(color: Colors.grey),
                    ),
                    SaveIcon(article: article),
                  ],
                ),

                 SizedBox(height: 10.h),

                Text(
                  author,
                  style:  TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
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