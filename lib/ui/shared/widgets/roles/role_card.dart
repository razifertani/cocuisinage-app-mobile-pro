import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/roles/modifier_role_popup.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';

class RoleCard extends StatefulWidget {
  final Role role;
  const RoleCard({Key? key, required this.role}) : super(key: key);

  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Row(
            children: [
              Text(
                widget.role.name,
                style: MyTextStyles.headline,
              ),
              Spacer(),
              if (Globals.profile.isOwner)
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ModifierRolePopup(role: widget.role);
                      },
                    ).then((value) => setState(() => {}));
                  },
                  child: Image.asset("assets/haccp_icons/pencil-cercled.png"),
                ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
