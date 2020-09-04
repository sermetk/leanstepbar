import 'package:flutter/material.dart';
import 'package:leanstepbar/stepbar.dart';

void main() {
  runApp(LeanStepBar());
}

class LeanStepBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: PageView.builder(
                itemCount: 4,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                      Center(child: Text('Dark')),
                      StepBar.dark(
                        currentStep: position,
                        stepCount: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(child: Text('Light')),
                      ),
                      StepBar.light(currentStep: position, stepCount: 4)
                    ]),
                  );
                })));
  }
}
