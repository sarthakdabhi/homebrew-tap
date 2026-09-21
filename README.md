# Homebrew tap

Install Plancast on Apple Silicon macOS 14+:

```sh
brew install sarthakdabhi/tap/plancast
plancast setup-local
plancast PLAN.md --play
```

Update with `brew update && brew upgrade plancast`.

Node is bundled. Model weights, speech assets, Python, uv, FFmpeg, and llama.cpp are downloaded during setup into Plancast-managed storage. Source and release notes: https://github.com/sarthakdabhi/plancast
