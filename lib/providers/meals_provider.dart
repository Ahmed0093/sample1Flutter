import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample1/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
}
);