import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/ui/widgets/drawer_home.dart';
import 'package:news_app/Features/auth/ui/widgets/tabbar.dart';
import 'package:news_app/Features/cubit/home_cubit/home_cubit.dart';
import 'package:news_app/Features/cubit/home_cubit/home_state.dart';
import 'package:news_app/core/constant/app_color.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late final HomeCubit _homeCubit;
  //late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _homeCubit.getSource();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Center(child: Text(_homeCubit.categoryid ?? "General")),
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

