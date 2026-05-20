# Denetix

Denetix, Flutter ile geliştirilen modern bir saha denetim ve kontrol uygulamasıdır. Uygulama; offline-first mimari, checklist tabanlı denetimler, fotoğraflı kanıt toplama, dijital imza, otomatik PDF raporlama ve online senkronizasyon özellikleri ile saha operasyonlarını dijitalleştirmeyi hedefler.

## Özellikler

* ✅ Offline-first çalışma yapısı
* ✅ SQLite + Drift tabanlı lokal veri yönetimi
* ✅ Dinamik checklist sistemi
* ✅ Fotoğraf ekleme ve kanıt yönetimi
* ✅ Dijital imza desteği
* ✅ Otomatik PDF rapor oluşturma
* ✅ Online senkronizasyon altyapısı
* ✅ Flutter ile cross-platform mobil destek
* ✅ Modern ve ölçeklenebilir mimari

## Mimari Yaklaşım

Denetix uygulaması, internet bağlantısının olmadığı ortamlarda bile sorunsuz çalışabilmesi için offline-first yaklaşımıyla geliştirilmiştir.

Tüm denetim verileri cihaz üzerinde lokal olarak saklanır ve bağlantı sağlandığında merkezi sisteme senkronize edilir.

Bu yapı sayesinde:

* Veri kaybı riski azaltılır
* Saha operasyonları kesintisiz devam eder
* Düşük bağlantı kalitesinde bile stabil kullanım sağlanır

---

## Kullanım Senaryoları

Denetix aşağıdaki alanlarda kullanılabilir:

* Fabrika denetimleri
* İş güvenliği kontrolleri
* Kalite kontrol süreçleri
* Şantiye saha denetimleri
* Teknik servis kontrolleri
* Franchise mağaza denetimleri
* Hijyen ve uygunluk kontrolleri

## Kurulum

### Gereksinimler

* Flutter SDK
* Dart SDK
* Android Studio / VSCode
* Android Emulator veya fiziksel cihaz

### Projeyi Çalıştırma

```bash
git clone https://github.com/yusuftannn/Denetix.git

cd Denetix

flutter pub get

flutter run
```

---

## Teknolojiler

| Teknoloji     | Açıklama                              |
| ------------- | ------------------------------------- |
| Flutter       | Cross-platform mobil geliştirme       |
| Dart          | Uygulama programlama dili             |
| Drift         | SQLite ORM ve lokal database yönetimi |
| SQLite        | Offline veri depolama                 |
| PDF Generator | Otomatik rapor üretimi                |
| Image Picker  | Fotoğraf yönetimi                     |
