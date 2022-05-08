part of 'models.dart';

List dpfromjson(String str) => List.from(json.decode(str));

String dptojson(DPCreateData data) => json.encode(data.toJson());

class DPCreateData{
  String namapeminjam;
  int nomorbuku;
  String tanggalpinjam;
  String tanggalkembali;
  //String judulbuku;
  DPCreateData({
    this.namapeminjam,
    this.nomorbuku,
    this.tanggalpinjam,
    this.tanggalkembali,
    //this.judulbuku
  });
  Map toJson() => {
    "namapeminjam" : namapeminjam,
    "nomorbuku" : nomorbuku,
    "tanggalpinjam": tanggalpinjam,
    "tanggalkembali" : tanggalkembali,
    //"judulbuku": judulbuku
};
}

class DPReadData{
  Future getdatapeminjam() async {
    try {
      http.Response hasildata = await http
      .get(Uri.parse("https://lspperpus.000webhostapp.com/readdatapeminjamkoleksi.php"), headers: {"Accept": "application/json", "Access-Control_Allow_Origin": "*"});
      if (hasildata.statusCode == 200){
        print("data peminjam berhasil ditampilkan");
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
  Future postdatapeminjam(body) async {
    try {
      http.Response hasildata = await http
      .post(Uri.parse("https://lspperpus.000webhostapp.com/createdatapeminjam.php"), body: body, headers: {"Accept": "application/json", "Access-Control_Allow_Origin": "*"});
      if (hasildata.statusCode == 200){
        print("data peminjam berhasil ditampilkan");
        //final data = dpfromjson(hasildata.body);
        return true;
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