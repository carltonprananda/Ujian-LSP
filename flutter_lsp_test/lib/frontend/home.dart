part of 'views.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final picker = ImagePicker();
  TextEditingController inputnama;
  TextEditingController inputdeskripsi;
  TextEditingController inputnomorbuku;
  TextEditingController tanggalpeminjaman;
  TextEditingController tanggalpengembalian;


  Future _pilihtanggal() async {
    DateTime pilih = await showDatePicker(
        context: context,
        initialDate: tanggalpinjam,
        firstDate: new DateTime(2006),
        lastDate: new DateTime(2025));
    if (pilih != null) {
      setState(() => tanggalpeminjaman = pilih as TextEditingController);
    }
  }

  static DateTime tanggalpinjam = DateTime.now();
  String formattanggal = DateFormat('yyyy-MM-dd - kk:mm:ss').format(tanggalpinjam);
  static DateTime deadlinepembalikan = tanggalpinjam.add(Duration(days: 7));
  String formattanggal2 =
      DateFormat('yyyy-MM-dd - kk:mm').format(deadlinepembalikan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: inputnama,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nama Peminjam',
              ),
            ),
            TextFormField(
              controller: inputdeskripsi,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'nomor buku',
              ),
            ),
            TextFormField(
              initialValue: formattanggal,
              onTap: () {
                picker;
              },
              controller: tanggalpeminjaman,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Tanggal Peminjaman',
              ),
            ),
            Text("Tanggal Pinjam" + tanggalpinjam.toString()),
            Text("Batas Pengembalian Buku" + deadlinepembalikan.toString()),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: (){
                  String namapeminjam = inputnama.text;
                  int nomorbuku = int.parse(inputnomorbuku.text);
                  
                }
                
                , child: Text("Submit")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
