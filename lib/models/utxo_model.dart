import 'package:defi_wallet/utils/convert.dart';
import 'package:defichaindart/defichaindart.dart';

class UtxoModel {
  int? mintIndex;
  String? mintTxId;
  String? address;
  int? value;
  ECPair? keyPair;

  UtxoModel(
      {this.mintIndex,
        this.mintTxId,
        this.address,
        this.value,
        this.keyPair});

  UtxoModel.fromJson(Map<String, dynamic> json) {
    this.mintTxId = json["vout"]['txid'];
    this.mintIndex = json["vout"]['n'];
    this.address = json["address"];
    this.value = convertToSatoshi(double.parse(json["vout"]["value"]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["mintIndex"] = this.mintIndex;
    data["mintTxId"] = this.mintTxId;
    data["address"] = this.address;
    data["value"] = convertFromSatoshi(this.value!);
    return data;
  }
}
