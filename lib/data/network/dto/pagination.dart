import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable(createToJson: false)
class Pagination {
  final int total;
  final int pages;
  final int page;
  final int limit;

  Pagination(this.total, this.pages, this.page, this.limit);

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
