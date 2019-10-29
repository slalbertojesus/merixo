///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Usuarios extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Usuarios', createEmptyInstance: create)
    ..pc<Usuario>(1, 'usuario', $pb.PbFieldType.PM, subBuilder: Usuario.create)
    ..hasRequiredFields = false
  ;

  Usuarios._() : super();
  factory Usuarios() => create();
  factory Usuarios.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Usuarios.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Usuarios clone() => Usuarios()..mergeFromMessage(this);
  Usuarios copyWith(void Function(Usuarios) updates) => super.copyWith((message) => updates(message as Usuarios));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Usuarios create() => Usuarios._();
  Usuarios createEmptyInstance() => create();
  static $pb.PbList<Usuarios> createRepeated() => $pb.PbList<Usuarios>();
  @$core.pragma('dart2js:noInline')
  static Usuarios getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Usuarios>(create);
  static Usuarios _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Usuario> get usuario => $_getList(0);
}

class Usuario extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Usuario', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'username')
    ..aOB(3, 'estado')
    ..hasRequiredFields = false
  ;

  Usuario._() : super();
  factory Usuario() => create();
  factory Usuario.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Usuario.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Usuario clone() => Usuario()..mergeFromMessage(this);
  Usuario copyWith(void Function(Usuario) updates) => super.copyWith((message) => updates(message as Usuario));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Usuario create() => Usuario._();
  Usuario createEmptyInstance() => create();
  static $pb.PbList<Usuario> createRepeated() => $pb.PbList<Usuario>();
  @$core.pragma('dart2js:noInline')
  static Usuario getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Usuario>(create);
  static Usuario _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get estado => $_getBF(2);
  @$pb.TagNumber(3)
  set estado($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEstado() => $_has(2);
  @$pb.TagNumber(3)
  void clearEstado() => clearField(3);
}

class CrearUsuarioResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CrearUsuarioResult', createEmptyInstance: create)
    ..aOM<Usuario>(1, 'usuario', subBuilder: Usuario.create)
    ..hasRequiredFields = false
  ;

  CrearUsuarioResult._() : super();
  factory CrearUsuarioResult() => create();
  factory CrearUsuarioResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CrearUsuarioResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CrearUsuarioResult clone() => CrearUsuarioResult()..mergeFromMessage(this);
  CrearUsuarioResult copyWith(void Function(CrearUsuarioResult) updates) => super.copyWith((message) => updates(message as CrearUsuarioResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CrearUsuarioResult create() => CrearUsuarioResult._();
  CrearUsuarioResult createEmptyInstance() => create();
  static $pb.PbList<CrearUsuarioResult> createRepeated() => $pb.PbList<CrearUsuarioResult>();
  @$core.pragma('dart2js:noInline')
  static CrearUsuarioResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CrearUsuarioResult>(create);
  static CrearUsuarioResult _defaultInstance;

  @$pb.TagNumber(1)
  Usuario get usuario => $_getN(0);
  @$pb.TagNumber(1)
  set usuario(Usuario v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsuario() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsuario() => clearField(1);
  @$pb.TagNumber(1)
  Usuario ensureUsuario() => $_ensure(0);
}

class CrearUsuarioRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CrearUsuarioRequest', createEmptyInstance: create)
    ..aOM<Usuario>(1, 'usuario', subBuilder: Usuario.create)
    ..hasRequiredFields = false
  ;

  CrearUsuarioRequest._() : super();
  factory CrearUsuarioRequest() => create();
  factory CrearUsuarioRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CrearUsuarioRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CrearUsuarioRequest clone() => CrearUsuarioRequest()..mergeFromMessage(this);
  CrearUsuarioRequest copyWith(void Function(CrearUsuarioRequest) updates) => super.copyWith((message) => updates(message as CrearUsuarioRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CrearUsuarioRequest create() => CrearUsuarioRequest._();
  CrearUsuarioRequest createEmptyInstance() => create();
  static $pb.PbList<CrearUsuarioRequest> createRepeated() => $pb.PbList<CrearUsuarioRequest>();
  @$core.pragma('dart2js:noInline')
  static CrearUsuarioRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CrearUsuarioRequest>(create);
  static CrearUsuarioRequest _defaultInstance;

  @$pb.TagNumber(1)
  Usuario get usuario => $_getN(0);
  @$pb.TagNumber(1)
  set usuario(Usuario v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsuario() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsuario() => clearField(1);
  @$pb.TagNumber(1)
  Usuario ensureUsuario() => $_ensure(0);
}

class Respuesta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Respuesta', createEmptyInstance: create)
    ..aOS(1, 'respuesta')
    ..hasRequiredFields = false
  ;

  Respuesta._() : super();
  factory Respuesta() => create();
  factory Respuesta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Respuesta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Respuesta clone() => Respuesta()..mergeFromMessage(this);
  Respuesta copyWith(void Function(Respuesta) updates) => super.copyWith((message) => updates(message as Respuesta));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Respuesta create() => Respuesta._();
  Respuesta createEmptyInstance() => create();
  static $pb.PbList<Respuesta> createRepeated() => $pb.PbList<Respuesta>();
  @$core.pragma('dart2js:noInline')
  static Respuesta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Respuesta>(create);
  static Respuesta _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get respuesta => $_getSZ(0);
  @$pb.TagNumber(1)
  set respuesta($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRespuesta() => $_has(0);
  @$pb.TagNumber(1)
  void clearRespuesta() => clearField(1);
}

class Mensaje extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Mensaje', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'content')
    ..hasRequiredFields = false
  ;

  Mensaje._() : super();
  factory Mensaje() => create();
  factory Mensaje.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Mensaje.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Mensaje clone() => Mensaje()..mergeFromMessage(this);
  Mensaje copyWith(void Function(Mensaje) updates) => super.copyWith((message) => updates(message as Mensaje));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Mensaje create() => Mensaje._();
  Mensaje createEmptyInstance() => create();
  static $pb.PbList<Mensaje> createRepeated() => $pb.PbList<Mensaje>();
  @$core.pragma('dart2js:noInline')
  static Mensaje getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Mensaje>(create);
  static Mensaje _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

