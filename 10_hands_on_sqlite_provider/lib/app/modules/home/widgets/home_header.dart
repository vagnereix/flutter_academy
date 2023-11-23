import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/app_auth_provider.dart';
import '../../../core/ui/theme_extension.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<AppAuthProvider, String>(
      selector: (_, provider) => provider.user?.displayName ?? '',
      builder: (_, userName, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Welcome back, $userName!',
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
