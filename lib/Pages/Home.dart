import 'package:flutter/material.dart';
import 'package:file_manager_ui/Pages/DraggableScrollCustom.dart';
import 'package:file_manager_ui/Widgets/CardStorage.dart';
import 'package:file_manager_ui/Widgets/Picture.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222831),
      appBar: AppBar(
        backgroundColor: const Color(0xff222831),
        leading: const Icon(Icons.sort, color: Color(0xff4C525B), size: 28),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xff4C525B), size: 27),
            onPressed: () {
              // Add search functionality
            },
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xff4C525B), size: 27),
            onPressed: () {
              // Add settings functionality
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 25),
              const Center(
                child: Text('Manage', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w300)),
              ),
              const Center(
                child: Text('Your Files', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 35),
              _buildStorageSection(),
              const SizedBox(height: 45),
              _buildRecentSection(),
              const SizedBox(height: 20),
              _buildPictureGallery(),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.20,
            minChildSize: 0.15,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return DraggableScrollCustom(scrollController: scrollController);
            },
          )
        ],
      ),
    );
  }

  Widget _buildStorageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Storage', style: TextStyle(color: Colors.white, fontSize: 17)),
              Icon(Icons.filter_list, color: Color(0xff4C525B), size: 27),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15),
            children: const [
              CardStorage(imageData: 'Assets/dropbox.png', title: 'Dropbox', color: Color(0xff0E67FA)),
              CardStorage(imageData: 'Assets/drive.png', title: 'Google Drive', color: Color(0xffFFA800)),
              CardStorage(imageData: 'Assets/mega.png', title: 'Mega', color: Colors.red),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Recent (30 days)', style: TextStyle(color: Colors.grey, fontSize: 14)),
          Row(
            children: [
              Icon(Icons.refresh, color: Color(0xff4C525B), size: 27),
              SizedBox(width: 10),
              Icon(Icons.visibility_outlined, color: Color(0xff4C525B), size: 27),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPictureGallery() {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      height: 250,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          Picture(color: Color(0xffFF9090)),
          Picture(color: Color(0xffF8A8FB)),
          Picture(color: Color(0xffC780ff)),
          Picture(color: Color(0xffa3a1ff)),
        ],
      ),
    );
  }
}
