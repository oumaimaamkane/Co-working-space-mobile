import 'package:coworking_space_mobile/config/services/user_infos.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';

class UpdateProfileViewModel {
  Future<void> updateProfile(UserModel updatedUser) async {
    await UserInfos().updateUserInfo('userId', updatedUser.toMap());
  }
}
