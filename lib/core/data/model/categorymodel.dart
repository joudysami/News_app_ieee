import 'package:news_app/core/constant/app_images.dart';

class Categorymodel {
  String image;
  String title;
  String id;

  Categorymodel({required this.image, required this.title, required this.id});
  static List<Categorymodel> categories = [
    Categorymodel(
      title: "General",
      image: AppImages.rectangle,
      id: "General",
    ),
    Categorymodel(
      title: "Business",
      image: AppImages.bis,
      id: "Business",
    ),
    Categorymodel(
      title: "Sports",
      image: AppImages.lionel,
      id: "Sports",
    ),
    Categorymodel(
      title: "Technology",
      image: AppImages.computer,
      id: "Technology",
    ),
    Categorymodel(
      title: "Entertainment",
      image: AppImages.pop,
      id: "Entertainment",
    ),
    Categorymodel(
      title: "Health",
      image: AppImages.doc,
      id: "Health",
    ),
    Categorymodel(
      title: "Science",
      image: AppImages.seicn,
      id: "Science",
    ),
  ];
}
