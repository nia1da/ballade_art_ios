import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Renkler (Main.dart ile uyumlu)
    const Color bg = Color(0xFF222831);
    const Color ink = Color(0xFFDFD0B8);

    // Metin Stili (Gövde metni için okunaklı ayar)
    final bodyStyle = GoogleFonts.cinzel(
      color: ink.withOpacity(0.9),
      fontSize: 15,
      height: 1.6, // Satır arası boşluk (Rahat okuma için)
    );

    // Başlık Stili
    final headerStyle = GoogleFonts.cinzel(
      color: ink,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    );

    return Scaffold(
      backgroundColor: bg,
      // APP BAR: Geri Butonu ve Başlık
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: ink),
          onPressed: () => Navigator.pop(context), // Geri dön
        ),
        title: Text("HİKAYEMİZ", style: headerStyle.copyWith(fontSize: 18)),
        centerTitle: true,
      ),
      // RESPONSIVE GÖVDE: ListView kullanıyoruz ki küçük ekranda kaydırılsın
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [

          // --- BÖLÜM 1: USTA ---
          Text("USTANIN ELİ", style: headerStyle),
          const SizedBox(height: 10),
          _buildPlaceholderImage("Usta Tezgahı Fotosu Buraya"),
          const SizedBox(height: 15),
          Text(
            "Ben Alper Karabak. Lise ve üniversite stajlarımı iyi atölyelerde, iyi ustalardan el alarak geçirdim. Üniversiteden sonra staj yaptığım yerde iş hayatıma başladım ve yirmi yedi yıldır hiç durmadan, mesleğimi hâlâ ilk günkü heyecanımla öğrenmeye ve icra etmeye çalışıyorum.",
            style: bodyStyle,
          ),

          const Divider(color: ink, height: 40, thickness: 0.5), // Ayıraç

          // --- BÖLÜM 2: BALLADE İSMİ ---
          Text("BALLADE'IN RUHU", style: headerStyle),
          const SizedBox(height: 10),
          _buildPlaceholderImage("Chopin Notaları & Yüzük Fotosu"),
          const SizedBox(height: 15),
          Text(
            "2012 yılının başlarında, bugün hâlâ faaliyet göstermekte olduğumuz BalladeArt’ı kurdum. Ballade, çok sevdiğim bir Chopin eseridir. Hikâyeler ve efsaneler üzerine söylenen şiir ya da şarkı anlamındaki Balad’ın Fransızca yazılışını, insanların hikâyelerini sadece fonetik sanatlarla değil, görsel sanatlarla da ifade edilebileceğini düşünerek atölyemin adına verdim.",
            style: bodyStyle,
          ),

          const Divider(color: ink, height: 40, thickness: 0.5),

          // --- BÖLÜM 3: ORTAKLIK ---
          Text("ZARAFETİN DOKUNUŞU", style: headerStyle),
          const SizedBox(height: 10),
          _buildPlaceholderImage("Cansu & Alper Atölye Fotosu"),
          const SizedBox(height: 15),
          Text(
            "BalladeArt’ta sevgili hayat arkadaşım Cansu Karabak ile beraberiz. Kendisi ile serüvenimiz beş yıl önce başladı ve atölyede birlikte çalışıyoruz. Cansu Hanım tarz olarak benden farklı ilerledi; daha minimalist şeyler yaparak atölyemize zarafet kazandırdı.",
            style: bodyStyle,
          ),

          const Divider(color: ink, height: 40, thickness: 0.5),

          // --- BÖLÜM 4: SİHİRLİ RESİM (ÜRETİM) ---
          Text("EL İŞÇİLİĞİ", style: headerStyle),
          const SizedBox(height: 10),

          // BURAYA SİHİRLİ RESİM GELECEK (Şimdilik placeholder)
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.black38,
              border: Border.all(color: ink),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Sihirli Resim Alanı\n(Kaydırınca Değişecek)",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ),

          const SizedBox(height: 15),
          Text(
            "Biz genelde 3D modelleme kullanmayız. Aklımız, edindiğimiz deneyimlerden gelen bilgilerimiz ve yeteneğimiz ışığında; ellerimiz yettiğince çalışırız. Piyasadaki seri üretim ürünleri çalışmayı kendimize hem tarz olarak yakıştırmıyor hem de etik bulmuyoruz.",
            style: bodyStyle,
          ),

          const SizedBox(height: 40), // En altta boşluk

          // Alt Bilgi
          Center(
            child: Text(
              "Hikayenizi metale dökmek için...",
              style: bodyStyle.copyWith(fontStyle: FontStyle.italic, fontSize: 12),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Resim Yer Tutucu (Yardımcı Fonksiyon)
  Widget _buildPlaceholderImage(String label) {
    return Container(
      height: 200, // Yükseklik sabit, genişlik responsive
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF222831).withOpacity(0.5), // Daha koyu zemin
        border: Border.all(color: const Color(0xFFDFD0B8).withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
        // Gerçek resim gelince burası DecorationImage olacak
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image, color: Color(0xFFDFD0B8), size: 40),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Color(0xFFDFD0B8))),
          ],
        ),
      ),
    );
  }
}