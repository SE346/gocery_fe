import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/repository/auth_repository.dart';
import 'package:grocery/data/repository/category_repository.dart';
import 'package:grocery/data/repository/product_repository.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/screens/admin/bottom_navigation_bar.dart/bottom_navigation_bar_screen.dart';
import 'package:grocery/presentation/services/add_category_bloc/add_category_bloc.dart';
import 'package:grocery/presentation/services/add_edit_product_bloc/add_edit_product_bloc.dart';
import 'package:grocery/presentation/services/app_data.dart';
import 'package:grocery/presentation/services/authentication_bloc/authentication_bloc.dart';
import 'package:grocery/presentation/services/bottom_navigation_bloc/cubit/navigation_cubit.dart';
import 'package:grocery/presentation/services/categories_overview_bloc/categories_overview_bloc.dart';
import 'package:grocery/presentation/services/detail_category_bloc/detail_category_bloc.dart';
import 'package:grocery/presentation/services/edit_category_bloc/edit_category_bloc.dart';
import 'package:grocery/presentation/services/products_overview_bloc/products_overview_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Future<SharedPreferences> sharedFuture;

  @override
  void initState() {
    _initshared(); // Prioritize

    super.initState();
  }

  _initshared() async {
    sharedFuture = SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(sharedFuture),
      child: Consumer<AppData>(
        builder: (context, appData, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<NavigationCubit>(
                create: (context) => NavigationCubit(),
              ),
              BlocProvider<AuthenticationBloc>(
                create: (context) => AuthenticationBloc(
                  AuthRepository(appData),
                  appData,
                ),
              ),
              BlocProvider<CategoriesOverviewBloc>(
                create: (context) => CategoriesOverviewBloc(
                  CategoryRepository(appData),
                ),
              ),
              BlocProvider<AddCategoryBloc>(
                create: (context) => AddCategoryBloc(
                  CategoryRepository(appData),
                ),
              ),
              BlocProvider<DetailCategoryBloc>(
                create: (context) => DetailCategoryBloc(
                    CategoryRepository(appData), ProductRepository(appData)),
              ),
              BlocProvider<EditCategoryBloc>(
                create: (context) => EditCategoryBloc(
                  CategoryRepository(appData),
                ),
              ),
              BlocProvider<ProductsOverviewBloc>(
                create: (context) => ProductsOverviewBloc(),
              ),
              BlocProvider<AddEditProductBloc>(
                create: (context) => AddEditProductBloc(
                  ProductRepository(appData),
                ),
              ),
            ],
            child: MaterialApp(
              title: 'Gocery',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.primary,
              ),
              home: const BottomNavigationBarScreen(),
            ),
          );
        },
      ),
    );
  }
}
