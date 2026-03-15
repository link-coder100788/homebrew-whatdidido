# homebrew-whatdidido

Homebrew tap for [whatdidido](https://github.com/link-coder100788/WhatDidIDo) — a pretty wrapper for your shell history.

```
whatdidido recent
whatdidido top
whatdidido for git
```

---

## Install

```bash
brew tap link-coder100788/whatdidido
brew install whatdidido
```

Or in a single command:

```bash
brew install link-coder100788/whatdidido/whatdidido
```

Verify it works:

```bash
whatdidido version
whatdidido debug
```

---

## Requirements

- macOS (Homebrew on Linux is not supported by this formula)
- Xcode 15 or later (for the Swift 5.9+ compiler)

Shell and OS are auto-detected — you rarely need to pass `--shell` or `--os` manually.

---

## Update

```bash
brew update
brew upgrade whatdidido
```

---

## Uninstall

```bash
brew uninstall whatdidido
brew untap link-coder100788/whatdidido
```

---

## Troubleshooting

**`Error: No available formula with the name "whatdidido"`**
Run `brew tap link-coder100788/whatdidido` first.

**`Error: SHA256 mismatch`**
Run `brew update` to pull the latest formula, then retry.

**Build fails / Xcode not found**
Make sure Xcode command-line tools are installed:
```bash
xcode-select --install
```

---

## License

MIT — see [LICENSE](LICENSE)
