import '../database.dart';

class TarefasListTable extends SupabaseTable<TarefasListRow> {
  @override
  String get tableName => 'TarefasList';

  @override
  TarefasListRow createRow(Map<String, dynamic> data) => TarefasListRow(data);
}

class TarefasListRow extends SupabaseDataRow {
  TarefasListRow(super.data);

  @override
  SupabaseTable get table => TarefasListTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);
}
