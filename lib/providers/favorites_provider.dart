import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>(
  (ref) {
    return FavoritesMealsNotifier();
  },
);
