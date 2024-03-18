import 'package:flutter/material.dart';
import 'package:posts_app/core/utils/dependency_injection.dart';
import 'package:posts_app/core/utils/my_shared_preferences.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_view_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await MySharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostsViewProvider(),
    );
  }
}
