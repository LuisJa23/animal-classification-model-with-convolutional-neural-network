import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/providers/image_data.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataScreen extends StatefulWidget {
  static const String name = 'DataScreen';

  const DataScreen({super.key});

  @override
  DataScreenState createState() => DataScreenState();
}

class DataScreenState extends State<DataScreen> {
  Map<String, dynamic> responseJson = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clasificador de Animales', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Consumer<ImageData>(
                    builder: (context, imageData, child) {
                      if (imageData.image != null) {
                        return AspectRatio(
                          aspectRatio: 1/1, 
                          child: Image.file(
                            imageData.image!,
                            fit: BoxFit.cover, 
                          ),
                        );
                      } else {
                        return const SizedBox(
                          height: 200,
                          child: Icon(Icons.image, size: 200,),
                        );
                      }
                    },
                  ),
                ),
                
                if(responseJson.isNotEmpty)
                  Builder(
                  builder: (context) {
                    if (responseJson.entries.isNotEmpty) {
                      var highestCategory = responseJson.entries.reduce((a, b) => a.value > b.value ? a : b);
                      if (highestCategory.value > 0.50) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          child: Text('El modelo clasificó la imagen como ${highestCategory.key}', style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                          );
                      } else {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          child: const Text('El modelo no pudo clasificar correctamente la imagen', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                          );
                       
                      }
                    } else {
                      return const Text('No hay datos disponibles');
                    }
                  },
                ),
                CategoryTable(json: responseJson),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt, size: 50, color: Colors.black,),
                onPressed: () {
                  Provider.of<ImageData>(context, listen: false).getImageFromCamera();
                  setState(() {
                    responseJson = {};
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.photo_library_outlined, size: 50),
                onPressed: () {
                  Provider.of<ImageData>(context, listen: false).getImageFromGallery();
                  setState(() {
                    responseJson = {};
                  });
                },
              ),
              IconButton(
                onPressed: () async {
                  var imageData = Provider.of<ImageData>(context, listen: false);
                  if (imageData.image != null) {
                    var request = http.MultipartRequest('POST', Uri.parse('http://3.21.233.31:8000/predict/'));
                    request.files.add(await http.MultipartFile.fromPath('file', imageData.image!.path));
                    var res = await request.send();
                    var responseData = await res.stream.bytesToString();
                    var responseJson = jsonDecode(responseData);
                    setState(() {
                      this.responseJson = responseJson;
                    });
                  }
                },
                icon: const Icon(Icons.send_outlined, size: 50),
              )
            ],
          ),
        ],
      )
    );
  }
}

class CategoryTable extends StatelessWidget {
  final Map<String, dynamic> json;

  CategoryTable({super.key, required this.json});

  final categories = [
    'perro',
    'caballo',
    'elefante',
    'polilla',
    'gallina',
    'gato',
    'vaca',
    'oveja',
    'araña',
    'ardilla',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Categoría')),
          DataColumn(label: Text('Valor')),
        ],
        rows: categories.map((category) {
          var value = json[category];
          return DataRow(cells: [
            DataCell(Text(category)),
            DataCell(Text(value != null ? value.toStringAsFixed(5) : '')),
          ]);
        }).toList(),
      ),
    );
  }
}