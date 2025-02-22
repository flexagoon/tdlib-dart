import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// A token for BlackBerry Push Service
@immutable
class DeviceTokenBlackBerryPush extends DeviceToken {
  const DeviceTokenBlackBerryPush({
    required this.token,
  });

  /// [token] Token; may be empty to deregister a device
  final String token;

  static const String constructor = 'deviceTokenBlackBerryPush';

  static DeviceTokenBlackBerryPush? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return DeviceTokenBlackBerryPush(
      token: json['token'],
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
