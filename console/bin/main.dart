import 'core/services/local_storage_json.dart';

void main() async {
  // final file = File('./db.json');
  // var sink = file.openRead();
  // sink.map((event) async =>  print(event));
  final LocalStorageJson storageJson = LocalStorageJson();
  final user = await storageJson.get();
  print('${user.name} ${user.age}');
  if (await storageJson.save('ana', 23)) {
    final user = await storageJson.get();
    print('${user.name} ${user.age}');
  }
}
