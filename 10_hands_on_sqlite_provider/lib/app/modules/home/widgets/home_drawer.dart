import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/app_auth_provider.dart';
import '../../../core/ui/theme_extension.dart';
import 'bottom_sheet_content.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: context.primaryColor.withAlpha(70),
              ),
              child: Row(
                children: [
                  Selector<AppAuthProvider, String>(
                    selector: (context, authProvider) {
                      return authProvider.user?.photoURL ?? '';
                    },
                    builder: (context, photoURL, child) {
                      return CircleAvatar(
                        backgroundImage: NetworkImage(photoURL),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  Selector<AppAuthProvider, String>(
                    selector: (context, authProvider) {
                      return authProvider.user?.displayName ?? '';
                    },
                    builder: (context, displayName, child) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          displayName,
                          style: context.textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Change name'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return BottomSheetContentWidget();
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => context.read<AppAuthProvider>().logout(),
          ),
        ],
      ),
    );
  }
}
