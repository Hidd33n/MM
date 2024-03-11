import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final User? user;

  const CustomDialog({Key? key, required this.user}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String _selectedPaymentMethod = 'Efectivo';
  double _saleAmount = 0;

  Map<String, double> _taxPercentages = {
    'Efectivo': 10,
    'Transferencia': 15,
    '3 Cuotas': 20,
    'Otro': 25,
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Ingresar Venta',
        style: TextStyle(color: Colors.black),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Monto de Venta',
                labelStyle: TextStyle(color: Colors.black),
              ),
              onChanged: (value) {
                setState(() {
                  _saleAmount = double.parse(value);
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Forma de Pago:',
              style: TextStyle(color: Colors.black),
            ),
            DropdownButton<String>(
              value: _selectedPaymentMethod,
              onChanged: (newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue!;
                });
              },
              items: _taxPercentages.keys.map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(
                    method,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () async {
            double taxes =
                _saleAmount * (_taxPercentages[_selectedPaymentMethod]! / 100);

            // Acceder a la colección "users" y el documento del usuario actual
            DocumentReference userDoc = FirebaseFirestore.instance
                .collection('users')
                .doc(widget.user!.uid);

            // Agregar un nuevo documento a la subcolección "only" con los cálculos
            await userDoc.collection('only').add({
              'amount': _saleAmount,
              'taxes': taxes,
              'paymentMethod': _selectedPaymentMethod,
            });

            Navigator.of(context).pop(); // Cerrar el diálogo
          },
          child: Text('Aceptar', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
