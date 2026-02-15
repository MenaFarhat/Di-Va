import 'package:diva/module/promote/payment_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

class PromoteScreen extends StatefulWidget {
  const PromoteScreen({Key? key}) : super(key: key);

  @override
  State<PromoteScreen> createState() => _PromoteScreenState();
}

class _PromoteScreenState extends State<PromoteScreen> {
  double numberPsts = 1;
  bool isMtn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Icon(
          Icons.west,
          color: Colors.black,
        ),
        title: const Text(
          'Promote',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'The number of posts you want to promote : ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  children: [
                    Text(
                      '${numberPsts.round()} ' 'Post ',
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${numberPsts.round() * 5} ' '\$ ',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    /* Text('Post',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ) , */
                    const SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
              Slider(
                  value: numberPsts,
                  max: 100,
                  min: 0,
                  inactiveColor: Colors.grey.shade400,
                  thumbColor: const Color(0xff21115C),
                  activeColor: const Color(0xff21115C),
                  onChanged: (value) {
                    setState(() {
                      numberPsts = value;
                    });
                  }),
              const SizedBox(
                height: 50.0,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      '''Note : 
                    
  The cost of promoting one post is 5 dollars
 
  The post appears when it is promoted in the explorer interface
 
  The post will remain in the explorer interface (promoted) for two days''',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Text(
                      'Choose payment method : ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMtn = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            0.0,
                          ),
                          color: isMtn ? const Color(0xff21115C) : Colors.white,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image(
                            // image: AssetImage('assets/images/new.png'),
                            // height: 175.0,
                            // width: 155.0,
                            // ),
                            /*   Text(
                                'Mtn Cach',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMtn = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            0.0,
                          ),
                          color: !isMtn ? const Color(0xff21115C) : Colors.white,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image(
                            //   image: AssetImage('assets/images/unnamed.png'),
                            //   height: 175.0,
                            //   width: 155.0,
                            // ),
                            /*    Text(
                                'Payeer',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                '''Note : 
                    
  After payment, you will receive the code for the transfer process.
  Please enter it in the following interface''',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.0),
                          color: defaultColor,
                        ),
                        width: 120,
                        child: MaterialButton(
                          onPressed: () {
                            navigateTo(
                                context,
                                PayementScreen(
                                  numberOfPost: numberPsts.toInt(),
                                ));
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
