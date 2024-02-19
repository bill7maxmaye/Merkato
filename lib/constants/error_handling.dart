import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:merkato/constants/utils.dart";

void httpErrorHandler9({
  required http.Response response,
  required BuildContext context,
  required VoidCallBack onSuccess,
})

{
  switch(response.statusCode){
    case 200:
      onSuccess();
      break;
    case 404:
      showSnackBar(context, text)
      break;
    case 500:
      showSnackBar(context, text)
s      break;
    default:
      showSnackBar(context, text)
  }
}