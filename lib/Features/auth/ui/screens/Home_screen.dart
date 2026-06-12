import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/ui/widgets/drawer_home.dart';
import 'package:news_app/Features/auth/ui/widgets/newsCard.dart';
import 'package:news_app/Features/cubit/home_cubit/home_cubit.dart';

import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/data/model/categorymodel.dart';
import 'package:news_app/core/routes/app_routes_named.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Categorymodel> categories = Categorymodel.categories;
  late final HomeCubit _homeCubit;
  @override
  void initState() {
    super.initState();
    _homeCubit = context.read<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Align(
          alignment: Alignment.center,
          child: Text('Home', style: Theme.of(context).textTheme.titleLarge),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              context.read<HomeCubit>().getSource();
            },
            icon: const Icon(Icons.search, size: 30, color: AppColor.white),
          ),
        ],
      ),
      drawer: Drawer_home(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'Here is Some News For You',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CustomCategoryCard(
                    title: categories[index].title,
                    image: categories[index].image,
                    index: index,
                    onViewAll: () async {
                      _homeCubit.selectCategoryId(categories[index].id);
                      await Navigator.pushNamed(
                        context,
                        AppRoutesNamed.News_screen,
                        arguments: _homeCubit,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
