import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:web_app/providers/plans.dart';
import 'package:web_app/providers/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_app/route_generator.dart';
import 'package:web_app/widgets/auth_widget.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(observers: [], child: MyApp()));
}

class MyApp extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth_home',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

// class MyHomePage extends HookWidget with Coder {
//   @override
//   Widget build(BuildContext context) {
//     ValueNotifier<int> count = useState(0);
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 context.read(toDoListProvider).addTodo(Todo(
//                     completed: false,
//                     description: 'Description for todo #$count',
//                     name: 'ToDo #$count',
//                     dueDate: DateTime.now()));
//               },
//               child: Text('Add a todo to the list'),
//             ),
//             Consumer(
//               builder: (context, watch, child) {
//                 final plans = watch(plansProvider);
//                 return plans.plansResponse();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// abstract class Person {
//   void think() {
//     print('What am I going to do today');
//   }
// }

// mixin Coder {
//   String think() {
//     return 'I am going to code today';
//   }
// }
