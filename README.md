<!-- <p align="center">
  <a href="https://develogo.com">
    <img alt="Portfolio" src="./src/images/mdg.png" width="60" />
  </a>
</p> -->
<h1 align="center">
  the_movie_list
</h1>

<p align="center">
    <a href="" target="blank">View Demo</a>
    ·
    <a href="https://github.com/leandrucarvalho/flutter_the_movie_list/issues/new/choose">Report Bug</a>
</p>

## 🚀 Screenshots

<p float="left">
  <img src="https://user-images.githubusercontent.com/56963289/232360239-03458168-453a-43e0-9697-693b882c7ea4.png" alt="HomePage" height="500"/>
  <img src="https://user-images.githubusercontent.com/56963289/232360415-ab025300-a882-45f6-a1ca-5ed36e6dfa4e.png" alt="DetailsPage" height="506"/>
</p>

## 🛠️ Installation Steps

1. Clone the repository

```bash
git clone https://github.com/leandrucarvalho/flutter_the_movie_list.git
```

2. Change the working directory

```bash
cd flutter_the_movie_list
```

3. Install dependencies

```bash
flutter pub get
```

4. Run the app

```bash
flutter run
```

🌟 You are all set!

## 🍰 Contributing

Please contribute using [GitHub Flow](https://guides.github.com/introduction/flow). Create a branch, add commits, and [open a pull request](https://github.com/develogo/the_movie_list/compare).

<!-- Please read [`CONTRIBUTING`](CONTRIBUTING.md) for details on our [`CODE OF CONDUCT`](CODE_OF_CONDUCT.md), and the process for submitting pull requests to us. -->

## 💻 Built with

- [Flutter](https://flutter.dev/): for building the app

## 📘 Comments

- create dio_service_imp.dart file inside the service folder, i have hidden this file because of the api token:

```
class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/list/1?language=pt-BR',
        headers: {
          'contet-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer api token'
        },
      ),
    );
  }
}
```

## 💡 Credits

- [Deivid Willyan | Flutter](https://www.youtube.com/watch?v=fcMlPEVSacs&list=PLRpTFz5_57cvo0CHf-AnojOvpznz8YO7S&ab_channel=DeividWillyan%7CFlutter): Diversos assuntos do mundo Flutter, Dart e Arquitetura, cursos introdutórios até avançados e de arquitetura, voltada para formar profissionais altamente competentes.
- [The Movie Database API](https://developers.themoviedb.org/4/getting-started): The API service is for those of you interested in using our movie, TV show or actor images and/or data in your application. Our API is a system we provide for you and your team to programmatically fetch and use our data and/or images.

<hr>
<p align="center">
Developed with ❤️ in Flutter
</p>
