import 'package:json_annotation/json_annotation.dart';
import 'package:wajve_coding_challenge/data/network/dto/pagination.dart';

part 'meta.g.dart';

@JsonSerializable(createToJson: false)
class Meta {
  final Pagination pagination;

  Meta(this.pagination);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
