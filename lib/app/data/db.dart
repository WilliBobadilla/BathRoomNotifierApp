import 'package:firebase_database/firebase_database.dart';

class FireBaseConnection {
  String refDB = "";
  late DatabaseReference ref;
  FireBaseConnection({refDB = ""}) {
    ref = FirebaseDatabase.instance.ref(refDB);
  }
  Future<DatabaseEvent> changesInDB() async {
    return await ref.once();
  }
}
