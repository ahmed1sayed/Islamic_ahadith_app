import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:islamic_app/cubit/app_cubit.dart';
 import 'package:islamic_app/pages/home.dart';
import 'package:islamic_app/pages/start_insert_screen.dart';

import 'cubit/cach_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
   bool  isInserted = CacheHelper.getData(key: 'Inserted')??false;
  Widget? widget;
  if (isInserted) {
    widget = const HomeScreen();
  } else {
    widget =
        const InsertScreen();
  }
  runApp(MyApp(startingWidget: widget,));
}

class MyApp extends StatelessWidget {
  Widget startingWidget;

  MyApp({super.key, required this.startingWidget });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) =>
    AppCubit()
      ..getAllData()
      ..createDatabase(),
      child: MaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter islamic app',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: startingWidget,
      ),
    );
  }
}
/*
echo "# Islamic_ahadith_app" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/ahmed1sayed/Islamic_ahadith_app.git
git push -u origin main*/
