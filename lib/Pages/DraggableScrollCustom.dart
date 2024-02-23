import 'package:file_manager_ui/Widgets/CardImageFile.dart';
import 'package:file_manager_ui/Widgets/ItemIcon.dart';
import 'package:flutter/material.dart';

import 'package:file_manager_ui/Widgets/CardFolders.dart';



class DraggableScrollCustom extends StatelessWidget
{
  final ScrollController scrollController;

  const DraggableScrollCustom({Key? key, required this.scrollController}) : super(key: key);

 @override
 Widget build(BuildContext context)
 {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10.0)
        ]
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        children: [
          Center(
            child: Container(
              height: 4.0,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(50)
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemIcon(title: 'Videos', color: Color(0xffFA8C5F), icon: Icons.play_circle_outline),
              ItemIcon(title: 'Pictures', color: Color(0xff719Ef7), icon: Icons.photo_album_outlined),
              ItemIcon(title: 'Documents', color: Color(0xfff67e86), icon: Icons.sticky_note_2_outlined),
              ItemIcon(title: 'Zips', color: Color(0xff6ED5D5), icon: Icons.ballot_outlined),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemIcon(title: 'APKs', color: Color(0xff6ed5d5), icon: Icons.adb_outlined),
              ItemIcon(title: 'Music', color: Color(0xffFA8C5F), icon: Icons.music_note_outlined),
              ItemIcon(title: 'Tags', color: Color(0xff719Ef7), icon: Icons.local_offer_outlined),
              ItemIcon(title: 'File Safe', color: Color(0xfff67e86), icon: Icons.adjust),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Folders', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey)
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 75,
            width: double.infinity,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [

                CardFolders(),
                CardFolders(),
                CardFolders(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('File Manager', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
              Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardImage(),
              CardImage()
            ],
          )

        ],
      ),
    );
  }
}