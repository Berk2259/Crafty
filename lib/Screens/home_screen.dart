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
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final data = _items[index].data() as Map<String, dynamic>;
                  return Container(
                    width: double.infinity,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff1C1C1E),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['title'] ?? '',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          data['description'] ?? '',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
