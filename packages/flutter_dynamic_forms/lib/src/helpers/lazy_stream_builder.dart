import 'package:flutter/widgets.dart';

typedef StreamFactory<T> = Stream<T> Function();

/// [StreamBuilder] which prevents recreating the stream every
/// time the build method is called.
class LazyStreamBuilder<T> extends StatefulWidget {
  final StreamFactory<T> streamFactory;
  final AsyncWidgetBuilder<T> builder;
  final T? initialData;

  const LazyStreamBuilder(
      {Key? key,
      required this.streamFactory,
      required this.builder,
      this.initialData})
      : super(key: key);

  @override
  _LazyStreamBuilderState<T> createState() => _LazyStreamBuilderState<T>();
}

class _LazyStreamBuilderState<T> extends State<LazyStreamBuilder<T>> {
  late Stream<T> _stream;

  @override
  void initState() {
    super.initState();
    _stream = widget.streamFactory();
  }

  @override
  void didUpdateWidget(LazyStreamBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.streamFactory != widget.streamFactory) {
      _stream = widget.streamFactory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      builder: widget.builder,
      stream: _stream,
      initialData: widget.initialData,
    );
  }
}
