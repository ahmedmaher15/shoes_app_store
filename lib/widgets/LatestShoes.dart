import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shoes_app_store/models/sneakers_model.dart';
import 'package:shoes_app_store/widgets/stagger.dart';

import '../utils/dimensions.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    super.key,
    required Future<List<Sneakers>> male,
    required this.height,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _male,
      builder:(context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasError){
          return Text("Error ${snapshot.error}");
        }
        else{
          final male=snapshot.data;
          return StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
              itemCount: male!.length,
              scrollDirection: Axis.vertical,
              staggeredTileBuilder: (index)=>StaggeredTile.extent(
                (index % 2 == 0) ? 1 : 1,
                (index % 4 == 1 || index % 4 == 3)?
                Dimensions.screenHeight/3.47:Dimensions.screenHeight/3.58,
              ),
              itemBuilder:(ctx,index) {
                final shoe=snapshot.data![index];
                return StaggerTile(imageUrl: shoe.imageUrl[1], name: shoe.name, price: "\$${shoe.price}");
              } );
        }
      } ,);
  }
}
