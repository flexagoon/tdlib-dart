import 'package:meta/meta.dart';
import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Contains full information about a user
@immutable
class UserFullInfo extends TdObject {
  const UserFullInfo({
    this.personalPhoto,
    this.photo,
    this.publicPhoto,
    required this.isBlocked,
    required this.canBeCalled,
    required this.supportsVideoCalls,
    required this.hasPrivateCalls,
    required this.hasPrivateForwards,
    required this.hasRestrictedVoiceAndVideoNoteMessages,
    required this.needPhoneNumberPrivacyException,
    this.bio,
    required this.premiumGiftOptions,
    required this.groupInCommonCount,
    this.botInfo,
  });

  /// [personalPhoto] User profile photo set by the current user for the
  /// contact; may be null. If null and user.profile_photo is null, then the
  /// photo is empty; otherwise, it is unknown. If non-null, then it is the same
  /// photo as in user.profile_photo and chat.photo. This photo isn't returned
  /// in the list of user photos
  final ChatPhoto? personalPhoto;

  /// [photo] User profile photo; may be null. If null and user.profile_photo is
  /// null, then the photo is empty; otherwise, it is unknown. If non-null and
  /// personal_photo is null, then it is the same photo as in user.profile_photo
  /// and chat.photo
  final ChatPhoto? photo;

  /// [publicPhoto] User profile photo visible if the main photo is hidden by
  /// privacy settings; may be null. If null and user.profile_photo is null,
  /// then the photo is empty; otherwise, it is unknown. If non-null and both
  /// photo and personal_photo are null, then it is the same photo as in
  /// user.profile_photo and chat.photo. This photo isn't returned in the list
  /// of user photos
  final ChatPhoto? publicPhoto;

  /// [isBlocked] True, if the user is blocked by the current user
  final bool isBlocked;

  /// [canBeCalled] True, if the user can be called
  final bool canBeCalled;

  /// [supportsVideoCalls] True, if a video call can be created with the user
  final bool supportsVideoCalls;

  /// [hasPrivateCalls] True, if the user can't be called due to their privacy
  /// settings
  final bool hasPrivateCalls;

  /// [hasPrivateForwards] True, if the user can't be linked in forwarded
  /// messages due to their privacy settings
  final bool hasPrivateForwards;

  /// [hasRestrictedVoiceAndVideoNoteMessages] True, if voice and video notes
  /// can't be sent or forwarded to the user
  final bool hasRestrictedVoiceAndVideoNoteMessages;

  /// [needPhoneNumberPrivacyException] True, if the current user needs to
  /// explicitly allow to share their phone number with the user when the method
  /// addContact is used
  final bool needPhoneNumberPrivacyException;

  /// [bio] A short user bio; may be null for bots
  final FormattedText? bio;

  /// [premiumGiftOptions] The list of available options for gifting Telegram
  /// Premium to the user
  final List<PremiumPaymentOption> premiumGiftOptions;

  /// [groupInCommonCount] Number of group chats where both the other user and
  /// the current user are a member; 0 for the current user
  final int groupInCommonCount;

  /// [botInfo] For bots, information about the bot; may be null
  final BotInfo? botInfo;

  static const String constructor = 'userFullInfo';

  static UserFullInfo? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return UserFullInfo(
      personalPhoto: ChatPhoto.fromJson(json['personal_photo']),
      photo: ChatPhoto.fromJson(json['photo']),
      publicPhoto: ChatPhoto.fromJson(json['public_photo']),
      isBlocked: json['is_blocked'],
      canBeCalled: json['can_be_called'],
      supportsVideoCalls: json['supports_video_calls'],
      hasPrivateCalls: json['has_private_calls'],
      hasPrivateForwards: json['has_private_forwards'],
      hasRestrictedVoiceAndVideoNoteMessages:
          json['has_restricted_voice_and_video_note_messages'],
      needPhoneNumberPrivacyException:
          json['need_phone_number_privacy_exception'],
      bio: FormattedText.fromJson(json['bio']),
      premiumGiftOptions: List<PremiumPaymentOption>.from(
          (json['premium_gift_options'] ?? [])
              .map((item) => PremiumPaymentOption.fromJson(item))
              .toList()),
      groupInCommonCount: json['group_in_common_count'],
      botInfo: BotInfo.fromJson(json['bot_info']),
    );
  }

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'personal_photo': personalPhoto?.toJson(),
        'photo': photo?.toJson(),
        'public_photo': publicPhoto?.toJson(),
        'is_blocked': isBlocked,
        'can_be_called': canBeCalled,
        'supports_video_calls': supportsVideoCalls,
        'has_private_calls': hasPrivateCalls,
        'has_private_forwards': hasPrivateForwards,
        'has_restricted_voice_and_video_note_messages':
            hasRestrictedVoiceAndVideoNoteMessages,
        'need_phone_number_privacy_exception': needPhoneNumberPrivacyException,
        'bio': bio?.toJson(),
        'premium_gift_options':
            premiumGiftOptions.map((item) => item.toJson()).toList(),
        'group_in_common_count': groupInCommonCount,
        'bot_info': botInfo?.toJson(),
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
