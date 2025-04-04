import 'package:flutter/material.dart';
import 'package:crud/app.dart';           
import 'package:crud/db/database.dart';   

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final taskDao = database.taskDao;

  runApp(MyApp(taskDao));
}



class MyApp extends StatelessWidget {
  final TaskDao taskDao;
  const MyApp(this.taskDao, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(taskDao)..fetchTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

