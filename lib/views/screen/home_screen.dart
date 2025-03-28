import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/controller/api_services.dart';
import 'package:wallpaper_flutter/model/photosModel.dart';
import 'package:wallpaper_flutter/views/screen/fullscreen_image.dart';
import 'package:wallpaper_flutter/views/widget/categorie_bloc.dart';
import 'package:wallpaper_flutter/views/widget/custom_appbar.dart';
import 'package:wallpaper_flutter/views/widget/search_bar_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PhotosModel> trendingWallList=[];


  getTrendingWallpapers()async{
    trendingWallList=await ApiServices.getTrendingWallpapers();
  setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    getTrendingWallpapers();
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
      body:
         Column(
          children: [
            Container(padding:EdgeInsets.symmetric(horizontal: 10),child: SearchBarWidget()),
            Container(
              margin: EdgeInsets.only(top: 0),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index)=>CategorieBloc(),),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 13,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 400
                    ),
                    itemCount: trendingWallList.length,
                    itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FullscreenImage(imgUrl: trendingWallList[index].imgSrc,),));
                      },
                      child: Hero(
                        tag: trendingWallList[index].imgSrc!,
                        child: Container(
                          height: 800,width: 50,
                           decoration: BoxDecoration(
                             color: Colors.transparent,
                             borderRadius: BorderRadius.circular(15),
                           ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(height: 800,width: 50,fit: BoxFit.cover,
                             trendingWallList[index].imgSrc!),
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
