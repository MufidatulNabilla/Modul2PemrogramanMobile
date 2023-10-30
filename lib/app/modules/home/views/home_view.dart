import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:image_picker/image_picker.dart';


class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  File? _selectedImage;

  void _openImagePicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _selectedImage = File(pickedImage.path);
    }
  }

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      _selectedImage = File(pickedImage.path);
    }
  }


  Widget _buildSelectedImage() {
    return _selectedImage != null
        ? Image.file(_selectedImage!)
        : const Text("No Image Selected");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/makaron_splash.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.pink[50],
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Obx(() => Text(controller.name.value)),
              accountEmail: Obx(() => Text(controller.email.value)),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  _openImagePicker();
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: _buildSelectedImage(),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _openCamera();
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 12,
                          child: Icon(
                            Icons.camera,
                            color: Colors.white, // Ganti dengan warna yang sesuai
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.only(left: 18, top: 30, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() =>
                Text(
                  "Hai, ${controller.name.value}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(
                  top: 8.0, bottom: 10.0, right: 40.0),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(232, 210, 161, 1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(60.0),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(60.0),
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Find recipes based on what you already have at home",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      "assets/ramen_home.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Kategori",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 47,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCategoryItem("Breakfast"),
                        buildCategoryItem("Lunch"),
                        buildCategoryItem("Dinner"),
                        // Tambahkan kategori lainnya sesuai kebutuhan Anda
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildItemWithImageAndText(
                      "Pancake", "assets/pancake_menu.jpg", Color.fromRGBO(250, 195, 150, 1.0)),
                  buildItemWithImageAndText(
                      "Pecel", "assets/pecel_menu.jpg", Color.fromRGBO(138, 230, 246, 1.0)),
                  buildItemWithImageAndText(
                      "Bubur Ayam", "assets/bubur_menu.jpg", Color.fromRGBO(152, 250, 122, 1.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(String category) {
    return GestureDetector(
      onTap: () {
        // Tambahkan logika ketika kategori ditekan di sini
      },
      child: Column(
        children: [
          SizedBox(height: 10),
          // Menambahkan jarak vertikal sebelum setiap kategori
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                  color: Colors.black,
                  width: 2),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemWithImageAndText(String text, String imagePath, Color backgroundColor) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Column(
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}