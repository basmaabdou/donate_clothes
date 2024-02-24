import 'package:flutter/material.dart';
import '../../shared/constants.dart';
class OrganizeDetailsWidget extends StatefulWidget {
  final void Function(String newText) onTitleTap;
  final void Function(String newText) onDesTap;
  final void Function(String newText) onImgTap;

  const OrganizeDetailsWidget({required this.onTitleTap, required this.onDesTap, required this.onImgTap});
  @override
  State<OrganizeDetailsWidget> createState() => _OrganizeDetailsWidgetState();
}

class _OrganizeDetailsWidgetState extends State<OrganizeDetailsWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTitleTap(isSelected ? 'Restoring family links' : 'The ICRC delegation in Egypt');
        widget.onDesTap(isSelected ?   '(Cairo, ICRC) The separation of family members can be one of the most difficult experiences that a person endures, as the loss of contact with loved ones and ignorance of their fate triggers immense suffering. Countless families are separated every year by armed conflicts, other violence and natural disasters, losing contact with each other, and in a state of uncertainty, anguish and grief.': ' promotes and ensures respect for international humanitarian law and facilitates ICRC operations around the world through dialogue with the government, multilateral organizations, civil society and diplomatic officials. She helps reconnect family members separated due to conflict, violence and migration, and works closely with the Egyptian Red Crescent and other partner organisations');
        widget.onImgTap(isSelected ? 'assets/images/nik.jpg' : 'assets/images/r1.png');
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.transparent,
            width: 2,
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/nik.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
