#!/bin/bash

# 兼容 macOS / zsh 的注释插入脚本
# 用于为每个 Python 文件插入功能说明文档字符串（docstring）

# 进入根目录（请根据实际情况修改路径）
cd "$(dirname "$0")/sstv_codec" || exit 1

# 文件路径 + 描述对
FILES_AND_DESCRIPTIONS=$(cat <<EOF
audio/audio_manager.py|音频输入输出统一管理器
audio/mic_input.py|麦克风输入
audio/file_input.py|音频文件读取与写入
audio/socket_input.py|Socket 输入流处理
audio/speaker_output.py|编码结果播放至扬声器
audio/recorder.py|音频流录制模块

processing/resampler.py|采样率转换器
processing/filter.py|带通滤波器
processing/agc.py|自动增益控制
processing/denoise.py|噪声抑制模块

sync/vis.py|VIS 码定义与解析
sync/sync_detector.py|同步信号检测器
sync/mode_manager.py|SSTV 模式参数管理

decode/goertzel.py|Goertzel 频率检测算法
decode/line_decoder.py|逐行音频解码器
decode/frame_decoder.py|完整图像帧组装器

encode/image_encoder.py|图像编码为频率序列
encode/sync_generator.py|同步与 VIS 信号生成器
encode/modulator.py|频率调制为 PCM 音频数据

image/builder.py|图像构建与逐行合成
image/formats.py|图像文件格式支持（读写）

core/decoder.py|SSTV 解码器主控类
core/encoder.py|SSTV 编码器主控类
core/codec.py|SSTV 编解码统一接口

utils/logger.py|日志系统
utils/time_utils.py|时间戳工具与计时器
EOF
)

echo "🛠 正在为各文件插入注释..."

# 遍历每一行并插入注释
while IFS='|' read -r file desc; do
  if [ -f "$file" ]; then
    # 检查是否已有 docstring，避免重复插入
    if ! grep -q '"""' "$file"; then
      echo -e "\"\"\"\n$desc\n\"\"\"\n\n$(cat "$file")" > "$file"
      echo "✅ 注释已写入 $file"
    else
      echo "⚠️  已存在注释，跳过 $file"
    fi
  else
    echo "❌ 文件不存在: $file"
  fi
done <<< "$FILES_AND_DESCRIPTIONS"
