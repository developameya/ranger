import 'package:antar/domain/core/failures.dart';
import 'package:dartz/dartz.dart';

Either<ValueFailure<String>, String> makeCaps(String input) =>
    right(input.toUpperCase());
