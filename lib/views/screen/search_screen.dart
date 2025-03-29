import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/controller/api_services.dart';
import 'package:wallpaper_flutter/model/photosModel.dart';
import 'package:wallpaper_flutter/views/screen/fullscreen_image.dart';
import 'package:wallpaper_flutter/views/widget/categorie_bloc.dart';
import 'package:wallpaper_flutter/views/widget/custom_appbar.dart';
import 'package:wallpaper_flutter/views/widget/search_bar_widget.dart';


class SearchScreen extends StatefulWidget {

  String? query;
  SearchScreen({required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PhotosModel> searchResult=[];
  getSearchResult()async{
 searchResult=await ApiServices.getSearchWallpapers(widget.query!);
 setState(() {
 });
  }
  @override
  void initState() {
  getSearchResult();
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
      body:  Column(
          children: [
            Container(padding:EdgeInsets.symmetric(horizontal: 10),child: SearchBarWidget()),

            Expanded(
              child: Container(
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
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FullscreenImage(imgUrl: searchResult[index].imgSrc,),));
                      },
                      child: Hero(
                        tag: searchResult[index].imgSrc!,
                        child: Container(
                          height: 800,width: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(height: 800,width: 50,fit: BoxFit.cover,
                                searchResult[index].imgSrc!),
                          ),),
                      ),
                    );
                  },),
              
              ),
            )
          ],

      ),
    );
  }
}
