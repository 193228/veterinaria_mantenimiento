import 'package:flutter/material.dart';
import '../models/users.dart';
import '../pages/listadoUsuarios.dart' as lista;

/*ListTileTheme vistaTileUsuarios(context,_listadoUsuario,vistaDestino){
  return ListTileTheme(
    contentPadding: EdgeInsets.all(15),
    style: ListTileStyle.list,
    dense: true,
    child: listado_Usuarios(context,_listadoUsuario,vistaDestino),
  );
}

FutureBuilder<List<users>> listado_Usuarios(context,_listadoUsuario,vistaDestino){
  return FutureBuilder<List<users>>(
    future: _listadoUsuario,
      builder: (context, snapshot) {
        
        if (snapshot.hasData){
          final List<users> listaUsuarios = snapshot.data ?? <users>[]; //user es la lista de usuarios
          return vistaListaUsuarios(context,listaUsuarios,vistaDestino);
        }
        
        else if (snapshot.hasError){ 
          return const Text("Error");
        }

        return const Center( 
          child: CircularProgressIndicator()
        );
      }
    );
  }*/

/*ListView vistaListaUsuarios(context,_listadoUsuario,vistaDestino) {
  return ListView.builder(
    itemCount: _listadoUsuario.length,
    itemBuilder: (_, index) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: ListTile(
          title: Text(_listadoUsuario[index].user),
          subtitle: Text(_listadoUsuario[index].tipoUsuario),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    toast("Modulo Editar En Progreso");
                    //Navigator.pushNamed(context, vistaDestino); //metodo get editar
                  },
                  icon: Icon(Icons.edit)
              ),

              IconButton(
                  onPressed: () {
                    deleteUser("http://10.0.2.2:18081/user/delete/",_listadoUsuario[index].idUsuario.toString());
                    
                  },
                  icon: const Icon(Icons.delete, color: ColorsSelect.paginatorNext)
              ),

            ],
          ),
        ),
      ),
  );
}*/

Container textoInformativo(texto,altitud){
  return Container(
      padding: EdgeInsets.only(top: altitud),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 15
        ),
      )
    );
}

Container campoInformacion(altitud,texto,hint,helper,inputControlador){
  return Container(
      padding: EdgeInsets.only(top: altitud),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texto,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: inputControlador,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                helperText: helper,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: hint),
          ),
        ],
      ));
}

Container campoInformacionEditar(altitud,texto,hint,helper,inputControlador,usuario){
  return Container(
      padding: EdgeInsets.only(top: altitud),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texto,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: inputControlador,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                helperText: helper,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: usuario,
            ),
          ),
        ],
      ));
}