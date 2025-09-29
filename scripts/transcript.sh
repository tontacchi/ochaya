scrape_transcripts() {
	url="$1"
	title="$2"
	yt-dlp --skip-download --write-subs --write-auto-subs --sub-lang en --sub-format ttml --convert-subs srt --output "transcript.%(ext)s" "$url"
	cat ./transcript.en.srt | sed '/^$/d' | grep -v '^[0-9]*$' | grep -v '\-->' | sed 's/<[^>]*>//g' | tr '\n' ' ' > $title.txt;
	rm transcript.en.srt
}

scrape_transcripts $@
