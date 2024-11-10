import 'package:flutter/material.dart';

void main() {
  runApp(SolarSystemApp());
}

class SolarSystemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Système Solaire',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: PlanetListScreen(),
    );
  }
}

class Planet {
  final String name;
  final String description;
  final String imagePath;

  Planet({required this.name, required this.description, required this.imagePath});
}

class PlanetListScreen extends StatelessWidget {
  final List<Planet> planets = [
    Planet(
      name:'الزئبق',
      description: 'الكوكب الأقرب إلى الشمس.',
      imagePath: 'assets/images/mercury.png',
    ),
    Planet(
      name: 'فينوس',
      description: 'كوكب بركاني حار ذو غلاف جوي كثيف.',
      imagePath: 'assets/images/venus.png',
    ),
    Planet(
      name: 'الأرض',
      description: 'كوكبنا هو الكوكب الوحيد المعروف بإيواء الحياة.',
      imagePath: 'assets/images/terre.png',
    ),
    Planet(
      name: 'المريخ',
      description: 'الكوكب الأحمر، المعروف بتربته الغنية بأكسيد الحديد.',
      imagePath: 'assets/images/mars.png',
    ),
    Planet(
      name: 'المشتري',
      description: 'أكبر كوكب في المجموعة الشمسية، مع بقعة حمراء كبيرة.',
      imagePath: 'assets/images/jupiter.png',
    ),
    Planet(
      name: 'زحل',
      description: 'تشتهر بحلقاتها الجليدية الرائعة.',
      imagePath: 'assets/images/saturn.png',
    ),
    Planet(
      name: 'أورانوس',
      description: 'كوكب جليدي عملاق ذو لون أزرق مخضر فريد.',
      imagePath: 'assets/images/uranus.png',
    ),
    Planet(
      name: 'نبتون',
      description: 'الكوكب الأبعد عن الشمس، لونه أزرق غامق.',
      imagePath: 'assets/images/neptune.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les Planètes du Système Solaire'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: planets.length,
        itemBuilder: (context, index) {
          final planet = planets[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanetDetailScreen(planet: planet),
                ),
              );
            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple[100]!, Colors.deepPurple[400]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(planet.imagePath),
                    radius: 30,
                  ),
                  title: Text(
                    planet.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    planet.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  PlanetDetailScreen({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              planet.imagePath,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planet.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    planet.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Informations supplémentaires sur ${planet.name}:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[600],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "• Position dans le système solaire\n"
                    "• Composition de l'atmosphère\n"
                    "• Température moyenne\n"
                    "• Découverte et exploration",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
