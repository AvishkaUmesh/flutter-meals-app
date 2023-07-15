import 'package:flutter_riverpod/flutter_riverpod.dart';

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
