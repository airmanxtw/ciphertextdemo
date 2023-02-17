import 'package:ciphertextdemo/ciphertextdemo.dart';
import 'package:intl/intl.dart';

void main(List<String> arguments) {
  final DateFormat formatter = DateFormat('yyyyMMddHHmm');
  final String exp = formatter.format(DateTime.now().add(Duration(minutes: 3)));
  User user = User("user1", "user1password", exp);
  getCiphertext(user).then((ciphertext) {
    print(ciphertext);
  });
}
