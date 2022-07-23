// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:projectawal/model/tourism_place.dart';
import 'package:projectawal/screentypedetail/detailmobilepage.dart';
import 'package:projectawal/screentypedetail/detailwebpage.dart';

class DetailScreen extends StatelessWidget {
  var oxygenFamily = TextStyle(fontFamily: 'Oxygen');
  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return DetailWebPage(place: place);
          } else {
            return DetailMobilePage(place: place);
          }
        }
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButton createState() => _FavoriteButton();
}

class _FavoriteButton extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      }, 
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      )
    );
  }
}