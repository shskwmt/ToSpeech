# ToSpeech

PowerShell functions to speech.
- Text to Speech
- Image to Speech
- PDF to Speech

## Usage

### TextToSpeech

Speak from text.

```
Speak-FromText "Hello world!" -Language "English" -Rate 2
```

### ImageToSpeech

Speak from image.

```
Speak-FromImage "C:\Image\Path" -Language "English" -Rate 0
```

### ClipboardToSpeech

Speak from clipboard.<br>
Supported formats are image or text.

```
Speak-FromClipboard -Language "English" -Rate 1
```

### ApplicationToSpeech

When want your computer to speak from pdf and you use "PDF XChange Viewer", do like this.

```
Speak-FromApplication "PDFXCview" -Language "English" -Rate 1
```
