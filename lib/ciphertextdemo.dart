import 'dart:convert';
import 'dart:io';
import 'package:encrypt/encrypt_io.dart';
import 'package:path/path.dart' as p;
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

Future<String> getCiphertext(User user) async {
  final filepath = p.join(Directory.current.path, "key", "public.pem");
  final publicKey = await parseKeyFromFile<RSAPublicKey>(filepath);
  final encrypter = Encrypter(RSA(publicKey: publicKey));
  return encrypter.encrypt(jsonEncode(user)).base64;
}

class User {
  String userid = "";
  String password = "";
  String exp = "";
  User(this.userid, this.password, this.exp);
  Map toJson() => {'userid': userid, 'password': password, 'exp': exp};
}
