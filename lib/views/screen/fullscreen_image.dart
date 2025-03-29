import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:set_wallpaper/set_wallpaper.dart';


class FullscreenImage extends StatefulWidget {
String? imgUrl;

FullscreenImage({required this.imgUrl});

  @override
  State<FullscreenImage> createState() => _FullscreenImageState();
}

class _FullscreenImageState extends State<FullscreenImage> {


  downloadWallpaper(String imageUrl,BuildContext context) async {
    try {

      var response=await http.get(Uri.parse(imageUrl));

      await FlutterImageGallerySaver.saveImage(response.bodyBytes);//save image to gallery

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image saved to Download Folder")),
      );
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
  setWallpaper(String imageUrl,WallpaperType type)async{
    try{

      final response=await http.get(Uri.parse(imageUrl));
      final tempDir=await getTemporaryDirectory();
      final time=DateTime.now().millisecondsSinceEpoch;
      final file=File('${tempDir.path}/wallpaper-$time.jpg');

      await file.writeAsBytes(response.bodyBytes);

      await SetWallpaper.setWallpaper(imagePath: file.path,wallpaperType: type);


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image set as Background")),
      );


    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(widget.imgUrl!),
          fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton:
         Align(
           alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                margin: EdgeInsets.only(left: 15),
                  width:170,
                  child: ElevatedButton(
                      onPressed: (){
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(),
                        context: context, builder: (context) {
                        return Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              TextButton(onPressed: (){
                                setWallpaper(widget.imgUrl!, WallpaperType.home);
                                Navigator.pop(context);
                              }, child: Text('Set for HomeScreen',style: TextStyle(color: Colors.black),)),
                              Divider(color: Colors.black26,height: 0.5,),
                              TextButton(onPressed: (){
                                setWallpaper(widget.imgUrl!, WallpaperType.lock);
                                Navigator.pop(context);
                              }, child: Text('Set for LockScreen',style: TextStyle(color: Colors.black),)),
                              Divider(color: Colors.black26,height: 0.5,),
                              TextButton(onPressed: (){
                                setWallpaper(widget.imgUrl!, WallpaperType.system);
                                Navigator.pop(context);
                              }, child: Text('Set for BothScreen',style: TextStyle(color: Colors.black),))
                            ],
                          ),
                        );
                      },);
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),child: Text('Set Wallpaper',style: TextStyle(color: Colors.black),),),
                ),
                SizedBox(width: 5,),
                Container(
                  margin: EdgeInsets.only(left: 10),

                  width: 170,
                  height: 40,
                  child: ElevatedButton(onPressed: (){
                    downloadWallpaper(widget.imgUrl!, context);
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),child: Center(child: Text('Download image',style: TextStyle(color: Colors.black,),))),
                ),
              ],
            ),
        ),


    );

  }
}
