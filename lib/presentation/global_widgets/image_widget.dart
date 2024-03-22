import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/ui.dart';

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final String? imageBoxFit;
  final String? placeHolder;
  const ImageWidget({Key? key,this.imageUrl,this.height,this.width,this.imageBoxFit,this.placeHolder}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size _size=MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: height??_size.height*0.15,
      width: width??_size.width*0.25,
      fit: Ui.commonUi.getBoxFit(imageBoxFit??'cover'),
      placeholder: (context, url) =>  Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image(
          image:  AssetImage(placeHolder??'assets/logo.png'),
          fit: Ui.commonUi.getBoxFit(imageBoxFit!),
        ),
      ),
      errorWidget: (context, url, error) =>  Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image(
          image:  AssetImage(placeHolder??
            'assets/logo.png',
          ),
          fit: Ui.commonUi.getBoxFit(imageBoxFit!),
        ),
      ),
    );
  }
}
