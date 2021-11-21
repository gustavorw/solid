import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_modular/shelf_modular.dart';
import 'places/places_module.dart';

void main() async {
  final server =
      await io.serve(Modular(module: PlacesModule()), '0.0.0.0', 8880);
  print(server.port);
  print(server.address);
  print(server.connectionsInfo());
  //server.close();
}
