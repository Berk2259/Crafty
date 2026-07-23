import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<QueryDocumentSnapshot> _items =
      []; //Firestore'dan gelen dökümanları tuttuğum boş bir liste
  bool _isLoading = true; // veri henüz gelmediği için true ile başlıyor

  @override
  void initState() {
    //Flutter'da bir widget ilk oluşturulduğunda otomatik olarak çağrılan fonks.
    // TODO: implement initState
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final getItems =
        await FirebaseFirestore.instance
            .collection('items')
            .get(); //items koleksiyonunun içine git içindeki tüm dökümanları tek bir kere getir. get ile bu tek seferlik bir işlem
    setState(() {
      _items =
          getItems
              .docs; //firestore'dan gelen dökümanlar listesine _İtems listesine aktarıyor
      _isLoading =
          false; // veri geldiğine göre yükleniyor durumundan çıkma işlemi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'El İşleri',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    'Adım adım anlatımlı el işi projeleri',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HomeCategory(selected: true, text: 'Tümü'),
                    HomeCategory(selected: false, text: 'Kağıt İşi'),
                    HomeCategory(selected: false, text: 'Örgü & Dokuma'),
                    HomeCategory(selected: false, text: 'Takı Tasarımı'),
                    HomeCategory(selected: false, text: 'Ahşap Boyama'),
                    HomeCategory(selected: false, text: 'Dekor'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child:
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                          itemCount: _items.length,
                          itemBuilder: (context, index) {
                            final data =
                                _items[index].data() as Map<String, dynamic>;
                            return HomeContainer(
                              image:
                                  'https://www.tatlidilimler.com/idea/gx/58/myassets/products/474/flower-3115353-1280.jpg?revision=1772540846',
                              data: data,
                              color: Colors.orange,
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCategory extends StatelessWidget {
  final bool selected;
  final String text;
  const HomeCategory({super.key, required this.selected, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected ? Colors.deepPurple : Color(0xff1C1C1E),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Text(
            text,
            style: TextStyle(color: selected ? Colors.white : Colors.white70),
          ),
        ),
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  final String image;
  final Map<String, dynamic> data;
  final Color color;
  const HomeContainer({
    super.key,
    required this.data,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff1C1C1E),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
          child: Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(image)),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['category'] ?? '',
                    style: TextStyle(color: color, fontSize: 12),
                  ),
                  Text(
                    data['title'] ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    data['description'] ?? '',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        data['time'] ?? '',
                        style: TextStyle(color: color, fontSize: 12),
                      ),
                      Text(
                        ' • ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        data['difficulty'] ?? '',
                        style: TextStyle(color: color, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
