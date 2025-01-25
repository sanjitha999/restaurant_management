import 'package:flutter/material.dart';
import 'package:resturant_management/modules/admins_list_screen/models/business_user_models.dart';
import 'package:resturant_management/theme/textstyle_consts.dart';

class UserDetailsScreen extends StatelessWidget {
  final BusinessUser user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(
                "Name", "${user.firstName ?? ''} ${user.lastName ?? ''}"),
            _buildDetailRow("Username", user.userName ?? "N/A"),
            _buildDetailRow("Mobile", user.mobileNumber?.toString() ?? "N/A"),
            _buildDetailRow("Gender", user.gender ?? "N/A"),
            _buildDetailRow("Date of Birth", user.dateOfBirth ?? "N/A"),
            _buildDetailRow("Roles", user.roles?.join(", ") ?? "N/A"),
            _buildDetailRow("Address", user.address ?? "N/A"),
            _buildDetailRow("Business Type", user.businessType ?? "N/A"),
            _buildDetailRow("Region", user.region ?? "N/A"),
            _buildDetailRow("Business ID", user.businessId ?? "N/A"),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyleConst.title,
          ),
          Expanded(
              child: Text(
            value,
            style: TextStyleConst.title,
          )),
        ],
      ),
    );
  }
}
