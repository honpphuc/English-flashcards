import '../models/word.dart';

// TODO: insert below data into an SQLite database instead

final List<Word> words = [

  // --- Beach ---
  Word(topic: "Beach", english: "Swimsuit", character: "Đồ bơi", vietnamese: "Đồ bơi"),
  Word(topic: "Beach", english: "Seashell", character: "Vỏ sò", vietnamese: "Vỏ sò"),
  Word(topic: "Beach", english: "Sunscreen", character: "Kem chống nắng", vietnamese: "Kem chống nắng"),
  Word(topic: "Beach", english: "Surfboard", character: "Ván lướt sóng", vietnamese: "Ván lướt sóng"),

  // --- Birds ---
  Word(topic: "Birds", english: "Kiwi", character: "Chim kiwi", vietnamese: "Chim kiwi"),
  Word(topic: "Birds", english: "Duck", character: "Vịt", vietnamese: "Vịt"),
  Word(topic: "Birds", english: "Flamingo", character: "Hồng hạc", vietnamese: "Hồng hạc"),

  // --- Body ---
  Word(topic: "Body", english: "Nose", character: "Mũi", vietnamese: "Mũi"),
  Word(topic: "Body", english: "Eye", character: "Mắt", vietnamese: "Mắt"),
  Word(topic: "Body", english: "Mouth", character: "Miệng", vietnamese: "Miệng"),
  Word(topic: "Body", english: "Ear", character: "Tai", vietnamese: "Tai"),

  // --- City ---
  Word(topic: "City", english: "Hospital", character: "Bệnh viện", vietnamese: "Bệnh viện"),
  Word(topic: "City", english: "Fire Station", character: "Trạm cứu hỏa", vietnamese: "Trạm cứu hỏa"),
  Word(topic: "City", english: "Bank", character: "Ngân hàng", vietnamese: "Ngân hàng"),

  // --- Dessert ---
  Word(topic: "Dessert", english: "Ice Cream", character: "Kem", vietnamese: "Kem"),
  Word(topic: "Dessert", english: "Chocolate", character: "Sô cô la", vietnamese: "Sô cô la"),
  Word(topic: "Dessert", english: "Donut", character: "Bánh vòng", vietnamese: "Bánh vòng"),

  // --- Drinks ---
  Word(topic: "Drinks", english: "Juice", character: "Nước ép", vietnamese: "Nước ép"),
  Word(topic: "Drinks", english: "Beer", character: "Bia", vietnamese: "Bia"),
  Word(topic: "Drinks", english: "Milk", character: "Sữa", vietnamese: "Sữa"),

  // --- Fruit ---
  Word(topic: "Fruit", english: "Apple", character: "Táo", vietnamese: "Táo"),
  Word(topic: "Fruit", english: "Orange", character: "Cam", vietnamese: "Cam"),
  Word(topic: "Fruit", english: "Banana", character: "Chuối", vietnamese: "Chuối"),

  // --- Insects ---
  Word(topic: "Insects", english: "Grasshopper", character: "Châu chấu", vietnamese: "Châu chấu"),
  Word(topic: "Insects", english: "Fly", character: "Ruồi", vietnamese: "Ruồi"),
  Word(topic: "Insects", english: "Spider", character: "Nhện", vietnamese: "Nhện"),

  // --- Jobs ---
  Word(topic: "Jobs", english: "Police Officer", character: "Cảnh sát", vietnamese: "Cảnh sát"),
  Word(topic: "Jobs", english: "Construction Worker", character: "Công nhân xây dựng", vietnamese: "Công nhân xây dựng"),
  Word(topic: "Jobs", english: "Detective", character: "Thám tử", vietnamese: "Thám tử"),

  // --- Land Animals ---
  Word(topic: "Land Animals", english: "Tiger", character: "Hổ", vietnamese: "Hổ"),
  Word(topic: "Land Animals", english: "Bear", character: "Gấu", vietnamese: "Gấu"),
  Word(topic: "Land Animals", english: "Beaver", character: "Hải ly", vietnamese: "Hải ly"),
  Word(topic: "Land Animals", english: "Camel", character: "Lạc đà", vietnamese: "Lạc đà"),
  Word(topic: "Land Animals", english: "Dog", character: "Chó", vietnamese: "Chó"),

  // --- Marine Life ---
  Word(topic: "Marine Life", english: "Dolphin", character: "Cá heo", vietnamese: "Cá heo"),
  Word(topic: "Marine Life", english: "Shark", character: "Cá mập", vietnamese: "Cá mập"),
  Word(topic: "Marine Life", english: "Whale", character: "Cá voi", vietnamese: "Cá voi"),

  // --- Music ---
  Word(topic: "Music", english: "Piano", character: "Đàn piano", vietnamese: "Đàn piano"),
  Word(topic: "Music", english: "Flute", character: "Sáo", vietnamese: "Sáo"),

  // --- Nature ---
  Word(topic: "Nature", english: "Tree", character: "Cây", vietnamese: "Cây"),
  Word(topic: "Nature", english: "Rock", character: "Đá", vietnamese: "Đá"),

  // --- School ---
  Word(topic: "School", english: "School Bag", character: "Cặp đi học", vietnamese: "Cặp đi học"),
  Word(topic: "School", english: "Computer", character: "Máy tính", vietnamese: "Máy tính"),
  Word(topic: "School", english: "Pen", character: "Bút", vietnamese: "Bút"),

  // --- Shapes ---
  Word(topic: "Shapes", english: "Triangle", character: "Hình tam giác", vietnamese: "Hình tam giác"),
  Word(topic: "Shapes", english: "Circle", character: "Hình tròn", vietnamese: "Hình tròn"),
  Word(topic: "Shapes", english: "Square", character: "Hình vuông", vietnamese: "Hình vuông"),

  // --- Sports ---
  Word(topic: "Sports", english: "Tennis", character: "Quần vợt", vietnamese: "Quần vợt"),
  Word(topic: "Sports", english: "Rugby", character: "Bóng bầu dục", vietnamese: "Bóng bầu dục"),
  Word(topic: "Sports", english: "Golf", character: "Gôn", vietnamese: "Gôn"),

  // --- Vehicles ---
  Word(topic: "Vehicles", english: "Motorbike", character: "Xe máy", vietnamese: "Xe máy"),
  Word(topic: "Vehicles", english: "Train", character: "Tàu hỏa", vietnamese: "Tàu hỏa"),
  Word(topic: "Vehicles", english: "Truck", character: "Xe tải", vietnamese: "Xe tải"),
  Word(topic: "Vehicles", english: "Airplane", character: "Máy bay", vietnamese: "Máy bay"),

  // --- Weather ---
  Word(topic: "Weather", english: "Rain", character: "Mưa", vietnamese: "Mưa"),
  Word(topic: "Weather", english: "Sun", character: "Mặt trời", vietnamese: "Mặt trời"),
  Word(topic: "Weather", english: "Cloud", character: "Mây", vietnamese: "Mây"),

];
