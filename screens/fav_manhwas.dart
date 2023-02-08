import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/providers/manhwa_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<ManhwaProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('My List (${_myList.length})'),
      ),
      body: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (_, index) {
          final currentManhwa = _myList[index];
          return Card(
            key: ValueKey(currentManhwa.judul),
            elevation: 4,
            child: ListTile(
              title: Text(currentManhwa.judul),
              subtitle: Text(currentManhwa.episode ?? ''),
              trailing: TextButton(
                onPressed: () {
                  context.read<ManhwaProvider>().removeFromList(currentManhwa);
                },
                child: const Text(
                  'Hapus',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
