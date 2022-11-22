import 'dart:io';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/exceptions.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Either<Exception, String>> addTaskWS(
    {required int collegueID,
    required int planningID,
    required String taskName}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/tasks',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
      body: {
        'professional_id': collegueID.toString(),
        'establishment_id': Globals.params.currentEstablishmentID.toString(),
        'planning_id': planningID.toString(),
        'name': taskName,
        'status': '0',
      },
    );

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        Globals.profile = await getUserWS();

        return Right(json.decode(response.body)['message']);
      } else {
        return Left(
            ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}

Future<Either<Exception, String>> updateTaskWS(
    {required int collegueID,
    required int id,
    int? status,
    String? comment,
    File? image}) async {
  try {
    http.Response response;

    if (image != null) {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Globals.baseUrl}/tasks/${id.toString()}'))
        ..headers.addAll({
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
          HttpHeaders.contentTypeHeader: 'multipart/form-data',
        })
        ..fields.addAll({
          'professional_id': collegueID.toString(),
          'establishment_id': Globals.params.currentEstablishmentID.toString(),
          'planning_id': id.toString(),
          if (status != null) 'status': status.toString(),
          if (comment != null) 'comment': comment,
        })
        ..files.add(
          await http.MultipartFile.fromPath('image', image.path),
        );

      var streamedResponse = await request.send();
      response = await http.Response.fromStream(streamedResponse);
    } else {
      response = await http.post(
        Uri.parse('${Globals.baseUrl}/tasks/${id.toString()}'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
        },
        body: {
          'professional_id': collegueID.toString(),
          'establishment_id': Globals.params.currentEstablishmentID.toString(),
          if (status != null) 'status': status.toString(),
          if (comment != null) 'comment': comment,
        },
      );
    }

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        Globals.profile = await getUserWS();

        return Right(json.decode(response.body)['message']);
      } else {
        return Left(
            ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}
