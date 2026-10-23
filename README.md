<div align="center">

# 🌅 Prosvet

**A DPI-bypass manager that finds the strategy that works for *your* ISP.**

🇬🇧 English · [🇷🇺 Русский](README.ru.md)

[![Release](https://img.shields.io/github/v/release/flowcdhome/prosvet?style=for-the-badge&color=2ea44f)](https://github.com/flowcdhome/prosvet/releases)
[![License](https://img.shields.io/github/license/flowcdhome/prosvet?style=for-the-badge)](LICENSE)
![Python](https://img.shields.io/badge/python-3.9%2B-3776AB?style=for-the-badge&logo=python&logoColor=white)

</div>

---

## 💡 The idea

Many ISPs block sites by inspecting traffic (DPI), not by IP. Tools like [zapret](https://github.com/bol-van/zapret) and [byedpi](https://github.com/hufrea/byedpi) bypass this by changing how packets are sent, but **the working parameters differ for every ISP**, and finding them by hand is the painful part.

Prosvet does not reinvent the engine. It sits on top of byedpi and automates the routine:

1. **Test** which sites open right now.
2. **Auto-pick** the best strategy by trying a list and measuring real results.
3. **Run** a local SOCKS5 proxy with that strategy, no root needed.
4. Use it in any app: browser, GhostFox, Telegram, curl.

## ✨ Features (v0.1)

- `prosvet auto`: tries strategies and saves the best one
- `prosvet test`: direct vs. through-proxy comparison
- Strategies and test targets live in a plain JSON file you can edit and share
- No dependencies except `python3`, `curl`, `git`, `make`

## 🗺️ Roadmap

- System-wide mode (nfqws / nftables) so apps need no proxy settings
- Community database of strategies per ISP
- systemd service, autostart
- Settings window and rofi menu
- Integration with [GhostFox](https://github.com/flowcdhome/ghostfox)

## 🚀 Install

```bash
sudo pacman -S --needed git python curl base-devel
git clone https://github.com/flowcdhome/prosvet.git
cd prosvet && ./install.sh
prosvet install-engine
prosvet auto
prosvet start
```

Then set your app's proxy to **SOCKS5 127.0.0.1:1080** (with "proxy DNS" enabled). In GhostFox: `"proxy": {"type": "socks5", "host": "127.0.0.1", "port": 1080}`.

## 📖 Usage

```bash
prosvet test            # what opens directly / via proxy
prosvet auto            # find the best strategy
prosvet start           # run the local proxy
prosvet stop
prosvet status
```

Config: `~/.config/prosvet/config.json` (port, targets, strategies). Strategies are byedpi arguments, see its README for all options.

## ⚠️ Limits

- It is **not a VPN** and gives **no anonymity**: your IP stays the same.
- It does not help with blocks by IP address.
- A strategy that works on one ISP may fail on another, run `prosvet auto` again after changing provider.

## ⚖️ Legal

Check the laws that apply to you before using circumvention tools. The author is not responsible for misuse.

## 🙏 Credits

Engine: [byedpi](https://github.com/hufrea/byedpi). Inspiration: [zapret](https://github.com/bol-van/zapret).

## 📄 License

MIT, see [LICENSE](LICENSE).
