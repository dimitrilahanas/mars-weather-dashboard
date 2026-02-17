class DataModel {
  final String label;
  final String data;

  const DataModel({
    required this.label,
    required this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      label: json['label'],
      data: json['data'],
    );
  }
}
