import 'package:get/get.dart';

class StartMatchandUpdateRoomCodeController extends GetxController{
  bool isLoading = false;

bool iWonCheckValue = false;
bool iLossCheckValue = false;
bool cancelCheckValue = false;

  onTapIWonCheckBox(bool? v) {
     iWonCheckValue = v??false;
     iLossCheckValue = false;
     cancelCheckValue = false;
     update();
  } onTapILossCheckBox(bool? v) {
    iLossCheckValue = v??false;

      iWonCheckValue = false;
    cancelCheckValue = false;
     update();
  } onTapCancelCheckBox(bool? v) {
    cancelCheckValue = v??false;
    iLossCheckValue = false;
    iWonCheckValue = false;
     update();
  }


  ///Reason dropdown
  String reasonDropdownValue = "No Room Code";
  List<String> reasonDropdownList = <String>[
    "No Room Code",
    "Opponent Cheating",
    "Opponent Uploaded Wrong Result",
    "Other",
  ];

  onTapReasonDropDown({String? value}) {

  }
}