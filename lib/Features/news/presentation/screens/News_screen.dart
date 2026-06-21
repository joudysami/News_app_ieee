import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/news/presentation/widgets/drawer_home.dart';
import 'package:news_app/Features/news/presentation/widgets/tabbar.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_state.dart';
import 'package:news_app/core/constant/app_color.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late final HomeCubit _homeCubit;
 
  @override
  void initState() {
    super.initState();
    _homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Center(child: Text(_homeCubit.categoryId ?? "General")),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: Drawer_home(),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (context, state) {
          print(state.source);
          final sources = state.source ?? [];
          if (sources.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return tabbar(sources: sources, homeCubit: _homeCubit);
          }
        },

      
      ),
    );
  }
}

