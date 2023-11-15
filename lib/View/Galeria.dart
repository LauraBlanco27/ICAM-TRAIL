import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:image_viewer/image_viewer.dart';

class Galeria1 extends StatefulWidget {
  @override
  _Galeria1State createState() => _Galeria1State();
}

class _Galeria1State extends State<Galeria1> {
  List<String> imagenes = [
    'ima/12.jpg',
    'ima/1.jpg',
    'ima/15.jpg',
    'ima/2.jpg',
    'ima/3.jpg',
    'ima/15.jpg',
    'ima/4.jpg',
    'ima/5.jpg',
    'ima/14.jpg',
    'ima/6.jpg',
    'ima/7.jpg',
    'ima/8.jpg',
    'ima/10.jpg',
    'ima/11.jpg',
    'ima/13.jpg',
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
          'Galería Sendero 1',
          style: TextStyle(color: Colors.black),
        ),
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