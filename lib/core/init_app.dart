import 'package:flutter/material.dart';
import 'package:itunes_rss/features/top_albums/domain/helpers/injection_helper.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('🚀 Initializing DI...');
  await initTopAlbumsFeature();
  debugPrint('✅ DI Initialized');
}
