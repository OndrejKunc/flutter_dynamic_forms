import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

typedef CreateFormManager<T extends FormManager> = T Function(
  BuildContext context,
);

/// Takes a `ValueBuilder` that is responsible for creating the `formManager` and
/// a [child] which will have access to the `formManager` via
/// `FormProvider.of(context)`.
/// It is used as a dependency injection (DI) widget so that a single instance
/// of a `formManager` can be provided to multiple widgets within a subtree.
///
/// Automatically handles closing the `formManager` when used with `create` and lazily
/// creates the provided `formManager` unless [lazy] is set to `false`.
///
/// ```dart
/// FormProvider(
///   create: (BuildContext context) => FormManagerA(),
///   child: ChildA(),
/// );
/// ```
class FormProvider<T extends FormManager> extends SingleChildStatelessWidget {
  FormProvider({
    Key key,
    @required CreateFormManager<T> create,
    Widget child,
    bool lazy,
  }) : this._(
          key: key,
          create: create,
          dispose: (_, manager) => manager?.close(),
          child: child,
          lazy: lazy,
        );

  /// Takes a `formManager` and a [child] which will have access to the `formManager` via
  /// `FormProvider.of(context)`.
  /// When `FormProvider.value` is used, the `formManager` will not be automatically
  /// closed.
  /// As a result, `FormProvider.value` should mainly be used for providing
  /// existing `formManager`s to new routes.
  ///
  /// A new `formManager` should not be created in `FormProvider.value`.
  /// `formManager`s should always be created using the default constructor within
  /// `create`.
  ///
  /// ```dart
  /// FormProvider.value(
  ///   value: Formrovider.of<BlocA>(context),
  ///   child: ScreenA(),
  /// );
  /// ```
  FormProvider.value({
    Key key,
    @required T value,
    Widget child,
  }) : this._(
          key: key,
          create: (_) => value,
          child: child,
        );

  /// Internal constructor responsible for creating the [FormProvider].
  /// Used by the [FormProvider] default and value constructors.
  FormProvider._({
    Key key,
    @required Create<T> create,
    Dispose<T> dispose,
    this.child,
    this.lazy,
  })  : _create = create,
        _dispose = dispose,
        super(key: key, child: child);

  /// [child] and its descendants which will have access to the `formManager`.
  final Widget child;

  /// Whether or not the `formManager` being provided should be lazily created.
  /// Defaults to `true`.
  final bool lazy;

  final Dispose<T> _dispose;

  final Create<T> _create;

  /// Method that allows widgets to access a `formManager` instance as long as their
  /// `BuildContext` contains a [FormProvider] instance.
  ///
  /// If we want to access an instance of `FormManagerA` which was provided higher up
  /// in the widget tree we can do so via:
  ///
  /// ```dart
  /// FormProvider.of<FormManagerA>(context)
  /// ```
  static T of<T extends FormManager>(BuildContext context) {
    try {
      return Provider.of<T>(context, listen: false);
    } on ProviderNotFoundException catch (e) {
      if (e.valueType != T) rethrow;
      throw FlutterError(
        '''
        FormProvider.of() called with a context that does not contain a FormManager of type $T.
        No ancestor could be found starting from the context that was passed to FormProvider.of<$T>().

        This can happen if the context you used comes from a widget above the FormProvider.

        The context used was: $context
        ''',
      );
    }
  }

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return InheritedProvider<T>(
      create: _create,
      dispose: _dispose,
      child: child,
      lazy: lazy,
    );
  }
}

/// Extends the `BuildContext` class with the ability
/// to perform a lookup based on a `Bloc` type.
extension FormProviderExtension on BuildContext {
  /// Performs a lookup using the `BuildContext` to obtain
  /// the nearest ancestor `FormManager` of type [C].
  ///
  /// Calling this method is equivalent to calling:
  ///
  /// ```dart
  /// FormProvider.of<C>(context)
  /// ```
  C form<C extends FormManager>() => FormProvider.of<C>(this);
}
