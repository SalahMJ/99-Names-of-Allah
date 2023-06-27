import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 89, 237, 166),
        body: SafeArea( // Wrap the CardCarousel with a SafeArea widget
          child: Center(
            child: CardCarousel(),
          ),
        ),
      ),
    );
  }
}

class CardCarousel extends StatefulWidget {
  const CardCarousel({Key? key}) : super(key: key);

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  final PageController _controller = PageController(viewportFraction: 1);
  final List<Color> _colors = [
    Color.fromARGB(255, 34, 34, 34),
  ];

  // Create a list of data that contains the name, translation, and meaning of each item
  final List<List<String>> _data = [
  ['Ar Rahmaan', 'انتہائی مہربان', 'The Most Gracious'],
  ['Ar Raheem', 'انتہائی رحم کرنے والا', 'The Most Merciful'],
  ['Al Malik', 'مالک، بادشاہ', 'The Owner, The King'],
  ['Al Qudoos', ' عیبوں سے پاک', 'The Most Holy'],
  ['As Salam', 'سلامتی والا', 'Only provider of Peace'],
  ['Al Momin', 'ایمان عطاء کرنے والا، امن دینے والا', 'The One Who gives Emaan and Security'],
  ['Al Muhaimin', 'محافظ', 'The Guardian'],
  ['Al Azeez', 'غالب، زبردست، غلبہ والا، عزت دینے والا', 'The All Mighty'],
  ['Al Jabbaar', 'زبردست', 'The Compeller, The Restorer'],
  ['Al Mutaqabir', 'بڑائی والا، بزرگی والا', 'The Supreme, The Majestic'],
  ['Al Khaliq', 'پیدا کرنے والا', 'The Creator, The Maker'],
  ['Al Baari', 'پیدا کرنے والا', 'The Originator'],
  ['Al Musawir', 'صورت بنانے والا', 'The Fashioner'],
  ['Al Ghaffar', 'بخشنے والا', 'The All- and Oft-Forgiving'],
  ['Al Qahhaar', 'زبردست، قہر نازل کرنے والا', 'The Subduer, The Ever-Dominating'],
  ['Al Wahhab', 'عطاء کرنے والا', 'The Giver of Gifts'],
  ['Al Razzaq', 'رزق دینے والا', 'The Provider'],
  ['Al Fataah', 'کھولنے والا', 'The Opener, The Judge'],
  ['Al Aleeem', 'جاننے والا، علم والا، باخبر', 'The All-Knowing, The Omniscient'],
  ['Al Qaabiz', 'قبض کرنے والا', 'The Withholder'],
  ['Al Basit', 'فراخ کرنے والا', 'The Extender'],
  ['Al Khafz', 'پست کرنے والا', 'The Reducer, The Abaser'],
  ['Al Rafey', 'بلند کرنے والا', 'The Exalter, The Elevator'],
  ['Al Mueez', 'عزت دینے والا', 'The Honourer, The Bestower'],
  ['Al Muzzil', 'ذلت دینے والا', 'The Dishonourer, The Humiliator'],
  ['Al Sami', 'سننے والا', 'The All-Hearing'],
  ['Al Baseer', 'دیکھنے والا', 'The All-Seeing'],
  ['Al Haqam', 'فیصلہ کرنے والا، حاکم', 'The Judge, The Giver of Justice'],
  ['Al Adal', 'انصاف کرنے والا', 'The Utterly Just'],
  ['Al Lateef', 'مہربان', 'The Subtle One, The Most Gentle'],
  ['Al Khabeer', 'خبردار، جاننے والا،خبر رکھنے والا', 'The Acquainted, the All-Aware'],
  ['Al Haleem', 'بردبار', 'The Most Forbearing'],
  ['Al Azeem', 'عظمت والا، بڑائی والا، بڑا', 'The Magnificent, The Supreme'],
  ['Al Ghafoor', 'معافی دینے والا', 'The Forgiving, The Exceedingly Forgiving'],
  ['Ash Shakoor', 'قدردان', 'The Most Appreciative'],
  ['Al Alee', 'اعلیٰ، سب سے افضل، برتر', 'The Most High, The Exalted'],
  ['Al Kabeer', 'بزرگی والا', 'The Greatest, The Most Grand'],
  ['Al Hafeez', 'حفاظت کرنے والا، نگہبان', 'The Preserver, The All-Heedful and All-Protecting'],
  ['Al Muqeet', 'باقی رہنے والا، روزی دینے والا، نگہبان، قوت دینے والا', 'The Sustainer'],
  ['Al Haseeb', 'حساب لینے والا', 'The Reckoner, The Sufficient'],
  ['Al Jaleel', 'بزرگ', 'The Majestic'],
  ['Al Kareem', 'کرم کرنے والا', 'The Most Generous, The Most Esteemed'],
  ['Ar Raqeeb', 'خیال رکھنے والا', 'The Watchful'],
  ['Al Mujeeb', 'قبول کرنے والا', 'The Responsive One'],
  ['Al Waasi', 'لامحدود', 'The All-Encompassing, the Boundless'],
  ['Al Hakeem', 'حکمت والا', 'The All-Wise'],
  ['Al Wadood', 'محبت کرنے والا', 'The Most Loving'],
  ['Al Majeed', 'بزرگی والا', 'The Glorious, The Most Honorable'],
  ["Al Ba’is", "اسباب پیدا کرنے والا", "The Resurrector, The Raiser of the Dead"],
  ["Ash Shaheed", "گواہ", "The All and Ever Witnessing"],
  ["Al Haqq", "سچ", "The Absolute Truth"],
  ["Al Wakeel", "وکیل،کارساز", "The Trustee, The Disposer of Affairs"],
  ["Al Qawiyy", "سب سے زیادہ طاقتور", "The All Strong"],
  ["Al Mateen", "مضبوط، قوت والا", "The Firm, The Steadfast"],
  ["Al waliyy", "دوست", "The Protecting Associate"],
  ["Al Hameed", "تعریف والا", "The Praiseworthy"],
  ["Al Muhsee", "شمار کرنے والا", "The All-Enumerating, The Counter"],
  ["Al Mubdi", "عدم سے عالم کو وجود لانے والا", "The Originator, The Initiator"],
  ["Al Mueed", "لوٹانے والا، پناہ دینے والا", "The Restorer, The Reinstater"],
  ["Al Muhyee", "زندگی دینے والا", "The Giver of Life"],
  ["Al Mumeet", "موت دینے والا", "The Bringer of Death, the Destroyer"],
  ["Al Hayy", "زندہ، ہمیشہ رہنے والا", "The Ever-Living"],
  ["Al Qayyoom", "قائم رہنے والا", "The Sustainer, The Self-Subsisting"],
  ["Al Wajid", "حاصل کرنے والا", "The Perceiver"],
  ["Al Majid", "بزرگی دینے والا", "The Illustrious, the Magnificent"],
  ["Al Wahid", "اکیلا", "The One"],
  ["Al Ahad", "ایک", "The Unique, The Only One"],
  ["As Samad", "بے نیاز، مضبوط", "The Eternal, Satisfier of Needs"],
  ["Al Qadir", "قدرت والا", "The Capable, The Powerful"],
  ["Al Muqtadir", "اقتدار والا، قادر مطلق", "The Omnipotent"],
  ["Al Muqaddim", "آگے کرنے والا", "The Expediter, The Promoter"],
  ["Al Mu’akhkhir", "پیچھے کرے والا", "The Delayer, the Retarder"],
  ["Al Awwal", "پہلا", "The First"],
  ["Al Aakhir", "آخر", "The Last"],
  ["Az Zahir", "ظاہر", "The Manifest"],
  ["Al Baatin", "چھپا ہوا، باطن کو جاننے والا", "The Hidden One, Knower of the Hidden"],
  ["Al Waali", "", "The Governor, The Patron"],
  ["Al Muta’ali", "بزرگ", "The Self Exalted"],
  ["Al Barr", "نیکیوں کا سرچشمہ", "The Source of Goodness, the Kind Benefactor"],
  ["At Tawwab", "توبہ قبول کرنے والا", "The Ever-Pardoning, The Relenting"],
  ["Al Muntaqim", "انتقام لینے والا", "The Avenger"],
  ["Al ‘Afuww", "معاف کرنے والا", "The Pardoner"],
  ["Ar Rauf", "رحم کرنے والا، شفقت کرنے ولا", "The Most Kind"],
  ["Maalik-ul-mulk", "دو جہاں کا مالک", "Master of the Kingdom, Owner of the Dominion"],
  ["Zul-jalaali wal-ikraam", "جلال اور انعام و اکرام والا", "Possessor of Glory and Honour, Lord of Majesty and Generosity"],
  ["Al Muqsit", "انصاف کرنے والا", "The Equitable, the Requiter"],
  ["Al Jaami’", "جمع کرنے والا", "The Gatherer, the Uniter"],
  ["Al Ghaniyy", "بے پرواہ، غنی", "The Self-Sufficient, The Wealthy"],
  ["Al Mughni", "بے نیاز", "The Enricher"],
  ["Al Mani’", "روکنے والا، باز رکھنے والا", "The Withholder"],
  ["Az Zaar", "نقصان کا مالک", "The Distresser,The creator of harm"],
  ["An Nafi’", "نفع کا مالک، نفع دینے والا", "The Propitious, the Benefactor"],
  ["An Nur", "روشن، روشنی دینے والا", "The Light, The Illuminator"],
  ["Al Haadi", "ہدایت دینے والا، راستہ دکھانے والا", "The Guide"],
  ["Al Badee’", "نادر پیدا کرنے والا", "The Incomparable Originator"],
  ["Al Baaqi", "ہمیشہ رہنے والا", "The Ever-Surviving, The Everlasting"],
  ["Al Waaris", "وارث", "The Inheritor, The Heir"],
  ["Ar Rasheed", "ہدایت دینے والا، رہنمائی کرنے والا", "The Guide, Infallible Teacher"],
  ["As Saboor", "صبر کرنے والا", "The Forbearing, The Patient"]
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 7,
      child: PageView.builder(
        controller: _controller,
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double value = 1;
              if (_controller.position.haveDimensions) {
                value = _controller.page! - index;
                value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
              }
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            child: CardItem(
              color: _colors[index % _colors.length],
              data: _data[index], // Pass the data list to the CardItem widget
            ),
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.color, required this.data})
      : super(key: key);

  final Color color;
  final List<String> data; // Receive the data list as a parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        gradient: LinearGradient(
          colors: [color, color.withOpacity(1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column( // Use a Column widget to display the text in three lines
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( // Display the name
              data[0],
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 89, 237, 166),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Add a SizedBox with a height of 16 pixels
            Text( // Display the translation
              data[1],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 89, 237, 166),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Add another SizedBox with a height of 16 pixels
            Text( // Display the meaning
              data[2],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 89, 237, 166),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}