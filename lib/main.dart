import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/presentation/features/task_list/task_list_screen.dart';

import 'bloc/task_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => TaskBloc())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          showSemanticsDebugger: false,
          title: 'Todo App',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: TaskListScreen(),
        ),
      ),
    );
  }
}


