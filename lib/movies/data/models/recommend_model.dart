import 'package:clean_arch_course/movies/domain/entities/recommendation.dart';

class RecommendModel extends Recommendation {
  const RecommendModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendModel.fromJson(Map<String, dynamic> json) => RecommendModel(
        backdropPath: json['backdrop_path'] ?? "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
        id: json['id'],
      );
}
