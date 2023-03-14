import 'package:dartz/dartz.dart';

extension DartzExtension<L, R> on Either<L, R> {
  R right() => fold((l) => throw StateError(l.toString()), (r) => r);
  L left() => fold((l) => l, (r) => throw StateError(r.toString()));
}
