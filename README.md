# SSTV Real-Time Codec Library

A modular Python library for **Slow Scan Television (SSTV)** real-time decoding and encoding. Supports Martin, Scottie, Robot, PD series and other VIS-based SSTV modes.

## ✅ Features

- 📡 Real-time SSTV decoding from audio streams (mic, files, socket, etc.)
- 🎨 Encode images into standard SSTV audio (playback, save or stream)
- 🔧 Modular structure: audio I/O, sync detection, processing, decoding, encoding
- 💾 Optional audio recording during decode for re-processing
- 🌐 Cross-platform: Compatible with x86/ARM on Linux/macOS/Raspberry Pi
- 🧱 Easily extensible: Add modes, image formats, filters, or output sinks

## 📦 Installation

```bash
git clone https://github.com/yourname/sstv_codec.git
cd sstv_codec
pip install -r requirements.txt
```

## 🚀 Quick Start

```python
from sstv_codec.core import SSTVCoder

# Real-time decoding from microphone
decoder = SSTVCoder(mode='decode', audio_sources=['mic'], record_audio=True)
decoder.on_frame_decoded = lambda img, meta: img.save('output.png')
decoder.start()

# Encode image to SSTV audio
encoder = SSTVCoder(mode='encode', output_sink='speaker', sample_rate=48000)
encoder.send_image('test.jpg')
encoder.start()
```

## 📚 Documentation

- [Architecture Overview](docs/architecture.md)
- [API Reference](docs/api_reference.md)
- [VIS Codes & Mode Specs](docs/mode_specs.md)

## 📁 Example Scripts

- `decode_mic.py`: Decode SSTV from microphone input
- `encode_file.py`: Encode image and play as SSTV audio
- `transcode_stream.py`: Decode then re-encode SSTV stream
- `socket_codec.py`: Encode/decode SSTV over network audio

## 🧪 Testing

```bash
pytest tests/
```

## 🛡 License

Released under the [GPL-3.0 License](LICENSE).