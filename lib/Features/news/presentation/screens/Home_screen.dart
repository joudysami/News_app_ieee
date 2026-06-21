import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/discovery/presentation/screen/discovery_screen.dart';
import 'package:news_app/Features/news/presentation/screens/News_screen.dart';
import 'package:news_app/Features/profile/presentation/screens/profile_screen.dart';
import 'package:news_app/Features/saved/presentation/screens/saved_screen.dart';
import 'package:news_app/Features/news/presentation/widgets/drawer_home.dart';
import 'package:news_app/Features/news/presentation/widgets/newsCard.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/Features/news/data/models/categorymodel.dart';
import 'package:news_app/core/routes/app_routes_named.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int currentIndex = 0;
  final List<Categorymodel> categories = Categorymodel.categories;
  late final HomeCubit _homeCubit;
  @override
  void initState() {
    super.initState();
    _homeCubit = context.read<HomeCubit>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
 Widget build(BuildContext context) {
    final Widget _currentPage = currentIndex == 0
        ? _buildNewsPage()
        : currentIndex == 1
        ? const SavedScreen()
        : currentIndex == 2
        ? const DiscoveryScreen()
        : currentIndex == 3
        ? const ProfileScreen()
        : const SizedBox();

    return Scaffold(
      body: _currentPage,

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.black,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.grey,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppColor.black,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.white,
            icon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.white,

            icon: Icon(Icons.explore),
            label: "Discovery",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.white,
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildNewsPage() {
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
                     Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => BlocProvider.value(
      value: _homeCubit,
      child: const NewsScreen(),
    ),
  ),
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
