import 'dart:io';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/exceptions.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Either<Exception, String>> updateScheduleWS({required int dayOfWeek, required int part, required String start, required String end}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/establishment/${Globals.profile.getEstablishment().id}/update_schedule',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
      body: {
        'day': dayOfWeek.toString(),
        'part': part.toString(),
        if (part == 1) 'begin': start,
        if (part == 1) 'ending': end,
        if (part == 2) 'second_begin': start,
        if (part == 2) 'second_end': end,
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
