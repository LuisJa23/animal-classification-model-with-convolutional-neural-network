import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpScreen extends StatelessWidget {
  static const String name = 'HelpScreen';

  const HelpScreen({super.key, Key? newKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: ListView(
        children: const [
          
          ListTile(
            title: Text('¿Qué es una red neuronal convulcional (CNN)?', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
           child: Text('Una red neuronal convolucional (CNN) es un tipo de red neuronal especializada en el procesamiento de datos con estructura de grilla, como imágenes. Utiliza capas de convolución para extraer características básicas, capas de pooling para reducir la dimensionalidad y capas completamente conectadas para realizar la clasificación final. Las CNNs son eficaces en tareas de visión por computadora debido a su capacidad para aprender automáticamente características complejas y requieren grandes conjuntos de datos y alto poder computacional para entrenarse.', textAlign: TextAlign.justify),
          ),
          ListTile(
            title: Text('Datos de entrenamiento', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
           child: Text('El modelo se entrenó con un conjunto de datos de imágenes que incluye 10 categorías de animales: perro, caballo, elefante, mariposa, gallina, gato, vaca, oveja, ardilla y araña. Cada categoría contaba con 1446 imágenes.', textAlign: TextAlign.justify),
          ),
          ListTile(
            title: Text('Construccion del modelo', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
           child: Text('La construcción del modelo de clasificación de imágenes se realizó utilizando Keras y TensorFlow:', textAlign: TextAlign.justify),
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
           child: Text('1. Lectura y Preprocesamiento de Imágenes:',  style: TextStyle(fontStyle:  FontStyle.italic)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Se leen las imágenes de un directorio utilizando os.walk.', textAlign: TextAlign.justify),
                Text('• Las imágenes se redimensionan a 100x100 píxeles usando OpenCV (cv2.resize).', textAlign: TextAlign.justify),
                Text('• Se almacenan las imágenes en una lista images y las etiquetas en una lista labels.', textAlign: TextAlign.justify),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
           child: Text('2. Etiquetado:',  style: TextStyle(fontStyle:  FontStyle.italic)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Se generan etiquetas numéricas para cada categoría de imágenes.', textAlign: TextAlign.justify),
                Text('• Las etiquetas y las imágenes se convierten a arrays de NumPy (np.array).', textAlign: TextAlign.justify),
              ],
            ),
          ),
           Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
           child: Text('3. División del Conjunto de Datos:',  style: TextStyle(fontStyle:  FontStyle.italic)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Los datos se dividen en conjuntos de entrenamiento y prueba utilizando train_test_split de scikit-learn.', textAlign: TextAlign.justify),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '4. Capa de Convolución (Conv2D):', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Filtros: 32'),
                Text('• Tamaño del Kernel: 3x3'),
                Text('• Función de Activación: linear'),
                Text('• Padding: \'same\''),
                Text('• Input Shape: (100, 100, 3) (imágenes de 100x100 píxeles con 3 canales de color)'),
                Text('• Función de Activación Posterior: LeakyReLU'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '5. Capa de MaxPooling (MaxPooling2D):', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Tamaño de la Ventana: 2x2'),
                Text('• Padding: \'same\''),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '6. Capa de Dropout:', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Tasa: 0.5 (para prevenir el sobreajuste)'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '7. Capa de Flatten:', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Convierte la matriz 2D resultante en un vector 1D.'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '8. Capa Densa (Dense):', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Unidades: 32'),
                Text('• Función de Activación: linear'),
                Text('• Función de Activación Posterior: LeakyReLU'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '9. Capa de Dropout:', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Tasa: 0.5'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '10. Capa de Salida (Dense):', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Unidades: nClasses (número de categorías de animales)'),
                Text('• Función de Activación: softmax (para clasificación multi-clase)'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '11. Compilación del Modelo:', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Función de Pérdida: \'categorical_crossentropy\' (adecuada para problemas de clasificación multi-clase)'),
                Text('• Optimizador: \'adam\' (eficiente y ampliamente utilizado en el entrenamiento de redes neuronales)'),
                Text('• Métricas: \'accuracy\' (para evaluar la precisión del modelo)'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              '12. Entrenamiento del Modelo:', 
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Número de Épocas: 20 (número de iteraciones completas sobre el conjunto de datos)'),
                Text('• Tamaño del Lote: 64 (número de muestras procesadas antes de actualizar el modelo)'),
                Text('• Datos de Validación: Se utiliza un 20% de los datos de entrenamiento para validar el rendimiento del modelo durante el entrenamiento.'),
              ],
            ),
          ),
          ListTile(
            title: Text('Arquitectura de la red neuronal convulcional', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ModelLayersTable(),
          ListTile(
            title: Text('Resultados por epoca', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          EpochsTable(), 
          ListTile(
            title: Text('Reporte de Clasificación', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataTableWidget(),

          ListTile(
            title: Text('Gráfica de perdida en validación', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assets/images/Tabla1.png'))
          ),
          ListTile(
            title: Text('Gráfica de perdida en entrenamiento', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assets/images/Tabla2.png'))
          ),
          
          


        ],
      ),
    );
  }
}



class ModelLayersTable extends StatelessWidget {
  const ModelLayersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Layer (type)')),
          DataColumn(label: Text('Output Shape')),
          DataColumn(label: Text('Param #')),
        ],
        rows: const <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('conv2d (Conv2D)')),
            DataCell(Text('(None, 100, 100, 32)')),
            DataCell(Text('896')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('leaky_re_lu (LeakyReLU)')),
            DataCell(Text('(None, 100, 100, 32)')),
            DataCell(Text('0')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('max_pooling2d (MaxPooling2D)')),
            DataCell(Text('(None, 50, 50, 32)')),
            DataCell(Text('0')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('dropout (Dropout)')),
            DataCell(Text('(None, 50, 50, 32)')),
            DataCell(Text('0')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('flatten (Flatten)')),
            DataCell(Text('(None, 80000)')),
            DataCell(Text('0')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('dense (Dense)')),
            DataCell(Text('(None, 32)')),
            DataCell(Text('2,560,032')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('leaky_re_lu_1 (LeakyReLU)')),
            DataCell(Text('(None, 32)')),
            DataCell(Text('0')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('dropout_1 (Dropout)')),
            DataCell(Text('(None, 32)')),
            DataCell(Text('0')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('dense_1 (Dense)')),
            DataCell(Text('(None, 10)')),
            DataCell(Text('330')),
          ]),
        ],
      ),
    );
  }
}

class EpochsTable extends StatelessWidget {
  const EpochsTable({super.key});

 
  

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Época')),
          DataColumn(label: Text('Tiempo por Época')),
          DataColumn(label: Text('Precisión de Entrenamiento')),
          DataColumn(label: Text('Pérdida de Entrenamiento')),
          DataColumn(label: Text('Precisión de Validación')),
          DataColumn(label: Text('Pérdida de Validación')),
        ],
        rows: epochsData.map((epoch) {
          return DataRow(cells: [
            DataCell(Text('${epoch['epoch']}')),
            DataCell(Text(epoch['time'])),
            DataCell(Text(epoch['train_acc'].toStringAsFixed(4))),
            DataCell(Text(epoch['train_loss'].toStringAsFixed(4))),
            DataCell(Text(epoch['val_acc'].toStringAsFixed(4))),
            DataCell(Text(epoch['val_loss'].toStringAsFixed(4))),
          ]);
        }).toList(),
      ),
    );
  }
}
class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Clase'),
          ),
          DataColumn(
            label: Text('Precision'),
          ),
          DataColumn(
            label: Text('Recall'),
          ),
          DataColumn(
            label: Text('F1-Score'),
          ),
          DataColumn(
            label: Text('Support'),
          ),
        ],
        rows: dataAcuraccy.map((item) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(item['class'])),
              DataCell(Text(item['precision']?.toString() ?? '-')),
              DataCell(Text(item['recall']?.toString() ?? '-')),
              DataCell(Text(item['f1-score']?.toString() ?? '-')),
              DataCell(Text(item['support'].toString())),
            ],
          );
        }).toList(),
      ),
    );
  }
}


  final List<Map<String, dynamic>> epochsData = [

  
      {'epoch': 1, 'time': '20s', 'train_acc': 0.1584, 'train_loss': 2.7231, 'val_acc': 0.3073, 'val_loss': 1.9804},
      {'epoch': 2, 'time': '18s', 'train_acc': 0.3148, 'train_loss': 1.9441, 'val_acc': 0.3846, 'val_loss': 1.8046},
      {'epoch': 3, 'time': '17s', 'train_acc': 0.3992, 'train_loss': 1.7201, 'val_acc': 0.4075, 'val_loss': 1.7145},
      {'epoch': 4, 'time': '17s', 'train_acc': 0.4673, 'train_loss': 1.5334, 'val_acc': 0.4443, 'val_loss': 1.6316},
      {'epoch': 5, 'time': '17s', 'train_acc': 0.5316, 'train_loss': 1.3531, 'val_acc': 0.4736, 'val_loss': 1.5645},
      {'epoch': 6, 'time': '17s', 'train_acc': 0.5819, 'train_loss': 1.2016, 'val_acc': 0.4710, 'val_loss': 1.5541},
      {'epoch': 7, 'time': '17s', 'train_acc': 0.6350, 'train_loss': 1.0615, 'val_acc': 0.4857, 'val_loss': 1.5526},
      {'epoch': 8, 'time': '17s', 'train_acc': 0.6736, 'train_loss': 0.9477, 'val_acc': 0.4823, 'val_loss': 1.5500},
      {'epoch': 9, 'time': '18s', 'train_acc': 0.7034, 'train_loss': 0.8679, 'val_acc': 0.4706, 'val_loss': 1.5740},
      {'epoch': 10, 'time': '17s', 'train_acc': 0.7310, 'train_loss': 0.7891, 'val_acc': 0.4719, 'val_loss': 1.6029},
      {'epoch': 11, 'time': '18s', 'train_acc': 0.7398, 'train_loss': 0.7396, 'val_acc': 0.4827, 'val_loss': 1.6091},
      {'epoch': 12, 'time': '18s', 'train_acc': 0.7744, 'train_loss': 0.6681, 'val_acc': 0.4624, 'val_loss': 1.7066},
      {'epoch': 13, 'time': '18s', 'train_acc': 0.7888, 'train_loss': 0.5949, 'val_acc': 0.4758, 'val_loss': 1.6772},
      {'epoch': 14, 'time': '18s', 'train_acc': 0.8022, 'train_loss': 0.5834, 'val_acc': 0.4732, 'val_loss': 1.8226},
      {'epoch': 15, 'time': '18s', 'train_acc': 0.8126, 'train_loss': 0.5519, 'val_acc': 0.4723, 'val_loss': 1.8065},
      {'epoch': 16, 'time': '18s', 'train_acc': 0.8267, 'train_loss': 0.5101, 'val_acc': 0.4728, 'val_loss': 1.8292},
      {'epoch': 17, 'time': '18s', 'train_acc': 0.8315, 'train_loss': 0.4801, 'val_acc': 0.4758, 'val_loss': 1.8387},
      {'epoch': 18, 'time': '18s', 'train_acc': 0.8375, 'train_loss': 0.4697, 'val_acc': 0.4693, 'val_loss': 1.8438},
      {'epoch': 19, 'time': '18s', 'train_acc': 0.8496, 'train_loss': 0.4400, 'val_acc': 0.4754, 'val_loss': 1.9256},
      {'epoch': 20, 'time': '18s', 'train_acc': 0.8554, 'train_loss': 0.4177, 'val_acc': 0.4780, 'val_loss': 1.9559},
    ];

List<Map<String, dynamic>> dataAcuraccy = [
  {'class': 'Clase 0', 'precision': 0.17, 'recall': 0.48, 'f1-score': 0.25, 'support': 289},
  {'class': 'Clase 1', 'precision': 0.51, 'recall': 0.40, 'f1-score': 0.45, 'support': 287},
  {'class': 'Clase 2', 'precision': 0.52, 'recall': 0.42, 'f1-score': 0.47, 'support': 316},
  {'class': 'Clase 3', 'precision': 0.77, 'recall': 0.53, 'f1-score': 0.63, 'support': 307},
  {'class': 'Clase 4', 'precision': 0.55, 'recall': 0.44, 'f1-score': 0.49, 'support': 271},
  {'class': 'Clase 5', 'precision': 0.48, 'recall': 0.40, 'f1-score': 0.44, 'support': 313},
  {'class': 'Clase 6', 'precision': 0.43, 'recall': 0.40, 'f1-score': 0.42, 'support': 269},
  {'class': 'Clase 7', 'precision': 0.48, 'recall': 0.27, 'f1-score': 0.35, 'support': 275},
  {'class': 'Clase 8', 'precision': 0.54, 'recall': 0.49, 'f1-score': 0.51, 'support': 282},
  {'class': 'Clase 9', 'precision': 0.45, 'recall': 0.40, 'f1-score': 0.42, 'support': 283},
  {'class': 'accuracy', 'precision': null, 'recall': null, 'f1-score': null, 'support': 2892},
  {'class': 'macro avg', 'precision': 0.49, 'recall': 0.42, 'f1-score': 0.44, 'support': 2892},
  {'class': 'weighted avg', 'precision': 0.49, 'recall': 0.42, 'f1-score': 0.44, 'support': 2892},
];