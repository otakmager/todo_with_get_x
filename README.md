# To Do With GetX

To Do With GetX adalah aplikasi to do list. Aplikasi ini dibangun dengan state management dari GetX dan Dio sebagai sarana koneksi ke internet. Aplikasi ini juga menyediakan fitur CRUD dalam mengelola TO Do. API yang digunakan dari laman https://api.nstack.in/.

## Installation

1. Siapkan IDE (Integrated Development Environment), seperti VS Code atau Android Studio.
2. Install Flutter.
3. Clone projek ini dari Github atau unduh file Zip-nya. Cloning projek dapat dilakukan dengan menggunakan command prompt berikut:
   ```
   git clone https://github.com/otakmager/todo_with_get_x.git
   ```
4. Unduh dependency yang diperlukan menggunakan command prompt berikut:
   ```
   flutter pub get
   ```
5. Jalankan aplikasi menggunakan browser, windows, smartphone, emulator, atau device yang mendukung Flutter.

## Preview Mobile App

Preview yang disediakan adalah screenshot pada platform Android yang diambil pada tanggal 11 September2024. Berikut ini adalah beberapa tampilan yang disediakan:

1. Screenshot 1\
   <img src="https://github.com/otakmager/todo_with_get_x/blob/main/assets/readme/1.screenshot_1.jpg" width="240">
2. Screenshot 2\
   <img src="https://github.com/otakmager/todo_with_get_x/blob/main/assets/readme/2.screenshot_2.jpg" width="240">
3. Screenshot 3\
   <img src="https://github.com/otakmager/todo_with_get_x/blob/main/assets/readme/3.screenshot_3.jpg" width="240">
4. Screenshot 4\
   <img src="https://github.com/otakmager/todo_with_get_x/blob/main/assets/readme/4.screenshot_4.jpg" width="240">

## Defect

Aplikasi ini masih mempunyai kekurangan dan kecacatan. Kecacatan yang baru diketahui adalah:

1. Aplikasi ini dapat melakukan koneksi ke server melalui Wi-Fi.
2. Aplikasi belum dapat melakukan koneksi ke server melalui jaringan internet seluler. Pesan error yang didapatkan adalah karena masalah type data:
   '''
   type List<ToDo?> is not a subtype of type List<ToDo> of val
   '''
3. Terdapat perbedaan data yang diterima oleh aplikasi yang terhubung dengan Wi-Fi dengan data yang diterima di Swagger.
