import 'package:diva/shared/components/size_config.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: Colors.black,
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) => buidPostExplorItem(
          onPress: () {
            // Navigator.pushNamed(context);
          },
        ),
      ),
    );
  }
}

Widget buidPostExplorItem({
  required void Function()? onPress,
}) =>
    InkWell(
      onTap: onPress,
      child: Container(
        width: getProportionateScreenWidth(190),
        height: getProportionateScreenWidth(170),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/interests/art.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
