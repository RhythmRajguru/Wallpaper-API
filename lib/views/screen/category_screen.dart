import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/controller/api_services.dart';
import 'package:wallpaper_flutter/model/photosModel.dart';
import 'package:wallpaper_flutter/views/screen/fullscreen_image.dart';
import 'package:wallpaper_flutter/views/widget/categorie_bloc.dart';
import 'package:wallpaper_flutter/views/widget/custom_appbar.dart';
import 'package:wallpaper_flutter/views/widget/search_bar_widget.dart';


class CategoryScreen extends StatefulWidget {
String? query;
CategoryScreen({required this.query});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<PhotosModel> categoryResult=[];

  getCategoryResult()async{
    categoryResult=await ApiServices.getCategoryWallpapers(widget.query!);
    setState(() {
    });
  }
  @override
  void initState() {
    getCategoryResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 400
                ),
                itemCount: categoryResult.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FullscreenImage(imgUrl: categoryResult[index].imgSrc!),));
                    },
                    child: Container(
                      height: 800,width: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(height: 800,width: 50,fit: BoxFit.cover,
                            categoryResult[index].imgSrc!),
                      ),),
                  );
                },),

            )
          ],
        ),
      ),
    );
  }
}
