import 'package:flutter/material.dart';

enum PopupMenuPages {
  container,
  rowsColumns,
  mediaQuery,
  layoutBuilder,
  buttonsRotations,
  singleChildScrollView,
  listView,
  dialogs,
  snackBars,
  forms,
  cities,
  stack,
  bottomNavBar,
  pageView,
  circleAvatar,
  colors,
  materialBanner,
}

class PopupMenuButtons extends StatelessWidget {
  const PopupMenuButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupMenuPages>(
      tooltip: 'Páginas disponíveis',
      onSelected: (PopupMenuPages value) {
        switch (value) {
          case PopupMenuPages.container:
            Navigator.pushNamed(context, '/containers');
            break;
          case PopupMenuPages.rowsColumns:
            Navigator.pushNamed(context, '/rows_columns');
            break;
          case PopupMenuPages.mediaQuery:
            Navigator.pushNamed(context, '/media_querys');
            break;
          case PopupMenuPages.layoutBuilder:
            Navigator.pushNamed(context, '/layout_builder');
            break;
          case PopupMenuPages.buttonsRotations:
            Navigator.pushNamed(context, '/buttons_rotations');
            break;
          case PopupMenuPages.singleChildScrollView:
            Navigator.pushNamed(context, '/single_child_scroll_view');
            break;
          case PopupMenuPages.listView:
            Navigator.pushNamed(context, '/list_view');
            break;
          case PopupMenuPages.dialogs:
            Navigator.pushNamed(context, '/dialogs');
            break;
          case PopupMenuPages.snackBars:
            Navigator.pushNamed(context, '/snack_bar');
            break;
          case PopupMenuPages.forms:
            Navigator.pushNamed(context, '/forms');
            break;
          case PopupMenuPages.cities:
            Navigator.pushNamed(context, '/cities');
            break;
          case PopupMenuPages.stack:
            Navigator.pushNamed(context, '/stack');
            break;
          case PopupMenuPages.bottomNavBar:
            Navigator.pushNamed(context, '/bottom_nav_bar');
            break;
          case PopupMenuPages.pageView:
            Navigator.pushNamed(context, '/page_view');
            break;
          case PopupMenuPages.circleAvatar:
            Navigator.pushNamed(context, '/circle_avatar');
            break;
          case PopupMenuPages.colors:
            Navigator.pushNamed(context, '/colors');
            break;
          case PopupMenuPages.materialBanner:
            Navigator.pushNamed(context, '/material_banner');
            break;
          default:
            break;
        }
      },
      itemBuilder: (context) => <PopupMenuItem<PopupMenuPages>>[
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.container,
          child: Text(
            'Containers',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.rowsColumns,
          child: Text(
            'Rows & Columns',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.mediaQuery,
          child: Text(
            'MediaQuerys',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.layoutBuilder,
          child: Text(
            'LayoutBuilder',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.buttonsRotations,
          child: Text(
            'Buttons & Rotations',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.singleChildScrollView,
          child: Text(
            'SingleChildScrollView',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.listView,
          child: Text(
            'ListView',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.dialogs,
          child: Text(
            'Dialogs',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.snackBars,
          child: Text(
            'SnackBars',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.forms,
          child: Text(
            'Forms',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.cities,
          child: Text(
            'Cities',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.stack,
          child: Text(
            'Stack',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.bottomNavBar,
          child: Text(
            'BottomNavigationBar',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.pageView,
          child: Text(
            'PageView',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.circleAvatar,
          child: Text(
            'CircleAvatar',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.colors,
          child: Text(
            'Colors',
          ),
        ),
        const PopupMenuItem<PopupMenuPages>(
          value: PopupMenuPages.materialBanner,
          child: Text(
            'MaterialBanner',
          ),
        ),
      ],
    );
  }
}
