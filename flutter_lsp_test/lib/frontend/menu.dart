part of 'views.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Masuk sebagai Pengunjung di Perpus", textAlign: TextAlign.center,),
          ElevatedButton(
            style: ButtonStyle(alignment: Alignment.center),
              onPressed: () {
                Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewDataKoleksi()),);
              }, child: Text("Masuk sebagai Peminjam Buku", textAlign: TextAlign.center,)),
          Text("Masuk sebagai Admin di Perpus"),
          ElevatedButton(
            style: ButtonStyle(alignment: Alignment.center),
              onPressed: () {
                Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewDataPeminjam()),);
              }, child: Text("Masuk sebagai admins", textAlign: TextAlign.center,))
        ]),
      ),
    );
  }
}
