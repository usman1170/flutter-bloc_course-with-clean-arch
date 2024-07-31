import 'package:bloc_course/favourite_exp/models/fev_model.dart';

class FavouriteRepository {
  Future<List<FavouriteModel>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generate(10));
  }

  List<FavouriteModel> _generate(int length) {
    return List.generate(
      length,
      (index) => FavouriteModel(id: index.toString(), value: "Item :$index"),
    );
  }
}
