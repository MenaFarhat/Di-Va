import 'package:diva/shared/styes/colors.dart';
import 'package:diva/tes/ne/add_post.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class Promotiomscreen extends StatefulWidget {
  const Promotiomscreen({Key? key}) : super(key: key);

  @override
  State<Promotiomscreen> createState() => _PromotiomscreenState();
}

class _PromotiomscreenState extends State<Promotiomscreen> {
  String? result;
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/interests/art.jpg"),
            )
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 25,
                      )),
                  const Text(
                    "Promotion Plan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Spacer(),
                    Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "SKIP",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 4),
                          blurRadius: 7.0),
                    ],
                  ),
                  child: SwipeableButtonView(
                    buttonText: 'SLIDE TO OPEN PLAN',
                    buttontextstyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                    buttonColor: Colors.white,
                    buttonWidget: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: defaultColor,
                    ),
                    activeColor: defaultColor,
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isFinished = true;
                        });
                      });
                    },
                    onFinish: () async {
                      await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const Addpost();
                      }));
                      setState(() {
                        isFinished = false;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
