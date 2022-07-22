// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:projectawal/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  var oxygenFamily = TextStyle(fontFamily: 'Oxygen');
  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: [
                  Hero(
                    tag: place.imageAsset, 
                    child: Image.asset(place.imageAsset),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              }, 
                              icon: Icon(Icons.arrow_back),
                              color: Colors.white,),
                          ),
                          FavoriteButton()
                        ],
                      )
                    )
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Staatliches'
                  ),),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today, color: Colors.green[500],),
                        const SizedBox(height: 8.0,),
                        Text(place.openDays, style: oxygenFamily,),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time, color: Colors.green[500],),
                        const SizedBox(height: 8.0,),
                        Text(place.openTime, style: oxygenFamily,),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Icon(Icons.monetization_on, color: Colors.green[500],),
                        const SizedBox(height: 8.0,),
                        Text(place.ticketPrice, style: oxygenFamily,),
                      ],
                    )

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  place.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Oxygen'),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      )
                    );
                  }).toList()
                ),
              )
            ],
          )
        )
      
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