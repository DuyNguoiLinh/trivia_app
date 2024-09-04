import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_message_data_source.dart';

class FirestoreMessageDataSourceImpl implements FirestoreMessageDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


}