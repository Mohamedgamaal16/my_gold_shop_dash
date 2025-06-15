import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportsFilterHeader extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final String selectedReportType;
  final List<String> reportTypes;
  final ValueChanged<DateTime> onStartDateChanged;
  final ValueChanged<DateTime> onEndDateChanged;
  final ValueChanged<String?>? onReportTypeChanged;
  final VoidCallback onApplyFilter;

  const ReportsFilterHeader({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.selectedReportType,
    required this.reportTypes,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.onReportTypeChanged,
    required this.onApplyFilter,
  }) : super(key: key);

  Future<void> _pickDate(BuildContext context, DateTime? initialDate, ValueChanged<DateTime> onDateSelected) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 5);
    final DateTime lastDate = DateTime(now.year + 5);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0D2E2B));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                _buildFixedDateField(
                  context,
                  label: 'Start Date',
                  date: startDate,
                  onDateSelected: onStartDateChanged,
                ),
                const SizedBox(width: 16),
                _buildFixedDateField(
                  context,
                  label: 'End Date',
                  date: endDate,
                  onDateSelected: onEndDateChanged,
                ),
                const SizedBox(width: 16),
                _buildFixedDropdown(),
              ],
            ),
            SizedBox(
              height: 63,
              width: 191,
              child: ElevatedButton.icon(
                onPressed: onApplyFilter,
                icon: const Icon(Icons.filter_alt, size: 18),
                label: const Text('Apply Filter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D4D45),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFixedDateField(
      BuildContext context, {
        required String label,
        required DateTime? date,
        required ValueChanged<DateTime> onDateSelected,
      }) {
    final formattedDate = date != null ? DateFormat('MM/dd/yyyy').format(date) : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0D2E2B))),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _pickDate(context, date, onDateSelected),
          child: Container(
            height: 63,
            width: 191,
            padding: const EdgeInsets.symmetric(horizontal: 23),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFBDBDBD)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate.isNotEmpty ? formattedDate : 'Select Date',
                  style: const TextStyle(fontSize: 16, color: Color(0xFF0D2E2B)),
                ),
                const Icon(Icons.calendar_today_outlined, size: 18, color: Color(0xFF0D2E2B)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFixedDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Report Type', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0D2E2B))),
        const SizedBox(height: 8),
        Container(
          height: 63,
          width: 191,
          padding: const EdgeInsets.symmetric(horizontal: 23),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFBDBDBD)),
          ),
          child: DropdownButton<String>(
            value: selectedReportType,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF0D2E2B)),
            underline: const SizedBox(),
            onChanged: onReportTypeChanged,
            items: reportTypes.map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(fontSize: 16)),
              ),
            ).toList(),
          ),
        ),
      ],
    );
  }
}
