import 'package:flutter/material.dart';

class MethodCard extends StatefulWidget {
  const MethodCard(
      {super.key,
      required this.title,
      required this.stepDescription,
      required this.currentStep,
      required this.totalSteps,
      this.duration = const Duration(seconds: 0)});

  final String title;
  final String stepDescription;

  final int currentStep;
  final int totalSteps;

  final Duration duration;

  @override
  State<MethodCard> createState() => _MethodCardState();
}

class _MethodCardState extends State<MethodCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
          child: SizedBox(
            width: constraints.maxWidth,
            child: Card(
              child: Container(
                // display title (top center), step (top right), and description (center)
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "Step ${widget.currentStep} of ${widget.totalSteps}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.stepDescription,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}