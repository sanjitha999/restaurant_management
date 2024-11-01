import 'package:flutter/material.dart';
import 'package:resturant_management/modules/license_upload/model/license_enum.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';
import 'package:resturant_management/theme/spacing.dart';

class LicenseUploadWidget extends StatefulWidget {
  final LicenseCertificates license;
  final bool isUploaded;
  final void Function() onTap;
  final void Function(String) onTextChange;

  const LicenseUploadWidget({
    super.key,
    required this.license,
    required this.isUploaded,
    required this.onTap,
    required this.onTextChange,
  });

  @override
  State<LicenseUploadWidget> createState() => _LicenseUploadWidgetState();
}

class _LicenseUploadWidgetState extends State<LicenseUploadWidget> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: _buildNameField(),
            // child: Text(
            //   '${widget.license.name}:',
            //   style: const TextStyle(
            //     fontSize: FontSize.title,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
          ),
          SizedBoxSpacing.width10,
          Row(
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.all(
                      RadialDimensions.radius12,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14),
                    child: Center(child: Text("Upload")),
                  ),
                ),
              ),
              SizedBoxSpacing.width5,
              Icon(
                widget.isUploaded
                    ? Icons.check_circle
                    : Icons.file_upload_outlined,
                size: 30,
                color: widget.isUploaded
                    ? AppColors.successGreen
                    : AppColors.shadowGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: widget.license.name,
        labelStyle: const TextStyle(
          fontSize: FontSize.title,
          fontWeight: FontWeight.w500,
        ),
      ),
      onChanged: widget.onTextChange,
    );
  }
}
