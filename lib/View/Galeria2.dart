import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:image_viewer/image_viewer.dart';

class Galeria2 extends StatefulWidget {
  @override
  _Galeria2State createState() => _Galeria2State();
}

class _Galeria2State extends State<Galeria2> {
  List<String> imagenes = [
    'ima/ruta22.jpg',
    'ima/ruta23.jpg',
    'ima/ruta10.jpg',
    'ima/ruta3.jpg',
    'ima/ruta2.jpg',
    'ima/ruta29.jpg',
    'ima/ruta5.jpg',
    'ima/ruta6.jpg',
    'ima/ruta16.jpg',
    'ima/ruta18.jpg',
    'ima/ruta19.jpg',
    'ima/ruta20.jpg',
    'ima/ruta14.jpg',
    'ima/ruta25.jpg',
    'ima/ruta9.jpg',
    'ima/ruta7.jpg',
    'ima/ruta17.jpg',
    'ima/ruta24.jpg',
  ];

  void _openPhotoGallery(BuildContext context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PhotoViewGallery.builder(
        itemCount: imagenes.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(imagenes[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(initialPage: index),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    int itemsPerRow = MediaQuery.of(context).size.width > 600 ? 4 : 3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd9d9d9),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Galería',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: imagenes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: itemsPerRow,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _openPhotoGallery(context, index);
              },
              child: Image.asset(imagenes[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}