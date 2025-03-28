import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/controller/api_services.dart';
import 'package:wallpaper_flutter/model/categoryModel.dart';
import 'package:wallpaper_flutter/model/photosModel.dart';
import 'package:wallpaper_flutter/views/screen/category_screen.dart';

class CategorieBloc extends StatefulWidget {
  @override
  State<CategorieBloc> createState() => _CategorieBlocState();
}

class _CategorieBlocState extends State<CategorieBloc> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        child: Row(children: [
          InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(query: "Nature"),));
                },
            child: Stack(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                      height: 50,
                      width: 100,
                      fit: BoxFit.cover,
                      "https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                ),
                 Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                Positioned(
                    left: 25,
                    top: 13,
                    child: Text(
                      'Nature',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
          SizedBox(width: 10,),
          InkWell(
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(query: "Cars"),));
          },
          child:Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    height: 50,
                    width: 100,
                    fit: BoxFit.cover,
                    "https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
              ),
              Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

              Positioned(
                  left: 35,
                  top: 13,
                  child: Text(
                    'Cars',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ],
          ),),
          SizedBox(width: 10,),
    InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(query: "Animal"),));
    },
    child:
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    height: 50,
                    width: 100,
                    fit: BoxFit.cover,
                    "https://images.pexels.com/photos/792381/pexels-photo-792381.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(query: "Animal"),));
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                  left: 28,
                  top: 13,
                  child: Text(
                    'Animal',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ],
          ),),
          SizedBox(width: 10,),
    InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(query: "Waterfall"),));
    },
    child:
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    height: 50,
                    width: 100,
                    fit: BoxFit.cover,
                    "https://images.pexels.com/photos/949194/pexels-photo-949194.jpeg?auto=compress&cs=tinysrgb&w=600"),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(query: "Waterfall"),));
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 13,
                  child: Text(
                    'Waterfall',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ],
          ),),
          SizedBox(width: 10,),
    InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(query: "Galaxy"),));
    },
    child:
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    height: 50,
                    width: 100,
                    fit: BoxFit.cover,
                    "https://images.pexels.com/photos/2150/sky-space-dark-galaxy.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(query: "Galaxy"),));
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                  left: 28,
                  top: 13,
                  child: Text(
                    'Galaxy',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ],
          ),),
        ]));
  }
}
