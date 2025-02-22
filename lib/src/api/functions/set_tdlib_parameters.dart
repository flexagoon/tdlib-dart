import 'package:meta/meta.dart';

import '../extensions/data_class_extensions.dart';
import '../tdapi.dart';

/// Sets the parameters for TDLib initialization. Works only when the current
/// authorization state is authorizationStateWaitTdlibParameters
/// Returns [Ok]
@immutable
class SetTdlibParameters extends TdFunction {
  const SetTdlibParameters({
    this.useTestDc,
    this.databaseDirectory,
    this.filesDirectory,
    this.useFileDatabase,
    this.useChatInfoDatabase,
    this.useMessageDatabase,
    this.useSecretChats,
    required this.apiId,
    required this.apiHash,
    required this.systemLanguageCode,
    required this.deviceModel,
    this.systemVersion,
    required this.applicationVersion,
    this.enableStorageOptimizer,
    this.ignoreFileNames,
  });

  /// [useTestDc] Pass true to use Telegram test environment instead of the
  /// production environment
  final bool? useTestDc;

  /// [databaseDirectory] The path to the directory for the persistent database;
  /// if empty, the current working directory will be used
  final String? databaseDirectory;

  /// [filesDirectory] The path to the directory for storing files; if empty,
  /// database_directory will be used
  final String? filesDirectory;

  /// [useFileDatabase] Pass true to keep information about downloaded and
  /// uploaded files between application restarts
  final bool? useFileDatabase;

  /// [useChatInfoDatabase] Pass true to keep cache of users, basic groups,
  /// supergroups, channels and secret chats between restarts. Implies
  /// use_file_database
  final bool? useChatInfoDatabase;

  /// [useMessageDatabase] Pass true to keep cache of chats and messages between
  /// restarts. Implies use_chat_info_database
  final bool? useMessageDatabase;

  /// [useSecretChats] Pass true to enable support for secret chats
  final bool? useSecretChats;

  /// [apiId] Application identifier for Telegram API access, which can be
  /// obtained at https://my.telegram.org
  final int apiId;

  /// [apiHash] Application identifier hash for Telegram API access, which can
  /// be obtained at https://my.telegram.org
  final String apiHash;

  /// [systemLanguageCode] IETF language tag of the user's operating system
  /// language; must be non-empty
  final String systemLanguageCode;

  /// [deviceModel] Model of the device the application is being run on; must be
  /// non-empty
  final String deviceModel;

  /// [systemVersion] Version of the operating system the application is being
  /// run on. If empty, the version is automatically detected by TDLib
  final String? systemVersion;

  /// [applicationVersion] Application version; must be non-empty
  final String applicationVersion;

  /// [enableStorageOptimizer] Pass true to automatically delete old files in
  /// background
  final bool? enableStorageOptimizer;

  /// [ignoreFileNames] Pass true to ignore original file names for downloaded
  /// files. Otherwise, downloaded files are saved under names as close as
  /// possible to the original name
  final bool? ignoreFileNames;

  static const String constructor = 'setTdlibParameters';

  @override
  String getConstructor() => constructor;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'use_test_dc': useTestDc ?? false,
        'database_directory': databaseDirectory ?? '',
        'files_directory': filesDirectory ?? '',
        'use_file_database': useFileDatabase ?? false,
        'use_chat_info_database': useChatInfoDatabase ?? false,
        'use_message_database': useMessageDatabase ?? false,
        'use_secret_chats': useSecretChats ?? false,
        'api_id': apiId,
        'api_hash': apiHash,
        'system_language_code': systemLanguageCode,
        'device_model': deviceModel,
        'system_version': systemVersion ?? '',
        'application_version': applicationVersion,
        'enable_storage_optimizer': enableStorageOptimizer ?? false,
        'ignore_file_names': ignoreFileNames ?? false,
        '@type': constructor,
      };

  @override
  bool operator ==(Object other) => overriddenEquality(other);

  @override
  int get hashCode => overriddenHashCode;
}
