<div align="center">

# 🌅 Prosvet (Просвет)

**Менеджер обхода DPI: находит стратегию, которая работает у *твоего* провайдера.**

[🇬🇧 English](README.md) · 🇷🇺 Русский

[![Release](https://img.shields.io/github/v/release/flowcdhome/prosvet?style=for-the-badge&color=2ea44f)](https://github.com/flowcdhome/prosvet/releases)
[![License](https://img.shields.io/github/license/flowcdhome/prosvet?style=for-the-badge)](LICENSE)
![Python](https://img.shields.io/badge/python-3.9%2B-3776AB?style=for-the-badge&logo=python&logoColor=white)

</div>

---

## 💡 Идея

Многие провайдеры блокируют сайты не по IP, а анализируя трафик (DPI). Инструменты вроде [zapret](https://github.com/bol-van/zapret) и [byedpi](https://github.com/hufrea/byedpi) обходят это, меняя способ отправки пакетов, но **рабочие параметры у каждого провайдера свои**, а подбирать их вручную мучительно.

Prosvet не изобретает движок заново. Он стоит поверх byedpi и автоматизирует рутину:

1. **Проверяет**, какие сайты открываются сейчас.
2. **Сам подбирает** лучшую стратегию: перебирает список и измеряет реальный результат.
3. **Запускает** локальный SOCKS5-прокси с этой стратегией, root не нужен.
4. Работает в любом приложении: браузер, GhostFox, Telegram, curl.

## ✨ Возможности (v0.1)

- `prosvet auto`: перебирает стратегии и сохраняет лучшую
- `prosvet test`: сравнение «напрямую» и «через прокси»
- Стратегии и сайты для проверки лежат в обычном JSON, их можно править и делиться ими
- Из зависимостей только `python3`, `curl`, `git`, `make`

## 🗺️ Планы

- Общесистемный режим (nfqws / nftables), чтобы не настраивать прокси в приложениях
- Общая база стратегий по провайдерам
- systemd-сервис и автозапуск
- Окно настроек и меню rofi
- Интеграция с [GhostFox](https://github.com/flowcdhome/ghostfox)

## 🚀 Установка

```bash
sudo pacman -S --needed git python curl base-devel
git clone https://github.com/flowcdhome/prosvet.git
cd prosvet && ./install.sh
prosvet install-engine
prosvet auto
prosvet start
```

Потом укажи в приложении прокси **SOCKS5 127.0.0.1:1080** (с включённым «DNS через прокси»). В GhostFox: `"proxy": {"type": "socks5", "host": "127.0.0.1", "port": 1080}`.

## 📖 Использование

```bash
prosvet test            # что открывается напрямую / через прокси
prosvet auto            # подобрать лучшую стратегию
prosvet start           # запустить локальный прокси
prosvet stop
prosvet status
```

Конфиг: `~/.config/prosvet/config.json` (порт, сайты, стратегии). Стратегии это аргументы byedpi, все опции в его README.

## ⚠️ Ограничения

- Это **не VPN** и **не анонимность**: твой IP не меняется.
- Не помогает против блокировок по IP-адресу.
- Стратегия, рабочая у одного провайдера, может не работать у другого. После смены провайдера запусти `prosvet auto` снова.

## ⚖️ Правовое уведомление

Узнай, какие законы действуют для тебя, прежде чем использовать средства обхода блокировок. Автор не отвечает за неправомерное использование.

## 🙏 Благодарности

Движок: [byedpi](https://github.com/hufrea/byedpi). Вдохновение: [zapret](https://github.com/bol-van/zapret).

## 📄 Лицензия

MIT, см. [LICENSE](LICENSE).
