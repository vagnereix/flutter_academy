import 'package:device_preview/device_preview.dart';
import 'package:first_project/pages/bottomNavBar/bottom_nav_bar_page.dart';
import 'package:first_project/pages/bottomNavBar/page_view.dart';
import 'package:first_project/pages/buttons_and_rotations_page.dart';
import 'package:first_project/pages/circle_avatar_page.dart';
import 'package:first_project/pages/cities/cities_page.dart';
import 'package:first_project/pages/colors_page.dart';
import 'package:first_project/pages/container_page.dart';
import 'package:first_project/pages/dialogs/dialogs_page.dart';
import 'package:first_project/pages/forms_page.dart';
import 'package:first_project/pages/home_page.dart';
import 'package:first_project/pages/layout_builder_page.dart';
import 'package:first_project/pages/material_banner_page.dart';
import 'package:first_project/pages/media_query_page.dart';
import 'package:first_project/pages/rows_columns_page.dart';
import 'package:first_project/pages/scrolls/list_view_page.dart';
import 'package:first_project/pages/scrolls/single_child_scroll_view_page.dart';
import 'package:first_project/pages/snack_bar_page.dart';
import 'package:first_project/pages/stack_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      // constante default do Flutter [indica se está em release mode]
      enabled: false, // !kReleaseMode
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter first project',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey[200],
          ),
          titleTextStyle: TextStyle(
            color: Colors.grey[200],
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/containers': (context) => const ContainerPage(),
        '/rows_columns': (context) => const RowsColumnsPage(),
        '/media_querys': (context) => const MediaQueryPage(),
        '/layout_builder': (context) => const LayoutBuilderPage(),
        '/buttons_rotations': (context) => const ButtonsAndRotationsPage(),
        '/single_child_scroll_view': (_) => const SingleChildScrollViewPage(),
        '/list_view': (context) => const ListViewPage(),
        '/dialogs': (context) => const DialogsPage(),
        '/snack_bar': (context) => const SnackBarPage(),
        '/forms': (context) => const FormsPage(),
        '/cities': (context) => const CitiesPage(),
        '/stack': (context) => const StackPage(),
        '/bottom_nav_bar': (context) => const BottomNavBarPage(),
        '/page_view': (context) => const PageViewPage(),
        '/circle_avatar': (context) => const CircleAvatarPage(),
        '/colors': (context) => const ColorsPage(),
        '/material_banner': (context) => const MaterialBannerPage(),
      },
    );
  }
}
