part of 'models.dart';

List dkolfromjson(String str) => List.from(json.decode(str));

String dkoltojson(DPCreateData data) => json.encode(data.toJson());

class DKolCreateData {
  String judulbuku;
  String descbuku;
  String penulisbuku;
  String penerbitbuku;
  String tahunbuku;
  int nokategori;
  String namakategori;
  DKolCreateData({
    this.judulbuku,
    this.descbuku,
    this.penulisbuku,
    this.penerbitbuku,
    this.tahunbuku,
    this.nokategori,
  });
  Map toJson() => {
    "judulbuku" : judulbuku,
    "descbuku" : descbuku,
    "penulisbuku": penulisbuku,
    "penerbitbuku": penerbitbuku,
    "tahunbuku": tahunbuku,
    "nokategori" : nokategori,
    "namakategori" : namakategori
};
}

class DKolReadData{
  Future getdatakoleksi() async {
    try {
      http.Response hasildata = await http
      .get(Uri.parse("https://lspperpus.000webhostapp.com/readkoleksikategori.php"), headers: {"Accept": "application/json", "Access-Control_Allow_Origin": "*"});
      if (hasildata.statusCode == 200){
        print("data koleksi berhasil ditampilkan");
        final data = dpfromjson(hasildata.body);
        return data;
      } else {
        print("error :" + hasildata.statusCode.toString());
        return null;
      }
    } catch (e){
      print ("error catch $e");
      return null;
    }
  }
}
