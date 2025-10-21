import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grabit_mobile/core/di/core_module_container.dart';
import 'package:grabit_mobile/core/presentation/app.dart';

void main()async {
 WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));
  runApp(const GrabitApp());
}



