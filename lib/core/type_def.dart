import 'package:fpdart/fpdart.dart';

import 'failure/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureEitherVoid = FutureEither<void>;
