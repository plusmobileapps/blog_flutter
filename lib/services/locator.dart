import 'package:blog_flutter/services/article_repository.dart';
import 'package:get_it/get_it.dart';

import 'navigator.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ArticleRepository());
}