import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'dart:io';
import 'package:pem/pem.dart';
import 'package:protobuf/protobuf.dart';


class GrpcClientSingleton{
  HttpClientCredentials coso;
  ClientChannel channel;
  static final GrpcClientSingleton _singleton = new GrpcClientSingleton._internal();
  factory GrpcClientSingleton() => _singleton;
 /*  List<int> clientCert;
  List<int> clientKey;
  List<int> serverCert; */
  List<int> rootCert; 
    
  GrpcClientSingleton._internal(){
    this.appliesCerts();
    /* channelCredentials.securityContext.useCertificateChainBytes(clientCert);
    channelCredentials.securityContext.usePrivateKeyBytes(clientKey); 
    channelCredentials.securityContext.setTrustedCertificatesBytes(rootCert);*/
    //var channelCredentials = new ChannelCredentials.secure();
    
    var channelCredentials = new ChannelCredentials.secure(certificates: rootCert,
      onBadCertificate: (X509Certificate certificate, String host) {
        // Trust the certificate
        // This is never called in release mode
        print("trusting cert");
        return true;},
    );
    final channelOptions = new ChannelOptions(credentials: channelCredentials);
    this.channel = new ClientChannel('159.89.50.94', port:50051, options: channelOptions); 
    print("retornó canal");
  }

    appliesCerts() async {
    print("aplicó certificados");
    /* final ByteData cert = await rootBundle.load('assets/raw/client.crt');
    this.clientCert = cert.buffer.asUint8List();
    final ByteData key = await rootBundle.load('assets/raw/client.key');
    this.clientKey = key.buffer.asUint8List(); 
    final ByteData serverCert = await rootBundle.load('assets/raw/serve.pem');
    this.serverCert = serverCert.buffer.asUint8List();
     */
    final ByteData root = await rootBundle.load('assets/raw/root.pem');
    this.rootCert = root.buffer.asUint8List();
  }

}