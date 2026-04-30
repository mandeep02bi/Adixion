class MedicineModel {
  final int? id;
  final String medicineName;
  final String qty;
  final String frequency;
  final String routeForm;
  final String noOfDays;
  final String instruction;
    final String type;


  MedicineModel({
    this.id,
    required this.medicineName,
    required this.qty,
    required this.frequency,
    required this.routeForm,
    required this.noOfDays,
    required this.instruction,
    this.type = 'medicine',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medicine_name': medicineName,
      'qty': qty,
      'frequency': frequency,
      'route_form': routeForm,
      'no_of_days': noOfDays,
      'instruction': instruction,
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic> map) {
    return MedicineModel(
      id: map['id'],
      medicineName: map['medicine_name'],
      qty: map['qty'],
      frequency: map['frequency'],
      routeForm: map['route_form'],
      noOfDays: map['no_of_days'],
      instruction: map['instruction'],
    );
  }
}