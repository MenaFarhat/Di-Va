// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';

class ShowPhoto extends StatefulWidget {
  String? image;
  ShowPhoto({super.key, this.image});

  @override
  State<ShowPhoto> createState() => _ShowPhotoState();
}

class _ShowPhotoState extends State<ShowPhoto> 
  with SingleTickerProviderStateMixin  {
  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  late AnimationController animationController;
  Animation<Matrix4>?animation;
  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController=AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {controller.value=animation!.value;
    });
  }

  @override
  void deactivate() {
    controller.dispose();
    animationController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Mina Farhat",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onDoubleTapDown: (details) => tapDownDetails = details,
        onDoubleTap: () {
          final position = tapDownDetails!.localPosition;

          const double scale = 3;
          final x = -position.dx * (scale - 1);
          final y = -position.dy * (scale - 1);

          final zommed = Matrix4.identity()
          ..translate(x,y)
          ..scale(scale);

          final end = controller.value.isIdentity() ? zommed : Matrix4.identity();
         
         animation=Matrix4Tween(
          begin: controller.value,
          end: end,

         ).animate(
          CurveTween(curve: Curves.easeOut).animate(animationController)
         );


         animationController.forward(from: 0);
        },
        child: InteractiveViewer(
          transformationController: controller,
          panEnabled: true,
          scaleEnabled: true,
         // maxScale: 2,
         // minScale: 1,
          //clipBehavior: Clip.none,
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
