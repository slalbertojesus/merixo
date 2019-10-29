///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class ChatAdminClient extends $grpc.Client {
  static final _$iniciaChat = $grpc.ClientMethod<$0.Usuarios, $0.Mensaje>(
      '/ChatAdmin/IniciaChat',
      ($0.Usuarios value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Mensaje.fromBuffer(value));
  static final _$subscribirse =
      $grpc.ClientMethod<$0.CrearUsuarioRequest, $0.Respuesta>(
          '/ChatAdmin/Subscribirse',
          ($0.CrearUsuarioRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Respuesta.fromBuffer(value));
  static final _$eliminaMensaje = $grpc.ClientMethod<$0.Mensaje, $0.Respuesta>(
      '/ChatAdmin/EliminaMensaje',
      ($0.Mensaje value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Respuesta.fromBuffer(value));

  ChatAdminClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.Mensaje> iniciaChat($0.Usuarios request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$iniciaChat, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.Respuesta> subscribirse(
      $0.CrearUsuarioRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$subscribirse, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Respuesta> eliminaMensaje($0.Mensaje request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$eliminaMensaje, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ChatAdminServiceBase extends $grpc.Service {
  $core.String get $name => 'ChatAdmin';

  ChatAdminServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Usuarios, $0.Mensaje>(
        'IniciaChat',
        iniciaChat_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Usuarios.fromBuffer(value),
        ($0.Mensaje value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CrearUsuarioRequest, $0.Respuesta>(
        'Subscribirse',
        subscribirse_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CrearUsuarioRequest.fromBuffer(value),
        ($0.Respuesta value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Mensaje, $0.Respuesta>(
        'EliminaMensaje',
        eliminaMensaje_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Mensaje.fromBuffer(value),
        ($0.Respuesta value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Mensaje> iniciaChat_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Usuarios> request) async* {
    yield* iniciaChat(call, await request);
  }

  $async.Future<$0.Respuesta> subscribirse_Pre($grpc.ServiceCall call,
      $async.Future<$0.CrearUsuarioRequest> request) async {
    return subscribirse(call, await request);
  }

  $async.Future<$0.Respuesta> eliminaMensaje_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Mensaje> request) async {
    return eliminaMensaje(call, await request);
  }

  $async.Stream<$0.Mensaje> iniciaChat(
      $grpc.ServiceCall call, $0.Usuarios request);
  $async.Future<$0.Respuesta> subscribirse(
      $grpc.ServiceCall call, $0.CrearUsuarioRequest request);
  $async.Future<$0.Respuesta> eliminaMensaje(
      $grpc.ServiceCall call, $0.Mensaje request);
}
