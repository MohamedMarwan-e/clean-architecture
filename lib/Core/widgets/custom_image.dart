import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      this.image, {
        super.key,
        this.width = 100,
        this.height = 100,
        this.bgColor,
        this.borderWidth = 0,
        this.borderColor,
        this.fit = BoxFit.fill,
        this.isNetwork = true,
        this.radius = 6,
        this.borderRadius,
        this.isShadow = true,
        this.horizontal,
        this.vertical,
      });

  final String image;
  final double width;
  final double? horizontal;
  final double? vertical;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool isNetwork;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, height: height,
      margin: EdgeInsets.symmetric(horizontal: horizontal ?? 0,vertical: vertical?? 0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        boxShadow: [
          if (isShadow) BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            spreadRadius: 1, blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ]
      ),
      child: isNetwork ?
      CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => const BlankImageWidget(),
        errorWidget: (context, url, error) => const BlankImageWidget(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        ),
      ):
      Image(image: AssetImage(image),
        fit: fit,
      ),
    );
  }
}

class BlankImageWidget extends StatelessWidget {
  const BlankImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Center(
          child: SizedBox(
              child: Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  elevation: 0.0
              )
          )
      ),
    );
  }
}