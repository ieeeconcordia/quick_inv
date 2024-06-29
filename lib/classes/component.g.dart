// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      id: json['id'] as String,
      generalLocation: json['generalLocation'] as String,
      generalSubLocation: json['generalSubLocation'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitaryPrice: (json['unitaryPrice'] as num).toDouble(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      pictureUrl: json['pictureUrl'] as String,
      specs: Map<String, String>.from(json['specs'] as Map),
      datasheetUrl: json['datasheetUrl'] as String,
    );

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'id': instance.id,
      'generalLocation': instance.generalLocation,
      'generalSubLocation': instance.generalSubLocation,
      'quantity': instance.quantity,
      'unitaryPrice': instance.unitaryPrice,
      'tags': instance.tags,
      'pictureUrl': instance.pictureUrl,
      'specs': instance.specs,
      'datasheetUrl': instance.datasheetUrl,
    };
