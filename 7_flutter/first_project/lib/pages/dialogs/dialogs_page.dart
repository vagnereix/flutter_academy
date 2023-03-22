import 'dart:io';

import 'package:first_project/components/button_widget.dart';
import 'package:first_project/pages/dialogs/dialog_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
              name: 'Show custom dialog',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => DialogCustom(context),
                );
              },
            ),
            ButtonWidget(
              name: 'Show simple dialog',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const SimpleDialog(
                    title: Text(
                      'Simple dialog',
                    ),
                    contentPadding: EdgeInsets.all(24),
                    children: [
                      Text(
                        'Simple dialog content',
                      ),
                    ],
                  ),
                );
              },
            ),
            ButtonWidget(
              name: 'Show alert dialog',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    // Deveríamos verificar se é iOS
                    // Usando assim apenas para visualizar no Android
                    if (Platform.isAndroid) {
                      return CupertinoAlertDialog(
                        title: const Text(
                          'Alert dialog iOS',
                        ),
                        content: const Text(
                          'Alert dialog iOS content',
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Close',
                              style: TextStyle(
                                color: Colors.grey.shade900,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.grey.shade900,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    }

                    return AlertDialog(
                      title: const Text(
                        'Alert dialog',
                      ),
                      contentPadding: const EdgeInsets.all(24),
                      content: const Text(
                        'Alert dialog content',
                      ),
                      actionsPadding: const EdgeInsets.all(24),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade900,
                          ),
                          child: const Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade900,
                          ),
                          child: const Text(
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ButtonWidget(
              name: 'Show time picker dialog',
              onTap: () async {
                final timePicked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                debugPrint('Time picked by user: $timePicked');
              },
            ),
            ButtonWidget(
              name: 'Show date picker dialog',
              onTap: () async {
                final datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1998),
                  lastDate: DateTime(2099),
                );

                debugPrint('Date picked by user: $datePicked');
              },
            ),
            ButtonWidget(
              name: 'Show about dialog',
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: const Icon(Icons.flutter_dash),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
