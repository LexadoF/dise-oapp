import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      
     // colores de fondo de pantalla en difuminado, color numero 1 rojo, numero 2 naranja

      colors: [
        Colors.red[900], //color izquierda
        Colors.deepOrange, //color derecha
      ],
    );

    //barra superior
    return Scaffold(
      appBar: NewGradientAppBar(  //app bar con gradiente (difuminación)
        title: Icon(
          Icons.home,
          size: 30,
        ),
        centerTitle: true,
        elevation: 0.0, // Desactivar linea de elevacion barra superior
        gradient: gradient,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [IconButton(icon: Icon(Icons.message), onPressed: () {})],
      ),
      body: Stack(
        children: [
          _fondo(size, gradient),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // control de forma curveada del fondo
            child: Column(
              children: [  //llamada a los widgets usuario, opciones y billetera como hijos del container
                _usuario(),
                _billetera(),
                _opc(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _fondo(Size size, LinearGradient gradient) {
    return Container(
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(70),
        ),
        gradient: gradient,
      ),
    );
  }

  Widget _usuario() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //avatar usuario
        CircleAvatar(
          child: Icon(Icons.person, color: Colors.white, size: 40),
          backgroundColor: Colors.grey,
          radius: 30,
        ),
        Container(
          transform: Matrix4.translationValues(-50, 0, 0), //ubica texto nombre y numero a la izquierda junto a la img
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //alinea los widgets de manera horizontal
            children: [
              Text('Daniel Mejía', //texto titulo nombre
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Text('+57 302 154 1458', style: TextStyle(
                color: Colors.white, 
                fontSize: 16)) //texto subtiutlo numero telefono
            ],
          ),
        ),
        Text('Medellín', style: TextStyle(
          color: Colors.white, 
          fontSize: 14))
      ],
    );
  }


  //widget Billetera
  Widget _billetera() {
    final iconStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );

    return Container(
      width: double.infinity, //tamaño max posible para el panel de mi billetera
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 30,
              offset: Offset(-1, 7), // Posicion de las sombras
            ),
          ]),
          
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mi Billetera',
                    style: TextStyle(
                      color: Colors.grey[600], //color texto billetera
                      fontSize: 21, //tamaño texto billetera
                    )),
                Text('\$55.000',
                    style: TextStyle(
                      color: Colors.green[700], //color precio
                      fontSize: 23, //tamaño precio
                      fontWeight: FontWeight.bold, //negrilla fuente precio
                    )),
              ],
            ),
          ),

          //division 

          Divider(color: Colors.grey[600], height: 10, thickness: 0.6),  // color de la division, tamaño y grosor
          
          //division

          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // iconos billetera
              children: [
                Column(
                  children: [
                    _botonBilletera(Icons.access_alarm),
                    Text('Mandado', style: iconStyle),
                    Text('Express', style: iconStyle),
                  ],
                ),
                Column(
                  children: [
                    _botonBilletera(Icons.business_center_rounded),
                    Text('Recargar', style: iconStyle),
                    Text('Paquete', style: iconStyle),
                  ],
                ),
                Column(
                  children: [
                    _botonBilletera(Icons.map_outlined),
                    Text('Monitorear', style: iconStyle),
                    Text('Servicios', style: iconStyle),
                  ],
                ),
                Column(
                  children: [
                    _botonBilletera(Icons.replay_circle_filled),
                    Text('Historial', style: iconStyle),
                    Text('Servicios', style: iconStyle),
                  ],
                ),
              ],
            ),           
          ),  
               //texto opciones rapidas
          Container(
            margin: EdgeInsets.only(top: 17),
            child: Text(
              'Opciones Rápidas',
              style: TextStyle(
                  color: Colors.orange[300],
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      
    );
  }
  
  //formato iconos biletera
  Widget _botonBilletera(IconData icon) {
    final double size = 40;

    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      child: Icon(icon, size: size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.yellow[100],
      ),
    );
  }

  //widget opc
  Widget _opc() {
    final iconStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return Container(
      width: double.infinity, //tamaño max posible para el panel de opciones extras
      margin: EdgeInsets.only(top: 20),
      // padding: EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
          
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20), //espaciado determinado
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              // iconos billetera
              children: [
                Column(
                  children: [
                    _botonOpc(Icons.send),
                    Text('Gestionar', style: iconStyle),
                    Text('Mis Paquetes', style: iconStyle),
                  ],
                ),
                Column(
                  children: [
                    _botonOpc(Icons.pedal_bike),
                    Text('Mensajero', style: iconStyle),
                    Text('Por Horas', style: iconStyle),
                  ],
                ),
                Column(
                  children: [
                    _botonOpc(Icons.add_business_rounded),
                    Text('Productos', style: iconStyle),
                    Text('En Bodega', style: iconStyle),
                  ],
                ),
                // Column(
                //   children: [
                //     _botonOpc(Icons.replay_circle_filled),
                //     Text('Historial', style: iconStyle),
                //     Text('Servicios', style: iconStyle),
                //   ],
                // ),

              ],
            ),        
          ),
        ],
      ),
    );
  }
  

  //formato iconos opc

  Widget _botonOpc(IconData icon) {
    final double size = 35;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 12),
      child: Icon(icon, size: size),
      decoration: BoxDecoration(
        boxShadow: [
            BoxShadow(
              color: Colors.pink[100],
              spreadRadius: 6,
              blurRadius: 15,
              offset: Offset(0, 0), // Posicion de las sombras
            ),
          ],
        borderRadius: BorderRadius.circular(60),
        color: Color(0xffF1ECB9),
      ),
    );
  }


}
