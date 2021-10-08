import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/src/injector.dart';
import 'package:news_app_clean_architecture/src/presentation/blocs/remote_articles_bloc.dart';

import 'src/config/routes/app.routes.dart';
import 'src/config/themes/app.themes.dart';
import 'src/core/utils/constants.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(create: (context) => injector()..add(GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
      ),
    );

  }
}
