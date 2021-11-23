import 'user/presenter/user_controller.dart';

void main() async {
  // late var op;
  // do {
  //   print('Sistema de Cadastro de Usuário Unico');
  //   print('1 - Para cadastro');
  //   print('2 - Para mostrar informações');
  //   print('0 - para sair');
  //   op = int.parse(stdin.readLineSync(encoding: utf8) ?? '0');
  //   menu(op);
  // } while (op != 0);

  final controller = UserController.init();
  await controller.save('Gustavo', 23);
  await controller.get();
  await controller.save('Beatriz', 21);
  await controller.get();
  await controller.save('João', -2);
}
