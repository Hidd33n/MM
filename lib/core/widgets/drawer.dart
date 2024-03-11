import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  final User? user;

  MyDrawer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30, left: 10),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                user != null ? user!.displayName ?? 'Usuario' : 'Usuario',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(fontSize: 18),
              ),
              subtitle: Text(
                user != null ? user!.email ?? '' : '',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.face), // Icono de la opción 1
            title: Text(
              'Opción 1',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            onTap: () {
              // Manejar la acción de la opción 1
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.face_2), // Icono de la opción 2
            title: Text(
              'Opción 2',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            onTap: () {
              // Manejar la acción de la opción 2
              Navigator.pop(context);
            },
          ),
          // Agregar más opciones según sea necesario
          Expanded(
              child:
                  Container()), // Espaciador para empujar la opción de desconectar al fondo
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app), // Icono de desconectar
            title: Text(
              'logout',
              style: Theme.of(context).textTheme.displayLarge,
            ).tr(),
            onTap: () {
              // Manejar la acción de desconectar
              // Por ejemplo, cerrar sesión
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
