# SSTV 实时编解码库

这是一个用于 **Slow Scan Television（SSTV）图像传输** 的实时编解码 Python 库，支持多种 SSTV 模式（如 Martin、Scottie、Robot、PD 系列），可实时从音频流中解析图像，或将图像编码为标准 SSTV 音频。

## ✅ 项目特性

- 📡 实时解码支持：麦克风、音频文件、Socket 流等音频输入
- 🎨 编码支持：将图像编码为 SSTV 音频信号（播放、保存或网络推送）
- 🧠 模块化设计：音频 I/O、同步识别、信号处理、图像编码/解码分层明确
- 💾 支持录音：可在解码同时保存原始音频，便于失败时重试
- 🧱 可拓展结构：支持新增 SSTV 模式、滤波器、图像格式等
- 🧩 跨平台：兼容 x86/ARM 架构，可在 Linux/macOS/Raspberry Pi 等设备上运行

## 📦 安装

```bash
git clone https://github.com/yourname/sstv_codec.git
cd sstv_codec
pip install -r requirements.txt
```

## 🚀 快速开始

```python
from sstv_codec.core import SSTVCoder

# 实时解码（从麦克风）
decoder = SSTVCoder(mode='decode', audio_sources=['mic'], record_audio=True)
decoder.on_frame_decoded = lambda img, meta: img.save('output.png')
decoder.start()

# 编码图像
encoder = SSTVCoder(mode='encode', output_sink='speaker', sample_rate=48000)
encoder.send_image('test.jpg')
encoder.start()
```

## 📚 文档

- [架构设计](docs/architecture.md)
- [API 接口文档](docs/api_reference.md)
- [VIS 码 & 模式定义](docs/mode_specs.md)

## 📁 示例脚本

- `examples/decode_mic.py`: 从麦克风实时解码
- `examples/encode_file.py`: 将图像编码并播放
- `examples/transcode_stream.py`: 接收解码后重新编码
- `examples/socket_codec.py`: 网络音频流解/编码

## 🔧 测试

```bash
pytest tests/
```

## 🛡 开源协议

本项目采用 [GPL-3.0 License](LICENSE) 开源协议。