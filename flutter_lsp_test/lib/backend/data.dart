part of 'models.dart';

class Koleksi {
  int bukuid;
  String judulbuku;
  String deskripsibuku;
  String penulisbuku;
  String penerbitbuku;
  int tahunbuku;
  int nokategori;
  Koleksi({
    this.bukuid,
    this.judulbuku,
    this.deskripsibuku,
    this.penulisbuku,
    this.penerbitbuku,
    this.tahunbuku,
    this.nokategori
  });
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'buku_id': bukuid,
      'judulbuku': judulbuku,
      'deskripsibuku': deskripsibuku,
      'penulisbuku' : penulisbuku,
      'penerbitbuku' :penerbitbuku,
      'tahunbuku' : tahunbuku,
      'nokategori' : nokategori
    };
    return map;
  }
  Koleksi.fromMap(Map<String, dynamic> map) {
      bukuid = map['buku_id'];
      judulbuku = map['judulbuku'];
      deskripsibuku = map['deskripsibuku'];
      penulisbuku = map['penulisbuku'];
      penerbitbuku = map['penerbitbuku'];
      tahunbuku = map['tahunbuku'];
      nokategori = map['nokategori'];
  }
}

class Kategori {
  int kategoriid;
  String namakategori;

  Map<String, dynamic> toMap() {
    return {
      'kategoriid': kategoriid,
      'namakategori': namakategori,
    };
  }

  Kategori.fromMap(Map<String, dynamic> map) {
      kategoriid: map['kategoriid'];
      namakategori: map['namakategori'];
  }

  String toJson() => json.encode(toMap());

  factory Kategori.fromJson(String source) => Kategori.fromMap(json.decode(source));
}

class Peminjam {
  int userid;
  String namapeminjam;
  int nomorbuku;
  Peminjam({
    this.userid,
    this.namapeminjam,
    this.nomorbuku,
  });
}

class DataPeminjaman extends Peminjam {
  String tanggalpinjam;
  String tanggalkembali;
  DataPeminjaman({userid, namapeminjam, nomorbuku,this.tanggalpinjam,
    this.tanggalkembali,}

  ) : super(userid: userid, namapeminjam:namapeminjam, nomorbuku: nomorbuku);
  

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userid' : userid,
      'namapeminjam' : namapeminjam,
      'nomorbuku' : nomorbuku,
      'tanggalpinjam': tanggalpinjam,
      'tanggalkembali': tanggalkembali,
    };
    return map;
  }

  DataPeminjaman.fromMap(Map<String, dynamic> map) {
      userid = map['userid'];
      namapeminjam = map['namapeminjam'];
      nomorbuku = map['nomorbuku'];
      tanggalpinjam = map['nomorbuku'];
      tanggalkembali = map['tanggalkembali'];
  }
}
