import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/app_auth_provider.dart';
import '../../../core/ui/messages.dart';
import '../../../core/ui/theme_extension.dart';
import '../../../services/user/user_service.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final name = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
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
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Change name'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (value) => name.value = value,
                          decoration: const InputDecoration(
                            labelText: 'Type your new name',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (name.value.isEmpty) {
                                    Messages.of(context).showError(
                                      'Name cannot be empty',
                                    );
                                  } else {
                                    context
                                        .read<UserService>()
                                        .updateProfileName(name.value);

                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text('Save'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
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
