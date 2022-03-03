import 'package:flutter_movies/utils/preference_util.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() async {
  PreferenceUtils.init();
}
