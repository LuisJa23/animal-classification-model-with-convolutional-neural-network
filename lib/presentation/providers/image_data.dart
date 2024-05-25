import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageData with ChangeNotifier {
  File? _image;
  List<String> get images => imgList;
  

  File? get image => _image;

  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future getImageFromGallery() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }
  final List<String> imgList = [
    'https://images.ctfassets.net/denf86kkcx7r/4IPlg4Qazd4sFRuCUHIJ1T/f6c71da7eec727babcd554d843a528b8/gatocomuneuropeo-97?fm=webp&w=612',
    'https://www.terranea.es/assets/images/razas/pastor_aleman2.jpg',
    'https://www.expertoecuestre.com/wp-content/uploads/2021/04/Purasangres-en-el-prado.jpg.webp',
    'https://img.freepik.com/fotos-premium/grupo-bonitas-vacas-brasilenas-pasto-dia-nublado_522472-9099.jpg?size=626&ext=jpg&ga=GA1.1.1700460183.1709856000&semt=ais',
    'https://avinews.com/wp-content/uploads/2023/10/gallinas-ponedoras-biozyme.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/7/7c/Eastern_Grey_Squirrel_in_St_James%27s_Park%2C_London_-_Nov_2006_edit.jpg',
    'https://www.serfadu.com/wp-content/uploads/2020/10/mariposa-monarca-el-alma-de-los-muertos.jpg',
    'https://static.nationalgeographicla.com/files/styles/image_3200/public/nationalgeographic2204210.webp?w=760&h=506',
    'https://cdn.pixabay.com/photo/2021/05/17/20/04/texel-6261757_1280.jpg',
    'https://www.lanacion.com.ar/resizer/v2/cuanto-mide-y-pesa-el-elefante-mas-grande-del-VGKL7WSR6ZGYJO3DRTLIYI6PQI.jpg?auth=165dd743dbde4fe70713f650dba59da8d6415241b281e1b95775b8dc67e1b9b5&width=880&height=586&quality=70&smart=true',
  ];

}
