import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

const kInitialFilter = {
  Filter.vegetarian: false,
  Filter.vegan: false,
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
};

class FiltersProvider extends StateNotifier<Map<Filter, bool>> {
  FiltersProvider() : super(kInitialFilter);

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<Filter, bool>>(
  (ref) {
    return FiltersProvider();
  },
);

final filteredMealProvider = Provider((ref) {
  final selectedFilters = ref.watch(filtersProvider);
  final availableMeals = ref.watch(mealsProvider);

  return availableMeals.where((meal) {
    if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
