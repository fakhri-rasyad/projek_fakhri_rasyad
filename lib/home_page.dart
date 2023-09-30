import 'package:flutter/material.dart';
import 'package:projek_fakhri_rasyad/add_pet_page.dart';
import 'package:projek_fakhri_rasyad/model/peliharaan.dart';

Map<String, Color> usedColors = {
  "Sunglow": const Color(0xFFFFD166),
  "Bright Pink": const Color(0xFFEF476F),
  "Emerald": const Color(0xFF06D6A0),
  "Blue NCS": const Color(0xFF118AB2),
  "Farm Green": const Color(0xFF50723c),
  "Maya Blue": const Color(0xFF79beee),
};

Map<String, String> listOfCatImages = {
  "Domestik": "assets/images/cats/cat.png",
  "Bobtail": "assets/images/cats/bobtail.png",
  "British": "assets/images/cats/british.png",
  "Persian": "assets/images/cats/persian.png",
  "Scottish": "assets/images/cats/scottish.png",
  "Siamese": "assets/images/cats/siamese.png",
  "Tuxedo": "assets/images/cats/tuxedo.png"
};

Map<String, String> listOfDogImages = {
  "Domestik": "assets/images/dogs/dog.png",
  "Beagle": "assets/images/dogs/beagle.png",
  "German Shepherd": "assets/images/dogs/german-shepherd.png",
  "Golden Retriever": "assets/images/dogs/golden-retriever.png",
  "Bulldog": "assets/images/dogs/happy.png",
  "Labrador": "assets/images/dogs/labrador-retriever.png",
  "Shih Tzu": "assets/images/dogs/shih-tzu.png",
};

String getImage(Pet peliharaan) {
  String ikonRas = listOfCatImages["Domestik"]!;
  switch (peliharaan.spesies) {
    case "Kucing":
      ikonRas = listOfCatImages[peliharaan.ras]!;
      break;
    case "Anjing":
      ikonRas = listOfDogImages[peliharaan.ras]!;
      break;
  }
  return ikonRas;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pet> listPeliharaan = [
    Pet(
        nama: "Fettucini",
        spesies: "Kucing",
        ras: "Domestik",
        kelamin: "Jantan"),
    Pet(
        nama: "Spaghettti",
        spesies: "Anjing",
        ras: "Shih Tzu",
        kelamin: "Jantan"),
    Pet(nama: "Macaroni", spesies: "Anjing", ras: "Labrador", kelamin: "Jantan")
  ];

  void addPet(Pet peliharaan) {
    listPeliharaan.add(peliharaan);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Informasi Peliharaan')),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 800) {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: listPeliharaan.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      Pet peliharaan = listPeliharaan[index];
                      return PetCard(
                        peliharaan: peliharaan,
                        fontSize: 24,
                      );
                    });
              } else if (constraints.maxWidth <= 550) {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: listPeliharaan.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      Pet peliharaan = listPeliharaan[index];
                      return PetCard(
                        peliharaan: peliharaan,
                        fontSize: 18,
                      );
                    });
              } else {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: listPeliharaan.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      Pet peliharaan = listPeliharaan[index];
                      return PetCard(
                        peliharaan: peliharaan,
                        fontSize: 20,
                      );
                    });
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPetPage(
                        addPet: addPet,
                      )))
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  const PetCard({super.key, required this.peliharaan, required this.fontSize});
  final Pet peliharaan;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: usedColors["Sunglow"],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(children: [
              CircleAvatar(
                backgroundColor: usedColors["Blue NCS"],
                radius: fontSize * 1.5,
                child: Image.asset(
                  getImage(peliharaan),
                ),
              ),
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: fontSize * .7,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        peliharaan.kelamin == "Jantan"
                            ? "assets/images/kelamin/male.png"
                            : "assets/images/kelamin/female.png",
                      ),
                    ),
                  ))
            ]),
            Text(
              peliharaan.nama,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: usedColors["Blue NCS"],
            ),
            Text("${peliharaan.spesies} ${peliharaan.ras}",
                style: TextStyle(fontSize: fontSize * .7)),
          ],
        )),
      ),
    );
  }
}
