import 'dart:io';
import 'package:cocuisinage_app_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro/services/exceptions.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Either<Exception, String>> addEstablishmentWS({required File image, required String name, required String city, required String longitude, required String latitude}) async {
  try {
    var request = http.MultipartRequest('POST', Uri.parse('${Globals.baseUrl}/establishments'))
      ..headers.addAll({
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
        HttpHeaders.contentTypeHeader: 'multipart/form-data',
      })
      ..fields.addAll({
        'company_id': Globals.profile.companyId.toString(),
        'name': name,
        'city': city,
        'longitude': longitude,
        'latitude': latitude,
      })
      ..files.add(
        await http.MultipartFile.fromPath('image', image.path),
      );

    var streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);

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

Future<Either<Exception, String>> updateEstablishmentWS({
  required int establishmentID,
  File? image,
  required String name,
  required String city,
  // required String longitude,
  // required String latitude,
}) async {
  try {
    http.Response response;

    if (image != null) {
      var request = http.MultipartRequest('POST', Uri.parse('${Globals.baseUrl}/establishment/${establishmentID.toString()}'))
        ..headers.addAll({
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
          HttpHeaders.contentTypeHeader: 'multipart/form-data',
        })
        ..fields.addAll({
          'company_id': Globals.profile.companyId.toString(),
          'name': name,
          'city': city,
          // 'longitude': longitude,
          // 'latitude': latitude,
        })
        ..files.add(
          await http.MultipartFile.fromPath('image', image.path),
        );

      var streamedResponse = await request.send();
      response = await http.Response.fromStream(streamedResponse);
    } else {
      response = await http.post(
          Uri.parse(
            '${Globals.baseUrl}/establishment/${establishmentID.toString()}',
          ),
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
          },
          body: {
            'company_id': Globals.profile.companyId.toString(),
            'name': name,
            'city': city,
            // 'longitude': longitude,
            // 'latitude': latitude,
          });
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

Future<Either<Exception, String>> deleteEstablishmentWS({required int establishmentID}) async {
  try {
    final response = await http.delete(
      Uri.parse(
        '${Globals.baseUrl}/establishment/$establishmentID',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
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
