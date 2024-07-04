import 'package:comments_and_post/app/constants/api_endpoint.dart';
import 'package:comments_and_post/core/failure/failure.dart';
import 'package:comments_and_post/core/networking/http_service.dart';
import 'package:comments_and_post/features/photo/data/model/photos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final photoDataSourceProvider = Provider.autoDispose(
    (ref) => PhotoDataSource(ref.read(httpServiceProvider)));

class PhotoDataSource {
  final Dio _dio;
  PhotoDataSource(this._dio);
  Future<Either<Failure, List<Photos>>> getPhotos(int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.photos,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );
      final data = response.data as List;
      final photos = data.map((e) => Photos.fromJson(e)).toList();
      return Right(photos);
    } on DioException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }
}
