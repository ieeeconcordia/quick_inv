import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

part 'component.g.dart';

@JsonSerializable()
class Component {
  final String id;
  final String generalLocation;
  final String generalSubLocation;
  final int quantity;
  final double unitaryPrice;
  final List<String> tags;
  final String pictureUrl;
  final Map<String, String> specs;
  final String datasheetUrl;

  Component({
    required this.id,
    required this.generalLocation,
    required this.generalSubLocation,
    required this.quantity,
    required this.unitaryPrice,
    required this.tags,
    required this.pictureUrl,
    required this.specs,
    required this.datasheetUrl,
  });

  factory Component.fromRecord(RecordModel record) => Component.fromJson(record.toJson());
  factory Component.fromJson(Map<String, dynamic> json) => _$ComponentFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}
