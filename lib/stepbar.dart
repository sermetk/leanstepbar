import 'package:flutter/material.dart';

class StepBar extends StatelessWidget {
  final bool stepBarDarkMode;
  final int currentStep;
  final int stepCount;

  StepBar.dark({this.stepBarDarkMode = true, this.currentStep = 0, this.stepCount});
  StepBar.light({this.stepBarDarkMode = false, this.currentStep = 0, this.stepCount});

  @override
  Widget build(BuildContext context) {
    var steps = List<Widget>();
    for (var i = 0; i < stepCount; i++) {
      steps.add(Container(
          height: 20,
          width: 20,
          child: i < currentStep ? Icon(Icons.done, size: 15, color: Colors.white) : null,
          decoration: BoxDecoration(
            color: i == currentStep
                ? stepBarDarkMode ? Colors.blueGrey : Colors.white
                : currentStep > i ? Colors.green : stepBarDarkMode ? Colors.white : Colors.black12,
            border: i == currentStep
                ? Border.all(color: stepBarDarkMode ? Colors.white : Colors.blueGrey, width: 6.0)
                : null,
            borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
          )));
      if (i != stepCount && i != stepCount - 1) {
        steps.add(Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: Container(
                //HACK: Divider not working
                alignment: Alignment.center,
                height: 4,
                color: stepBarDarkMode ? Colors.white : Colors.blueGrey),
          ),
        ));
      }
    }
    return Container(
      decoration: BoxDecoration(color: stepBarDarkMode ? Colors.blueGrey : Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: steps),
      ),
    );
  }
}
