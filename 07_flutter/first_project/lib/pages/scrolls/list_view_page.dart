import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          debugPrint('Index renderizado: $index');

          return const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://github.com/vagnereix.png'),
            ),
            title: Text('Vagner Reis'),
            subtitle: Text('Mobile Engineer'),
            trailing: Icon(Icons.ad_units),
          );
        },
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
