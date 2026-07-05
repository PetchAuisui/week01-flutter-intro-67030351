# 📱 ใบงานการทดลองที่ 1
## วิชา: การพัฒนาซอฟต์แวร์สำหรับอุปกรณ์เคลื่อนที่ (Mobile Software Development)
## หัวข้อ: ปฐมนิเทศ & แนะนำ Mobile Development — Flutter, Dart & Google AI Studio

---

| รายละเอียด | ข้อมูล |
|---|---|
| **สัปดาห์ที่** | 1 |
| **ชั่วโมง** | 3.5 ชั่วโมง (ทฤษฎี + ปฏิบัติ) |
| **CLO ที่เกี่ยวข้อง** | CLO1, CLO4 |
| **เครื่องมือหลัก** | VS Code, Flutter SDK, Dart, Google AI Studio |
| **เครื่องมือเสริม** | Android SDK Command-line Tools, Chrome Browser, ADB |

> 💡 **ทำไมใช้ VS Code เป็นหลัก?**  
> VS Code มี Flutter Extension ที่ครบถ้วน รองรับการพัฒนา Flutter ได้เต็มรูปแบบโดยไม่ต้องติดตั้ง Android Studio ช่วยประหยัด Storage ได้กว่า 8 GB และเปิดได้เร็วกว่ามาก เราติดตั้งเฉพาะ Android SDK Command-line Tools ที่จำเป็นจริงๆ แทน

---

## 📚 ส่วนที่ 1: เนื้อหาทฤษฎี (Theory)

### 1.1 ภาพรวม Mobile Platform

การพัฒนาแอปพลิเคชันบนอุปกรณ์เคลื่อนที่ในปัจจุบันแบ่งออกเป็น 3 แนวทางหลัก:

#### 1.1.1 Native Development
การพัฒนาเฉพาะสำหรับแต่ละ Platform โดยตรง

| Platform | ภาษา | IDE |
|---|---|---|
| Android | Kotlin / Java | Android Studio |
| iOS | Swift / Objective-C | Xcode |

**ข้อดี:** ประสิทธิภาพสูงสุด เข้าถึง Native API ได้เต็มรูปแบบ  
**ข้อเสีย:** ต้องพัฒนาแยกกัน 2 ชุด ใช้ทรัพยากรมาก

#### 1.1.2 Cross-Platform Development
เขียนโค้ดครั้งเดียวใช้ได้หลาย Platform

| Framework | บริษัท | ภาษา |
|---|---|---|
| **Flutter** | Google | Dart |
| React Native | Meta | JavaScript |
| Xamarin / MAUI | Microsoft | C# |
| Ionic | Ionic Team | HTML/CSS/JS |

#### 1.1.3 Progressive Web App (PWA)
เว็บแอปที่ทำงานคล้าย Native App โดยไม่ต้องติดตั้งจาก Store

---

### 1.2 Flutter คืออะไร และทำไมต้องใช้

**Flutter** คือ UI Toolkit แบบ Open Source จาก Google สำหรับพัฒนาแอปพลิเคชันแบบ Cross-Platform จาก Codebase เดียว รองรับ:

```
Android  |  iOS  |  Web  |  Windows  |  macOS  |  Linux
```

#### สถาปัตยกรรม Flutter

```
┌─────────────────────────────────────────┐
│          Flutter App (Dart Code)        │  ← โค้ดที่เราเขียน
├─────────────────────────────────────────┤
│        Flutter Framework (Dart)         │  ← Widgets, Animation, Painting
│  Material | Cupertino | Widgets | ...   │
├─────────────────────────────────────────┤
│          Flutter Engine (C++)           │  ← Skia/Impeller Rendering
│     Dart VM | Text | Plugins | ...      │
├─────────────────────────────────────────┤
│       Platform-Specific Embedder        │  ← Android / iOS / Web / Desktop
└─────────────────────────────────────────┘
```

#### จุดเด่นของ Flutter

1. **Hot Reload** — เห็นผลการเปลี่ยนแปลงทันทีโดยไม่ต้อง Build ใหม่
2. **Hot Restart** — รีสตาร์ทแอปพลิเคชันพร้อม Reset State ใหม่ทั้งหมด
3. **Own Rendering Engine (Impeller)** — วาด UI เองทุก Pixel ไม่พึ่ง Native Widget
4. **Dart Language** — ภาษาที่ออกแบบมาสำหรับ Flutter โดยเฉพาะ
5. **Rich Widget Library** — มี Widget สำเร็จรูปให้ใช้งานจำนวนมาก
6. **Strong Community** — มี Package และ Plugin ใน pub.dev กว่า 40,000 รายการ

---

### 1.3 Dart Language Overview

**Dart** คือภาษาโปรแกรมแบบ Object-Oriented, Strongly Typed ที่พัฒนาโดย Google รองรับทั้ง AOT (Ahead-of-Time) และ JIT (Just-in-Time) Compilation

#### โครงสร้างพื้นฐานของ Dart

```dart
// main function — จุดเริ่มต้นของโปรแกรม
void main() {
  print('Hello, Flutter!');
  
  // ตัวแปรพื้นฐาน
  String name = 'นักศึกษา';
  int age = 20;
  double gpa = 3.75;
  bool isStudent = true;
  
  // Type Inference ด้วย var
  var course = 'Mobile Development';  // Dart รู้ว่าเป็น String
  
  // Null Safety
  String? nullableName;  // อาจเป็น null ได้
  String nonNullName = 'Must have value';  // ต้องมีค่าเสมอ
}
```

#### ฟังก์ชันพื้นฐาน

```dart
// ฟังก์ชันปกติ
String greet(String name) {
  return 'สวัสดี $name!';  // String Interpolation
}

// Arrow Function (Short Syntax)
int add(int a, int b) => a + b;

// Named Parameters
void createUser({required String name, int age = 18}) {
  print('User: $name, Age: $age');
}

// การเรียกใช้งาน
void main() {
  print(greet('Flutter'));         // สวัสดี Flutter!
  print(add(3, 5));                // 8
  createUser(name: 'Alice', age: 21);
}
```

#### Object-Oriented Programming ใน Dart

```dart
class Animal {
  String name;
  int age;
  
  // Constructor
  Animal(this.name, this.age);
  
  // Named Constructor
  Animal.unknown() : name = 'Unknown', age = 0;
  
  // Method
  void speak() {
    print('$name makes a sound');
  }
  
  // Getter
  String get info => '$name ($age years old)';
}

class Dog extends Animal {
  String breed;
  
  Dog(String name, int age, this.breed) : super(name, age);
  
  @override
  void speak() {
    print('$name says: Woof!');
  }
}
```

#### Collections ใน Dart

```dart
void main() {
  // List (Array)
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  fruits.add('Date');
  
  // Map (Dictionary)
  Map<String, int> scores = {
    'Alice': 95,
    'Bob': 87,
    'Carol': 92,
  };
  
  // Set (Unique values)
  Set<int> numbers = {1, 2, 3, 2, 1};  // จะเก็บ {1, 2, 3}
  
  // Loop
  for (var fruit in fruits) {
    print(fruit);
  }
  
  // List operations
  var evenNumbers = [1,2,3,4,5,6].where((n) => n % 2 == 0).toList();
  // [2, 4, 6]
}
```

---

### 1.4 Flutter Widget System

ทุกอย่างใน Flutter คือ **Widget** — ตั้งแต่ปุ่ม, ข้อความ, Layout ไปจนถึง Animation

#### ประเภทของ Widget

| ประเภท | คำอธิบาย | ตัวอย่าง |
|---|---|---|
| **StatelessWidget** | UI ไม่เปลี่ยนแปลงหลัง Build | `Text`, `Icon`, `Image` |
| **StatefulWidget** | UI เปลี่ยนแปลงได้ตาม State | `Checkbox`, `TextField`, `AnimatedWidget` |

#### Widget Tree ตัวอย่าง

```
MaterialApp
└── Scaffold
    ├── AppBar
    │   └── Text ("My App")
    └── Body
        └── Center
            └── Column
                ├── Text ("Hello, World!")
                └── ElevatedButton
                    └── Text ("Click Me")
```

#### StatelessWidget

```dart
class MyWidget extends StatelessWidget {
  final String title;  // ข้อมูลที่รับเข้ามา (Immutable)
  
  const MyWidget({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 24));
  }
}
```

#### StatefulWidget

```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});
  
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;  // State variable
  
  void _increment() {
    setState(() {  // แจ้ง Flutter ให้ rebuild Widget
      _count++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

---

### 1.5 แนวโน้ม AI ใน Mobile Development

การนำ AI มาใช้ใน Mobile Application กำลังเติบโตอย่างรวดเร็ว ครอบคลุม:

| Use Case | ตัวอย่าง | เทคโนโลยี |
|---|---|---|
| **Text Generation** | Chatbot, สรุปข้อความ, แปลภาษา | Gemini API |
| **Vision / Image Analysis** | OCR, Object Detection, Face Recognition | Gemini Vision |
| **Voice** | Speech-to-Text, Text-to-Speech | Google Cloud Speech |
| **On-Device AI** | ประมวลผลโดยไม่ต้องใช้ Internet | TFLite, ML Kit |
| **Personalization** | แนะนำสินค้า, Adaptive UI | Vertex AI |

#### Google AI Studio คืออะไร

**Google AI Studio** (aistudio.google.com) คือ Web Interface สำหรับ:
- ทดลองใช้งาน **Gemini API** โดยตรง
- เขียนและทดสอบ **Prompt** ก่อนนำไปใช้ในแอป
- สร้าง **API Key** สำหรับใช้งานใน Flutter
- ดู **Code Snippet** ที่พร้อมนำไปใช้งาน (รองรับ Python, JavaScript, Dart)

---

## 🔬 ส่วนที่ 2: ใบงานการทดลอง (Lab Worksheet)

### วัตถุประสงค์การทดลอง (Objectives)

เมื่อเสร็จสิ้นการทดลองนี้ นักศึกษาสามารถ:

1. ✅ ติดตั้งและตั้งค่า Flutter SDK พร้อมใช้งาน
2. ✅ ตรวจสอบ Environment ด้วยคำสั่ง `flutter doctor`
3. ✅ สร้างและรัน Flutter Application ตัวแรก
4. ✅ ทดลองใช้งาน Hot Reload และ Hot Restart
5. ✅ สร้างบัญชี Google AI Studio และทดลอง Gemini API
6. ✅ นำ Gemini API มาใช้ใน Flutter App เบื้องต้น

---

### เครื่องมือและซอฟต์แวร์ที่ต้องการ (Requirements)

| รายการ | เวอร์ชัน | หมายเหตุ |
|---|---|---|
| VS Code | Latest | code.visualstudio.com — **เครื่องมือหลัก** |
| Flutter SDK | ≥ 3.19.0 (Stable) | flutter.dev/docs/get-started/install |
| Android SDK Command-line Tools | Latest | developer.android.com/studio#command-line-tools-only |
| Git | Latest | git-scm.com |
| Google Chrome | Latest | สำหรับรัน Flutter Web และ AI Studio |
| Google Account | — | สำหรับ AI Studio |
| RAM | ≥ 8 GB | แนะนำ 16 GB |
| Storage | ≥ 5 GB | Flutter SDK + Android SDK (ไม่รวม Android Studio ช่วยประหยัด ~8 GB) |

> ⚠️ **ไม่ต้องติดตั้ง Android Studio** ใบงานนี้ใช้ VS Code + Android SDK Command-line Tools แทนทั้งหมด

---

## 🧪 การทดลองที่ 1: ติดตั้งและตั้งค่า Flutter SDK

### ขั้นตอนที่ 1: ดาวน์โหลด Flutter SDK

#### สำหรับ Windows

1. เปิดเบราว์เซอร์ไปที่ https://docs.flutter.dev/get-started/install/windows
2. คลิก **"flutter_windows_x.x.x-stable.zip"** เพื่อดาวน์โหลด
3. สร้างโฟลเดอร์ `C:\src\flutter` (ห้ามสร้างใน `C:\Program Files\` เพราะต้องการสิทธิ์ Admin)
4. แตกไฟล์ ZIP ลงใน `C:\src\flutter`

```
C:\src\flutter\
    bin\
    packages\
    examples\
    ...
```

> ⚠️ **ข้อควรระวัง:** ห้ามวาง Flutter ใน path ที่มี space หรืออักขระพิเศษ เช่น `C:\My Documents\flutter`

#### สำหรับ macOS

```bash
# วิธีที่ 1: ใช้ Homebrew (แนะนำ)
brew install flutter

# วิธีที่ 2: ดาวน์โหลดและแตกไฟล์เอง
cd ~/development
unzip ~/Downloads/flutter_macos_x.x.x-stable.zip
```

#### สำหรับ Linux

```bash
# ดาวน์โหลดและแตกไฟล์
cd ~/development
tar xf ~/Downloads/flutter_linux_x.x.x-stable.tar.xz
```

---

### ขั้นตอนที่ 2: เพิ่ม Flutter ใน PATH

#### Windows

1. กด `Windows Key` + `S` พิมพ์ **"Environment Variables"**
2. คลิก **"Edit the system environment variables"**
3. คลิก **"Environment Variables..."**
4. ใต้ **"User variables"** เลือก **"Path"** → คลิก **"Edit"**
5. คลิก **"New"** → พิมพ์ `C:\src\flutter\bin`
6. คลิก **"OK"** ทุก Dialog
7. ปิดและเปิด Command Prompt ใหม่

#### macOS / Linux

```bash
# เปิดไฟล์ ~/.zshrc (macOS) หรือ ~/.bashrc (Linux)
nano ~/.zshrc

# เพิ่มบรรทัดนี้ที่ท้ายไฟล์
export PATH="$HOME/development/flutter/bin:$PATH"

# บันทึกและโหลดการตั้งค่า
source ~/.zshrc
```

---

### ขั้นตอนที่ 3: ตรวจสอบ Flutter Installation เบื้องต้น

เปิด Terminal ใน VS Code (`` Ctrl+` ``) แล้วพิมพ์:

```bash
flutter doctor
```

**ผลลัพธ์ที่คาดหวังหลังติดตั้ง Flutter SDK เพียงอย่างเดียว (ยังไม่มี Android SDK):**

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x)
[✗] Android toolchain - develop for Android devices
      ✗ Unable to locate Android SDK.
        Install Android Studio from: https://developer.android.com/studio
        (or visit https://flutter.dev/to/android-setup for detailed instructions)
[✓] Chrome - develop for the web
[!] Android Studio (not installed)
[!] VS Code (not installed)
[✓] Network resources
```

> 📝 `[✗] Android toolchain` แสดงว่ายังไม่มี Android SDK — **ต้องแก้ไขในขั้นตอนที่ 4**
> `[✓] Chrome` หมายความว่าสามารถรัน Flutter บน Chrome ได้แล้วทันที โดยไม่ต้องรอ Android SDK

---

### ขั้นตอนที่ 4: ติดตั้ง Android SDK Command-line Tools (แทน Android Studio)

เราจะติดตั้งเฉพาะ **Command-line Tools** ซึ่งให้ทุกอย่างที่ Flutter ต้องการ โดยไม่ต้องติดตั้ง Android Studio IDE ทั้งตัว

> ⚠️ **ข้อกำหนดเบื้องต้น:** Android SDK Command-line Tools ต้องการ **Java JDK** ในการทำงาน ถ้ารัน `sdkmanager` แล้วได้ Error ว่า `JAVA_HOME is not set` หรือ `no 'java' command found` ให้ทำขั้นตอน 4.0 ก่อน

#### 4.0 ติดตั้ง Java JDK (จำเป็นสำหรับ Android SDK Tools)

**ทำไมต้องใช้ Java?** Android SDK Command-line Tools เช่น `sdkmanager` และ `avdmanager` เขียนด้วย Java จึงต้องมี JDK ติดตั้งไว้ก่อน แนะนำ **JDK 17** ซึ่งเป็น Version ที่ Flutter และ Android Gradle รองรับดีที่สุด

**ตรวจสอบก่อนว่ามี Java อยู่แล้วหรือไม่:**

```bash
java -version
# ถ้ามีแล้วจะแสดงเช่น: openjdk version "17.x.x"
# ถ้าไม่มีจะขึ้น: command not found หรือ java is not recognized
```

**ถ้ายังไม่มี ให้ติดตั้ง JDK 17 หรือ version ที่สูงกว่า:**

**Windows:**

```powershell
# วิธีที่ 1: ใช้ winget (Windows Package Manager — มีใน Windows 10/11)
winget install Microsoft.OpenJDK.17

# ตรวจสอบว่าติดตั้งสำเร็จ (ปิด vs code แล้วเปิดใหม่ก่อน หรือตรวจสอบจาก command prompt ของ windows)
java -version
# ควรแสดง: openjdk version "17.x.x"
```

```powershell
# วิธีที่ 2: ดาวน์โหลดและติดตั้งเอง
# 1. เปิดเบราว์เซอร์ไปที่ https://adoptium.net/
# 2. คลิก "Latest LTS release" → เลือก JDK 17
# 3. ดาวน์โหลด Windows x64 Installer (.msi)
# 4. ดับเบิลคลิกติดตั้ง ติ๊ก "Set JAVA_HOME" ด้วย
# 5. เปิด Terminal ใหม่แล้วทดสอบ
java -version
```

**macOS:**

```bash
# วิธีที่ 1: ใช้ Homebrew (แนะนำ)
brew install --cask temurin@17

# วิธีที่ 2: ดาวน์โหลดจาก adoptium.net
# https://adoptium.net/ → JDK 17 → macOS (.pkg)
# ติดตั้งแล้ว JAVA_HOME จะถูกตั้งค่าอัตโนมัติ

# ตรวจสอบ
java -version
# ควรแสดง: openjdk version "17.x.x"
```

**Linux (Ubuntu/Debian):**

```bash
# ติดตั้ง OpenJDK 17
sudo apt update
sudo apt install -y openjdk-17-jdk

# ตรวจสอบ
java -version
# ควรแสดง: openjdk version "17.x.x"
```

**ตั้งค่า JAVA_HOME (ถ้า sdkmanager ยังแจ้ง Error):**

Windows (PowerShell):
```powershell
# หา path ของ Java ที่ติดตั้ง
# ปกติจะอยู่ที่ C:\Program Files\Eclipse Adoptium\jdk-17.x.x.x-hotspot\
# หรือ C:\Program Files\Microsoft\jdk-17.x.x.x-hotspot\

# ตั้งค่า JAVA_HOME
[System.Environment]::SetEnvironmentVariable(
  "JAVA_HOME",
  "C:\Program Files\Eclipse Adoptium\jdk-17.x.x.x-hotspot",
  "User"
)
# แทนที่ path ด้วย path จริงของเครื่องคุณ
# ปิด vs code แล้วเปิดใหม่
```

macOS/Linux:
```bash
# ตรวจสอบ JAVA_HOME ที่ควรเป็น
/usr/libexec/java_home -v 17   # macOS เท่านั้น

# เพิ่มใน ~/.zshrc หรือ ~/.bashrc
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 17)' >> ~/.zshrc  # macOS
# หรือ
echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> ~/.bashrc  # Linux
source ~/.zshrc  # หรือ source ~/.bashrc

# ตรวจสอบ
echo $JAVA_HOME
java -version
```

**ทดสอบขั้นสุดท้ายก่อนไปขั้นตอน 4.1:**

```bash
java -version
# ต้องแสดง: openjdk version "17.x.x" หรือใกล้เคียง

echo $JAVA_HOME   # macOS/Linux
echo %JAVA_HOME%  # Windows CMD
# ต้องแสดง path ที่มี jdk อยู่ ไม่ใช่ค่าว่าง
```

> ✅ ถ้า `java -version` แสดงผลได้ → พร้อมไปขั้นตอน 4.1  
> ❌ ถ้ายังขึ้น `JAVA_HOME is not set` หลังตั้งค่าแล้ว → ลอง **ปิด VS Code ทั้งหมด แล้วเปิดใหม่** เพื่อให้ Environment Variables มีผล

---

#### 4.1 ดาวน์โหลด Android Command-line Tools

1. เปิดเบราว์เซอร์ไปที่ https://developer.android.com/studio#command-line-tools-only
2. เลื่อนลงหาส่วน **"Command line tools only"**
3. คลิกดาวน์โหลดไฟล์ตาม OS ของคุณ:
   - Windows: `commandlinetools-win-XXXXXXXX_latest.zip`
   - macOS: `commandlinetools-mac-XXXXXXXX_latest.zip`
   - Linux: `commandlinetools-linux-XXXXXXXX_latest.zip`

#### 4.2 ติดตั้ง Command-line Tools

**Windows (PowerShell ใน VS Code Terminal):**

```powershell
# 1. สร้างโฟลเดอร์ (โครงสร้าง cmdline-tools\latest สำคัญมาก ห้ามข้ามขั้นตอน)
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Android\cmdline-tools\latest"

# 2. แตกไฟล์ ZIP ที่ดาวน์โหลดมา
# ตัวอย่าง: ถ้าดาวน์โหลดไว้ที่ Downloads\commandlinetools-win-*.zip
Expand-Archive -Path "$env:USERPROFILE\Downloads\commandlinetools-win-*_latest.zip" -DestinationPath "$env:TEMP\cmdtools"

# 3. Copy ไฟล์ทั้งหมดใน cmdline-tools\ ไปวางที่ latest\
Copy-Item -Path "$env:TEMP\cmdtools\cmdline-tools\*" `
          -Destination "$env:USERPROFILE\Android\cmdline-tools\latest" `
          -Recurse -Force

# 4. ตั้งค่า Environment Variables (รันใน PowerShell ปกติ ไม่ต้อง Admin)
[System.Environment]::SetEnvironmentVariable(
  "ANDROID_HOME", "$env:USERPROFILE\Android", "User"
)
$p = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable(
  "Path",
  "$p;$env:USERPROFILE\Android\cmdline-tools\latest\bin;$env:USERPROFILE\Android\platform-tools",
  "User"
)

# 5. ปิด vs code แล้วเปิดใหม่ จากนั้นทดสอบ
sdkmanager --version
# ควรแสดงตัวเลข version เช่น 12.0
```

**macOS/Linux (Terminal ใน VS Code):**

```bash
# 1. สร้างโฟลเดอร์ (โครงสร้าง cmdline-tools/latest สำคัญมาก)
mkdir -p ~/Android/cmdline-tools/latest

# 2. แตกไฟล์ ZIP และ copy เนื้อหาไปที่ latest/
unzip ~/Downloads/commandlinetools-*.zip -d /tmp/cmdtools
cp -r /tmp/cmdtools/cmdline-tools/* ~/Android/cmdline-tools/latest/

# 3. เพิ่ม PATH ใน ~/.zshrc (macOS) หรือ ~/.bashrc (Linux)
echo 'export ANDROID_HOME="$HOME/Android"' >> ~/.zshrc
echo 'export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"' >> ~/.zshrc

# 4. โหลดการตั้งค่าใหม่และทดสอบ
source ~/.zshrc
sdkmanager --version
# ควรแสดงตัวเลข version เช่น 12.0
```

> ⚠️ **โครงสร้างโฟลเดอร์ที่ถูกต้อง — ต้องเป็นแบบนี้เท่านั้น:**
> ```
> ~/Android/
>   cmdline-tools/
>     latest/
>       bin/          ← sdkmanager, avdmanager อยู่ที่นี่
>       lib/
>       NOTICE.txt
>       source.properties
>
> ✅ ถูก:  ~/Android/cmdline-tools/latest/bin/sdkmanager
> ❌ ผิด:  ~/Android/cmdline-tools/bin/sdkmanager   (ขาด latest/)
> ❌ ผิด:  ~/Android/bin/sdkmanager                 (ขาดทั้ง 2 ชั้น)
> ```

#### 4.3 ติดตั้ง Android SDK Components ที่จำเป็น

```bash
# ติดตั้ง Build Tools และ Platform ที่ Flutter ต้องการ
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# ติดตั้ง System Image สำหรับ Emulator (ใช้เวลาประมาณ 5-10 นาที)
sdkmanager "system-images;android-34;google_apis;x86_64"

# ติดตั้ง Emulator binary
sdkmanager "emulator"

# ตรวจสอบสิ่งที่ติดตั้งแล้ว
sdkmanager --list_installed
```

#### 4.4 ยอมรับ Android Licenses

```bash
flutter doctor --android-licenses
# พิมพ์ y แล้วกด Enter ทุกครั้งที่ถาม
# จนขึ้น "All SDK package licenses accepted"
```

#### 4.5 ตรวจสอบผลลัพธ์หลังติดตั้ง Android SDK

```bash
flutter doctor
```

**ผลลัพธ์ที่คาดหวัง (หลังติดตั้ง Android SDK สำเร็จ):**

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.x.x)
      • Android SDK at ~/Android (หรือ C:\Users\xxx\Android)
      • Build Tools 34.0.0
[✓] Chrome - develop for the web
[!] Android Studio (not installed)   ← [!] ปกติ ไม่ต้องแก้
[✓] VS Code (version x.x.x)
      • Flutter extension version x.x
[✓] Network resources

! Doctor found issues in 1 category.
```

> ✅ `[✓] Android toolchain` ผ่านแล้ว — Flutter พร้อมสร้างแอป Android  
> ✅ `[!] Android Studio (not installed)` **ไม่ใช่ Error** — เราใช้ Command-line Tools แทนโดยตั้งใจ  
> ❗ ถ้ายังเห็น `[✗] Android toolchain` — ตรวจสอบโครงสร้างโฟลเดอร์ใน 4.2 และ PATH ว่าถูกต้อง

> 📝 **บันทึกผล:** จดบันทึก Error (`[✗]`) ที่พบ และทำการแก้ไขตามคำแนะนำ  
> ไม่ต้องแก้ไขรายการที่ขึ้น `[!] Android Studio`

---

### ขั้นตอนที่ 5: ติดตั้ง VS Code และ Flutter Extension

#### 5.1 ติดตั้ง VS Code

1. เปิดเบราว์เซอร์ไปที่ https://code.visualstudio.com
2. คลิก **Download** สำหรับ OS ของคุณ
3. ติดตั้งตามขั้นตอนปกติ
4. เปิด VS Code ขึ้นมา

#### 5.2 ติดตั้ง Flutter Extensions

1. กด `Ctrl+Shift+X` (Windows/Linux) หรือ `Cmd+Shift+X` (macOS) เพื่อเปิด Extensions panel
2. ค้นหาและติดตั้ง Extensions ต่อไปนี้ทีละตัว:

| Extension | Publisher | สำคัญ | หน้าที่ |
|---|---|---|---|
| **Flutter** | Dart Code | ✅ จำเป็น | Flutter support ครบทุกอย่าง |
| **Dart** | Dart Code | ✅ จำเป็น | Dart language support |
| **Error Lens** | Alexander | แนะนำ | แสดง Error/Warning inline ในบรรทัดโค้ด |
| **Pubspec Assist** | Jeroen Meijer | แนะนำ | ค้นหาและเพิ่ม Package ใน pubspec.yaml |
| **Flutter Widget Snippets** | Alexis Coulombe | แนะนำ | Code Snippets สำเร็จรูป พิมพ์ `stl` ได้ StatelessWidget |
| **GitLens** | GitKraken | แนะนำ | ดู Git history inline ในโค้ด |

3. รีสตาร์ท VS Code หลังติดตั้งครบ

#### 5.3 Shortcut สำคัญที่ใช้บ่อยใน VS Code

| Shortcut (Windows/Linux) | Shortcut (macOS) | การทำงาน |
|---|---|---|
| `Ctrl+Shift+P` | `Cmd+Shift+P` | Command Palette — ค้นหาคำสั่ง Flutter |
| `` Ctrl+` `` | `` Ctrl+` `` | เปิด/ปิด Integrated Terminal |
| `Ctrl+S` | `Cmd+S` | Save + **Hot Reload อัตโนมัติ** |
| `F5` | `F5` | Run & Debug |
| `Shift+F5` | `Shift+F5` | Stop |
| `Ctrl+Shift+X` | `Cmd+Shift+X` | Extensions panel |
| `Ctrl+Shift+F` | `Cmd+Shift+F` | Search across all files |

---

## 🧪 การทดลองที่ 2: สร้าง Flutter Hello World Application

### ขั้นตอนที่ 1: สร้างโปรเจกต์ใหม่

มี 2 วิธี เลือกวิธีที่ถนัด:

#### วิธีที่ 1: ผ่าน VS Code Command Palette (แนะนำ)

1. กด **`Ctrl+Shift+P`** เพื่อเปิด Command Palette
2. พิมพ์ `Flutter: New Project` แล้วกด Enter
3. เลือก **Application**
4. เลือกโฟลเดอร์ที่ต้องการเก็บโปรเจกต์ (เช่น `~/Projects` หรือ `C:\Projects`)
5. ตั้งชื่อโปรเจกต์ว่า `week01_hello_flutter` แล้วกด Enter
6. VS Code จะสร้างโปรเจกต์และเปิดให้อัตโนมัติ

#### วิธีที่ 2: ผ่าน Integrated Terminal

```bash
# เปิด Terminal ใน VS Code ด้วย Ctrl+`
# จากนั้นเปลี่ยนไปที่โฟลเดอร์ที่ต้องการ
cd ~/Projects   # macOS/Linux
# หรือ
cd C:\Projects  # Windows

# สร้าง Flutter Project ใหม่
flutter create week01_hello_flutter

# เข้าไปในโฟลเดอร์โปรเจกต์
cd week01_hello_flutter

# เปิดด้วย VS Code
code .
```

**โครงสร้างโปรเจกต์ที่สร้างขึ้น:**

```
week01_hello_flutter/
├── android/          ← Native Android Code
├── ios/              ← Native iOS Code
├── lib/
│   └── main.dart     ← 🎯 โค้ดหลักของเรา
├── test/
│   └── widget_test.dart
├── web/              ← Web Support
├── pubspec.yaml      ← Project Configuration & Dependencies
└── README.md
```

---

### ขั้นตอนที่ 2: ตั้งค่า Target Device

มีตัวเลือก 3 แบบ เลือกแบบที่เหมาะกับสถานการณ์ของคุณ

#### ตัวเลือกที่ 1: Chrome Browser (แนะนำสำหรับเริ่มต้น — ไม่ต้องตั้งค่าเพิ่ม)

Chrome พร้อมใช้งานทันทีที่ติดตั้ง Flutter ไม่ต้องทำขั้นตอนใดเพิ่มเติม เหมาะมากสำหรับการทดสอบ UI ในช่วงแรก

```bash
# รันแอปบน Chrome โดยตรง
flutter run -d chrome

# ตรวจสอบว่า Chrome ถูกตรวจพบ
flutter devices
# ควรเห็น: Chrome (web) • chrome • web-javascript • Google Chrome 1xx
```

> 💡 **เคล็ดลับ:** Flutter DevTools ทำงานได้เต็มรูปแบบบน Chrome รวมถึง Widget Inspector, Performance Profiler และ Memory Analyzer

---

#### ตัวเลือกที่ 2: Android Emulator ผ่าน Command Line (ไม่ต้องใช้ Android Studio)

เราจะสร้างและจัดการ Emulator ผ่าน `avdmanager` และ `emulator` ซึ่งติดตั้งมาพร้อมกับ Android SDK Command-line Tools

**ขั้นตอน 2.1 — ดาวน์โหลด System Image (ถ้ายังไม่ได้ทำในขั้นตอนที่ 4):**

```bash
# ตรวจสอบว่า System Image ติดตั้งแล้วหรือยัง หลังรันคำสั่งให้หาดูว่ามี system-images หรือไม่
sdkmanager --list_installed 

# ถ้ายังไม่มี ติดตั้ง System Image API 34
sdkmanager "system-images;android-34;google_apis;x86_64"
```

**ขั้นตอน 2.2 — ติดตั้ง Emulator:**

```bash
# ติดตั้ง Emulator binary ผ่าน sdkmanager
sdkmanager "emulator"
```

**ขั้นตอน 2.3 — เพิ่ม emulator ใน PATH:**

Windows (PowerShell):
```powershell
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable(
  "Path",
  "$currentPath;$env:USERPROFILE\Android\emulator",
  "User"
)
# ปิดและเปิด Terminal ใหม่
```

macOS/Linux:
```bash
echo 'export PATH="$ANDROID_HOME/emulator:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**ขั้นตอน 2.4 — สร้าง Android Virtual Device (AVD):**

```bash
# ดู Hardware Profile ที่ใช้ได้
avdmanager list device 

# สร้าง Emulator (Pixel 7, Android 14, x86_64)
avdmanager create avd --name "Pixel7_API34" --package "system-images;android-34;google_apis;x86_64" --device "pixel_7"

# ตรวจสอบว่าสร้างสำเร็จ
avdmanager list avd
```

ผลลัพธ์ที่คาดหวัง:
```
Available Android Virtual Devices:
    Name: Pixel7_API34
    Path: ~/.android/avd/Pixel7_API34.avd
  Target: Google APIs (Google Inc.)
          Based on: Android 14.0 (API 34)
    ABI : google_apis/x86_64
```

**ขั้นตอน 2.5 — เปิด Emulator:**

```bash
# เปิด Emulator (รอประมาณ 30-60 วินาที)
emulator -avd Pixel7_API34

# หรือเปิดแบบ No Window สำหรับ CI/CD
emulator -avd Pixel7_API34 -no-window &
```

**ขั้นตอน 2.6 — เลือก Device ใน VS Code:**

เมื่อ Emulator เปิดแล้ว VS Code จะตรวจพบโดยอัตโนมัติ ดู Device Selector ที่ **Status Bar ด้านล่างขวา**:

```
┌────────────────────────────────────────────────────────────────┐
│  ... (Editor) ...                                              │
├────────────────────────────────────────────────────────────────┤
│  🔵 Dart   ⚡ Flutter   [sdk gphone (android-x86)]   ...      │
└────────────────────────────────────────────────────────────────┘
                               ↑
                    คลิกตรงนี้เพื่อเปลี่ยน Device
```

---

#### ตัวเลือกที่ 3: Android Device จริง (แนะนำที่สุด)

ใช้โทรศัพท์จริง ไม่ต้องการ RAM มากเหมือน Emulator และ Performance ดีกว่า

**ขั้นตอน 3.1 — เปิด Developer Options บนโทรศัพท์:**

1. เปิด **Settings** บนโทรศัพท์ Android
2. ไปที่ **About Phone** (อาจอยู่ใน Settings ตรงๆ หรือใน System)
3. แตะ **Build Number** 7 ครั้งติดต่อกัน
4. จะขึ้นข้อความ **"You are now a developer!"**

**ขั้นตอน 3.2 — เปิด USB Debugging:**

1. กลับไปที่ **Settings**
2. เข้า **Developer Options** (มักอยู่ที่ Settings > System > Developer Options)
3. เปิด **USB Debugging** → กด **OK** เมื่อถามยืนยัน

**ขั้นตอน 3.3 — เชื่อมต่อกับคอมพิวเตอร์:**

1. เชื่อมต่อโทรศัพท์ด้วยสาย USB
2. บนโทรศัพท์จะขึ้น Popup **"Allow USB Debugging?"** → กด **Allow**
3. เลือก **File Transfer (MTP)** เมื่อถามโหมดการเชื่อมต่อ

**ขั้นตอน 3.4 — ตรวจสอบว่า ADB มองเห็นโทรศัพท์:**

```bash
# ตรวจสอบ Device ที่เชื่อมต่อ
adb devices

# ผลลัพธ์ที่ถูกต้อง:
# List of devices attached
# XXXXXXXXXXXXXXXXX    device   ← ต้องขึ้น "device" ไม่ใช่ "unauthorized"
```

> ❗ ถ้าขึ้น `unauthorized` — ให้ดูที่โทรศัพท์แล้วกด **"Allow"** ในกล่องข้อความ USB Debugging

**ขั้นตอน 3.5 — VS Code จะตรวจพบโทรศัพท์อัตโนมัติ** ดู Device Selector ที่ Status Bar ด้านล่างขวา

---

#### ตรวจสอบ Device ทั้งหมดที่เชื่อมต่อ

```bash
flutter devices
```

ตัวอย่างผลลัพธ์เมื่อมีทั้ง Device จริงและ Chrome:

```
Found 3 connected devices:
  SM-A546E (mobile)    • RFXXXXXXXXX • android-arm64 • Android 14 (API 34)
  sdk gphone (mobile)  • emulator-5554 • android-x86  • Android 14 (API 34)
  Chrome (web)         • chrome       • web-javascript • Google Chrome 1xx
```

---

### ขั้นตอนที่ 3: ทำความเข้าใจโค้ดเริ่มต้น

เปิดไฟล์ `lib/main.dart` และศึกษาโค้ด:

```dart
import 'package:flutter/material.dart';

// จุดเริ่มต้นของแอปพลิเคชัน
void main() {
  runApp(const MyApp());
}

// Root Widget ของแอป — เป็น StatelessWidget เพราะไม่มี State
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// หน้าหลัก — เป็น StatefulWidget เพราะมี Counter ที่เปลี่ยนแปลงได้
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

> 📝 **แบบฝึกหัด:** วาด Widget Tree ของโค้ดนี้ลงในใบงาน

---

### ขั้นตอนที่ 4: รันแอปพลิเคชันครั้งแรก

มี 2 วิธีในการรัน เลือกวิธีที่ถนัด:

#### วิธีที่ 1: Run ผ่าน VS Code (แนะนำ)

1. ตรวจสอบว่าเลือก Device แล้วที่ **Status Bar ด้านล่างขวา** ของ VS Code
   - ถ้ายังไม่มี Device → คลิกที่ Status Bar แล้วเลือก **Chrome (web)**
2. กด **`F5`** เพื่อ Run & Debug  
   หรือกด **`Ctrl+F5`** เพื่อ Run without Debug (เร็วกว่าเล็กน้อย)
3. รอจนแอปเปิดขึ้นมาบน Device หรือ Chrome

```
VS Code Status Bar:
┌──────────────────────────────────────────────────────────────────┐
│  🔵 Dart   ⚡ Flutter   [Chrome (web)]   0 errors   0 warnings  │
└──────────────────────────────────────────────────────────────────┘
                              ↑ คลิกเพื่อเปลี่ยน Device
```

#### วิธีที่ 2: Run ผ่าน Integrated Terminal

เปิด Terminal ใน VS Code ด้วย `` Ctrl+` `` แล้วรัน:

```bash
# รันบน Chrome (ไม่ต้องมี Emulator หรือ Device)
flutter run -d chrome

# รันบน Android Device จริงที่เชื่อมต่ออยู่
flutter run

# รันบน Emulator ที่เปิดไว้
flutter run -d emulator-5554

# ดู Device ID ทั้งหมดก่อนเลือก
flutter devices
```

**เมื่อแอปรันแล้ว ทดลองคำสั่งต่อไปนี้ใน Terminal:**

| คำสั่ง | การทำงาน | ใช้เมื่อไหร่ |
|---|---|---|
| `r` | **Hot Reload** — รีโหลด UI คง State ไว้ | แก้ไข UI, สี, ข้อความ |
| `R` | **Hot Restart** — รีสตาร์ททั้งแอป Reset State | เพิ่ม Class ใหม่, แก้ initState |
| `p` | Toggle แสดงขอบ Widget | Debug Layout |
| `P` | Toggle Performance Overlay | Debug Performance |
| `q` | ปิดแอป | เสร็จงาน |

> 💡 **Tip:** กด **`Ctrl+S`** ใน VS Code Editor จะ Hot Reload อัตโนมัติทันที ไม่ต้องสลับไปพิมพ์ใน Terminal

---

### ขั้นตอนที่ 5: แก้ไขแอปให้แสดงข้อมูลของตัวเอง

แก้ไขไฟล์ `lib/main.dart` เพื่อสร้าง **Profile Card**:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            
            // รูปโปรไฟล์
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.teal,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            
            const SizedBox(height: 16),
            
            // ชื่อ — TODO: เปลี่ยนเป็นชื่อของคุณ
            const Text(
              'ชื่อ นามสกุล',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // รหัสนักศึกษา — TODO: เปลี่ยนเป็นรหัสของคุณ
            const Text(
              'รหัสนักศึกษา: XXXXXXXX',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            
            const SizedBox(height: 24),
            
            // Card ข้อมูล
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.school, 'คณะ', 'วิทยาศาสตร์และเทคโนโลยี'),
                    const Divider(),
                    _buildInfoRow(Icons.code, 'วิชาที่ชอบ', 'Mobile Development'),
                    const Divider(),
                    _buildInfoRow(Icons.star, 'เป้าหมาย', 'พัฒนาแอปให้ได้ 1 ตัว'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Helper Method สร้างแถวข้อมูล
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
```

**TODO สำหรับนักศึกษา:**
- [x] เปลี่ยนชื่อและรหัสนักศึกษาให้เป็นของตัวเอง
- [x] เปลี่ยนข้อมูลในแถวข้อมูลให้เป็นของตัวเอง
- [x] เพิ่ม Row ข้อมูลเพิ่มเติมอีก 2 แถว
- [x] ลองเปลี่ยนสี Theme จาก `Colors.teal` เป็นสีอื่น

**บันทึกผลการทดลอง**
> <img width="1470" height="922" alt="image" src="https://github.com/user-attachments/assets/9d551291-6038-4cc6-a213-7b908cb6da7d" />

---

### ขั้นตอนที่ 6: ทดลอง Hot Reload

1. รันแอปให้แสดงบน Emulator/Device
2. เปลี่ยนข้อความ `'Profile'` ใน AppBar เป็น `'โปรไฟล์ของฉัน'`
3. **บันทึกไฟล์** (Ctrl+S) → สังเกตว่า UI อัปเดตทันที
4. เปลี่ยนสี `Colors.teal` เป็น `Colors.orange`
5. บันทึกไฟล์อีกครั้ง → สังเกตการเปลี่ยนสีทันที
6. ลองกด **R** ใน Terminal เพื่อ Hot Restart

> 🔍 **ข้อสังเกต:** Hot Reload vs Hot Restart ต่างกันอย่างไร? บันทึกการสังเกตลงในใบงาน

> #### Hot Reload vs Hot Restart ต่างกันอย่างไร?
> 1. Hot Reload
> - การทำงาน: เป็นการนำโค้ดเฉพาะส่วนที่เพิ่งแก้ไข (มักจะเป็นไฟล์ประเภท UI เช่น Widget build) ฉีดเข้าไปใน Dart Virtual Machine (VM) ที่กำลังรันอยู่บน Emulator หรือเครื่องจริงโดยตรง
> - ผลกระทบต่อ State (ข้อมูลในแอป): จะยังคงรักษาข้อมูลเดิมไว้ หมายความว่า ถ้าเราเปิดแอปอยู่ที่หน้าไหน หรือกรอกข้อมูลอะไรค้างไว้ แอปจะไม่รีเซ็ตกลับไปหน้าแรก แต่จะเปลี่ยนดีไซน์หรือข้อความในหน้านั้นให้ทันที
> - ความเร็ว: เร็วมาก (ใช้เวลาเฉลี่ย < 1 วินาที)
> - หมาะสำหรับ: การปรับแต่งหน้าตา UI, การจูนสี, การจัด Layout หรือการแก้ข้อความ/คำผิดใน Widget
> 2. Hot Restart
> - การทำงาน : เป็นการทำลายหน่วยความจำเดิมทิ้งทั้งหมด แล้วเริ่มรันแอปพลิเคชันขึ้นมาใหม่ตั้งแต่จุดเริ่มต้น (นับหนึ่งใหม่ที่ฟังก์ชัน main())
> - ผลกระทบต่อ State (ข้อมูลในแอป): ข้อมูลเดิมจะหายทั้งหมด (Lose State) แอปพลิเคชันจะถูกรีเซ็ตและย้อนกลับไปแสดงผลที่หน้าแรกสุด (Home Page) เสมือนเพิ่งเปิดแอปพลิเคชันขึ้นมาใหม่
> - ความเร็ว: ช้ากว่า Hot Reload เล็กน้อย (ใช้เวลาประมาณ 2 - 5 วินาที ขึ้นอยู่กับขนาดของโปรเจกต์)
> - เหมาะสำหรับ: การแก้ไขฟังก์ชัน main(), โค้ดส่วนที่เป็นการตั้งค่าเริ่มต้นก่อนเปิดแอป (Initialization), การเปลี่ยนตัวแปรที่เป็นสถิต (Static/Global variables) หรือเมื่อแอปเกิดอาการ Error/ค้างจากลอจิกเดิม
> 
> | คุณสมบัติ | Hot Reload | Hot Restart |
> | --- | --- | --- |
> | การจัดการข้อมูล (State) | รักษาไว้ (อยู่หน้าเดิม ข้อมูลไม่หาย) | ทำลาย/รีเซ็ต (กลับไปเริ่มต้นหน้าแรก) |
> | ความเร็วในการประมวลผล | เร็วที่สุด (< 1 วินาที) | ปานกลาง (2-5 วินาที) |
> | ขอบเขตการโหลดโค้ด | โหลดเฉพาะโค้ด UI/Logic ใน Widget | โหลดโค้ดทั้งหมดใหม่ตั้งแต่ต้น |
> | จังหวะที่ควรเลือกใช้ | แก้ไขดีไซน์ / แก้ไขคำ / จัดหน้าจอ | แก้ไขคำสั่งเริ่มต้น / แก้ไขตัวแปร Global / แอปค้าง |

---

## 🧪 การทดลองที่ 3: ทดลองใช้งาน Google AI Studio

### ขั้นตอนที่ 1: สร้างบัญชีและเข้าสู่ Google AI Studio

1. เปิดเบราว์เซอร์ไปที่ https://aistudio.google.com
2. ล็อกอินด้วย Google Account
3. คลิก **"Try Gemini 1.5 Pro"** หรือ **"Get started"**
4. ยอมรับ Terms of Service

---

### ขั้นตอนที่ 2: ทดลอง Prompt พื้นฐาน

#### ทดลองที่ 1: Text Generation

1. คลิก **"New Prompt"** หรือ **"Create new"**
2. เลือก **"Freeform"** Prompt Type
3. พิมพ์ Prompt ต่อไปนี้และสังเกตผลลัพธ์:

```
อธิบายแนวคิดของ Flutter Framework ให้นักศึกษาปี 2 เข้าใจง่ายๆ ภายใน 5 ประโยค
```

4. คลิก **"Run"** หรือกด `Ctrl+Enter`
5. บันทึก Response และสังเกตความแตกต่างเมื่อเรียกซ้ำ

>นี่คือแนวคิดของ **Flutter Framework** ที่สรุปมาอย่างกระชับและเข้าใจง่ายสำหรับนักศึกษาปี 2 ภายใน **5 ประโยค** ครับ:
>1. **เขียนครั้งเดียว รันได้ทุกที่ (Single Codebase)**: Flutter คือ UI SDK จาก Google ที่ช่วยให้น้อง ๆ เขียนโค้ดด้วยภาษา Dart เพียงชุดเดียว แต่สามารถคอมไพล์เป็นแอปพลิเคชันที่ทำงานได้จริงทั้งบน iOS, Android, Web และ Desktop โดยไม่ต้องเขียนแยกภาษา
>2. **ทุกอย่างคือตัวต่อ (Everything is a Widget)**: แนวคิดหลักของ Flutter คือการมองทุกส่วนบนหน้าจอเป็น "Widget" เสมือนการต่อเลโก้ ไม่ว่าจะเป็นปุ่มกด ข้อความ หรือเลย์เอาต์ช่องว่าง ล้วนเป็น Object ที่นำมาประกอบและซ้อนทับกันอย่างเป็นระบบตามโครงสร้าง OOP ที่น้อง ๆ คุ้นเคย
>3. **วาดหน้าจอเองไม่พึ่ง OS (Self-Rendering Engine)**: แตกต่างจากเฟรมเวิร์กอื่นตรงที่ Flutter ไม่ได้ดึงปุ่มดั้งเดิมของระบบปฏิบัติการมาใช้ แต่มีเอนจินกราฟิกประสิทธิภาพสูงคอยวาด (Render) ทุกพิกเซลขึ้นมาเอง ทำให้หน้าตาแอปสวยงามสม่ำเสมอและทำงานได้ลื่นไหลสูงสุดถึง 120 FPS ในทุกอุปกรณ์
>4. **เห็นผลลัพธ์ทันตาไม่ต้องรอโหลด (Hot Reload)**: ฟีเจอร์เด่นที่ช่วยประหยัดเวลามากคือ "Hot Reload" ซึ่งช่วยให้น้อง ๆ เห็นผลลัพธ์ของการแก้ไขโค้ดปรากฏบนหน้าจอจำลองได้ทันทีในเสี้ยววินาที โดยไม่ต้องเสียเวลารอคอมไพล์ใหม่ทั้งหมดตั้งแต่ต้น
>5. **บทสรุปสำหรับปี 2**: หากเข้าใจ OOP และการเขียนโปรแกรมพื้นฐานแล้ว Flutter คือเครื่องมือวิเศษที่จะช่วยให้น้อง ๆ เปลี่ยนโครงสร้าง Logic ในหัวให้กลายเป็นแอปพลิเคชันที่หน้าตาสวยงามและมีประสิทธิภาพสูงระดับ Native ได้เร็วที่สุดครับ

#### ทดลองที่ 2: Code Generation

พิมพ์ Prompt ต่อไปนี้:

```
เขียน Flutter Widget ชื่อ WeatherCard ที่แสดง:
- ชื่อเมือง
- อุณหภูมิ (ตัวเลขขนาดใหญ่)
- ไอคอนสภาพอากาศ (sunny/cloudy/rainy)
- ความชื้น

ใช้ Material Design 3 และรับค่าผ่าน Constructor Parameters
```

6. นำโค้ดที่ได้ Copy ไปทดสอบใน Flutter Project

**บันทึกผลการทดลอง**
> <img width="1470" height="921" alt="image" src="https://github.com/user-attachments/assets/08300d2d-c836-4508-b766-949ca50bf1a3" />

#### ทดลองที่ 3: Prompt Engineering

ทดลองปรับ Prompt เพื่อให้ได้ผลลัพธ์ที่ดีขึ้น:

```
คุณเป็น Flutter Developer ผู้เชี่ยวชาญ

สร้าง Flutter Widget ชื่อ WeatherCard โดย:
1. รับ parameters: city (String), temperature (double), condition (String), humidity (int)
2. แสดง UI สวยงามด้วย Card Widget
3. ใช้ Icons.wb_sunny สำหรับ "sunny", Icons.cloud สำหรับ "cloudy", Icons.water_drop สำหรับ "rainy"
4. ใช้ Color scheme สีฟ้า-ขาว
5. ขนาดอุณหภูมิต้องใหญ่และชัดเจน

ให้โค้ดที่สมบูรณ์และใช้งานได้เลย ไม่ต้อง Comment อธิบาย
```

**บันทึกผลการทดลอง**
> <img width="1470" height="923" alt="image" src="https://github.com/user-attachments/assets/558512f0-4249-48dc-a9aa-dc8af060a225" />


> 🔍 **เปรียบเทียบ:** ผลลัพธ์จาก Prompt แบบ Simple vs Detailed ต่างกันอย่างไร?
> - Simple Prompt ได้ผลลัพธ์ในรูปแบบพื้นฐานทั่วไป (Generic/Minimalist) หน้าตาแอปพลิเคชันจะเน้นโทนสีขาวดำเรียบๆ แบนๆ ขาดสีสันและลูกเล่นในการไฮไลต์จุดสำคัญ แม้จะแสดงข้อมูลได้ครบตามสั่งแต่โครงสร้างโค้ดและการจัดหน้าจอจะถูกลดทอนรายละเอียดลงไปมาก เหมาะสำหรับการขึ้นโครงสร้างจำลองแบบไวๆ (Mockup) เท่านั้น หากจะใช้จริงนักพัฒนาต้องเสียเวลาเขียนโค้ดปรับแต่งรายละเอียดให้ครบถ้วน
> - Detailed Prompt ได้ผลลัพธ์ที่เป็นมืออาชีพและตรงตามมาตรฐาน Material Design 3 เต็มรูปแบบ มีการจัดองค์ประกอบ มีมิติการใช้สีที่โดดเด่น เช่น ชื่อเมืองสีฟ้าและตัวเลขขนาดใหญ่หนาชัดเจน รวมถึงมีการเขียนลอจิกดักจับเงื่อนไขเพื่อเปลี่ยนสีไอคอนตามสภาพอากาศมาให้เรียบร้อย โค้ดมีความพร้อมสูง สามารถนำไปใช้งานจริงในโปรเจกต์ได้ทันทีโดยไม่ต้องแก้ไขเพิ่ม

---

### ขั้นตอนที่ 3: สร้าง API Key

1. ใน Google AI Studio คลิก **"Get API Key"** (เมนูด้านซ้ายล่าง ที่เป็นรูปกุญแจ)
2. คลิก **"Create API Key"**
3. เลือก **"Create API key in new project"**
4. **คัดลอก API Key และเก็บไว้อย่างปลอดภัย**

> ⚠️ **ความปลอดภัย:** ห้าม Commit API Key ลง Git Repository โดยเด็ดขาด! ให้ใช้ Environment Variables หรือ `.env` file เสมอ

5. สร้างไฟล์ `.gitignore` ในโปรเจกต์ Flutter และเพิ่ม:

```gitignore
# Flutter
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
build/

# API Keys (สำคัญมาก!)
.env
*.env
lib/config/api_keys.dart
```

---

### ขั้นตอนที่ 4: ติดตั้ง Gemini Package ใน Flutter

1. เปิดไฟล์ `pubspec.yaml`
2. เพิ่ม dependency:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.5.0 # เพิ่มบรรทัดนี้
```

3. บันทึกไฟล์ → VS Code จะรัน `flutter pub get` อัตโนมัติ
   หรือรันเองใน Terminal:

```bash
flutter pub get
```

---

### ขั้นตอนที่ 5: สร้าง AI Chat Demo

สร้างไฟล์ `lib/config/api_config.dart`:

```dart
// lib/config/api_config.dart
// ⚠️ ในโปรเจกต์จริงให้ใช้ Environment Variables
// ไฟล์นี้เพิ่มใน .gitignore

class ApiConfig {
  // TODO: แทนที่ด้วย API Key ของคุณ
  static const String geminiApiKey = 'YOUR_API_KEY_HERE';
}
```

สร้างไฟล์ `lib/pages/ai_chat_page.dart`:

```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/api_config.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, String>> _messages = [];

  bool _isLoading = false;

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();

    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({
        'role': 'user',
        'text': userMessage,
      });
      _isLoading = true;
    });

    _controller.clear();

    try {
      final response = await http.post(
        Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent?key=${ApiConfig.geminiApiKey}',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text": userMessage,
                }
              ]
            }
          ]
        }),
      );

      debugPrint("Status Code : ${response.statusCode}");
      debugPrint("Response : ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final aiText =
            data["candidates"][0]["content"]["parts"][0]["text"] ??
                "No response";

        setState(() {
          _messages.add({
            'role': 'assistant',
            'text': aiText,
          });
        });
      } else {
        setState(() {
          _messages.add({
            'role': 'assistant',
            'text':
                'Error ${response.statusCode}\n\n${response.body}',
          });
        });
      }
    } catch (e, st) {
      debugPrint(e.toString());
      debugPrint(st.toString());

      setState(() {
        _messages.add({
          'role': 'assistant',
          'text': e.toString(),
        });
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildMessage(Map<String, String> message) {
    final isUser = message["role"] == "user";

    return Align(
      alignment:
          isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message["text"] ?? "",
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gemini AI Chat"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? const Center(
                    child: Text(
                      "👋 Hello Gemini",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _buildMessage(_messages[index]);
                    },
                  ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Ask Gemini...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton.small(
                    onPressed:
                        _isLoading ? null : _sendMessage,
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

อัปเดต lib/main.dart ให้นำทางไปหน้า AI Chat โดยแก้ไข 2 จุด:

จุดที่ 1 — เพิ่ม import ที่หัวไฟล์ บรรทัดแรกๆ ของ main.dart มี import อยู่แล้ว ให้เพิ่มบรรทัดนี้ต่อท้าย import เดิม:
```dart
import 'package:flutter/material.dart';
import 'pages/ai_chat_page.dart';   // ← เพิ่มบรรทัดนี้
```
จุดที่ 2 — เพิ่มปุ่มใน ProfilePage ภายใน Column ของ ProfilePage ให้เพิ่มปุ่มต่อท้าย Card widget ที่มีอยู่แล้ว:
```dart
// โครงสร้างของ ProfilePage ที่มีอยู่แล้ว
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(...),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // --- ส่วนที่มีอยู่แล้ว ---
          const SizedBox(height: 20),
          const CircleAvatar(...),
          const SizedBox(height: 16),
          const Text('ชื่อ นามสกุล', ...),
          const SizedBox(height: 8),
          const Text('รหัสนักศึกษา: ...', ...),
          const SizedBox(height: 24),
          Card(...),   // Card ข้อมูล

          // ↓↓↓ เพิ่ม 2 บรรทัดนี้ต่อจาก Card ↓↓↓
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AiChatPage(),
                ),
              );
            },
            icon: const Icon(Icons.smart_toy),
            label: const Text('ทดลอง AI Chat'),
          ),
          // ↑↑↑ จบส่วนที่เพิ่ม ↑↑↑

        ],
      ),
    ),
  );
}
```

💡 ตำแหน่งที่เพิ่ม คือภายใน children: [...] ของ Column หลัง Card(...) ที่แสดงข้อมูลโปรไฟล์ ระวังวงเล็บ — ต้องอยู่ก่อน ], ที่ปิด children



ตัวอย่าง main.dart ที่สมบูรณ์หลังเพิ่มแล้ว ส่วนที่เพิ่มใหม่จะมี Comment กำกับ:

```dart
import 'package:flutter/material.dart';
import 'pages/ai_chat_page.dart'; // ← เพิ่ม import นี้

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.teal,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'ชื่อ นามสกุล',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('รหัสนักศึกษา: XXXXXXXX'),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.school, 'คณะ', 'วิทยาศาสตร์และเทคโนโลยี'),
                    const Divider(),
                    _buildInfoRow(Icons.code, 'วิชาที่ชอบ', 'Mobile Development'),
                  ],
                ),
              ),
            ),

            // ↓ เพิ่มส่วนนี้ ↓
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AiChatPage(),
                  ),
                );
              },
              icon: const Icon(Icons.smart_toy),
              label: const Text('ทดลอง AI Chat'),
            ),
            // ↑ จบส่วนที่เพิ่ม ↑

          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
```

⚠️ ถ้าได้ Error ว่า AiChatPage ไม่รู้จัก ให้ตรวจสอบว่า:


ไฟล์ lib/pages/ai_chat_page.dart มีอยู่จริง
บรรทัด import 'pages/ai_chat_page.dart'; อยู่ที่หัวไฟล์ main.dart แล้ว



ขั้นตอนที่ 6: รันและทดสอบ AI Chat

---

### ขั้นตอนที่ 6: รันและทดสอบ AI Chat

```bash
flutter run
```

**ทดลองส่งข้อความต่อไปนี้:**
** ให้ setting เพิ่ม keyboard ภาษาไทยก่อน **
1. `สวัสดี ฉันเป็นนักศึกษา Flutter มือใหม่`
2. `อธิบาย StatefulWidget ให้เข้าใจง่ายๆ`
3. `ช่วยเขียน Flutter code แสดงรายการนักศึกษา 5 คน`
4. ลองถามคำถามอื่นๆ ที่คุณสงสัย

---

## 📋 ส่วนที่ 3: แบบบันทึกผลการทดลอง (Lab Report)

### 3.1 ผลการติดตั้ง Flutter

```
flutter doctor output:
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  วางผลลัพธ์จาก flutter doctor ที่นี่                    │
│                                                         │
└─────────────────────────────────────────────────────────┘

Flutter Version: ___________________
Dart Version: ______________________
Android SDK Version: _______________
```

### 3.2 Screenshot ของ Flutter App

```
[แนบ Screenshot ของ Profile Card App ที่สร้าง]
```

**Widget Tree ที่วาด:**

```
(วาด Widget Tree ของแอปที่สร้างด้วยมือ)

MaterialApp
└── ?
    └── ?
        └── ...
```

### 3.3 การเปรียบเทียบ Hot Reload vs Hot Restart

| รายการ | Hot Reload (r) | Hot Restart (R) |
|---|---|---|
| ความเร็ว | | |
| State ถูก Reset? | | |
| ใช้เมื่อไหร่ | | |

### 3.4 ผลการทดลอง Prompt Engineering

**Prompt แบบ Simple:**
```
(วาง Prompt ที่ใช้)
```

**Prompt แบบ Detailed:**
```
(วาง Prompt ที่ใช้)
```

**ความแตกต่างของผลลัพธ์:**
```
(บันทึกสิ่งที่สังเกต)
```

### 3.5 Screenshot ของ AI Chat App

```
[แนบ Screenshot ของ Gemini AI Chat ที่ทำงานได้]
```

---

## 📝 ส่วนที่ 4: คำถามท้ายบท (Review Questions)

ตอบคำถามต่อไปนี้ลงในใบงาน:

**1.** Flutter แตกต่างจาก React Native อย่างไรในแง่ของ Rendering Engine?

```
คำตอบ: _______________________________________________
```

**2.** อธิบายความแตกต่างระหว่าง `StatelessWidget` และ `StatefulWidget` พร้อมยกตัวอย่างการใช้งานที่เหมาะสมของแต่ละประเภท

```
คำตอบ: _______________________________________________
```

**3.** เหตุใดจึงห้าม Commit API Key ลง Git Repository? และมีวิธีจัดการ API Key อย่างปลอดภัยอย่างไรบ้าง?

```
คำตอบ: _______________________________________________
```

**4.** Hot Reload ทำงานอย่างไร และมีข้อจำกัดอะไรบ้าง?

```
คำตอบ: _______________________________________________
```

**5.** จากการทดลองใช้ Gemini API ในวันนี้ คุณคิดว่าสามารถนำ AI มาช่วยพัฒนาแอปในแง่ไหนได้บ้าง? ยกตัวอย่าง Use Case 3 อย่าง

```
คำตอบ: 
1. _______________________________________________
2. _______________________________________________
3. _______________________________________________
```

---

## 🏆 ส่วนที่ 5: งานเพิ่มเติม (Challenge)

**(Optional — สำหรับผู้ที่ต้องการพัฒนาทักษะเพิ่มเติม)**

### Challenge 1: ปรับปรุง Profile Card
- เพิ่ม Animation เมื่อกดปุ่ม (ใช้ `AnimatedContainer`)
- เพิ่ม Dark Mode Support
- เพิ่ม Social Media Links

### Challenge 2: ปรับปรุง AI Chat
- เพิ่มประวัติการสนทนา (Chat History) โดยส่ง Message History ไปกับ Request
- เพิ่ม System Prompt เพื่อกำหนดบุคลิกของ AI
- เพิ่มปุ่ม Clear Chat

### Challenge 3: รวม Profile + AI
- เพิ่มปุ่มใน Profile Page ที่ให้ AI สร้าง "Introduction" จากข้อมูลของคุณ
- ส่งข้อมูล Profile ไปใน Prompt และให้ Gemini เขียนแนะนำตัว

---

## 📤 การส่งงาน (Submission)

### สิ่งที่ต้องส่ง

1. **Source Code** — Push ขึ้น GitHub Repository
   ```
   Repository Name: week01-flutter-intro-[รหัสนักศึกษา]
   ```

2. **ใบงานที่กรอกเสร็จแล้ว** — ส่งเป็น PDF หรือ Markdown

3. **Screenshot** อย่างน้อย 3 รูป:
   - Flutter Profile Card App
   - Google AI Studio Prompt Test
   - AI Chat Demo ที่ทำงานได้

### โครงสร้าง Repository ที่ต้องการ

```
week01-flutter-intro-XXXXXXXX/
├── lib/
│   ├── config/
│   │   └── api_config.dart   (⚠️ แทนที่ key ด้วย placeholder)
│   ├── pages/
│   │   └── ai_chat_page.dart
│   └── main.dart
├── .gitignore                  (ต้องมี!)
├── pubspec.yaml
├── screenshots/
│   ├── profile_card.png
│   ├── ai_studio.png
│   └── ai_chat.png
└── LAB_REPORT.md              (ใบงานที่กรอกแล้ว)
```

### Checklist ก่อนส่ง

- [ ] `flutter doctor` ไม่มี `[✗]` (มี `[!] Android Studio` ได้ — ปกติสำหรับ VS Code Workflow)
- [ ] App รันได้บน Chrome หรือ Android Device/Emulator
- [ ] Profile Card แสดงข้อมูลของตัวเอง
- [ ] AI Chat คุยกับ Gemini ได้จริง
- [ ] API Key ไม่ถูก Commit ลง Git (ตรวจสอบ `.gitignore`)
- [ ] ตอบคำถามท้ายบทครบทุกข้อ
- [ ] Push ขึ้น GitHub แล้ว

---

## 📚 แหล่งข้อมูลเพิ่มเติม (References)

| แหล่งข้อมูล | URL |
|---|---|
| Flutter Official Docs | https://docs.flutter.dev |
| Dart Language Tour | https://dart.dev/language |
| Flutter Widget Catalog | https://docs.flutter.dev/ui/widgets |
| Google AI Studio | https://aistudio.google.com |
| Gemini API Docs (Dart) | https://ai.google.dev/api/dart/google_generative_ai |
| pub.dev (Package Registry) | https://pub.dev |
| Material Design 3 | https://m3.material.io |
| Flutter YouTube Channel | https://youtube.com/@flutterdev |

---

*ใบงานนี้เป็นส่วนหนึ่งของวิชา Mobile Software Development | สัปดาห์ที่ 1*  
*อัปเดตล่าสุด: มิถุนายน 2568*
