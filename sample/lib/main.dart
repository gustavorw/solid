import 'user/presenter/user_controller.dart';

void main() async {
  final controller = UserController.init();
  await controller.save('Gustavo', 23);
  await controller.get();
  await controller.save('Beatriz', 21);
  await controller.get();
  await controller.save('João', -2);
}
