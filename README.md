
# 🎬 movie

![Flutter](https://img.shields.io/badge/Flutter-3.29.2-blue?logo=flutter)  
![Dart](https://img.shields.io/badge/Dart-3.7.2-blue?logo=dart)  
![TMDB](https://img.shields.io/badge/API-TMDB-green?logo=themoviedatabase)

> A modern, responsive movie browsing app built with Flutter and the TMDB API.

![header](https://i.postimg.cc/g0ZZDGRC/home.png)

---

## 📸 Screenshots

<p float="left">
  <img src="https://i.postimg.cc/fTnvq6x5/home.jpg" width="250"/>
  <img src="https://i.postimg.cc/7Zqnw0t2/the-dark-night.jpg" width="250"/>
</p>

---

## 🚀 Features

- 🔍 **Search** for movies or TV shows by title, genre, or keyword  
- 🎭 View detailed **movie/TV show info**: cast, rating, release date, and trailers  
- ❤️ **Add to watchlist** for quick access  
- 🔥 Explore **popular, trending, and upcoming** content  
- ⚡️ **Real-time search** with debounce effect  
- 📦 **Bloc Architecture + Repository Pattern**  
- 🎯 **Advanced State Management** using Bloc & Cubit  
  - Immutable Cubits with `Equatable`, `copyWith`, `switch`, etc.  
  - Precise rebuilds and smart state updates  
- 💾 Smart **caching for movie details**  
- 🧠 Cache is cleared when navigating back to bottom nav using `didPopNext`  
- 🌐 API Integration using **Dio**  
- 📶 Handles internet issues gracefully with Dio exceptions  
- 🧪 Full error handling for server & client-side issues  
- 🔁 Async API calls using `Future.wait` for optimized loading  
- 📱 **Responsive design** with **smooth neon UI**

---

## 🧰 Prerequisites
- A valid **TMDB API key**

---

## 🛠 Getting Started

To run the app locally:

```bash
git clone https://github.com/Abdullah-3hmed/movie
cd movie
flutter pub get
```

### For iOS:

```bash
cd ios
pod install
```

### 🔑 Add Your API Key

Go to:

```
lib/core/network/dio_helper.dart
```

And replace:

```dart
apiKey = 'YOUR_API_KEY';
```

That’s it!  
**Feel free to run this code, edit it, and use any part of it in your own projects.**  
Just plug in your API key and **enjoy **  
And don’t forget to **⭐️ star the repo** if you liked it!

---

## 🔌 API Usage

The app uses the [TMDB API](https://www.themoviedb.org/) to fetch movie and TV show data.  
Make sure to keep your API key safe and **do not commit it** publicly.

---

## 🤝 Contributing

All contributions are welcome!  
If you spot an issue or have an idea for a new feature:

1. Fork the repo  
2. Create a new branch  
3. Commit clean and well-tested code  
4. Open a Pull Request 🚀

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).  
Feel free to use, modify, and share the code with credit.

---

## 🙏 Acknowledgments

Thanks to [TMDB](https://www.themoviedb.org/) for providing the rich and powerful API that powers this app.  
And big thanks to the open-source community 💙

---

## 📬 Contact

Built by **Abdullah**  
📧 Email: [abdullhahmed107@gmail.com](mailto:abdullhahmed107@gmail.com)
