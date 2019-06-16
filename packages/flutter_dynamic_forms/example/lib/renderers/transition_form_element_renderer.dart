import 'package:example/models/transition_form_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class TransitionFormElementRenderer
    extends FormElementRenderer<TransitionFormElement> {
  @override
  Widget render(
      TransitionFormElement element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    var child = renderer(element.child, context);
    switch (element.transitionType) {
      case FormElementTransitionType.show:
        return ExpandedSection(
          child: child,
          expand: true,
        );
        break;
      case FormElementTransitionType.hide:
        return ExpandedSection(
          child: child,
          expand: false,
        );
        break;
      default:
        throw Exception("Unknown transition type");
    }
  }
}

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  ExpandedSection({this.expand = false, this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    Animation curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.linear,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expand) {
      expandController.value = 0;
      expandController.forward();
    } else {
      expandController.value = 1.0;
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
