import 'package:grpc/grpc.dart';
import 'package:merixo/grpc/generated_code/chat.pb.dart' as structure;
import 'package:merixo/grpc/generated_code/chat.pbgrpc.dart' as grpc;
import 'package:merixo/grpc/singleton/commons.dart';
import 'package:merixo/models/client.dart' as client;
import 'package:merixo/grpc/generated_code/chat.pbenum.dart';
import 'package:merixo/grpc/generated_code/chat.pbjson.dart';

class ChatAdmin {
  static Future<structure.Respuesta> subscribirse(client.Client datos) async {
    print('Singleton');
    var client = grpc.ChatAdminClient(GrpcClientSingleton().channel);
    print("utilizó canal desde singleton");
    final usuario = structure.Usuario()
      ..id = datos.id
      ..username = datos.username
      ..estado = datos.estado;
    final user = structure.CrearUsuarioRequest()
      ..usuario = usuario;
    final response = await client.subscribirse(user);
    print('Entró a suscribirse');
    print('Respuesta de subscripción: ${response.respuesta}');
    return response;
  }
}
