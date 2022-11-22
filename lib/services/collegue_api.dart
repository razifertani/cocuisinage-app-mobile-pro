import 'dart:io';
import 'package:cocuisinage_app_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro/services/exceptions.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Either<Exception, String>> sendInvitationLinkWS({required String firstName, required String lastName, required String phoneNumber, required String email, required int roleID}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/collegue/invite',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
      body: {
        'company_id': Globals.profile.companyId.toString(),
        'establishment_id': Globals.params.currentEstablishmentID.toString(),
        'role_id': roleID.toString(),
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'email': email,
      },
    );

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

Future<Either<Exception, String>> acceptInvitationLinkWS({required String invitationLink, required String password}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}${invitationLink.substring(invitationLink.indexOf('/collegue/'))}',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: {
        'password': password,
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
