import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/models/manhwa_model.dart';
import 'package:state_management_provider/providers/manhwa_provider.dart';
import 'package:state_management_provider/screens/fav_manhwas.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var manhwas = context.watch<ManhwaProvider>().manhwas;
    var myList = context.watch<ManhwaProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Annisa - Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyListScreen()),
                );
              },
              icon: const Icon(Icons.favorite),
              label: Text(
                'Go to My Favorite (${myList.length})',
                style: const TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: manhwas.length,
                itemBuilder: (_, index) {
                  final currentManhwa = manhwas[index];
                  return Card(
                    key: ValueKey(currentManhwa.judul),
                    color: Colors.green[200],
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        currentManhwa.judul,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        currentManhwa.episode ?? 'No Information',
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          if (!myList.contains(currentManhwa)) {
                            context
                                .read<ManhwaProvider>()
                                .addToList(currentManhwa);
                          } else {
                            context
                                .read<ManhwaProvider>()
                                .removeFromList(currentManhwa);
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: myList.contains(currentManhwa)
                              ? Colors.red
                              : Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
