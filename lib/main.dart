import 'package:flutter/material.dart';
import 'package:itunes_rss/core/init_app.dart';
import 'package:itunes_rss/features/top_albums/presentation/providers/top_albums_provider.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/top_albums_screen.dart';
import 'package:provider/provider.dart';
import 'config/theming/app_theme.dart';
import 'features/top_albums/domain/helpers/injection_helper.dart';

Future<void> main() async {

await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getItInstance<TopAlbumsProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Itunes RSS Top Albums',
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: buildDarkTheme(),
        home: TopAlbumsScreen(),
      ),
    );
  }
}

