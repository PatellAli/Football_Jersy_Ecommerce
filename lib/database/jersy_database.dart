import 'package:football_jersy_ecommerce/database/jersy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JersyDatabase {
  final database = Supabase.instance.client.from('Jersy_info');

//READ
  final stream = Supabase.instance.client.from('Jersy_info').stream(
    primaryKey: ['id'],
  ).map((data) => data.map((Jmap) => Jersy.fromMap(Jmap)).toList());
}
