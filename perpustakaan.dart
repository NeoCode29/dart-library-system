import "./buku.dart";
import "./stack.dart";
import "dart:io";

class Perpustakaan {
  List<Buku> listBuku = [];
  Stack historyPeminjaman = Stack<Map>();

  Perpustakaan() {
    listBuku = [];
    historyPeminjaman = Stack<Map>();
  }

  void menambahkanBuku(Buku buku) {
    listBuku.add(buku);
    print("berhasil menambahkan buku ${buku.judul}");
  }

  void menghapusBuku(Buku buku) {
    listBuku.remove(buku);
    print("berhasil menghapus buku ${buku.judul}");
  }

  void meminjamBuku(Buku buku) {
    if (listBuku.contains(buku)) {
      for (var b in listBuku) {
        if (b == buku) {
          if (!b.getDipinjam()) {
            b.pinjam();
            historyPeminjaman
                .push({'judul': buku.judul, 'tanggal': DateTime.now()});
            print("Buku ${buku.judul} berhasil dipinjam.");
            return;
          } else {
            print("Buku ${buku.judul} sudah dipinjam.");
          }
        }
      }
      print("Buku ${buku.judul} tidak tersedia.");
    }
  }

  void mengembalikanBuku(Buku buku) {
    if (listBuku.contains(buku)) {
      for (var b in listBuku) {
        if (b == buku) {
          if (b.getDipinjam()) {
            b.kembalikan();
            print("Buku ${buku.judul} berhasil dikembalikan.");
            return;
          } else {
            print("Buku ${buku.judul} tidak sedang dipinjam.");
          }
        }
      }
      print("Buku ${buku.judul} tidak tersedia.");
    }
  }

  void menampilkanListBuku() {
    listBuku.sort((a, b) => a.judul.compareTo(b.judul));
    listBuku.forEach((buku) => {print(buku.toString())});
  }

  Buku? cariBukuBerdasarkanNama(String nama) {
    for (Buku buku in listBuku) {
      if (buku.judul.toLowerCase().contains(nama.toLowerCase())) {
        return buku;
      }
    }
    print("Buku dengan nama '$nama' tidak ditemukan.");
    return null;
  }

  void menampilkanHistoryPeminjaman() {
    if (historyPeminjaman.isEmpty()) {
      print("Tidak ada history peminjaman.");
    } else {
      print("History Peminjaman:");
      for (var i = 0; i < historyPeminjaman.size(); i++) {
        var history = historyPeminjaman.peek();
        print("Judul: ${history['judul']}, Tanggal: ${history['tanggal']}");
      }
    }
  }

  void startApp() {
    print("Selamat Datang di Aplikasi Manajemen Perpustakaan");
    while (true) {
      print("\nMenu:");
      print("1. Pinjam Buku");
      print("2. Kembalikan Buku");
      print("3. Tampilkan List Buku");
      print("4. Cari Buku Berdasarkan Nama");
      print("5. Tambah Buku");
      print("6. Hapus Buku");
      print("7. Tampilkan History Peminjaman");
      print("8. Keluar");
      stdout.write("Pilih opsi: ");
      var pilihan = stdin.readLineSync();

      switch (pilihan) {
        case '1':
          stdout.write("Masukkan judul buku yang ingin dipinjam: ");
          var judul = stdin.readLineSync();
          var buku = cariBukuBerdasarkanNama(judul!);
          if (buku != null) {
            meminjamBuku(buku);
          }
          break;
        case '2':
          stdout.write("Masukkan judul buku yang ingin dikembalikan: ");
          var judul = stdin.readLineSync();
          var buku = cariBukuBerdasarkanNama(judul!);
          if (buku != null) {
            mengembalikanBuku(buku);
          }
          break;
        case '3':
          menampilkanListBuku();
          break;
        case '4':
          stdout.write("Masukkan nama buku yang ingin dicari: ");
          var nama = stdin.readLineSync();
          Buku? result = cariBukuBerdasarkanNama(nama!);
          if (result != null) {
            result.toString();
          } else {
            print("Tidak ada buku");
          }
          break;
        case '5':
          stdout.write("Masukkan judul buku yang ingin ditambahkan: ");
          var judulBaru = stdin.readLineSync();
          stdout.write("Masukkan penulis buku yang ingin ditambahkan: ");
          var penulisBaru = stdin.readLineSync();
          var bukuBaru = Buku(judul: judulBaru!, penulis: penulisBaru!);
          listBuku.add(bukuBaru);
          print("Buku ${bukuBaru.judul} berhasil ditambahkan.");
          break;
        case '6':
          stdout.write("Masukkan judul buku yang ingin dihapus: ");
          var judulHapus = stdin.readLineSync();
          var bukuHapus = cariBukuBerdasarkanNama(judulHapus!);
          if (bukuHapus != null) {
            listBuku.remove(bukuHapus);
            print("Buku ${bukuHapus.judul} berhasil dihapus.");
          }
          break;
        case '7':
          menampilkanHistoryPeminjaman();
          break;
        case '8':
          print(
              "Terima kasih telah menggunakan Aplikasi Manajemen Perpustakaan.");
          return;
        default:
          print("Pilihan tidak valid. Silakan coba lagi.");
      }
    }
  }
}
