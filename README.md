
# IlmStream

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)  
[Live Demo](https://ilmi-library.vercel.app/) | [Source Code](https://github.com/FaizaAbdulSattar/IlmStream)

---

## Overview

**IlmStream** is a modern, elegant Flutter application designed to serve as a digital library for Islamic literature and Urdu novels. It offers users an immersive reading experience with support for PDF viewing, offline access, and seamless navigation. IlmStream is thoughtfully crafted with a focus on readability, accessibility, and cultural authenticity — featuring Noto Nastaliq Urdu font support and a clean, responsive UI.

---

## Key Features

- **Dual-Category Browsing:** Effortlessly switch between Islamic books and Urdu novels.
- **Advanced Search:** Dynamic filtering by book title and author to find content instantly.
- **Integrated PDF Viewer:** Read books directly within the app without external dependencies.
- **Offline Accessibility:** Download books for uninterrupted reading anytime, anywhere.
- **Dark Mode Support:** Comfortable reading in all lighting conditions with easy theme toggling.
- **Beautiful Typography:** Utilizes Google Fonts with Noto Nastaliq Urdu for elegant script rendering.
- **Responsive & Intuitive UI:** Adapted for various devices with smooth animations and transitions.
- **Open Source:** Fully customizable and extendable for developers and contributors.

---

## Screenshots

![Home Screen](screenshots/home_light.png)  
*Home screen with book categories and search*

![PDF Viewer](screenshots/pdf_viewer_dark.png)  
*In-app PDF reading experience with dark mode*

---

## Demo

Experience IlmStream live at [https://ilmi-library.vercel.app/](https://ilmi-library.vercel.app/).

---

## Installation Guide

### Prerequisites

- Flutter SDK ≥ 3.0.0  
- Dart ≥ 3.0.0  
- Compatible device or emulator

### Steps

1. **Clone the repository:**

```bash
git clone https://github.com/FaizaAbdulSattar/IlmStream.git
cd IlmStream
````

2. **Install dependencies:**

```bash
flutter pub get
```

3. **Run the application:**

```bash
flutter run
```

---

## Project Architecture

```
lib/
├── main.dart          # App entry point
├── screens/
│   ├── home_screen.dart
│   ├── pdf_viewer_screen.dart
│   ├── splash_screen.dart
├── widgets/
│   ├── book_grid.dart
│   ├── search_bar.dart
├── models/
│   └── book.dart
├── utils/
│   └── theme.dart
assets/
├── books.json          # Book metadata
├── pdfs/               # PDF files
└── images/             # Book covers
```

---

## Usage & Customization

### Adding New Books

1. Place the PDF file inside `assets/pdfs/`.
2. Add a new entry to `assets/books.json`:

```json
{
  "title": "Sample Book Title",
  "author": "Author Name",
  "path": "assets/pdfs/sample_book.pdf",
  "cover": "https://link-to-cover-image.jpg",
  "category": "Islamic"  // or "Novel"
}
```

3. Update `pubspec.yaml` if adding new assets.

### Themes

* Modify `lib/utils/theme.dart` to customize light/dark modes.
* Google Fonts integration allows easy typography changes.

---

## Dependencies

| Package                        | Purpose               |
| ------------------------------ | --------------------- |
| `flutter`                      | Core SDK              |
| `google_fonts`                 | Custom fonts support  |
| `syncfusion_flutter_pdfviewer` | PDF rendering         |
| `path_provider`                | Access device storage |

---

## Contribution Guidelines

Contributions, issues, and feature requests are welcome! Please follow these steps:

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add your feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a Pull Request.

---

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## About the Developer

**Faiza Abdul Sattar**
Passionate Flutter developer and open-source contributor, dedicated to building inclusive and culturally rich digital experiences.

---

## Contact

* GitHub: [FaizaAbdulSattar](https://github.com/FaizaAbdulSattar)
* Website: [ilmi-library.vercel.app](https://ilmi-library.vercel.app/)

---

*Thank you for exploring IlmStream — enriching minds one book at a time.*

```


