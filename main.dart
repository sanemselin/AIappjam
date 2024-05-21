import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ünlü Müzeler',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FamousMuseumsPage(),
    );
  }
}

class FamousMuseumsPage extends StatelessWidget {
  const FamousMuseumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ünlü Müzeler'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.hurimg.com/i/hurriyet/75/1110x740/5f5895ff18c7732ff0b547a3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Ünlü Müzeler',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 3.0,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                MuseumCard(
                  imageUrl:
                      'https://image.hurimg.com/i/hurriyet/75/1110x740/5f5895ff18c7732ff0b547a3.jpg',
                  museumName: 'Louvre Müzesi',
                  location: 'Paris, Fransa',
                  details:
                      'Louvre Müzesi, dünyanın en büyük ve en ünlü müzelerinden biridir. Paris, Fransa\'da bulunan müze, 1793 yılında kurulmuştur.',
                ),
                MuseumCard(
                  imageUrl:
                      'https://www.istanbulsanatevi.com/wp-content/uploads/2017/06/metropolian-museum-of-art-02a.jpg',
                  museumName: 'Metropolitan Müzesi',
                  location: 'New York, ABD',
                  details:
                      'Metropolitan Sanat Müzesi, New York\'ta yer alan, dünyanın en büyük ve en önemli sanat müzelerinden biridir. 1870 yılında kurulmuştur.',
                ),
                MuseumCard(
                  imageUrl:
                      'https://www.vatikan-muzesi.com/wp-content/uploads/2020/09/Vatikan-Muzesi-Haritalar-Galerisi.jpg',
                  museumName: 'Vatikan Müzesi',
                  location: 'Vatikan',
                  details:
                      'Vatikan Müzeleri, Vatikan Şehri\'nde bulunan, dünyanın en ünlü ve en büyük müzelerinden biridir. 1506 yılında Papa II. Julius tarafından kurulmuştur.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MuseumCard extends StatelessWidget {
  final String imageUrl;
  final String museumName;
  final String location;
  final String details;

  const MuseumCard({
    super.key,
    required this.imageUrl,
    required this.museumName,
    required this.location,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading:
            Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(museumName),
        subtitle: Text(location),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MuseumDetailsPage(
                museumName: museumName,
                details: details,
              ),
            ),
          );
        },
      ),
    );
  }
}

class MuseumDetailsPage extends StatelessWidget {
  final String museumName;
  final String details;

  const MuseumDetailsPage({
    super.key,
    required this.museumName,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(museumName),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(details, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
