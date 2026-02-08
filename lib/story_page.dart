import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive_helper.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late bool isTurkish;

  // ✅ Story data structure with placeholders
  late final List<Map<String, dynamic>> storyData;

  @override
  void initState() {
    super.initState();
    
    // ✅ Automatic language detection
    final langCode = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    isTurkish = langCode == 'tr';

    // ✅ 4 sections with placeholder content
    storyData = [
      {
        "images": [
          "assets/images/studio1.png",
          "assets/images/studio2.png",
          "assets/images/studio3.png",
        ],
        "tr": {
          "title": "USTANIN ELİ",
          "text": "Ben Alper Karabak. Lisede ve üniversitede Kuyumculuk ve Takı Tasarımı okudum. Yirmi yedi yıldır hiç durmadan, mesleğimi ilk günkü heyecanımla öğrenmeye ve icra etmeye devam ediyorum. 2012 yılında, bugün hâlâ faaliyet gösterdiğimiz BalladeArt’ı kurdum. Ballade, sevdiğim bir Chopin eseridir. İnsanların hikâyelerini sadece fonetik sanatlarla değil, görsel sanatlarla da ifade edilebileceğini düşünerek atölyeme adını verdim."
        },
        "en": {
          "title": "THE MASTER'S HAND",
          "text": "I am Alper Karabak. I studied Jewelry Design in high school and university. For twenty-seven years, I have been practicing my profession with the same excitement as the first day. In 2012, I founded BalladeArt, inspired by a Chopin piece I love. I named my workshop 'Ballade' believing that people's stories can be expressed not just through music, but through visual arts as well."
        }
      },
      {
        "images": [
          "assets/images/ring1.png",
          "assets/images/ring2.png",
          "assets/images/ring3.png",
        ],
        "tr": {
          "title": "BİRLİKTE YARATIM",
          "text": "BalladeArt’ta insanların hikâyelerini semboller ve görsel vurgularla takılabilir hâle getirmek gibi bir derdimiz var. Bu yolculukta hayat arkadaşım Cansu Karabak ile birlikteyiz. Bildiklerimi kendisine aktardım o da daha minimalist şeyler yaparak atölyemize zarafet kazandırdı. Şimdi hem üretiyor hem de markamızın dijital dünyasını yönetiyor."
        },
        "en": {
          "title": "CO-CREATION",
          "text": "At BalladeArt, our mission is to turn people's stories into wearable art using symbols. I am on this journey with my life partner, Cansu Karabak. I taught her everything I know step by step. Cansu developed a minimalist style different from mine, adding elegance to our workshop. Now, she both creates and manages the digital world of our brand."
        }
      },
      {
        "images": [
          "assets/images/skull3.png",
          "assets/images/skull1.png",
          "assets/images/skull2.png",
        ],
        "tr": {
          "title": "SAF ZANAAT",
          "text": "Yüzükler, kolyeler, taçlar, kemer tokaları ve minimal heykeller çalışıyoruz. Kıymetli metal ve taşla çalışma konusunda sınırları zorluyoruz. Biz genelde 3D modelleme kullanmayız. Aklımız, tecrübemiz ve yeteneğimiz ışığında çalışırız. Genel karakter olarak; antik görünüme sahip, mat ve eskitme dokulu, yaşanmışlık hissi veren ürünler üretiyoruz."
        },
        "en": {
          "title": "PURE CRAFT",
          "text": "We work on rings, necklaces, crowns, belt buckles, and minimal sculptures, pushing the boundaries with precious metals and stones. We generally do not use 3D modeling; we work with our minds, experience, and hands. Our character is defined by designs with an antique look, matte textures, and a sense of history."
        }
      },
      {
        "images": [
          "assets/images/ouroboros1.png",
          "assets/images/ouroboros2.png",
          "assets/images/ouroboros3.png",
        ],
        "tr": {
          "title": "BALLADE'IN RUHU",
          "text": "Seri üretim ürünleri çalışmayı tarzımıza ve etiğimize uygun bulmuyoruz. Müşterilerimiz bir konsept ya da hikâye ile gelir, istişare ederek tasarımın hatlarını belirleriz. Gerekli durumlarda fotoğraf ve video ile fikirlerini alır, üretime dahil ederiz. Bu süreç vakit alsa da, ortaya çıkan bağ ve müşterimizin heyecanı için bunu severek tercih ediyoruz."
        },
        "en": {
          "title": "BALLADE'S SOUL",
          "text": "We do not find mass production suitable for our style or ethics. Our clients come with a concept or story; we consult and determine the design together. When necessary, we get their feedback via photos and videos, involving them in production. Although this takes time, we prefer it for the bond it creates and the excitement it brings to our customers."
        }
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    const Color bg = Color(0xFF222831);
    const Color ink = Color(0xFFDFD0B8);

    // Responsive text styles
    final headerStyle = GoogleFonts.cinzel(
      color: ink,
      fontSize: ResponsiveHelper.fontSize(context, 22, maxSize: 26),
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    );

    final bodyStyle = GoogleFonts.cinzel(
      color: ink.withOpacity(0.9),
      fontSize: ResponsiveHelper.fontSize(context, 15, maxSize: 17),
      height: 1.6,
    );

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: ink),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isTurkish ? "HİKAYEMİZ" : "OUR STORY",
          style: headerStyle.copyWith(
            fontSize: ResponsiveHelper.fontSize(context, 18, maxSize: 20),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: ResponsiveHelper.spacing(context, 20),
        ),
        itemCount: storyData.length + 1, // +1 for footer
        itemBuilder: (context, index) {
          if (index == storyData.length) {
            // Footer section
            return Column(
              children: [
                SizedBox(height: ResponsiveHelper.spacing(context, 40)),
                Center(
                  child: Text(
                    isTurkish
                        ? "Hikayenizi metale dökmek için..."
                        : "To cast your story in metal...",
                    style: bodyStyle.copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: ResponsiveHelper.fontSize(context, 12, maxSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: ResponsiveHelper.spacing(context, 20)),
              ],
            );
          }

          final section = storyData[index];
          final content = section[isTurkish ? "tr" : "en"];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Title
              Text(content["title"], style: headerStyle),
              SizedBox(height: ResponsiveHelper.spacing(context, 10)),

              // ✅ Text
              Text(content["text"], style: bodyStyle),
              SizedBox(height: ResponsiveHelper.spacing(context, 15)),

              // ✅ Interactive Image
              InteractiveStoryCard(
                images: List<String>.from(section["images"]),
              ),

              // Divider between sections (except after last section)
              if (index < storyData.length - 1)
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ResponsiveHelper.spacing(context, 30),
                  ),
                  child: Divider(
                    color: ink.withOpacity(0.3),
                    thickness: 0.5,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// ✅ Interactive Image Widget with Horizontal Drag
class InteractiveStoryCard extends StatefulWidget {
  final List<String> images;

  const InteractiveStoryCard({
    super.key,
    required this.images,
  });

  @override
  State<InteractiveStoryCard> createState() => _InteractiveStoryCardState();
}

class _InteractiveStoryCardState extends State<InteractiveStoryCard> {
  double _dragProgress = 0.0; // 0.0 to 1.0

  @override
  Widget build(BuildContext context) {
    // Calculate which images to show based on drag progress
    int currentIndex = (_dragProgress * (widget.images.length - 1)).floor();
    int nextIndex = (currentIndex + 1).clamp(0, widget.images.length - 1);
    
    // Calculate opacity for cross-fade
    double segmentProgress = (_dragProgress * (widget.images.length - 1)) - currentIndex;

    final isCompact = ResponsiveHelper.isCompactScreen(context);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          // Calculate drag progress (0.0 to 1.0)
          final RenderBox box = context.findRenderObject() as RenderBox;
          final localPosition = details.localPosition.dx;
          _dragProgress = (localPosition / box.size.width).clamp(0.0, 1.0);
        });
      },
      onHorizontalDragEnd: (details) {
        // Snap back to first image
        setState(() {
          _dragProgress = 0.0;
        });
      },
      child: Container(
        height: isCompact ? 200 : 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF222831).withOpacity(0.5),
          border: Border.all(
            color: const Color(0xFFDFD0B8).withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Current image
              Image.asset(
                widget.images[currentIndex],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholder(widget.images[currentIndex]);
                },
              ),
              // Next image (cross-fade)
              if (currentIndex != nextIndex)
                Opacity(
                  opacity: segmentProgress,
                  child: Image.asset(
                    widget.images[nextIndex],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildPlaceholder(widget.images[nextIndex]);
                    },
                  ),
                ),
              // Drag indicator overlay
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.swipe,
                          color: Color(0xFFDFD0B8),
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "${currentIndex + 1}/${widget.images.length}",
                          style: const TextStyle(
                            color: Color(0xFFDFD0B8),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(String imagePath) {
    return Container(
      color: const Color(0xFF222831).withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.image,
              color: Color(0xFFDFD0B8),
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              imagePath.split('/').last,
              style: const TextStyle(
                color: Color(0xFFDFD0B8),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
