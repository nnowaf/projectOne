// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:projectawal/model/tourism_place.dart';

class DetailWebPage extends StatelessWidget {
  var oxygenFamily = TextStyle(fontFamily: 'Oxygen');
  final TourismPlace place;

  DetailWebPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64
        ),
        child: Center(
          child: Container(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wisata Bandung',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Staatliches'
                  ),
                ),

                SizedBox(height: 32,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Hero(
                              tag: place.imageAsset, 
                              child: Image.asset(place.imageAsset)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 150,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: place.imageUrls.map((url) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(url),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 32,),
                    Expanded(
                      child: Card(
                        child:  Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  place.name,
                                  textAlign: TextAlign.center ,
                                  style: TextStyle(fontSize: 30.0, fontFamily: 'Staatliches'),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.calendar_today, color: Colors.green[500],),
                                      SizedBox(width: 8.0,),
                                      Text(
                                        place.openDays,
                                        style: oxygenFamily,
                                      )
                                    ],
                                  ),
                                  FavoriteButton()
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                    Icon(Icons.access_time, color: Colors.green[500],),
                                    SizedBox(width: 8.0,),
                                    Text(
                                      place.openTime,
                                      style: oxygenFamily,
                                    )
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.monetization_on, color: Colors.green[500],),
                                  SizedBox(width: 8.0,),
                                  Text(
                                    place.ticketPrice,
                                    style: oxygenFamily,
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  place.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Oxygen'
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    )
                  ],
                )
              ],
            )
          ),
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