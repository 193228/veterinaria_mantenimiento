class Citas {
  late int idCita;
  late String fecha;
  late String hora;
  late String tipoServicio;
  late int idMascota;

  Citas(idCita, fecha, hora, tipoServicio, idMascota) {
    this.idCita = idCita;
    this.fecha = fecha;
    this.hora = hora;
    this.tipoServicio = tipoServicio;
    this.idMascota = idMascota;
  }
}