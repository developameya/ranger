import 'package:antar/domain/core/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  const ValueObject();
  // Fields
  Either<ValueFailure<dynamic>, T> get value;

  /// This method returns the stored primitive data type by the object.
  /// Otherwise throws an [UnexpectedValueError].
  T get getPrimitive => value.fold(
        (failure) => throw UnexpectedValueError(failure),
        (value) => value,
      );

  @override
  List<Object?> get props => [value];
}
