import 'package:comments_and_post/app/constants/api_endpoint.dart';
import 'package:comments_and_post/core/failure/failure.dart';
import 'package:comments_and_post/core/networking/http_service.dart';
import 'package:comments_and_post/features/comments/data/model/comments.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final commentDataSourceProvider = Provider<CommentDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  return CommentDataSource(dio);
});

class CommentDataSource {
  final Dio _dio;
  CommentDataSource(this._dio);

  // get data from post with pagination
  Future<Either<Failure, List<Comments>>> getComments(int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.comments,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );
      final data = response.data as List;
      final posts = data.map((e) => Comments.fromJson(e)).toList();
      return Right(posts);
    } on DioException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }
}
