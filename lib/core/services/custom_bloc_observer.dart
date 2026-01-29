import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

/// Custom BlocObserver to monitor all Bloc/Cubit events, transitions, and errors
class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    developer.log('onCreate -- ${bloc.runtimeType}', name: 'BlocObserver');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    developer.log(
      'onEvent -- ${bloc.runtimeType}, event: $event',
      name: 'BlocObserver',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    developer.log(
      'onChange -- ${bloc.runtimeType}\n'
      'currentState: ${change.currentState}\n'
      'nextState: ${change.nextState}',
      name: 'BlocObserver',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    developer.log(
      'onTransition -- ${bloc.runtimeType}\n'
      'event: ${transition.event}\n'
      'currentState: ${transition.currentState}\n'
      'nextState: ${transition.nextState}',
      name: 'BlocObserver',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    developer.log(
      'onError -- ${bloc.runtimeType}\n'
      'error: $error\n'
      'stackTrace: $stackTrace',
      name: 'BlocObserver',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    developer.log('onClose -- ${bloc.runtimeType}', name: 'BlocObserver');
  }
}
