
# 🌙 **IlmStream** – Read. Reflect. Reconnect.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
📱 [**Live Demo**](https://ilmi-library.vercel.app/) | 💻 [**Source Code**](https://github.com/FaizaAbdulSattar/IlmStream)

---

## 📚 About IlmStream

**IlmStream** is a culturally-inspired, aesthetically crafted Flutter application designed as your gateway to **Islamic literature** and **Urdu novels**. With immersive reading capabilities, modern design, and offline functionality, it’s more than a digital library—it’s your personal space to **read, reflect, and reconnect** with heritage and spirituality.

---

## ✨ Features at a Glance

* 📂 **Dual Collection** – Seamlessly browse both Islamic books and Urdu fiction.
* 🔍 **Intelligent Search** – Quickly find books by title or author.
* 📖 **Built-in PDF Reader** – Read instantly with an integrated viewer.
* 📥 **Offline Mode** – Download and enjoy anytime, anywhere.
* 🌙 **Dark Mode** – Enhanced readability in low light.
* 🖋️ **Authentic Typography** – Beautiful Noto Nastaliq Urdu via Google Fonts.
* 📱 **Responsive Design** – Fully optimized for both phones and tablets.
* 💡 **Open Source** – Built for community learning and contributions.

---

## 📸 Sneak Peek

| Splash Screen                                                                              | Categories View                                                                              | Reading Experience                                                                          |
| ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| ![Splash](https://github.com/user-attachments/assets/11b93cff-d9e1-43f9-8a0a-0bc000fcadfb) | ![Category](https://github.com/user-attachments/assets/98bb7920-179d-46f6-aeb6-a78f5a98540c) | ![Reading](https://github.com/user-attachments/assets/ec5d2a51-1f8f-4968-bea9-413f22132ba0) |

---

## 🚀 Try It Now

👉 [**Explore the Live App**](https://ilmi-library.vercel.app/) – no installation needed.

---

## 🛠 Installation Instructions

### ✅ Requirements

* Flutter SDK ≥ 3.0.0
* Dart ≥ 3.0.0
* Android/iOS Emulator or Physical Device

### 🔧 Setup Steps

```bash
# Clone the repository
git clone https://github.com/FaizaAbdulSattar/IlmStream.git
cd IlmStream

# Get dependencies
flutter pub get

# Launch the app
flutter run
```

---

## 📁 Project Structure

```bash
lib/
├── main.dart                  # Entry point
├── screens/                   # UI screens
│   ├── home_screen.dart
│   ├── pdf_viewer_screen.dart
│   ├── splash_screen.dart
├── widgets/                   # Custom widgets
│   ├── book_grid.dart
│   ├── search_bar.dart
├── models/
│   └── book.dart              # Book data model
├── utils/
│   └── theme.dart             # Theme and styling

assets/
├── books.json                 # Metadata for books
├── pdfs/                      # Book PDFs
└── images/                    # Cover images
```

---

## ➕ Add New Books

To add a new book:

1. Drop your PDF in: `assets/pdfs/`
2. Add the book details in `assets/books.json`:

```json
{
  "title": "Sample Book",
  "author": "Author Name",
  "path": "assets/pdfs/sample_book.pdf",
  "cover": "https://link-to-image.jpg",
  "category": "Islamic" // or "Novel"
}
```

3. Register assets in `pubspec.yaml` if needed.

---

## 🎨 Theming & Typography

* The color palette and theme settings are available in:
  `lib/utils/theme.dart`
* Fonts powered by [Google Fonts](https://fonts.google.com/), including support for **Noto Nastaliq Urdu** for a premium native reading experience.

---

## 📦 Core Dependencies

| Package                        | Role                |
| ------------------------------ | ------------------- |
| `flutter`                      | Base SDK            |
| `google_fonts`                 | Font integration    |
| `syncfusion_flutter_pdfviewer` | PDF viewing         |
| `path_provider`                | Local file handling |

---

## 🤝 Contributing

Contributions are warmly welcomed! To collaborate:

```bash
# Fork the repository
# Create your feature branch
git checkout -b feature/your-feature

# Commit your work
git commit -m "✨ Add new feature"

# Push and create a Pull Request
git push origin feature/your-feature
```

---

## 📄 License

This project is licensed under the **MIT License**.
Read more in the [LICENSE](LICENSE) file.

---

## 👩‍💻 Meet the Developer

**Faiza Abdul Sattar**
A passionate Flutter developer building thoughtful, inclusive digital platforms with a deep appreciation for cultural storytelling and open-source collaboration.

* 🌐 [Website](https://ilmi-library.vercel.app/)
* 🧑‍💻 [GitHub Profile](https://github.com/FaizaAbdulSattar)

---

> 📖 *“IlmStream is not just a library — it’s a bridge between tradition and technology, designed to elevate hearts and minds.”* ✨

