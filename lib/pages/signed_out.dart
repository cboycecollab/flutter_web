import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignedOut extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AnimationController controller =
        useAnimationController(duration: Duration(milliseconds: 500));
    final Animation<double> rotation =
        Tween(begin: 0.0, end: 0.25).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ));
    final Animation<double> animHeight = Tween(begin: 0.0, end: 50.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    ValueNotifier<bool> forward = useState(true);
    ValueNotifier<bool> stateSetter = useState(false);

    controller.addListener(() {
      stateSetter.value = !stateSetter.value;
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text('Signed Out'),
          ),
          Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                height: animHeight.value,
                child: GestureDetector(
                  onTap: () {
                    print('Tapped three');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.redAccent,
                      ),
                      width: 50,
                      height: 50,
                      child: Center(child: Text('Three')),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                height: animHeight.value,
                child: GestureDetector(
                  onTap: () {
                    print('Tapped two');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.lightBlue,
                      ),
                      width: 50,
                      height: 50,
                      child: Center(child: Text('Two')),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                height: animHeight.value,
                child: GestureDetector(
                  onTap: () {
                    print('Tapped one');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.lightGreen,
                      ),
                      width: 50,
                      height: 50,
                      child: Center(child: Text('One')),
                    ),
                  ),
                ),
              ),
              RotationTransition(
                turns: rotation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.lightBlueAccent),
                    child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          if (forward.value) {
                            controller.forward();
                            print('controller forward');
                          } else {
                            print('controller reverse');
                            controller.reverse();
                          }

                          forward.value = !forward.value;
                        }),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
