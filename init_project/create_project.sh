#!/bin/bash

ROOT_DIR="."

# 创建顶层目录与文件
mkdir -p $ROOT_DIR/{docs,examples,sstv_codec/{audio,processing,sync,decode,encode,image,core,utils},tests}
touch $ROOT_DIR/{README.md,setup.py,requirements.txt,LICENSE}
touch $ROOT_DIR/docs/{architecture.md,api_reference.md,mode_specs.md}
touch $ROOT_DIR/examples/{decode_mic.py,encode_file.py,transcode_stream.py,socket_codec.py}
touch $ROOT_DIR/tests/{test_audio.py,test_sync.py,test_decode.py,test_encode.py,test_integration.py}

# 创建 __init__.py 与各模块代码骨架
MODULES=(
  "audio/audio_manager.py"
  "audio/mic_input.py"
  "audio/file_input.py"
  "audio/socket_input.py"
  "audio/speaker_output.py"
  "audio/recorder.py"
  "processing/resampler.py"
  "processing/filter.py"
  "processing/agc.py"
  "processing/denoise.py"
  "sync/vis.py"
  "sync/sync_detector.py"
  "sync/mode_manager.py"
  "decode/goertzel.py"
  "decode/line_decoder.py"
  "decode/frame_decoder.py"
  "encode/image_encoder.py"
  "encode/sync_generator.py"
  "encode/modulator.py"
  "image/builder.py"
  "image/formats.py"
  "core/decoder.py"
  "core/encoder.py"
  "core/codec.py"
  "utils/logger.py"
  "utils/time_utils.py"
)

for path in "${MODULES[@]}"; do
  full_path="$ROOT_DIR/sstv_codec/$path"
  dir_path=$(dirname "$full_path")
  touch "$full_path"
#  echo -e "'''Module: $(basename "$path")'''\n\n" > "$full_path"
#  find $ROOT_DIR/sstv_codec -type d -exec touch {}/$(basename "$path") \;
done

# 添加 __init__.py 到每个包目录
find $ROOT_DIR/sstv_codec -type d -exec touch {}/__init__.py \;

echo "✅ 项目结构初始化完成。"

