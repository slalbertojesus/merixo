import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:merixo/grpc/key/key.dart';
import 'dart:io';
import 'package:pem/pem.dart';


class GrpcClientSingleton {
  ClientChannel channel;
  static final GrpcClientSingleton _singleton = new GrpcClientSingleton._internal();
  factory GrpcClientSingleton() => _singleton;


  GrpcClientSingleton._internal() {
    Key cert = new Key();
    List<int> trustedRoot = cert.certData;
    final channelCredentials = new ChannelCredentials.secure(certificates: trustedRoot);
    final channelOptions = new ChannelOptions(credentials: channelCredentials);
    this.channel = new ClientChannel('159.89.50.94', options: channelOptions); 
  }

}
