import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:clasificador_de_animales/presentation/providers/image_data.dart';
import 'package:clasificador_de_animales/presentation/screens/data_screen.dart';
import 'package:clasificador_de_animales/presentation/screens/help_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clasificador de Animales', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue, 
        leading: const Icon(Icons.home, color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info, 
              color: Colors.white, 
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            const Padding(
              padding: EdgeInsets.all(0.0),
              child: Expanded(child: ImageCarousel()),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Esta app utiliza una red neuronal convolucional para identificar animales con solo una foto. Simplemente toma una foto o selecciona una de tu galería, y nuestro modelo te proporcionará una aproximación según las categorías existentes, mostrando la probabilidad de cada posible especie.',
                style: TextStyle(
                  fontSize: 15.0,
                  
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DataScreen()),
              );
                
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
              ),
              child: const Text(
                'Iniciar',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var imgList = Provider.of<ImageData>(context).imgList;

    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 2.0,
        initialPage: 0,
      ),
      items: imgList
          .map((item) => SizedBox(
                width: double.infinity,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 5,
                          blurRadius: 30, 
                          offset: const Offset(0, 10), 
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300.0,
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}