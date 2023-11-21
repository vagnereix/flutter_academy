import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/messages.dart';
import '../../../services/user/user_service.dart';

class BottomSheetContentWidget extends StatelessWidget {
  BottomSheetContentWidget({
    super.key,
  });

  final name = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
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
                      context.read<UserService>().updateProfileName(name.value);

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
  }
}
