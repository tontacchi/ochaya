#!/usr/bin/env bash

# Usage:
#   transcript.sh <youtube-url> <output-title>
#
# Example:
#   transcript.sh https://www.youtube.com/watch?v=dQw4w9WgXcQ rickroll


scrape_transcripts() {
	url="$1"
	title="$2"

	yt-dlp --js-runtimes bun:/home/andy/.bun/bin/bun \
		--skip-download \
		--write-subs \
		--write-auto-subs \
		--sub-lang en \
		--sub-format ttml \
		--convert-subs srt \
		--output "transcript.%(ext)s" \
		"$url"

	cat ./transcript.en.srt \
		| sed '/^$/d' \
		| grep -v '^[0-9]*$' \
		| grep -v '\-->' \
		| sed 's/<[^>]*>//g' \
		| tr '\n' ' ' \
		> "$title.txt";

	rm -f transcript.en.srt
}

# usage message
if [ $# -lt 2 ]; then
    echo "Usage: transcript <youtube-url> <output-title>"
    exit 1
fi

scrape_transcripts "$@"

