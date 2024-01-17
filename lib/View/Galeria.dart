import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Galeria1 extends StatefulWidget {
  const Galeria1({super.key});

  @override
  _Galeria1State createState() => _Galeria1State();
}

class _Galeria1State extends State<Galeria1> {
  List<String> imagenes = [
    'ima/ruta22.jpg',
    'ima/ruta23.jpg',
    'ima/ruta10.jpg',
    'ima/ruta1.jpg',
    'ima/ruta3.jpg',
    'ima/ruta2.jpg',
    'ima/ruta4.jpg',
    'ima/ruta29.jpg',
    'ima/ruta5.jpg',
    'ima/ruta6.jpg',
    'ima/ruta7.jpg',
    'ima/ruta12.jpg',
    'ima/ruta13.jpg',
    'ima/ruta15.jpg',
    'ima/ruta16.jpg',
    'ima/ruta18.jpg',
    'ima/ruta19.jpg',
    'ima/ruta20.jpg',
    'ima/ruta14.jpg',
    'ima/ruta25.jpg',
    'ima/ruta11.jpg',
    'ima/ruta9.jpg',
    'ima/ruta7.jpg',
    'ima/ruta26.jpg',
    'ima/ruta17.jpg',
    'ima/ruta24.jpg',
    'ima/ruta21.jpg',
    'ima/ruta8.jpg',
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
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(
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
        backgroundColor: const Color(0xffd9d9d9),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Galería',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(10.0),
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