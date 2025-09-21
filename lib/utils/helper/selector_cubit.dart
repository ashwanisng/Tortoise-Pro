import 'package:bloc/bloc.dart';

class SelectorCubit<T> extends Cubit<T> {
  SelectorCubit({required T initial}) : super(initial);

  void select(T value) {
    if (value != state) emit(value);
  }

  void selectAt(List<T> options, int index) {
    if (index < 0 || index >= options.length) {
      throw RangeError.index(index, options, 'index');
    }
    select(options[index]);
  }

  void clear(T fallback) => emit(fallback);

  bool isSelected(T value) => value == state;
}
