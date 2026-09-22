# Plancast Homebrew tap

[Plancast](https://sarthakdabhi.github.io/plancast/) turns **Markdown plans, plain-text files, public article URLs, and text-based PDFs** into two-person audio briefings with Jane and George AI voices. Dialogue and speech generation run locally by default.

## Install

Apple Silicon Mac running macOS 14 or newer:

```sh
brew install sarthakdabhi/tap/plancast
plancast setup-local
```

## Choose your source

```sh
plancast PLAN.md --play
plancast article.txt --play
plancast report.pdf --play
plancast "https://example.com/article" --play
```

Replace the example filenames or URL with your own source. Plancast creates audio, a transcript, and a JSON sidecar, then opens a local browser player with pause, seeking, and speed controls. Only two-minute generation is currently supported.

Node is bundled. Setup downloads managed Python, uv, FFmpeg, llama.cpp, model weights, and speech assets. The default dialogue model is about 9.3 GB, with additional space needed for speech and dependencies. No separate Node, Python, Ollama, or LM Studio installation is needed.

Fetching a URL contacts its website. Extracted content stays on your Mac with local generation. OpenAI and Google Gemini are explicit alternatives with a disclosure and charges to your API account.

Scanned/password-protected PDFs, Word documents, saved HTML, and remote PDF URLs are not supported. Download a text-based PDF before passing it to Plancast. Login-protected, paywalled, and JavaScript-only articles may not extract.

## Cloud providers

Plancast 0.3.0 also supports OpenAI and Gemini for both dialogue and speech. No local model setup is required for cloud mode.

```sh
export GEMINI_API_KEY="your-api-key"
plancast article.txt --provider gemini --play

export OPENAI_API_KEY="your-api-key"
plancast article.txt --provider openai --play
```

Cloud modes send source content and dialogue to the selected provider after confirmation, with applicable API usage charged to your account. Gemini uses Kore/Puck voices; its TTS is a preview service, and live Gemini generation has not yet been verified in this project. See the [Gemini setup guide](https://github.com/sarthakdabhi/plancast#use-google-gemini).

## Update or uninstall

```sh
brew update && brew upgrade plancast
brew uninstall plancast
```

Uninstalling leaves model downloads and generated audio intact.

[Full usage guide and input limits](https://github.com/sarthakdabhi/plancast#supported-inputs-and-limits) · [Source](https://github.com/sarthakdabhi/plancast) · [Release downloads](https://github.com/sarthakdabhi/plancast/releases)
