// import 'package:comments_and_post/app/constants/api_endpoint.dart';
// import 'package:comments_and_post/core/failure/failure.dart';
// import 'package:comments_and_post/core/networking/http_service.dart';
// import 'package:comments_and_post/features/post/data/model/post.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final postDataSourceProvider = Provider.autoDispose(
//     (ref) => PostDataSource(ref.read(httpServiceProvider)));

// class PostDataSource{
//    final Dio _dio;
//   PostDataSource(this._dio);
//   Future<Either<Failure, List<Post>>> getPosts(int page) async {
//     try {
//       final response = await _dio.get(
//         ApiEndpoints.photos,
//         queryParameters: {
//           '_page': page,
//           '_limit': ApiEndpoints.limitPage,
//         },
//       );
//       final data = response.data as List;
//       final photos = data.map((e) => Post.fromJson(e)).toList();
//       return Right(photos);
//     } on DioException catch (e) {
//       return Left(Failure(message: e.message.toString()));
//     }
//   }


// }