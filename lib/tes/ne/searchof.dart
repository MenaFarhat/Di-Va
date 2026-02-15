import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

class SearchOf extends StatelessWidget {
  const SearchOf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  "Graphic Design",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: defaultColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
               // SizedBox(width: 10),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/interests/graphic_design.jpg',
                  ),
                  radius: 30,
                ),
              ],
            ),
            const Divider(
              color: Color(0xff9a9ea4),
              thickness: 1,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
