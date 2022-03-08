import 'failure.dart';

const serverFailureMessage = 'Server Failure';
const cacheFailureMessage = 'Cache Failure';

String reportFailure(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case CacheFailure:
      return cacheFailureMessage;
    default:
      return 'Unexpected Error';
  }
}
