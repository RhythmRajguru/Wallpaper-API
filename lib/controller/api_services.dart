import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_flutter/model/photosModel.dart';
class ApiServices{

  static getTrendingWallpapers()async{

     List<PhotosModel> trendingWallpapers=[];

    final response=await http.get(Uri.parse("https://api.pexels.com/v1/curated"),
    headers: {
      "Authorization":"563492ad6f9170000100000198946807a4094585bec2f989e06441ae",
        }).then((value) {
          Map<String,dynamic> jsonData=jsonDecode(value.body);
          List photos=jsonData['photos'];
          photos.forEach((element){
         trendingWallpapers.add(PhotosModel.fromAPI2App(element));

          });
    });
    return trendingWallpapers;
  }
  static getSearchWallpapers(String query)async{
    List<PhotosModel> searchWallpaperList=[];

    final response=await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":"563492ad6f9170000100000198946807a4094585bec2f989e06441ae",
        }).then((value) {
      Map<String,dynamic> jsonData=jsonDecode(value.body);
      List photos=jsonData['photos'];
      searchWallpaperList.clear();
      photos.forEach((element){
        searchWallpaperList.add(PhotosModel.fromAPI2App(element));

      });
    });
    return searchWallpaperList;
  }
  static getCategoryWallpapers(String query)async{
    List<PhotosModel> categoryWallpaperList=[];

    final response=await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":"563492ad6f9170000100000198946807a4094585bec2f989e06441ae",
        }).then((value) {
      Map<String,dynamic> jsonData=jsonDecode(value.body);
      List photos=jsonData['photos'];
      categoryWallpaperList.clear();
      photos.forEach((element){
        categoryWallpaperList.add(PhotosModel.fromAPI2App(element));

      });
    });
    return categoryWallpaperList;
  }


}