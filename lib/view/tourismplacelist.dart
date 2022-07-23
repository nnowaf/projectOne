import 'package:flutter/material.dart';

import 'package:projectawal/detailscreen.dart';
import 'package:projectawal/model/tourism_place.dart';

class TourismPlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tourismPlaceList.length,
        itemBuilder: (context, index) {
          final TourismPlace dataPlace = tourismPlaceList[index];
          return InkWell(
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:  Image.asset(dataPlace.imageAsset)
                  ),
                  
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            dataPlace.name,
                            style: TextStyle(fontSize: 16.0),
                          ),

                          SizedBox(height: 10,),

                          Text(dataPlace.location)
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ),

          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: dataPlace);
            }));
          },
        );
      
      });
  }
}