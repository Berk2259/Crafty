import 'package:crafty/Models/aciklama_model.dart';
import 'package:crafty/Models/detail_container_malzeme_model.dart';

class DetailData {
  // Her çiçek türü için farklı malzemeler
  static Map<String, List<DetailMalzemeContainerModel>> flowerMaterials = {
    'Gül': [
      DetailMalzemeContainerModel(
        icon: 'assets/images/makas.png',
        malzeme: 'Makas',
      ),
      DetailMalzemeContainerModel(
        icon: 'assets/images/tape.png',
        malzeme: 'Bant',
      ),
      DetailMalzemeContainerModel(
        icon: 'assets/images/needle.png',
        malzeme: 'İğne',
      ),
    ],
    'Orkide': [
      DetailMalzemeContainerModel(
        icon: 'assets/images/makas.png',
        malzeme: 'Makas',
      ),
      DetailMalzemeContainerModel(
        icon: 'assets/images/tape.png',
        malzeme: 'Bant',
      ),
      DetailMalzemeContainerModel(
        icon: 'assets/images/needle.png',
        malzeme: 'İğne',
      ),
    ],
    'Papatya': [
      DetailMalzemeContainerModel(
        icon: 'assets/images/makas.png',
        malzeme: 'Makas',
      ),
      DetailMalzemeContainerModel(
        icon: 'assets/images/tape.png',
        malzeme: 'Bant',
      ),
      DetailMalzemeContainerModel(
        icon: 'assets/images/needle.png',
        malzeme: 'İğne',
      ),
    ],
    'Lavanta': [
      DetailMalzemeContainerModel(
        icon: 'assets/images/makas.png',
        malzeme: 'Makas',
      ),
      DetailMalzemeContainerModel(
        icon: 'assets/images/tape.png',
        malzeme: 'Bant',
      ),
      DetailMalzemeContainerModel(
        icon: 'assets/images/needle.png',
        malzeme: 'İğne',
      ),
    ],
  };

  // Her çiçek türü için farklı açıklamalar
  static Map<String, List<AciklamaModel>> flowerAciklamalar = {
    'Gül': [
      AciklamaModel(
        aciklama: [
          'asfgsgdsfbdhsfbkdsfbkdsfbkdsfbkdsbfkdsf',
          'dsfkjdsfkdsbkfdsbfkdsbfkds',
          'dfskdsfkjdsfkjsfkjh',
        ],
      ),
    ],

    'Orkide': [AciklamaModel(aciklama: [])],

    'Papatya': [AciklamaModel(aciklama: [])],

    'Lavanta': [AciklamaModel(aciklama: [])],
  };
}
