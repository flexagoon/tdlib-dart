import '../tdapi.dart';

/// Clears draft messages in all chats
/// Returns [Ok]
class ClearAllDraftMessages extends TdFunction {
  ClearAllDraftMessages({required this.excludeSecretChats});

  /// [excludeSecretChats] If true, local draft messages in secret chats will
  /// not be cleared
  final bool excludeSecretChats;

  static const String CONSTRUCTOR = 'clearAllDraftMessages';

  @override
  String getConstructor() => CONSTRUCTOR;
  @override
  Map<String, dynamic> toJson() =>
      {'exclude_secret_chats': this.excludeSecretChats, '@type': CONSTRUCTOR};
}
