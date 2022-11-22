import 'dart:io';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro/services/exceptions.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

Future<Either<Exception, String>> addPlanningWS({required int professionalId, required DateTime day, DateTime? shouldStartAt, DateTime? startedAt, DateTime? shouldFinishAt, bool? monthly}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/plannings',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
      body: {
        'professional_id': professionalId.toString(),
        'establishment_id': Globals.params.currentEstablishmentID.toString(),
        'day': DateFormat("yyyy-MM-dd").format(day),
        if (shouldStartAt != null) 'should_start_at': DateFormat.Hm().format(shouldStartAt),
        if (startedAt != null) 'started_at': DateFormat.Hm().format(startedAt),
        if (shouldFinishAt != null) 'should_finish_at': DateFormat.Hm().format(shouldFinishAt),
        if (monthly != null) 'monthly': monthly ? "1" : "0",
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

Future<Either<Exception, String>> updatePlanningWS({required Planning planning, bool? monthly}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/planning/${planning.id}',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
      body: {
        'should_start_at': DateFormat.Hm().format(planning.shouldStartAt),
        'should_finish_at': DateFormat.Hm().format(planning.shouldFinishAt!),
        if (monthly != null) 'monthly': monthly ? "1" : "0",
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

Future<Either<Exception, String>> updatePlanningTimeWS({required int id, required DateTime startedAt, DateTime? finishedAt, DateTime? shouldFinishAt}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/planning/${id.toString()}/update_time',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
      body: {
        'started_at': DateFormat.Hm().format(startedAt),
        if (finishedAt != null) 'finished_at': DateFormat.Hm().format(finishedAt),
        if (shouldFinishAt != null) 'should_finish_at': DateFormat.Hm().format(shouldFinishAt),
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
