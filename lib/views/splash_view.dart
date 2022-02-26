import 'package:by_onboarding_login_page/models/splash_model.dart';
import 'package:by_onboarding_login_page/utility/utility.dart';
import 'package:by_onboarding_login_page/views/login_view.dart';
import 'package:flutter/material.dart';

class splashView extends StatefulWidget {
  const splashView({Key? key}) : super(key: key);

  @override
  _splashViewState createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50], body: buildSplash(context));
  }

  Column buildSplash(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: _controller,
              itemCount: models.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    const emptySpace.sHeight(),
                    Image(image: AssetImage(models[i].image)),
                    Card(
                      elevation: 15,
                      margin: const EdgeInsets.only(right: 15, left: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      child: SizedBox(
                        height: 270,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Text(models[i].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              const emptySpace.mHeight(),
                              Text(
                                models[i].description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 2),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              List.generate(models.length, (index) => buildDot(index, context)),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  child: Visibility(
                    child: const Text("Skip"),
                    visible: currentIndex == models.length - 1 ? false : true,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[50],
                      onPrimary: Colors.grey[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 15),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginView()));
                  },
                ),
              ),
              Container(
                height: 60,
                width: 150,
                margin: const EdgeInsets.only(left: 30),
                child: ElevatedButton(
                  child: Text(
                      currentIndex == models.length - 1 ? "Continue" : "Next"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 15),
                  onPressed: () {
                    if (currentIndex == models.length - 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginView()));
                    }
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: currentIndex == index ? 12 : 10,
      width: currentIndex == index ? 12 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.0, color: const Color(0xFF5C6BC0)),
        color:
            currentIndex == index ? Colors.indigoAccent[400] : Colors.white60,
      ),
    );
  }
}
