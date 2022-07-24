import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  const ValueObject();
  // Fields
  Either<ValueFailure<T>, T> get value;
  @override
  // TODO: implement props
  List<Object?> get props => [value];
}
