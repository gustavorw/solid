// import 'dart:convert';
// import 'dart:io';

// import 'user_controller.dart';

// void menu(int op) async {
//   final controller = UserController.init();
//   switch (op) {
//     case 1:
//       final name = stdin.readLineSync(encoding: utf8) ?? '';
//       final age = int.parse(stdin.readLineSync(encoding: utf8) ?? '0');
//       await controller.save(name, age);
//       break;
//     case 2:
//       print('buscando dados ......');
//       await controller.get();
//       break;
//     case 0:
//       print('Até mais breve');
//       break;
//     default:
//       print('Opção Invalida');
//   }
// }
