# ๐ฏ Introduce

Flutter simple To-Do List with provider. CRUD system. memory save.

<p float="left">
    <img src="https://github.com/keemeesuu/flutter-todolist-with-provider/blob/main/images/onboarding.gif"  width="28%" />
</p>

used packages
- [Provider](https://pub.dev/packages/provider/install)
    ์ฌ์ฉ๋ฒ์ด ์ฝ๊ณ , Flutter ๊ณต์ ๋ฌธ์์์๋ ์ถ์ฒํ๋ ํจํค์ง.

<br>

# ๐ฏ Point

## ๐ ์ํ ๊ด๋ฆฌ(State Management) ์ดํดํ๊ธฐ


![State management](https://flutter-ko.dev/assets/development/data-and-backend/state-mgmt/state-management-explainer-5495afe6c3d6162f145107fe45794583bc4f2b55be377c76a92ab210be74c033.gif)

์ฌ์ฉํจํค์ง - Provider
์ต์  ์ํ์ ๋ฐ์ดํฐ๋ฅผ ๋ณด์ฌ์ฃผ๋๋ก ํ์ด์ง ๊ฐ ๋ฐ์ดํฐ๋ฅผ ์ฃผ๊ณ ๋ฐ๊ณ  ๊ด๋ฆฌํ๋ ํ์.  
๋ฐ์ดํ๋ฅผ ์ํ๊ด๋ฆฌ์๋น์ค ํด๋์ค์์ ๋ด๋นํ๋ค.  

์ฆ, ์ ์ญ์ ์ผ๋ก ์ฌ์ฉ๋๋ ๋ฐ์ดํฐ๋ฅผ ๋ด๋นํ  **Service**๋ฅผ ๋ง๋ค๊ณ  ํด๋น ๋ฐ์ดํฐ์ฒ๋ฆฌ๋ฅผ ๋ชจ๋ **Service**์์ ๊ตฌํํ๋ค.

<br>

# ๐ฏ Note

## ๐ Provider

```dart 
ClassName Service extends ChangeNotifier {
    notifylisteners();
}
```
๋ค๋ฅธ ๊ณณ์ ๋ณ๊ฒฝ์ฌํญ์ ์๋ ค์ฃผ๋ ๊ธฐ๋ฅ.  
ํด๋น ํด๋์ค์ ๋ฐ์ดํ๋ฅผ ์ฌ์ฉํ๋ ํ์ด์ง๋ฅผ ๊ฐฑ์ ์์ผ์ค ์ ์๋๋ก ์๋ ค์ค๋ค.

`notifylisteners();` : ์ด ๋ฉ์๋๋ฅผ ํธ์ถํ๋ฉด ์์ ฏ๋ค์ ๊ฐฑ์ ํ๋ค.  
๋ณ๊ฒฝ์ฌํญ์ด ์์ ๊ฒฝ์ฐ `Consumer`์ `builder`ํจ์ ๋ด๋ถ๊ฐ ์๋ก๊ณ ์นจ ๋๋ค.  
์ฝ๊ฒ๋งํด `StatefulWidget`์ `setState` ๊ฐ์ ๊ธฐ๋ฅ.  

### Provider ์ ๊ทผ๋ฐฉ๋ฒ

์์ ฏํธ๋ฆฌ ์๋จ์ ์๋ Provider๋ก ๋ฑ๋กํ ํด๋์ค์ ์ ๊ทผํ  ์ ์๋ค.
์ค๋น : runApp์ MultiProvider๋ก ๊ฐ์ผ๋ค.

- `Consumer<ํด๋์ค๋ช>`
    ํด๋์ค ์ ๋ณด ๊ฐฑ์ ์ ํจ๊ป ์๋ก๊ณ ์นจ ํ  ๋ ์ฌ์ฉํจ.
- `context.read<ํด๋์ค๋ช>()`
    1ํ์ฑ์ผ๋ก ํด๋์ค ์ ๊ทผํ  ๋ ์ฌ์ฉํจ.

## ๐ ๊ฐ์ฒดํ

`List<ํด๋์ค ๋ฐ์ดํฐ ํ์> = []` ์ ์ ๊ทผํ๋ ค๋ฉด ๊ฐ์ฒดํ๋ฅผ ์์ผ ๋ฃ์ด์ค์ผ ํ๋ค.

<br>

# ๐ฏ Reference

[State Management | Flutter(Flutter ๊ณต์๋ฌธ์)](https://docs.flutter.dev/development/data-and-backend/state-mgmt/intro)