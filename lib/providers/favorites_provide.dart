import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample1/models/meal.dart';


class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //FavoriteMealsNotifier(super.state);
  FavoriteMealsNotifier() :super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    //  state.add // Not allowed here to add or remove
    // you need to make new assignnment !
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((element) => element.id != meal.id).toList();
    return false;
    } else {
      state = [
        ...state,
        meal
      ]; // update the list in mutatable way not using add or remove
   return true;
    }
  }
}

// State Notifer works in memory like making new objects in memory not editing when changes happen !
final favoritesMealProvider = StateNotifierProvider<FavoriteMealsNotifier,
    List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
//if complex data is changing many times ! [StateNotifierProvider]