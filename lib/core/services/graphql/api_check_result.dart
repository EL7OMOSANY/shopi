// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_check_result.freezed.dart';

@Freezed()
abstract class ApiCheckResult<T> with _$ApiCheckResult<T> {
  const factory ApiCheckResult.success(T data) = Success<T>;
  const factory ApiCheckResult.failure(String errorHandler) = Failure<T>;
}
