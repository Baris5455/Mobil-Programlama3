import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // AppBar yüksekliği
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 30, 8, 191),
                  Color.fromARGB(255, 60, 103, 223),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent, // Şeffaf yapıyoruz
              elevation: 0, // Gölgeyi kaldırıyoruz
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                iconSize: 32,
                padding: const EdgeInsets.only(top: 30),
                onPressed: () {
                  // Geriye gitmek için kullanılabilir
                  Navigator.pop(context);
                },
              ),
              title: const Padding(
                padding: EdgeInsets.only(top: 35),
                child: Text(
                  'Firmalar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              AnaSekme(), // Sağlık sekmesi
              SizedBox(height: 20),
              FirmaArama(), // TextField widget'ı
              SizedBox(height: 10),
              IndirimFirsati(), // Soluk indirim fırsatı yazısı
              Indirimler(), // Firma indirim listesini ekliyoruz
            ],
          ),
        ),
      ),
    );
  }
}

class AnaSekme extends StatelessWidget {
  const AnaSekme({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 30, 8, 191),
            Color.fromARGB(255, 60, 103, 223),
          ], // soldan sağa renkler
          begin: Alignment.centerLeft, // geçişin başladığı yer
          end: Alignment.centerRight, // geçişin bittiği yer
        ),
        border: Border.all(color: Colors.black, width: 1), // Siyah çerçeve
        borderRadius: BorderRadius.circular(12), // Köşeleri yuvarlar
      ),
      child: Row(
        children: <Widget>[
          // Sol taraftaki geniş alan (resim için)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25), // Soldan biraz boşluk bırakır
              child: Align(
                alignment: Alignment.centerLeft, // Resmi sola hizalar
                child: Image.asset(
                  'assets/images/hospitalTent.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
          // Ortadaki geniş alan (yazı için)
          const Expanded(
            child: Align(
              alignment: Alignment.center, // Yazıyı tam ortaya hizalar
              child: Text(
                'Sağlık',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Sağ tarafta boş bir geniş alan (ortalamayı korumak için)
          const Expanded(
            child: SizedBox(), // Boş alan bırakır, hiçbir şey göstermeden
          ),
        ],
      ),
    );
  }
}

class FirmaArama extends StatelessWidget {
  const FirmaArama({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gölge
        Positioned(
          child: Container(
            width: 370,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        // Ana Container
        Container(
          width: 370,
          height: 65,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.4),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white, // Arka plan rengi
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/magnifyingGlass.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 2, // Esnekliği artırarak yazıyı sola kaydırıyoruz
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Firma ara', // Yer tutucu metin
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 115, 119, 119),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: -40),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IndirimFirsati extends StatelessWidget {
  const IndirimFirsati({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      height: 65,
      child: Text(
        'İstediğiniz firmada indirim yakalama fırsatı..',
        style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

class FirmaIndirimleri extends StatelessWidget {
  final String firmaAdi;

  const FirmaIndirimleri({super.key, required this.firmaAdi});

  @override
  Widget build(BuildContext context) {
    // Tekrar eden stil özelliklerini burada tanımlıyoruz.
    final BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 4),
        ),
      ],
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10), // Satırlar arasında boşluk
      decoration: boxDecoration, // Tekrar eden BoxDecoration burada kullanılıyor
      child: Row(
        children: [
          // Sol tarafta Görsel
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset(
              'assets/images/arrow.png',
              width: 50,
              height: 75,
            ),
          ),
          
          // Firma Adı yazısı (Sol hizalı ve esnek)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10), // Biraz boşluk ekliyoruz
              child: Text(
                firmaAdi,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Sağdaki Mavi Alan
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 30, 8, 191),
                  Color.fromARGB(255, 60, 103, 223),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Center(
              child: Text(
                '%10',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Indirimler extends StatelessWidget {
  const Indirimler({super.key});

  @override
  Widget build(BuildContext context) {
    // Firma adlarını içeren liste
    List<String> firmaAdlari = [
      'Firma Adı Uzun Firma Adı',
      'Firma Adı',
      'Firma Adı Uzun Firma Adı',
      'Firma Adı',
      'Firma Adı Uzun Firma Adı',
    ];

    return ListView.builder(
      shrinkWrap:
          true, // Diğer widget'larla uyumlu olacak şekilde listeyi sığdırır
      itemCount: firmaAdlari.length, // Kaç tane satır olacağını belirler
      itemBuilder: (context, index) {
        return Center(
          // Öğeleri merkeze hizalar
          child: SizedBox(
            width: 380,
            height: 100,
            child: FirmaIndirimleri(firmaAdi: firmaAdlari[index]),
          ), // Firma adlarını sırasıyla gönderiyoruz
        );
      },
    );
  }
}