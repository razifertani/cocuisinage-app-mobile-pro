import 'dart:io';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro/models/profile.dart';
import 'package:cocuisinage_app_mobile_pro/services/exceptions.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<Config> configWS() async {
  final response = await http.get(
    Uri.parse(
      '${Globals.baseUrl}/config/mobile',
    ),
    headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
    },
  );

  if (response.statusCode == 200) {
    List<Role> roles = [];
    json.decode(response.body)['roles'].forEach((v) {
      roles.add(new Role.fromJson(v));
    });

    List<Permission> permissions = [];
    json.decode(response.body)['permissions'].forEach((v) {
      permissions.add(new Permission.fromJson(v));
    });

    return Config(roles: roles, permissions: permissions);
  } else {
    return Config(roles: [], permissions: []);
  }
}

Future<Either<Exception, bool>> loginWS({required String email, required String password}) async {
  try {
    final response = await http.post(
        Uri.parse(
          '${Globals.baseUrl}/login',
        ),
        body: {
          'email': email,
          'password': password,
        });

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        Globals.token = json.decode(response.body)['token'];

        Globals.profile = await getUserWS();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('rememberMe', true);
        prefs.setString('email', email);
        prefs.setString('password', password);

        return Right(true);
      } else {
        return Left(ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}

Future<Either<Exception, String>> registerWS({required String ownerEmail, required String ownerFirstName, required String ownerLastName, required String ownerPassword, required String companyName, required String companyEmail, required String companyPhoneNumber, required String companyRib, required String companySiret}) async {
  try {
    var response = await http.post(
      Uri.parse('${Globals.baseUrl}/register'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: {
        'owner_email': ownerEmail,
        'owner_first_name': ownerFirstName,
        'owner_last_name': ownerLastName,
        'owner_password': ownerPassword,
        'company_name': companyName,
        'company_email': companyEmail,
        'company_phone_number': companyPhoneNumber,
        'company_rib': companyRib,
        'company_siret': companySiret,
      },
    );

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        return Right(json.decode(response.body)['message']);
      } else {
        return Left(ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}

Future<Profile> getUserWS() async {
  try {
    final response = await http.get(
      Uri.parse(
        '${Globals.baseUrl}/user',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
    );

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        Profile profile = Profile.fromJson(json.decode(response.body)['data']);

        Globals.config = await configWS();

        return profile;
      } else {
        throw ApiException(message: json.decode(response.body)['error']);
      }
    } else {
      throw ApiException(message: response.statusCode.toString());
    }
  } catch (e) {
    print(e);
    throw ApiException(message: e.toString());
  }
}

Future<Either<Exception, String>> updateProfileWS({required int professionalID, File? image, String? firstName, String? lastName, String? email, String? phoneNumber, String? password, String? newPassword, String? fcmToken}) async {
  try {
    http.Response response;

    if (image != null) {
      var request = http.MultipartRequest('POST', Uri.parse('${Globals.baseUrl}/user/$professionalID'))
        ..headers.addAll({
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
          HttpHeaders.contentTypeHeader: 'multipart/form-data',
        })
        ..fields.addAll({
          "establishment_id": Globals.params.currentEstablishmentID.toString(),
          "first_name": firstName ?? Globals.profile.firstName,
          "last_name": lastName ?? Globals.profile.lastName,
          "email": email ?? Globals.profile.email,
          "phone_number": phoneNumber ?? Globals.profile.phoneNumber ?? "",
          "fcm_token": fcmToken ?? Globals.profile.fcmToken ?? "",
          if (password != null) "password": password,
          if (newPassword != null) "new_password": newPassword,
        })
        ..files.add(
          await http.MultipartFile.fromPath('image', image.path),
        );

      var streamedResponse = await request.send();
      response = await http.Response.fromStream(streamedResponse);
    } else {
      response = await http.post(
        Uri.parse('${Globals.baseUrl}/user/$professionalID'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
        },
        body: {
          "establishment_id": Globals.params.currentEstablishmentID.toString(),
          "first_name": firstName ?? Globals.profile.firstName,
          "last_name": lastName ?? Globals.profile.lastName,
          "email": email ?? Globals.profile.email,
          "phone_number": phoneNumber ?? Globals.profile.phoneNumber ?? "",
          "fcm_token": fcmToken ?? Globals.profile.fcmToken ?? "",
          if (password != null) "password": password,
          if (newPassword != null) "new_password": newPassword,
        },
      );
    }

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        Globals.profile = await getUserWS();
        return Right(json.decode(response.body)['message']);
      } else {
        return Left(ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}

Future<Either<Exception, String>> sendResetPasswordLinkWS({required String email}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/password/email',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: {
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        return Right(json.decode(response.body)['message']);
      } else {
        return Left(ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}

Future<Either<Exception, String>> verifyCodeWS({required String email, required String token}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/password/verify_code',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: {
        'email': email,
        'token': token,
      },
    );

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        return Right(json.decode(response.body)['message']);
      } else {
        return Left(ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}

Future<Either<Exception, String>> resetPasswordWS({required String email, required String token, required String password}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/password/reset',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: {
        'email': email,
        'token': token,
        'password': password,
        'password_confirmation': password,
      },
    );

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        return Right(json.decode(response.body)['message']);
      } else {
        return Left(ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}

Future<Either<Exception, bool>> logoutWS() async {
  try {
    final response = await http.get(
        Uri.parse(
          '${Globals.baseUrl}/logout',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Globals.token}',
        });

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();

        return Right(true);
      } else {
        return Left(ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}
