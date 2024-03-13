import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:screen_lock/data/service/shared_preff_storage_impl.dart';

import 'data/domain/repository.dart';
import 'data/domain/repository_impl.dart';
import 'data/service/locale_secure_storage_impl.dart';

final getIt = GetIt.instance;

void setupServicesLocator() {
  final flutterSecureStorage = LocaleSecureStorageImpl(const FlutterSecureStorage());
  final localeStorage = SharedPrefStorageImplements();

  getIt.registerSingleton<WelTradeRepository>(
    WeltradeRepositoryImpl(
      flutterSecureStorage: flutterSecureStorage,
      sharedPrefStorage: localeStorage,
    ),
  );
}
