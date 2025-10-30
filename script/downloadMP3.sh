#!/bin/bash

download_array=($@)

echo "Starting download of individual videos (no playlists or radio)..."

for url in "${download_array[@]}"; do
  echo "Downloading from URL: $url"

  yt-dlp --paths output \
  --output "%(title)s.%(ext)s" \
  --embed-thumbnail --add-metadata \
  --extract-audio --audio-format mp3 --audio-quality 320K \
  --no-playlist \
  --break-on-existing \
  "$url"

  echo "Finished downloading from URL: $url"
done

echo "MP3 download completed."