import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure() = _ValueFailure<T>;
  const factory ValueFailure.length({required LengthValueFailure<T> failure}) =
      _Length<T>;
  const factory ValueFailure.stringLength(
      {required StringLengthFailure<T> failure}) = _StringLength;
}

@freezed
abstract class LengthValueFailure<T> with _$LengthValueFailure<T> {
  const factory LengthValueFailure({required T failedValue}) =
      _LengthValueFailure<T>;
}

@freezed
abstract class StringLengthFailure<T> with _$StringLengthFailure<T> {
  const factory StringLengthFailure({required T failedValue}) =
      _StringLengthFailure;
}
