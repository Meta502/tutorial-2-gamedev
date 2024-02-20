# Latihan 1: Playtest
## Pertanyaan 1: Apa saja pesan log yang dicetak pada panel **Output**?
Ketika game pertama dimulai, muncul tulisan berikut ini di dalam log:
```
Godot Engine v3.5.stable.official.991bb6ac7 - https://godotengine.org
OpenGL ES 3.0 Renderer: NVIDIA GeForce RTX 3060/PCIe/SSE2
Async. shader compilation: OFF

Platform initialized
```
Saya berasumsi bahwa 3 line pertama merupakan debug line yang di print oleh engine, dan Platform initialized merupakan debug line yang di-print oleh game ketika level pertama di load.

## Pertanyaan 2: Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?
Ketika pesawat menyentuh batas area bawah, tidak ada line yang keluar di Output console, namun ketika pesawat menyentuh batas area atas, keluar tulisan `Reached objective!`

## Pertanyaan 3: Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?
Iya, lokasi/bounding area dari `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel **Output**, yakni menyebabkan game mengoutput `Reached objective!` ketika pesawat memasuki area tersebut.

# Latihan 2: Memanipulasi Node dan Scene
## Pertanyaan 1: Scene BlueShip dan StonePlatform sama-sama memiliki sebuah child node bertipe Sprite. Apa fungsi dari node bertipe Sprite?
`Sprite` berguna untuk menambahkan texture/gambar pada game object yang kita buat. Dalam hal `BlueShip`, objek sprite merupakan objek yang menyebabkan gambar pesawat muncul pada game area.

## Pertanyaan 2: Root node dari scene BlueShip dan StonePlatform menggunakan tipe yang berbeda. BlueShip menggunakan tipe RigidBody2D, sedangkan StonePlatform menggunakan tipe StaticBody2D. Apa perbedaan dari masing-masing tipe node?
`RigidBody2D` merupakan object di Godot yang dapat dipengaruhi oleh collision/force yang di-apply ke objek tersebut. Objek ini dapat berinteraksi dengan berbagai objek lain di levelnya yang kemudian bisa "mendorong" RigidBody dengan memberikannya sebuah gaya.

Sementara itu, `StaticBody2D` merupakan object di Godot yang tidak dipengaruhi oleh collision. StaticBody dapat digunakan untuk membuat objek-objek statis seperti 
lantai ataupun tembok.

## Pertanyaan 3: Ubah nilai atribut Mass dan Weight pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?
Setelah mengubah `Mass` dan `Weight` saya tidak merasakan apapun yang berbeda dengan behaviour dari objek pesawat. Asumsi saya hal ini terjadi karena `Mass` dan `Weight` terikat, dan apabila dikaitkan dengan fisika, object yang memiliki massa lebih tinggi belum tentu akan jatuh lebih cepat dari object yang memiliki massa lebih rendah karena memiliki akselerasi gravitasi yang sama.

Namun, meningkatkan nilai "Mass" dan "Weight" pada tipe `RigidBody2D` menyebabkan objek memiliki inersia yang lebih besar, sehingga apabila kita apply force sebesar 1.0f pada object yang memiliki massa lebih besar, efek dari force tersebut akan lebih kecil dari object yang memiliki massa lebih kecil.

## Pertanyaan 4: Ubah nilai atribut Disabled pada tipe CollisionShape2D di scene StonePlatform, lalu coba jalankan scene MainLevel. Apa yang terjadi?
Ketika `CollisionShape2D` dimatikan, ketika permainan di jalankan pesawat kan jatuh menembus platform.

## Pertanyaan 5: Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?
Ketika atribut `Position` dari `BlueShip` dirubah, maka posisi dari `BlueShip` pada viewport akan berpindah dari posisi semula. 

Sementara itu apabila atribut `Rotation` dirubah, maka `BlueShip` akan berputar dari posisi semula sesuai dengan angka yang di-set pada atribut tersebut. 

Terakhir, ketika atribut `Scale` dirubah, ukuran dari BlueShip pada viewport berubah.

## Pertanyaan 6: Pada scene MainLevel, perhatikan nilai atribut Position node PlatformBlue, StonePlatform, dan StonePlatform2. Mengapa nilai Position node StonePlatform dan StonePlatform2 tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?
Attribute `Position` pada StonePlatform dan StonePlatform2 terlihat tidak sesuai pada editor karena posisi tersebut dihitung relatif terhadap posisi dari parentnya, bukan terhadap koordinat global.

