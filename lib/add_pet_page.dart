import 'package:flutter/material.dart';
import 'package:projek_fakhri_rasyad/home_page.dart';

import 'model/peliharaan.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key, required this.addPet});

  final Function(Pet) addPet;
  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  String petName = "";
  String petSpecies = "";
  String petRace = "";
  String petRaceImage = "";
  String petDateOfBirth = "";
  String petGender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menambahkan Peliharaan"),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 32),
          child: Center(
            child: Card(
              child: SizedBox(
                width: 480,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        child: Image.asset(
                          petRaceImage != ""
                              ? petRaceImage
                              : "assets/images/cats/cat.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Tambahkan Hewan Anda! "),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Nama:"),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: usedColors["Blue NCS"]!),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  petName = value;
                                });
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Masukkan nama peliharaan anda"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Spesies:"),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    petSpecies = "Kucing";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  color: petSpecies == "Kucing"
                                      ? usedColors["Emerald"]
                                      : null,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/cats/cat.png",
                                        height: 64,
                                        width: 64,
                                      ),
                                      const Text("Kucing")
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    petSpecies = "Anjing";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  color: petSpecies == "Anjing"
                                      ? usedColors["Emerald"]
                                      : null,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/dogs/dog.png",
                                        height: 64,
                                        width: 64,
                                      ),
                                      const Text("Anjing")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Ras:"),
                          const SizedBox(
                            height: 8,
                          ),
                          petSpecies.isNotEmpty
                              ? LayoutBuilder(builder: (context, constraint) {
                                  return GridView.builder(
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  constraint.maxWidth >= 600 &&
                                                          constraint.maxWidth <=
                                                              900
                                                      ? 8
                                                      : 3),
                                      itemCount: petSpecies == "Kucing"
                                          ? listOfCatImages.length
                                          : listOfDogImages.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () => setState(() {
                                            petRace = (petSpecies == "Kucing"
                                                    ? listOfCatImages
                                                    : listOfDogImages)
                                                .entries
                                                .elementAt(index)
                                                .key;
                                            petRaceImage =
                                                (petSpecies == "Kucing"
                                                        ? listOfCatImages
                                                        : listOfDogImages)
                                                    .entries
                                                    .elementAt(index)
                                                    .value;
                                          }),
                                          child: Container(
                                            color: petRace ==
                                                    (petSpecies == "Kucing"
                                                            ? listOfCatImages
                                                            : listOfDogImages)
                                                        .entries
                                                        .elementAt(index)
                                                        .key
                                                ? usedColors["Emerald"]
                                                : null,
                                            margin: const EdgeInsets.all(8),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    (petSpecies == "Kucing"
                                                            ? listOfCatImages
                                                            : listOfDogImages)
                                                        .entries
                                                        .elementAt(index)
                                                        .value,
                                                    height: constraint
                                                                    .maxWidth >=
                                                                600 &&
                                                            constraint
                                                                    .maxWidth <=
                                                                900
                                                        ? 32
                                                        : 64,
                                                    width: constraint
                                                                    .maxWidth >=
                                                                600 &&
                                                            constraint
                                                                    .maxWidth <=
                                                                900
                                                        ? 32
                                                        : 64,
                                                  ),
                                                ),
                                                Text(
                                                  (petSpecies == "Kucing"
                                                          ? listOfCatImages
                                                          : listOfDogImages)
                                                      .entries
                                                      .elementAt(index)
                                                      .key,
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                })
                              : const Text("Pilih spesies hewan anda!")
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Kelamin"),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    petGender = "Jantan";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  color: petGender == "Jantan"
                                      ? usedColors["Emerald"]
                                      : null,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/kelamin/male.png",
                                        height: 64,
                                        width: 64,
                                      ),
                                      const Text("Jantan")
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    petGender = "Betina";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  color: petGender == "Betina"
                                      ? usedColors["Emerald"]
                                      : null,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/kelamin/female.png",
                                        height: 64,
                                        width: 64,
                                      ),
                                      const Text("Betina")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (petName.isEmpty) {
                                  popUpDialog(context,
                                      "Nama peliharaan tidak boleh kosong");

                                  return;
                                } else if (petSpecies.isEmpty) {
                                  popUpDialog(context,
                                      "Spesies peliharaan tidak boleh kosong");

                                  return;
                                } else if (petRace.isEmpty) {
                                  popUpDialog(context,
                                      "Ras peliharaan tidak boleh kosong");

                                  return;
                                } else if (petGender.isEmpty) {
                                  popUpDialog(context,
                                      "Kelamin peliharaan tidak boleh kosong");

                                  return;
                                }
                                Pet peliharaanBaru = Pet(
                                    nama: petName,
                                    spesies: petSpecies,
                                    ras: petRace,
                                    kelamin: petGender);
                                widget.addPet(peliharaanBaru);
                                popUpDialog(context, "Peliharaan ditambahkan");
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text(
                                "Tambahkan Peliharaan Anda",
                                style: TextStyle(fontSize: 14),
                              ))
                        ],
                      )
                    ],
                  )),
                ),
              ),
            ),
          )),
    );
  }

  Future<dynamic> popUpDialog(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(text),
          );
        });
  }
}
