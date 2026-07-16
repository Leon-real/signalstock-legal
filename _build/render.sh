#!/bin/bash
# 사용법: render.sh <html파일> <PNG출력> <W> <H>
# Chrome 헤드리스로 HTML→PNG(2x). 종목 스크린샷 등 로컬 파일 접근 허용.
HTML="$1"; OUT="$2"; W="$3"; H="$4"
DIR="$(cd "$(dirname "$HTML")" && pwd)"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files \
  --force-device-scale-factor=2 --window-size="$W,$H" --default-background-color=00000000 \
  --screenshot="$OUT" --virtual-time-budget=2000 "file://$DIR/$(basename "$HTML")" 2>/dev/null
sips -g pixelWidth -g pixelHeight "$OUT" 2>/dev/null | grep pixel
