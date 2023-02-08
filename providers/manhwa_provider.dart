import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:state_management_provider/models/manhwa_model.dart';

final List<Manhwa> initialData = List.generate(
    51,
    (index) => Manhwa(
        judul: "Manhwa $index", episode: "${Random().nextInt(100) + 60} ep."));

class ManhwaProvider with ChangeNotifier {
  final List<Manhwa> _manhwas = initialData;
  List<Manhwa> get manhwas => _manhwas;

  final List<Manhwa> _myList = [];
  List<Manhwa> get myList => _myList;

  void addToList(Manhwa manhwa) {
    _myList.add(manhwa);
    notifyListeners();
  }

  void removeFromList(Manhwa manhwa) {
    _myList.remove(manhwa);
    notifyListeners();
  }
}
