import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample1/providers/meals_provider.dart';



enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
  FiltersNotifier():super({
    Filter.glutenFree:false,
    Filter.lactoseFree:false,
    Filter.vegetarian:false,
    Filter.vegan:false,
  });

  void setFilter(Filter filter ,bool isActive)
  {
    state = {
      ...state,
      filter:isActive,
    };

  }

  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final mealsActive = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return mealsActive.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});