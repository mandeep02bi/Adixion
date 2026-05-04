import 'package:doctor/Core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Core/widgets/custom_button.dart';
import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/medicine_model.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:flutter/material.dart';

class ContainerMedicen extends StatefulWidget {
  final VoidCallback? onAdded;
  final String? title;
  final String? nameOf;
  final String? labelQty; // Fixed typo
  final String? name;
  final String? qty;
  final String? labelFrequency; // Fixed typo
  final String? frequency;
  final String? labelRoute; // Fixed typo
  final String? route;
  final String? labelNoOfDay; // Fixed typo
  final String? noOfDay;
  final String? labelInstruction; // Fixed typo
  final String? instruction;
  final String? textButton; // Fixed typo
  final String? iconButton; // Fixed typo
  final bool showMedicineFields;
  final Widget? primaryCustomButton; // Renamed for clarity
  final Widget? secondaryCustomButton; // Added for the second button

  const ContainerMedicen({
    super.key,
    this.title,
    this.nameOf,
    this.onAdded,
    this.labelQty,
    this.name,
    this.qty,
    this.labelFrequency,
    this.frequency,
    this.labelRoute,
    this.route,
    this.labelNoOfDay,
    this.primaryCustomButton,
    this.secondaryCustomButton,
    this.noOfDay,
    this.labelInstruction,
    this.instruction,
    this.textButton,
    this.iconButton,
    this.showMedicineFields = true,
  });

  @override
  State<ContainerMedicen> createState() => _ContainerMedicenState();
}

class _ContainerMedicenState extends State<ContainerMedicen> {
  late final TextEditingController medicineNameController;
  late final TextEditingController qtyController;
  late final TextEditingController frequencyController;
  late final TextEditingController routeFormController;
  late final TextEditingController noOfDaysController;
  late final TextEditingController instructionController;
  late final TextEditingController commentsController;

  @override
  void initState() {
    super.initState();
    medicineNameController = TextEditingController();
    qtyController = TextEditingController();
    frequencyController = TextEditingController();
    routeFormController = TextEditingController();
    noOfDaysController = TextEditingController();
    instructionController = TextEditingController();
    commentsController = TextEditingController(); // Initialize
  }

  @override
  void dispose() {
    medicineNameController.dispose();
    qtyController.dispose();
    frequencyController.dispose();
    routeFormController.dispose();
    noOfDaysController.dispose();
    instructionController.dispose();
    commentsController.dispose(); // Dispose
    super.dispose();
  }

  Future<void> _onAddMedicine() async {
    if (medicineNameController.text.trim().isEmpty) return;

    final medicine = MedicineModel(
      medicineName: medicineNameController.text.trim(),
      qty: qtyController.text.trim(),
      frequency: frequencyController.text.trim(),
      routeForm: routeFormController.text.trim(),
      noOfDays: noOfDaysController.text.trim(),
      instruction: instructionController.text.trim(),
      type: widget.showMedicineFields ? 'medicine' : 'lab',
    );

    await MedicineDatabase.instance.insertMedicine(medicine);

    medicineNameController.clear();
    qtyController.clear();
    frequencyController.clear();
    routeFormController.clear();
    noOfDaysController.clear();
    instructionController.clear();
    commentsController.clear();

    // استدعاء الريفرش للصفحة الأب عشان الدوا الجديد يظهر فوراً
    if (widget.onAdded != null) {
      widget.onAdded!();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        // Title
        Text(
          widget.title ?? "Add Medicine",
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.nameOf ?? "Name of Medicine / Product",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: ColorApp.labelColor,
                fontSize: 14,
              ),
            ),
            if (widget.showMedicineFields)
              Text(
                widget.labelQty ?? "T.Qty",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: ColorApp.labelColor,
                  fontSize: 14,
                ),
              ),
          ],
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              flex: widget.showMedicineFields ? 2 : 1,
              child: CustomFormField(
                controller: medicineNameController,
                label: '',
                hint: widget.name ?? 'Medicine Name',
                icon: ImageAssets.stethoscope,
                fieldFillColor: const Color(0xFFF9FCFF),
                widthIcon: 18,
                heightIcon: 18,
              ),
            ),
            if (widget.showMedicineFields) ...[
              const SizedBox(width: 10),
              Expanded(
                child: CustomFormField(
                  controller: qtyController,
                  label: '',
                  hint: widget.qty ?? 'Qty',
                  fieldFillColor: const Color(0xFFF9FCFF),
                ),
              ),
            ],
          ],
        ),

        const SizedBox(height: 20),

        if (widget.showMedicineFields) ...[
          Row(
            children: [
              Expanded(
                child: CustomFormField(
                  controller: frequencyController,
                  label: widget.labelFrequency ?? 'Frequency',
                  hint: widget.frequency ?? 'e.g., 1x/day', // Replaced '170'
                  icon:
                      ImageAssets.heightPrescription, // Consider changing icon
                  widthIcon: 16,
                  heightIcon: 16,
                  fieldFillColor: ColorApp.scaffoldColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomFormField(
                  controller: routeFormController,
                  label: widget.labelRoute ?? 'Route/Form',
                  hint: widget.route ?? 'e.g., Oral', // Replaced '65'
                  icon: ImageAssets.weight, // Consider changing icon
                  widthIcon: 16,
                  heightIcon: 16,
                  fieldFillColor: ColorApp.scaffoldColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: CustomFormField(
                  controller: noOfDaysController,
                  label: widget.labelNoOfDay ?? 'No of Days',
                  hint: widget.noOfDay ?? 'e.g., 7', // Replaced '170'
                  icon: ImageAssets.heightPrescription,
                  widthIcon: 16,
                  heightIcon: 16,
                  fieldFillColor: ColorApp.scaffoldColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomFormField(
                  controller: instructionController,
                  label: widget.labelInstruction ?? 'Instruction',
                  hint:
                      widget.instruction ??
                      'e.g., After meals', // Replaced '65'
                  icon: ImageAssets.weight,
                  widthIcon: 16,
                  heightIcon: 16,
                  fieldFillColor: ColorApp.scaffoldColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],

        const SizedBox(height: 15),

        CustomFormField(
          controller: commentsController, // Now capturing the data!
          label: 'Additional Comments',
          hint: "Add instructions, follow-up advice, restrictions...",
          hintStyle: TextStyle(fontSize: 12, color: ColorApp.labelColor),
          keyboardType: TextInputType.multiline,
          fieldFillColor: const Color(0xFFF9FCFF),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child:
                  widget.primaryCustomButton ??
                  CustomButton(
                    height: 60,
                    width: 150,
                    onPressed: _onAddMedicine,
                    text: 'Save and Add',
                    textStyle: TextStyle(
                      fontSize: 12,
                      color: ColorApp.textColor,
                    ),
                    border: Border.all(color: ColorApp.textColor, width: 1),
                    buttonColor: ColorApp.scaffoldColor,
                    icon: ImageAssets.drft,
                  ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child:
                  widget.secondaryCustomButton ??
                  CustomButton(
                    height: 60,
                    width: 150,
                    onPressed: () {},
                    text: 'Choose Template',
                    icon: ImageAssets.drft,
                    textStyle: TextStyle(
                      fontSize: 12,
                      color: ColorApp.textColor,
                    ),
                    border: Border.all(color: ColorApp.textColor, width: 1),
                    buttonColor: ColorApp.scaffoldColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
