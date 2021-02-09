class Session {
  static final Session _instance = Session._internal();
  factory Session() => _instance;

  Session._internal() {
    // init things inside this
  }

  static Session get shared => _instance;

  String id;
  String nombre;
  String apellido;
  String nombre_usuario;
  String telefono;
  String sexo;
  String email;
  String direccion;
  String foto;

  static setSession(id, nombre, apellido, nombre_usuario, telefono, sexo, email, direccion, foto_perfil){
    Session.shared.id = id;
    Session.shared.nombre = nombre;
    Session.shared.apellido = apellido;
    Session.shared.nombre_usuario = nombre_usuario;
    Session.shared.telefono = telefono;
    Session.shared.sexo = sexo;
    Session.shared.email = email;
    Session.shared.direccion = direccion;
    Session.shared.foto = foto_perfil;
  }

}