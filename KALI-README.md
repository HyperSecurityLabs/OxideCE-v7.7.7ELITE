```  
 ██████╗ ██╗  ██╗██╗██████╗ ███████╗
██╔═══██╗╚██╗██╔╝██║██╔══██╗██╔════╝
██║   ██║ ╚███╔╝ ██║██║  ██║█████╗  
██║   ██║ ██╔██╗ ██║██║  ██║██╔══╝  
╚██████╔╝██╔╝ ██╗██║██████╔╝███████╗
 ╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝
```

# OXIDE v8.5.0 Community Edition

### *"Levenshtein walked so OXIDE could run. XSStrike taught me the way — I just made it faster, meaner, and hungrier."* — khaninkali

---

## What's New in This Release

### The GUI — CyberPunk2077-Interface
A frameless, neon-drenched desktop app that makes you feel like you're in a cyberdeck from 2077. WRY + TAO under the hood. Scan presets, live terminal console, module toggles, and an About modal that tells you exactly how illegal your scan is.

### Levenshtein Distance (The XSStrike Special)
Yeah, I took the Levenshtein algorithm from **XSStrike** — the baddest XSS scanner on the planet. But I didn't just copy it. I **weaponized** it.

OXIDE now uses Levenshtein-based fuzzy matching across:
- **SQLi detection** — UNION pattern scoring with 0.65 Bayesian threshold
- **XSS reflection analysis** — character-level distance on response bodies
- **CMDi detection** — command injection fingerprint matching at 0.55 threshold
- **Bayesian fusion** — Levenshtein + n-gram cosine similarity → Bayes confidence score

If two payloads are too similar, OXIDE knows. If a response is just *slightly* off from what we expect, OXIDE knows. This isn't just scanning — it's **surgical**.

### Bayesian Fusion Scorer
Combines Levenshtein distance, n-gram cosine similarity, and behavioral heuristics into a single Bayes confidence score. Threshold gates at 0.65 for SQLi, 0.55 for CMDi. False positives? Not on my watch.

### Precision & Destruction
Every module has been tuned for **maximum damage with minimum noise**:

| Module | Precision | Destruction |
|--------|-----------|-------------|
| SQLi | Error/Boolean/Time/UNION stacked | DROP TABLE, xp_cmdshell, INTO OUTFILE webshell |
| XSS | Reflected/Stored/DOM/mXSS | Session theft, keylogging, DEFACE |
| LFI | Path traversal + file read confirm | /etc/passwd, proc/self/environ |
| CMDi | Linux + Windows injection | Reverse shell, certutil, bitsadmin |
| Zero-Day ML | Random Forest + SVM ensemble | Auto-exploit 12 WAF vendors |

### WAF Massacre
12 WAF vendors, 12 evasion techniques. Cloudflare, ModSecurity, AWS WAF, F5, Imperva — OXIDE eats them for breakfast. If a WAF blocks you, OXIDE tries the next evasion. And the next. And the next. Until you're in.

### Headless DOM Crawler
Chrome under the hood. SPAs, JS-rendered content, WebSockets — if it exists in the DOM, OXIDE finds it. 5-level crawl depth, 100 URLs per target, form auto-fill. Your SPA is not safe.

---

## The XSStrike Connection

> *"XSStrike is the most advanced XSS detection suite. I learned Levenshtein from studying how XSStrike detects reflected XSS with surgical precision. OXIDE takes that same DNA and injects it into SQLi, CMDi, LFI, and every other module. Levenshtein isn't just for XSS anymore. It's for everything."* — khaninkali

| Technique | Origin | OXIDE Upgrade |
|-----------|--------|---------------|
| Levenshtein Distance | XSStrike | Ported to SQLi, CMDi, Bayesian fusion |
| N-gram Cosine Similarity | Academic research | Integrated with Levenshtein for multi-signal scoring |
| Bayesian Confidence | OXIDE original | 0.65/0.55 threshold gates for FP suppression |

---

## Install on Kali Linux

```bash
sudo apt install -y build-essential pkg-config libssl-dev cmake
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
git clone https://github.com/HyperSecurityLabs/oxide-communityedition-v8.5.0.git
cd OxideCE-v8.5.0COMMUNITY && cargo build --release
sudo cp target/release/oxide /usr/local/bin/
```

Or grab the **.deb** from the releases page and:
```bash
sudo dpkg -i oxide-ce_8.5.0community-edition_amd64.deb
oxide-ce --url https://yourtarget.com --modules all --duration 120
```

---

## The Philosophy

> **"Scan everything. Trust nothing. Patch accordingly."**

This is the last freely-available Community Edition. Future development moves exclusively to OXIDE Pro Edition. Every star on GitHub brings OXIDE closer to `sudo apt install oxide` on Kali Linux.

Built with 🦀 Rust. Forged in the offensive security trenches. Fueled by late nights and Levenshtein distance calculations.

**HyperSecurityLabs · khaninkali · Lyara-Koroleva**

```  
  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄
  ██░▄▄▄░██  ██░▄▄▄░██  ██░▄▄▄░██  ██░▄▄▄░██
  ██░███░██  ██░███░██  ██░███░██  ██░███░██
  ██░███░██  ██░███░██  ██░███░██  ██░███░██
  ▀▀░▀▀▀░▀▀  ▀▀░▀▀▀░▀▀  ▀▀░▀▀▀░▀▀  ▀▀░▀▀▀░▀▀
```
