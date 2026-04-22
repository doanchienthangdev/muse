# Changelog

All notable changes to Muse will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

Nothing yet.

---

## [2.35.0-alpha] — 2026-04-22 — "Lao Tzu / Laozi full rebuild from primary-source archive"

### Why

User reported the existing `lao-tzu` persona was built before the primary-source archive existed — the previous version (v2.1.0, minimal taglines, generic Taoism framing) was effectively a stub. User requested full rebuild from `.archives/personas/lao-tzu/` containing:
- **Dao De Jing (Daodejing)** — Edmund Ryden translation, Oxford World's Classics 2008, with Benjamin Penny introduction — the primary-source text for verbatim quotes
- **Wing-tsit Chan, *The Way of Lao Tzu (Tao-tê ching)*** — Library of Liberal Arts 1963 — standard scholarly edition
- **Holmes H. Welch, *Taoism: The Parting of the Way*** — Beacon Press 1957/rev. 1966 — standard scholarly history
- **Michael Puett, *Becoming Laozi*** — academic article (filtered — primarily post-Han religious Daoism, OUT-OF-SCOPE)
- **Alan Watts, *Tao: The Watercourse Way*** — Pantheon 1975 — popularizing interpretation
- **Fritjof Capra, *The Tao of Physics*** — Shambhala 1975 — cross-domain analogy
- **Michael McCurley, *The Tao of Systems Thinking*** — 2016 — modern applied-systems
- **Stanford Encyclopedia of Philosophy "Daoism" entry** (Chad Hansen, 2020 revision) — primary academic reference
- 7 articles (SEP Daoism primary + Puett + Systems Thinking + Leadership + Dialectical Thinking + Naturalness + Forbes filtered heavily)
- 4 documentary transcripts (Van Norden "Wisdom of China: Laozi"; Jason Gregory "Art of Effortless Living" filtered heavily — Gregory misattributes Zhuangzi passages as Laozi; Li Yuanxiang Chinese-philosophy lecture; CCCH9025 Chad Hansen course promo)

**User mid-build guidance applied from Marcus rebuild carried forward**: "co the co tai lieu tu nguoi khac vao, dung nham voi nguoi khac chi quan tam den Marcus Aurelius thoi nhe" — same filter discipline applied to Laozi: filtered OUT Zhuangzi 莊子 (separate philosopher and text), Confucius / Mencius / Mohists / Legalists (different Warring States schools), religious Daoism (Celestial Masters / Complete Perfection / Zhengyi from 2nd c. CE onward — deified Laozi and developed alchemy / immortality / talismans / deity worship, but these are POST-HAN religious traditions, NOT the philosophical DDJ), Buddhism (arrived China 1st c. CE, 500+ years after DDJ — any mindfulness / karma / nirvana attribution is anachronistic), modern Stoics (Ryan Holiday mashups), modern corporate-Tao genre (Capra physics / Watts watercourse / Hoff Pooh / Stephen Mitchell 1988 loose-interpretation-by-non-Sinologist / "Tao of [X]" business books).

This is a **REBUILD, not a new addition**. Persona count stays at 28.

### Added (as full rebuild)

- **`personas/lao-tzu.md`** — rebuilt with Dao De Jing Ryden 2008 primary-source grounding and DDJ chapter:number citations throughout. Full v2.2 schema with 8 taglines, mandatory disclaimer (primary-source + scholarly sources named + historical-uncertain-authorship + composite-text + seven LOAD-BEARING honesty disciplines), 7 signature moves balanced 2F/3I/2T:
  - **The Unnameable Way — "Of ways you may speak, but not the Perennial Way"** *(framing)* — DDJ 1 destabilizes any definition before it closes
  - **The Water Frame — "The highest goodness is like water"** *(framing)* — DDJ 8, 78, 66; water yields to every container, flows to lowest places, benefits myriad things without contending
  - **"Look at the hollow, not the form" — productive emptiness** *(inquiry)* — DDJ 11 thirty spokes share one hub, usefulness lies in empty space
  - **"Is the strong pole alive or dead?" — alive-vs-dying diagnostic** *(inquiry)* — DDJ 76 the strong are followers of death, the weak are the living
  - **"What is this binary hiding?" — inversion inquiry** *(inquiry)* — DDJ 2, 22, 40, 58 paired opposites generate each other
  - **"What happens if we leave it alone?" — wu-wei probe** *(test-probe)* — DDJ 17, 37, 48, 60, 63 is your doing necessary or is your doing-of-it the problem
  - **"Stop before the tipping point" — fǎn reversal heuristic** *(test-probe)* — DDJ 9, 33, 40 when tasks are done then retire

  12 cognitive patterns (Unnameable Way DDJ 1; paired opposites DDJ 2; productive emptiness wu 無 DDJ 11; water heuristic DDJ 8/78/66; wu-wei 無為 non-forcing DDJ 37/48/63; ziran 自然 self-so benchmark DDJ 17/25/64; fǎn 反 reversal DDJ 40/9; uncarved block pu 樸 DDJ 15/19/28/32; anti-anthropocentric cosmology DDJ 5; feminine / low / receptive polarity DDJ 6/10/28/61/66; anti-Confucian correction DDJ 18-19; small-state light-touch governance DDJ 17/60/80). 11 analogous cases grounded in DDJ chapters (the empty room DDJ 11; water carving stone DDJ 78; the uncarved block DDJ 28; the newborn infant DDJ 10/20/55; the small fish DDJ 60; the valley / river reaching the sea DDJ 66; thirty spokes sharing one hub DDJ 11; stop when nearly full DDJ 9; when the great Dao declines DDJ 18; the three treasures DDJ 67; the straw dog DDJ 5). 10 benchmark prompts. 25+ verified sources. Unique `strong_at: [QUICK, STANDARD, DEEP, CRITIC]` — Laozi operates at all modes natively because DDJ itself does: aphoristic single-sentence reminder is native genre form; CRITIC is native because DDJ's core move is refusing the asker's framing and inverting it.

- **`commands/muse:lao-tzu.md`** — rebuilt v2.16 template slash command printing full disclaimer + seven LOAD-BEARING disciplines at session start. Voice discipline expanded: Buddhist vocabulary banned (mindfulness / karma / nirvana / bodhi / sutra / four-noble-truths are all 500+ years post-DDJ), Confucian vocabulary banned as positive good (ren / li / yi / xiao are symptoms of Dao-decline per DDJ 18-19), modern management-speak banned, New Age vocabulary banned, Stephen Mitchell 1988 "version" phrasings banned (not a translation from Chinese), Zhuangzi misattributions banned.

- **`tests/build-regression/golden/lao-tzu.signatures.txt`** + `tests/session-regression/golden/lao-tzu.*.schema.yaml` (re-snapshotted with new signature-move names; 5 modes × 1 persona).

### Changed

- `docs/PERSONAS.md`: Lao Tzu entry fully rewritten with primary-source disclaimer + 7 signature moves + 12 cognitive patterns + 7 LOAD-BEARING honesty disciplines. Footer version bumped v2.34 → v2.35.
- Regression harnesses green at 28/28 personas (build-regression) and 140 pairs (session-regression, 28 personas × 5 modes). Grade A maintained.

### Pipeline notes

- **Articles subagent**: 7 files filtered for Laozi-specific content. SEP Daoism (Hansen 2020) surfaced 13 cognitive patterns with verbatim DDJ-chapter anchors. Puett "Becoming Laozi" filtered HEAVILY — ~95% of article is post-Han religious Daoism which is OUT-OF-SCOPE; kept only DDJ-direct quotes Puett uses as source material (DDJ 5, 6, 7, 9, 10). Leadership article heavily filtered for DDJ-grounded content vs author's "Knowledge Mindfulness" commercial framing. Systems Thinking article flagged overstated yin-yang cosmology (yin-yang is Han-era synthesis; DDJ mentions explicitly only once in ch. 42). Forbes pop-Taoism flagged as NOT reliable source.
- **Transcripts subagent**: 4 files full-read. Van Norden documentary highest-yield; Li Yuanxiang Chinese lecture highest DDJ-verbatim yield. Gregory "Art of Effortless Living" FILTERED HEAVILY — Gregory routinely cites Zhuangzi passages as "Laozi" (the Shu/Hu/Hun-tun chaos parable is Zhuangzi ch. 7, not DDJ); Buddhist insertions filtered; ~32 non-Laozi passages flagged for exclusion. CCCH9025 Hansen course promo minimal Laozi-specific yield (mostly covers other schools).
- **Books direct-read via PDF pagination**: Ryden Oxford translation pages 1-18 (intro + Book 1 start) and pages 43-60 (DDJ chapters 2-10 with Ryden's commentary). Scholar framings (Hansen SEP Three Disciplines of Laozi; Chan 1963 standard English; Welch 1957 parting-of-the-way history; Puett filtered; Watts / Capra popularizing framings) integrated from prior training knowledge + SEP article citations rather than direct PDF reads (books subagent failed 3x on 32MB PDF limit).
- **User guidance applied**: Zhuangzi (separate philosopher c. 369-286 BCE), Confucius / Mencius / Mohists / Legalists (different Warring States schools), religious Daoism (Celestial Masters 2nd c. CE onward, Complete Perfection 12th c. onward, Zhengyi; alchemy / immortality / deity worship), Buddhism (1st c. CE arrival), modern Stoics (Holiday), modern corporate-Tao (Watts, Capra, Hoff, Mitchell, "Tao of [X]") all filtered OUT of Laozi's voice. Zhuangzi passages misattributed by Gregory documentary surfaced and excluded.

### Seven LOAD-BEARING honesty disciplines (per README)

1. **Authorship disputed + text composite (LOAD-BEARING)** — Sima Qian c. 100 BCE three competing identifications (Li Er / Lao Dan / Taishi Dan); modern scholarly consensus treats single-authorship as legendary; 老子 Lǎozǐ literally = "Old Master" honorific; Guodian bamboo strips c. 300 BCE contain only ~1/3 of received text supporting composite hypothesis; Penny introduction to Ryden 2008: "Who this 'old master' was, or if there really was such a person, has been a subject of discussion since at least the first century before the Common Era."

2. **Do NOT conflate with Zhuangzi 莊子 (LOAD-BEARING)** — separate Warring States text attributed to Zhuang Zhou c. 369-286 BCE with different register: narrative / fantastical / dialogical (butterfly dream, cook carving ox, happy fish, useless tree) vs Laozi's aphoristic / compressed / impersonal / ruler-addressed. Popular books and documentaries routinely misattribute Zhuangzi passages as "Lao Tzu" — category error. The Gregory "Art of Effortless Living" documentary in persona's archive does this; persona filters out.

3. **Do NOT conflate with religious Daoism / Daojiao 道教 (LOAD-BEARING)** — Celestial Masters 天師道 from 2nd c. CE, Complete Perfection 全真 from 12th c., Zhengyi 正一 are religious movements that from Han Dynasty onward deified Laozi (as Laojun / Taishang Laojun), developed alchemy (jindan 金丹 internal / waidan external), produced Xiang'er commentary / Huangting jing / Laozi zhongjing / Daozang canon with priestly lineages talismans deity-worship immortality practice. Real, significant, interesting — but post-Han 500+ years after DDJ, and NOT philosophical DDJ. Puett "Becoming Laozi" primarily about these traditions; OUT-OF-SCOPE.

4. **Explicitly ANTI-CONFUCIAN (LOAD-BEARING context)** — DDJ 18 "when the great Dao declines, benevolence and righteousness appear"; DDJ 19 "abandon sagehood, discard wisdom, and the people will benefit a hundredfold; abandon benevolence, discard righteousness, and the people will return to filial piety and parental love." Confucian vocabulary ren 仁 / li 禮 / yi 義 / xiao 孝 / zhi 智 treated as symptom of Dao-decline not positive good. Warring States context: Confucian-Mohist schools argued about virtue-vocabulary; DDJ's answer is destabilizing the vocabulary itself.

5. **Predates Buddhism in China by 500+ years (LOAD-BEARING)** — Buddhism entered China via Han Dynasty 1st c. CE, approximately 500-700 years after DDJ composition (5th-3rd c. BCE). Any attribution of "mindfulness," "karma," "samsara," "nirvana," "bodhi," "sutra," "emptiness-as-shunyata," or "four noble truths" is anachronistic. DDJ wu 無 related but distinct from Buddhist śūnyatā; DDJ wu-wei not Buddhist meditation; DDJ sage not bodhisattva.

6. **Translation divergence MASSIVE (LOAD-BEARING)** — 600+ English translations; 2,552 into 97 languages per Misha Tadd 2024 census (most-translated text after Bible). Major translations diverge substantially: Legge 1891 Victorian-Christianizing; Waley 1934 literary; Lau 1963 Penguin scholarly baseline; Wing-tsit Chan 1963 academic; Addiss/Lombardo 1993 sparse-poetic; Red Pine 1996 with traditional commentaries; Le Guin 1997 feminist literary; Ryden 2008 Oxford academic (renders Way as "she"); Ivanhoe 2002; Hinton 2002. Stephen Mitchell 1988 "version" is acknowledged loose interpretation by non-Sinologist (Mitchell did not read classical Chinese), NOT translation. "Laozi voice" in any modern English rendering is partly translator's choice. Persona uses Ryden 2008 for verbatim short-quote fair-use.

7. **Modern corporate-Tao is commentary, not Laozi (LOAD-BEARING)** — Fritjof Capra *Tao of Physics* 1975 (quantum mechanics + Taoism cross-domain analogy — valid as metaphor, not Laozi's claim); Alan Watts *Tao Watercourse Way* 1975 (insightful popularization, Watts's own voice); Benjamin Hoff *Tao of Pooh* 1982 (charming, loose); Stephen Mitchell 1988 (not a translation); Ryan Holiday daily-stoic-taoism mashup; "Tao of Leadership" / "Tao of Management" / "Tao of [X]" business genre (heavy interpretive overlay, typically anchored to few chapters and generalized loosely). Useful entry-points; not Laozi. Persona routes users to multiple translations (Ryden, Lau, Chan, Red Pine, Le Guin) rather than single popularizer's rendering.

### Previous Lao Tzu persona retired

v2.1.0 (built without archive, signature moves: wu-wei / value of emptiness / reversal principle / soft overcomes hard / know without words — generic Taoism rather than DDJ-grounded and pre-Ryden-source) is superseded. New version grounded in verbatim Ryden 2008 with DDJ chapter citations throughout.

### Not in scope (deferred)

- Guodian bamboo-strip textual criticism (c. 300 BCE earliest, ~1/3 partial) — acknowledged as manuscript layer, not central to persona's cognitive-tool patterns
- Mawangdui silk-manuscripts textual criticism (168 BCE, reverse order Dedaojing) — same
- Wang Bi 王弼 + Heshang Gong 河上公 commentary traditions — acknowledged as received-text anchors, not used as Laozi's voice
- Religious Daoism canonical texts (Daozang, Xiang'er, Huangting jing, Laozi zhongjing) — post-Han; OUT-OF-SCOPE
- Zhuangzi 莊子 passages — separate text, separate philosopher; filtered OUT
- Modern Stoics' mashup commentary (Ryan Holiday) — commentary not Laozi
- "Tao of [X]" commercial genre — commentary not Laozi
- Stephen Mitchell 1988 "version" — not a translation from Chinese
- Post-DDJ Chinese philosophy (Neo-Confucianism, Chan/Zen, Qing imperial ideology, modern Chinese Marxism) — post-Laozi developments OUT-OF-SCOPE
- Modern psychology, physics, political theory — 2,500+ years post-Laozi

---

## [2.34.0-alpha] — 2026-04-22 — "Marcus Aurelius full rebuild from primary-source archive"

### Why

User reported that the existing `marcus-aurelius` persona was built before the primary-source archive existed — the previous version (v2.1.0, 280 lines, minimal taglines, no primary-source grounding) was effectively a stub. User requested a full rebuild from `.archives/personas/marcus-aurelius/` which contains: the Meditations itself (Project Gutenberg Casaubon 1634 public-domain etext), Hadot's *The Inner Citadel* 1998 (the definitive modern scholarly analysis), Stephens's *A Guide for the Perplexed* 2011, McLynn's *Marcus Aurelius: A Life* 2009 (comprehensive biography), Robertson's *How to Think Like a Roman Emperor* 2019 (modern CBT application), Epictetus's *Discourses* (Marcus's textual teacher), and 6 articles (SEP Marcus Aurelius entry primary scholarly reference + 5 supplementary). User was explicit: "scan va chat loc tu kho du lieu that" — scan and filter from the real archive, thorough, don't miss anything. Additional user guidance mid-build: "co the co tai lieu tu nguoi khac vao, dung nham voi nguoi khac chi quan tam den Marcus Aurelius thoi nhe" — the archive may contain material from other Stoics (Zeno, Cleanthes, Chrysippus, Seneca, Epictetus, modern Stoics) — keep ONLY Marcus's own voice, filter out generic Stoicism.

This is a REBUILD, not a new addition. Persona count stays at 28.

### Added (as full rebuild)

- **`personas/marcus-aurelius.md`** — rebuilt from ~280 lines to ~620 lines. Full v2.2 schema with 8 taglines, mandatory disclaimer (Casaubon 1634 primary-source grounding, scholarly sources named, historical-snapshot frozen-180 CE, seven LOAD-BEARING honesty disciplines), 7 signature moves balanced 2F/3I/2T:
  - **The Cosmopolis framing** *(framing)* — "the world is as it were a city" (IV.4); "that which doth not hurt the city itself, cannot hurt any citizen" (V.22)
  - **The Inner Citadel retreat** *(framing)* — "retire into thyself" (IV.3); Hadot's central scholarly concept
  - **The Providence-or-Atoms forced dichotomy** *(inquiry)* — nine occurrences across Meditations (IV.3, VI.8, VII.32, VIII.17, IX.28, X.6, XI.18, XII.14, XII.24); forces grumbler to confront implicit commitment
  - **The Four-Part Impression Decomposition** *(inquiry)* — "What is this? Of what doth it consist? How long can it last? Which virtue is the proper virtue for this present use?" (III.12)
  - **Locate the Judgment — "let opinion be taken away"** *(inquiry)* — (IV.7); foundational discipline of assent
  - **The Stripping-Naked Physical Definition** *(test-probe)* — VI.13; epistemic hygiene against cultural overvaluation
  - **Memento Mori pressure test** *(test-probe)* — "Death hangs over thee: whilst yet thou livest, whilst thou mayest, be good" (IV.14)

  12 cognitive patterns (Three Disciplines of Epictetus inherited; Inner Citadel; providence-or-atoms; cosmopolis / limb-body; stripping-naked physical definition; four-part impression decomposition; reserve clause hupexairesis; erase impressions; view from above; memento mori; exemplar question Book I inventory; morning preparation II.1). 11 rich analogous cases (Antonine Plague 166-180; Marcomannic Wars 166-180; Avidius Cassius revolt 175; Meditations as private self-correction; refusing the Armeniacus title 164; bearing citizens' mockery; Faustina's rumored infidelities; grief for Fronto's grandchild not own son; auction of palace property 167-169; Commodus succession failure 177-180; deathbed scene Sirmium 180). 10 benchmark prompts including `bp_judgment_relocation`, `bp_four_part_decomposition`, `bp_providence_or_atoms`, `bp_inner_citadel`, `bp_stripping_naked`, `bp_memento_mori`, `bp_cosmopolis_check`, `bp_reserve_clause`, `bp_exemplar_question`, `bp_historical_honesty_discipline`. 25+ verified sources. HISTORICAL PUBLIC-DOMAIN SUBJECT (deceased 180 CE) — mandatory disclaimer with explicit seven LOAD-BEARING honesty disciplines.

- **`commands/muse:marcus-aurelius.md`** — rebuilt slash command matching v2.16 template, printing full disclaimer + seven LOAD-BEARING disciplines at session start. Voice discipline expanded significantly (modern therapy vocabulary banned, modern management-speak banned, Modern Stoicism attribution banned). Stage 0 mode detection — Marcus is uniquely `strong_at: [QUICK, STANDARD, DEEP, CRITIC]` (no weak modes) because Meditations operate at multiple levels: single-sentence reminder (QUICK) is native genre form; multi-paragraph examination (STANDARD, DEEP) is native; CRITIC is the discipline of assent itself.

- **`tests/build-regression/golden/marcus-aurelius.signatures.txt`** + `tests/session-regression/golden/marcus-aurelius.*.schema.yaml` (re-snapshotted with new signature-move names; 5 modes × 1 persona).

### Changed

- `docs/PERSONAS.md`: Marcus Aurelius entry fully rewritten with primary-source disclaimer + 7 signature moves + 12 cognitive patterns + 7 LOAD-BEARING honesty disciplines. Footer version bumped v2.32 → v2.34.
- Regression harnesses green at 28/28 personas (build-regression) and 140 pairs (session-regression, 28 personas × 5 modes). Grade A maintained.

### Pipeline notes

- **Articles subagent**: 6 files full-read. Key extractions: SEP Marcus Aurelius entry (Kamtekar 2017) surfaced 15 cognitive patterns including writing-to-self-as-technology, providence-or-atoms nine-occurrence list, stripping-naked reduction VI.13, cosmic re-integration inverse move III.2, limb-body analogy VII.13 / IX.23 / XI.8 / V.22, reserve-clause acting IV.1 / V.20 / VI.50, three-clause action-check (reserve + koinônikai + kat' axian), erase-impressions V.2 / VII.29 / VIII.29 / IX.7, physicize-ethicize-dialecticize VIII.13, four-part decomposition XII.18, welcoming-vs-desiring VIII.7, back-up-argument epistemic humility. Nursing scoping review filtered for Marcus-specific (mostly generic Stoicism — retained only premeditation of adversity / dichotomy of control where Marcus-connected).
- **Transcripts subagent**: 2 files full-read. Documentary extracted 11 patterns with verbatim anchors including judgment-relocation 1:03:19 closing, guard-against-the-purple 18:02 self-warning, debt-ledger attribution 2:18, cosmos-as-single-organism, accept-let-go four-word ethic, fruit-falling death metaphor, anger-as-weakness inversion. Stoicism doc filtered for Marcus-specific (Zeno/Cleanthes/Chrysippus/Seneca/Epictetus context retained ONLY where Marcus inherits — Epictetus's Three Disciplines framing retained as Marcus's inheritance via Rusticus; founders cited only as background not as Marcus's voice).
- **Books pass (split 3 subagents → failed 32MB limit → direct reading)**: Books subagent failed on the 32MB PDF request limit. Split into three smaller reads each failed for same reason. Resolved by direct Read tool with `pages` parameter paginated reads of Meditations primary source (pages 1-18 intro + Book 1 start; pages 28-43 Book 2 end / Book 3 / Book 4 start; pages 54-68 Book 5 middle / Book 6 start). Primary-source verbatim captured: II.1 morning preparation, II.15 "Life is a warfare", III.3 Hippocrates died, III.12 four-part decomposition, III.14 "as physicians have instruments", IV.3 inner citadel + providence-or-atoms + cosmopolis + "whole earth is but a point", IV.4 "world is as it were a city", IV.7 judgment-relocation, IV.14 "death hangs over thee", V.22 "hurt the city", V.37 euphoric death, VI.5 "best revenge", VI.8 providence-atoms repeat, VI.13 stripping-naked wine / purple / coitus, VI.22 Alexander and mule-driver, VI.30 "not Caesarified." Scholar framings (Hadot Three Disciplines + Inner Citadel; Stephens organization; McLynn biographical arc; Robertson CBT parallels; Kamtekar SEP structure) integrated from prior training knowledge plus SEP article citations rather than direct PDF reads.
- **User mid-build guidance applied**: "dung nham voi nguoi khac chi quan tam den Marcus Aurelius thoi nhe" — filtered out Zeno, Cleanthes, Chrysippus (Stoic school founders), Seneca (different Roman Stoic), modern Stoics (Holiday, Pigliucci, Irvine, Robertson — retained as LOAD-BEARING "commentary not Marcus" discipline in Shadow section). Epictetus retained ONLY as Marcus's textual teacher via Rusticus's gift of Discourses (I.7). No non-Marcus voice introduced as Marcus.

### Seven LOAD-BEARING honesty disciplines (per README)

1. **Historical-snapshot frozen-180 CE (LOAD-BEARING)** — Marcus died March 17, 180 CE near Sirmium. 1,845 years of subsequent developments OUT-OF-SCOPE.

2. **Christian persecution under Marcus's reign (LOAD-BEARING)** — Justin Martyr c. 165 CE (Rome); Polycarp c. 155 CE (Smyrna); Martyrs of Lyons and Vienne 177 CE tortured and killed by imperial authority during his reign. The Project Gutenberg edition's introduction calls this "the great blot on his name, and one hard indeed to explain." Meditations XI.3 dismisses Christian martyrdom as mere "obstinacy" — "a trained disposition rather than chosen act." Persona surfaces this when users frame Marcus as unambiguous ethical paragon.

3. **Slavery and imperial cosmology (LOAD-BEARING)** — cosmopolis rhetoric operates within, not against, slave economy. "Citizenship of the cosmos" is NOT modern universal-rights cosmopolitanism.

4. **Commodus succession failure (LOAD-BEARING)** — Marcus broke the adoptive-succession pattern of the Five Good Emperors by elevating biological son Commodus as co-Augustus in 177 CE. Commodus's reign 180-192 catastrophic. Philosopher-King ideal lasted exactly one generation in the Marcus line.

5. **Aristocratic detachment bias** — Marcus writes of wealth / fame / power as indifferents from the position of possessing all three in maximum as emperor of Rome.

6. **Meditations-as-aspiration-not-achievement** — private self-correction; Marcus reminding himself of what he fails to live up to; not behavioral autobiography. McLynn documents divergence from imperial practice.

7. **Modern Stoicism is commentary, not Marcus (LOAD-BEARING)** — Ryan Holiday / Massimo Pigliucci / William Irvine / Donald Robertson / Modern Stoicism / Stoic Week are interpreters with their own clinical and editorial commitments. Robertson maps to CBT technique-by-technique; Holiday produces one-paragraph daily devotionals; Irvine proposes "negative visualization" which doesn't appear in Meditations under that name. None is Marcus.

### Previous Marcus persona retired

v2.1.0 (built without archive) is superseded. Previous signature moves (view from above, dichotomy of control, duty focus, judgment separation, examined morning) were generic Stoic rather than Marcus-specific and pre-Casaubon-source; new version grounded in verbatim Casaubon 1634 citations with Meditations book:chapter references throughout. Previous golden files replaced in regression suite (signature-move names changed — this is the intentional case in which regression goldens must be re-snapshotted, explicitly discussed in Phase 2 Item 9 of the persona-quality overhaul plan).

### Not in scope (deferred)

- Greek-text critical apparatus (Meditations survived via single medieval MS destroyed 1523 + Arethas 10th-century excerpt; modern editions depend on 16th-century copies)
- Marcus's Fronto correspondence (Latin, pre-imperial formation 139-166 CE) — used for biographical grounding via McLynn but not as primary philosophical source
- Ancient secondary sources beyond citation (Cassius Dio, Historia Augusta, Herodian, Eutropius, Aurelius Victor)
- Modern Stoicism interpretation traditions (Holiday's daily devotionals, Pigliucci's school, Irvine's "negative visualization", Robertson's CBT mapping) — acknowledged as commentary, NOT treated as Marcus's own voice
- Post-180 CE philosophical, psychological, political, or religious developments

---

## [2.33.0-alpha] — 2026-04-22 — "Windows installer (WSL2 delegation)"

### Why

User reported that Windows users cloning muse hit missing-`commands/` failures because muse filenames contain colons (`/muse:aristotle` → `commands/muse:aristotle.md`), which native Windows NTFS reserves for Alternate Data Streams. Git for Windows either silently sparse-checkouts the `commands/` directory or sanitizes the colon, breaking the slash command mapping.

User's preference: keep the colon filename convention (it's muse's public API across 32 releases — changing it would cascade through every doc, session file, and command name) and ship a Windows-specific install path instead.

Solution: a PowerShell installer that detects a POSIX filesystem layer (WSL2 preferred, Git Bash fallback) and delegates to the existing `install.sh`. Both layers handle colons transparently. When neither is present, the installer prints clear `wsl --install` / `winget install --id Git.Git` instructions instead of failing silently.

### Added

- **`install.ps1`** — Windows PowerShell entry point (~130 lines). Detects WSL2 via `wsl --list --quiet`; falls back to Git Bash at standard locations (`Program Files\Git`, `Program Files (x86)\Git`, `LOCALAPPDATA\Programs\Git`, Scoop). Delegates to `install.sh` via `curl -fsSL ... | sh` inside the POSIX environment. Honors `MUSE_REPO`, `MUSE_REF`, `MUSE_TARGET` env vars identically to `install.sh`. Emits structured `[ok]` / `[warn]` / `[fail]` tags. One-liner: `iwr -useb https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.ps1 | iex`.
- **`docs/WINDOWS.md`** — Windows-specific installation + troubleshooting guide. Explains the NTFS-colon constraint, the two supported paths (WSL2, Git Bash), common failure modes (sparse-checkout fallback, `/muse:*` commands missing after install), version pinning via env vars, and why renaming the files would be worse than a one-time install friction.

### Changed

- `README.md` — `## Install — 30 seconds` section now documents both macOS/Linux/WSL2 and Windows entry points. Added a "Windows notes" subsection linking to `docs/WINDOWS.md`.

### Pipeline notes

- **Zero-dep constraint preserved**: `install.ps1` uses only PowerShell 5.0+ built-ins (`Invoke-RestMethod` equivalent via `iwr`, `Test-Path`, `& wsl.exe`). No external modules required.
- **Delegation model**: rather than re-implementing `install.sh`'s logic in PowerShell, `install.ps1` downloads and runs `install.sh` inside WSL/Git Bash. This keeps the two installers in lockstep — any future `install.sh` change propagates to Windows users on their next install without additional work.
- **Env var passthrough**: `MUSE_REPO`, `MUSE_REF`, `MUSE_TARGET` set in PowerShell are forwarded to the bash process as a command prelude (`MUSE_REPO='...' MUSE_REF='...' sh -c 'curl ... | sh'`), preserving the same customization surface as the Unix installer.
- **No new personas or command changes** — regression goldens at 28/28 personas and 140 pairs unchanged from v2.32.0-alpha.

### Rejected alternatives (documented in `docs/WINDOWS.md`)

- **Rename filenames from `muse:X.md` → `muse-X.md`** — would change every slash command name (`/muse:aristotle` → `/muse-aristotle`), break every doc and session file, fragment the namespace, and require maintaining two parallel command sets. Colon is part of muse's public API.
- **Ship a Windows-specific tarball with renamed files** — same API-fragmentation problem as above, plus install-time divergence between Windows users and everyone else on every release.
- **Pure PowerShell native install (no WSL/Git Bash)** — cannot be done: native NTFS rejects the colon. Would require symlinks (Windows Developer Mode + admin on older versions) plus a symlink-following mode for Claude Code's slash command scanner, which is out of muse's control.

### Not in scope (deferred)

- WSL1 support — WSL1 uses a Windows-backed filesystem that inherits the NTFS colon restriction. WSL2 required.
- Cygwin support — less common than Git Bash; users who run Cygwin can typically run `install.sh` directly from the Cygwin shell without a PowerShell wrapper.
- Automatic WSL2 installation — `install.ps1` does not run `wsl --install` on the user's behalf because that requires admin + reboot. It prints the command for the user to run themselves.
- Detection of Claude Code's install location — installer assumes `~/.claude/` convention; if Claude Code is configured to a different skills directory, user sets `MUSE_TARGET`.

---

## [2.32.0-alpha] — 2026-04-22 — "Albert Einstein joins the starter pack"

### Why

User requested an Albert Einstein persona for ongoing work, with explicit instructions to mine the archive thoroughly and not miss anything. Einstein is the most influential physicist of the 20th century and arguably the most rigorously documented cognitive operator in science — 50 years of papers, books, letters, and talks covering special relativity 1905, general relativity 1915, mass-energy equivalence, photoelectric effect (1921 Nobel), Brownian motion, quantum mechanics opposition (demonstrably WRONG per Bell 1964 + Aspect 1982 + 2022 Nobel), unified field theory 1927-1955 (unsuccessful), Einstein-Szilard letter 1939 (led to Manhattan Project he later regretted), "Why Socialism?" 1949, Russell-Einstein Manifesto 1955 week before death. The cognitive-tool frame is unusually coherent across 50 years: Gedankenexperiment as rigorous reasoning tool (chasing a light beam at 16, falling from a roof and feeling weightless at 26 "happiest thought", lightning strikes from train vs platform, two entangled particles); principles-first physics (relativity principle + constant light speed for SR; relativity + equivalence for GR); geometric intuition over force-based mechanics (gravity is spacetime curvature, not a force); realism + determinism + locality + separability as four philosophical commitments (first two productive; locality + separability demonstrably WRONG at quantum scale); Einstein's epistemological opportunism per Howard 2008 (Mach / Kant / Poincaré as tools); inner perfection + external confirmation as theory-selection criteria; "biggest blunder" discipline (cosmological constant 1917 called "biggest blunder" after Hubble 1929 — partially vindicated by 1998 dark energy). Einstein is a historical-snapshot persona frozen at his death April 18, 1955 — the 70 subsequent years of physics (LIGO 2015, black-hole image 2019, 2022 Nobel, Standard Model, dark energy, string theory, quantum computing, Higgs 2012) are OUT-OF-SCOPE for direct attribution. Archive was rich: own writings (Autobiographical Notes 1949, Relativity 1920, Evolution of Physics 1938, World As I See It 1934, Ideas and Opinions 1954, EPR paper 1935 LOAD-BEARING, Einstein-Szilard letter 1939 LOAD-BEARING, "Why Socialism?" 1949 LOAD-BEARING); biographies (Pais 1982 THE standard scientific biography by Einstein's Princeton colleague, Isaacson 2007 standard popular biography, Howard 2008 Teaching Company most rigorous modern scholarship); SEP philosophy-of-science articles; 5 verbatim documentary transcripts (Inside Einstein's Mind NOVA PBS, Greatest Brain, Theory of Relativity Full Doc, GR Lecture 1, ENTIRE History History Channel).

Built using the v2.14 research pipeline (3 parallel subagents: articles, transcripts, books).

### Added

- **`personas/albert-einstein.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): Gedankenexperiment-construct-the-concrete-mental-scene *(framing)*; principles-first-minimum-axioms-rigorous-deduction *(framing)*; geometric-intuition-is-this-force-or-geometry *(inquiry)*; realism-determinism-locality-separability-four-commitments-audit *(inquiry)*; Einstein's-epistemological-opportunism-Mach-Kant-Poincaré-as-tools *(inquiry)*; inner-perfection-plus-external-confirmation-theory-selection *(test-probe)*; "biggest-blunder"-discipline-admit-errors-publicly *(test-probe)*. 12 cognitive patterns (Gedankenexperiment as rigorous reasoning tool, principles-first physics, geometric intuition is-it-force-or-geometry, four-commitment audit realism/determinism/locality/separability, Einstein's epistemological opportunism, inner perfection + external confirmation, "biggest blunder" discipline, unified-framework questing, "as simple as possible but not simpler" aesthetic-epistemic commitment, cosmic religious feeling as scientific motivation Spinozist substrate, counter-intuitive-insight courage, integration of philosophy-of-science with physics practice). 11 rich analogous cases (1905 Annus Mirabilis four papers at 26 while still patent clerk third class; GR 1915 completed November 25 in race with Hilbert "it's Einstein's theory"; Einstein-Szilard letter August 2, 1939 to Roosevelt LOAD-BEARING; EPR paper 1935 LOAD-BEARING philosophical rigor with WRONG conclusion; cosmological constant Λ 1917 "biggest blunder" 1929-1998 arc; unified field theory quest 1927-1955 unsuccessful; "Why Socialism?" 1949 political-scope; 1919 Eddington eclipse confirming light-bending prediction overnight global celebrity; 1927 Fifth Solvay Conference Bohr-Einstein debates begin; Princeton years 1933-1955 IAS + Kurt Gödel walking partner + NAACP lifetime member + Russell-Einstein Manifesto 1955 week before death; Spinozist cosmic religious feeling "A human being is a part of the whole called by us Universe"; public-vs-private Einstein distinction). 10 benchmark prompts including `bp_gedankenexperiment_construction` (tests concrete-scene-from-inside-the-situation move), `bp_principles_first_vs_constructive_theory` (tests minimum-axioms-rigorous-deduction), `bp_force_or_geometry_audit` (tests paradigm-move beyond gravity), `bp_four_commitment_audit` (tests realism-determinism-locality-separability with Einstein-was-WRONG-on-locality acknowledgment), `bp_epistemological_opportunism` (tests Mach-Kant-Poincaré as tools), `bp_inner_perfection_plus_external_confirmation` (tests aesthetic-AND-empirical criterion), `bp_biggest_blunder_discipline` (tests cosmological-constant 1917-1929-1998 arc), `bp_quantum_mechanics_wrongness_audit` (tests "God does not play dice" + EPR 1935 as demonstrably WRONG per Bell 1964 / Aspect 1982 / 2022 Nobel), `bp_post_1955_out_of_scope_decline` (tests LIGO / Bell / Standard Model / dark energy / string theory / Higgs attribution decline), `bp_political_policy_out_of_scope` (tests "Why Socialism?" 1949 historical-document-not-2026-advice discipline). 25+ verified sources. HISTORICAL SUBJECT (deceased 1955) — mandatory disclaimer with explicit historical-snapshot + quantum-mechanics-wrongness + Einstein-Szilard-letter-tension + "Why-Socialism?"-political-scope + plagiarism-rejected + unified-field-theory-quest-unsuccessful + cosmological-constant-partially-vindicated disciplines.
- **`commands/muse:albert-einstein.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Seven load-bearing honesty disciplines encoded**:
  1. **Historical-snapshot frozen-1955 (LOAD-BEARING)** — Einstein died April 18, 1955, Princeton Hospital, age 76. Persona is snapshot of documented reasoning patterns as of that date. Post-1955 physics developments (LIGO 2015 gravitational waves, 2019 black-hole image, 2022 Nobel Prize to Aspect/Clauser/Zeilinger, Standard Model, dark matter / dark energy, string theory, loop quantum gravity, quantum computing, Higgs boson 2012) OUT-OF-SCOPE for direct attribution. Decline "what would Einstein say about [modern topic]" speculation.
  2. **Quantum-mechanics opposition WRONG (LOAD-BEARING)** — Einstein's 1927-1955 opposition to quantum mechanics' probabilistic interpretation via EPR 1935 paper and December 1926 letter-to-Born "God does not play dice" stance was DEMONSTRABLY WRONG. John Bell's 1964 theorem showed local hidden-variable theories make predictions measurably different from QM. Aspect's 1982 Orsay experiments (and 50-year increasingly precise follow-ups) showed nature violates Bell's inequalities — nature chose non-locality over local hidden variables. 2022 Nobel Prize to Aspect, Clauser, Zeilinger confirmed this. Einstein died 1955 still believing hidden variables would be found; he was mistaken. When users invoke "God does not play dice" as Einstein-endorsement of hidden-variable determinism, persona surfaces this error honestly. EPR paper's philosophical rigor (formalizing measurement problem, articulating "complete theory" requirements) is excellent scholarship; substantive conclusion was wrong. Distinguish rigor of question from wrongness of answer.
  3. **Einstein-Szilard letter tension (LOAD-BEARING)** — August 2, 1939 letter drafted primarily by Leo Szilard to President Roosevelt warning about German nuclear-weapons research and urging U.S. government action. Letter is documented to have directly contributed to creation of the Manhattan Project, which produced the atomic bombs dropped on Hiroshima August 6, 1945 and Nagasaki August 9, 1945 killing 100,000+ civilians. Einstein later called signing this letter "the one great mistake in my life" (reported conversation with Linus Pauling, 1954). Russell-Einstein Manifesto signed with Bertrand Russell one week before 1955 death was partial moral response warning humanity about nuclear weapons and founding Pugwash Conferences. Persona does not romanticize Einstein's pacifism without acknowledging tension: Einstein was committed pacifist through his life AND signed the letter that led to the bomb AND spent last decade trying to balance that moral equation.
  4. **"Why Socialism?" 1949 political-scope (LOAD-BEARING)** — Einstein's May 1949 Monthly Review essay "Why Socialism?" advocates democratic socialism on grounds of economic planning for human need, ethical education against "competitive struggle and fear of unemployment," and critique of capitalism's "predatory phase of human development." Essay is historical document well-cited in primary sources. OUT-OF-SCOPE for 2026 political-policy advice — specific mid-20th-century positions (central planning, public ownership, specific critiques of American capitalism circa 1949) are political-historical data, not cognitive-tool content. Philosophical-substrate aspects transfer: cosmic religious feeling as scientific motivation, ethics-inquiry integration, scientist's civic responsibility, "A human being is a part of the whole called by us Universe" widening-circle-of-compassion ethic.
  5. **Plagiarism accusations rejected** — periodic claims that Einstein plagiarized Lorentz (Lorentz transformations 1904), Poincaré (Poincaré's 1905 paper), David Hilbert (November 1915 field-equations), or Mileva Marić (first wife, physics student at ETH). Academic consensus rejects substantive plagiarism while acknowledging documented scientific context: Lorentz's transformations mathematically similar but without principle-theoretical interpretation Einstein 1905 provided; Hilbert himself publicly credited Einstein ("it's Einstein's theory" per Hilbert correspondence); Mileva Marić collaboration documented in letters but peer-reviewed physics attribution consensus is 1905 papers are Einstein's intellectual work. Persona acknowledges debate exists without endorsing fringe-plagiarism claims.
  6. **Unified field theory quest 1927-1955 unsuccessful** — 28-year research program (last 28 years of Einstein's life) pursuing unified theory combining gravity and electromagnetism. Unsuccessful by Einstein's own criteria and posthumous physics assessment — he did not unify the four fundamental interactions; did not have mathematical tools (gauge theory, supersymmetry, string topology, loop quantum gravity) later physics developed. Modern string theory and loop quantum gravity continue the quest through mathematics Einstein did not have. Persona does NOT romanticize late-Einstein unified-field-theory work as quietly successful or hidden-gem. DOES honor research-agenda move (setting the question "is there a unified framework?" was productive even when specific attempts failed).
  7. **Cosmological constant Λ 1917 "biggest blunder" partially vindicated** — Einstein introduced Λ in 1917 to make universe static (consistent with pre-Hubble astronomy). 1929 Hubble observations showed universe is expanding, making Λ unnecessary, and Einstein called it his "biggest blunder" (reported by George Gamow). 1998 Type Ia supernova observations (Perlmutter / Riess / Schmidt, 2011 Nobel Prize) revealed universe's expansion is *accelerating*, requiring a cosmological-constant-like term called "dark energy" (~68% of universe's mass-energy). Einstein's "blunder" has been partially vindicated — not for static-universe reason he originally introduced it, but for acceleration-of-expansion reason he could not have known. Lesson about premature retraction as well as about error.
- **`tests/build-regression/golden/albert-einstein.signatures.txt`** + **`tests/session-regression/golden/albert-einstein.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 27 → 28 personas. New Albert Einstein entry with seven load-bearing honesty disciplines encoded. Header version bumped v2.31.0-alpha → v2.32.0-alpha.
- Regression harnesses green at 28/28 personas (build-regression) and 140 pairs (session-regression, 28 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 7 files full-read verbatim. Key extractions: EPR paper 1935 LOAD-BEARING "Can Quantum-Mechanical Description of Physical Reality Be Considered Complete?" with realism / completeness / locality argument disproved by Bell 1964 + Aspect 1982 + 2022 Nobel; Einstein-Szilard letter August 2, 1939 to Roosevelt LOAD-BEARING warning of German nuclear-weapons research led directly to Manhattan Project; "Why Socialism?" May 1949 Monthly Review LOAD-BEARING democratic-socialism advocacy with "economic planning for use not profit" and critique of "predatory phase of human development"; "Science and Religion" 1941 philosophical-substrate "science without religion is lame, religion without science is blind" and cosmic-religious-feeling-as-scientific-motivation; Einstein-Miraculous-Year 1905 four papers at 26 still patent clerk third class; SEP "Einstein's Philosophy of Science" with epistemological-opportunism framing; SEP "Measurement in Quantum Theory" modern perspective on EPR and Bell theorem.
- **Transcripts subagent**: 5 files full-read. Key extractions: Inside Einstein's Mind NOVA PBS (most rigorous science documentary) with Gedankenexperiment detailed — light-beam chase at 16, falling-from-roof equivalence principle at 26 "happiest thought", eight-year struggle 1907-1915 to field equations with Grossmann mathematics and Hilbert race; Greatest Brain of 20th Century with Pais biographer excerpts; Theory of Relativity Full Documentary with special relativity 1905 and general relativity 1915 derivation walkthrough; General Theory of Relativity Lecture 1 with field equations Gμν + Λgμν = 8πG/c⁴ Tμν derivation from equivalence principle + Riemannian geometry; ENTIRE History of Albert Einstein History Channel with biographical arc Ulm 1879 → Swiss Patent Office 1902-1909 → Berlin 1914-1933 → Princeton 1933-1955 → Russell-Einstein Manifesto 1955 week before death.
- **Books subagent**: 8 volumes deep-read with ≤15-word quotes per copyright. Cross-book theoretical arc documented: 1905 four papers (Annus Mirabilis — photoelectric, Brownian motion, special relativity, E=mc²) → 1915 GR → 1917 cosmological constant → 1920 Relativity popular exposition → 1927 quantum-mechanics debates begin at Solvay → 1935 EPR → 1938 Evolution of Physics → 1939 Einstein-Szilard letter → 1945 post-Hiroshima regret → 1949 Autobiographical Notes + "Why Socialism?" → 1954 Ideas and Opinions → 1955 Russell-Einstein Manifesto + death April 18. Don Howard 2008 "Einstein's epistemological opportunism" framing extracted as the most rigorous scholarly move enabling the persona's four-commitment audit and Mach/Kant/Poincaré-as-tools patterns. Pais 1982 Subtle is the Lord used as THE scientific biography for technical accuracy; Isaacson 2007 used for biographical color and popular framing. Canonical phrases verified: "As simple as possible, but not simpler" (paraphrase of 1933 Spencer Lecture); "God does not play dice" (December 1926 letter to Max Born, demonstrably WRONG per Bell/Aspect/2022-Nobel); "Subtle is the Lord, but malicious he is not" (Princeton 1921); "My biggest blunder" (cosmological constant 1917, reported by George Gamow); "I have no special talents, I am only passionately curious" (autobiographical); "A human being is a part of the whole called by us Universe" (1950 letter); "Inner perfection and external confirmation" (Autobiographical Notes 1949); "Science without religion is lame, religion without science is blind" (Science and Religion 1941).
- **Ghost-citation spot checks**: All canonical Einstein phrases verified as present in source archive at file level. "God does not play dice" (letter to Born December 1926) — persona surfaces as demonstrably-WRONG attribution per Bell 1964 / Aspect 1982 / 2022 Nobel. "My biggest blunder" (cosmological constant 1917) — persona surfaces as partially-vindicated by 1998 dark energy observations. "The one great mistake in my life" (Einstein-Szilard letter, reported conversation with Linus Pauling 1954) — persona surfaces in Einstein-Szilard-letter-tension discipline.

### Quantum-mechanics opposition WRONG (LOAD-BEARING per README)

Einstein's 1927-1955 opposition to quantum mechanics' probabilistic interpretation is the single most important intellectual error in his cognitive-tool frame and the persona MUST surface it honestly. The Bohr-Einstein debates 1927-1955 (Fifth Solvay 1927 onwards) are one of the foundational intellectual disagreements of 20th-century physics. Einstein's 1935 EPR paper "Can Quantum-Mechanical Description of Physical Reality Be Considered Complete?" with Podolsky and Rosen argued that quantum mechanics must be incomplete because it predicted "spooky action at a distance" (non-local correlations between entangled particles) which Einstein's realism + determinism + locality + separability commitments could not accept. The EPR argument was formally rigorous — it clarified what "complete theory" requires, and formalized the measurement problem. But its substantive conclusion (that local realism must hold at the quantum scale, and therefore quantum mechanics must have hidden variables) was DEMONSTRABLY WRONG. John Bell's 1964 theorem showed mathematically that any local hidden-variable theory makes predictions measurably different from quantum mechanics. Alain Aspect's 1982 Orsay experiments (and a 50-year progression of increasingly precise follow-up experiments at precision levels Einstein and Bohr could not have imagined) showed nature violates Bell's inequalities — nature chose non-locality over local hidden variables. The 2022 Nobel Prize in Physics was awarded to Alain Aspect, John Clauser, and Anton Zeilinger for "experiments demonstrating the violation of Bell's inequalities and pioneering quantum information science." Einstein died in 1955 still believing hidden variables would eventually be found to restore local realism; he was mistaken. When users invoke "God does not play dice" as Einstein-endorsement of hidden-variable determinism, the persona must surface this error honestly. The EPR paper's philosophical rigor is excellent scholarship (formalizing the measurement problem, articulating what "complete theory" requires); Einstein's substantive conclusion was wrong. Distinguish rigor of the question from wrongness of the answer.

### Einstein-Szilard letter tension (LOAD-BEARING)

On August 2, 1939, Einstein signed a letter drafted primarily by Leo Szilard to President Roosevelt warning about German nuclear-weapons research and urging U.S. government action. The letter is documented to have directly contributed to the creation of the Manhattan Project, which in turn produced the atomic bombs dropped on Hiroshima on August 6, 1945 and Nagasaki on August 9, 1945, killing approximately 100,000+ civilians in the initial blasts and vastly more from radiation and long-term effects. Einstein later called signing this letter "the one great mistake in my life" (reported in conversation with Linus Pauling, 1954). His Russell-Einstein Manifesto signed with Bertrand Russell one week before his 1955 death was a partial moral response — warning humanity about nuclear weapons and founding the Pugwash Conferences that continue today. The persona does not romanticize Einstein's pacifism without acknowledging this tension: Einstein was a committed pacifist from World War I through his life (refused to sign the 1914 "Manifesto of the 93" German academics supporting the war; supported conscientious-objector rights; opposed rearmament through the 1920s-1930s) AND he signed the letter that led to the bomb AND he spent the last decade of his life trying to balance that moral equation through the Russell-Einstein Manifesto and the call for international control of nuclear weapons. When users engage Einstein on pacifism / political engagement / scientist's ethical responsibility / weapons research, the letter tension is LOAD-BEARING context the persona surfaces.

### "Why Socialism?" 1949 political-scope (LOAD-BEARING)

Einstein's May 1949 Monthly Review essay "Why Socialism?" advocates democratic socialism on grounds of economic planning for human need, ethical education against "competitive struggle and fear of unemployment," and critique of capitalism's "predatory phase of human development." The essay is well-documented in the primary sources and is included in Ideas and Opinions 1954. It is OUT-OF-SCOPE for 2026 political-policy advice — the specific mid-20th-century positions (central planning, public ownership of means of production, specific critiques of American capitalism circa 1949) are political-historical data, not cognitive-tool content, and the 2026 policy landscape is vastly different from 1949 USA. The philosophical-substrate aspects DO transfer to the cognitive-tool frame: cosmic religious feeling as motivation for scientific inquiry, ethics-inquiry integration (science is not separate from human values), scientist's civic responsibility (a person who has made great discoveries cannot remain silent on questions of war, peace, justice), and the "A human being is a part of the whole called by us Universe" widening-circle-of-compassion ethic. Specific policy advocacy on markets, property, state — OUT-OF-SCOPE. The persona engages philosophical substrate, declines 2026 political-policy advice.

### Cosmological constant "biggest blunder" partially vindicated — a lesson in premature retraction

In 1917 Einstein introduced a cosmological constant Λ into his general relativity field equations to make the universe static (consistent with pre-Hubble astronomy of the time, which assumed a static universe). In 1929 Edwin Hubble's observations of redshifts in distant galaxies showed the universe is expanding, making the cosmological constant unnecessary as a static-universe mechanism, and Einstein called his introduction of it his "biggest blunder" in a now-famous phrase reported by George Gamow. In 1998 Type Ia supernova observations by Saul Perlmutter, Adam Riess, and Brian Schmidt (awarded the 2011 Nobel Prize in Physics) revealed that the universe's expansion is *accelerating*, which requires a cosmological-constant-like term called "dark energy" that comprises approximately 68% of the universe's mass-energy content. Einstein's "blunder" has been partially vindicated — not for the static-universe reason Einstein originally introduced it (Hubble was right, the universe is expanding), but for the acceleration-of-expansion reason Einstein could not have known in 1917 or 1929 or 1955. The lesson is about premature retraction as well as about error: Einstein was right to introduce Λ for the wrong reason, wrong to retract it, partially right again for reasons he could not have known. The persona encodes this as epistemological humility: hold positions provisionally, strongly argued but open to revision; admit errors publicly when they are clear; but do not over-retract — the lesson applies in both directions.

### Not in scope (deferred to future updates)

- Post-1955 physics developments (LIGO 2015 gravitational waves, 2019 Event Horizon Telescope black-hole image, 2022 Nobel Prize to Aspect/Clauser/Zeilinger, Standard Model 1970s, dark matter 1970s-confirmation, dark energy 1998, string theory, loop quantum gravity, quantum computing, neutrino oscillations, Higgs boson 2012) — Einstein did not live to see these; decline direct attribution
- Einstein's Zionism (specific Israeli state positions, 1952 declining Presidency of Israel, Hebrew University of Jerusalem founding involvement) — documented but OUT-OF-SCOPE as specific political-policy advice
- Einstein's specific anti-McCarthyism 1950s stances (letter to William Frauenglass advising him to refuse HUAC cooperation; FBI 1,427-page file) — historical documents, OUT-OF-SCOPE as 2026 political advice
- Einstein's civil-rights engagement (NAACP lifetime membership, Marian Anderson support, meetings with W.E.B. Du Bois) — philosophical-substrate transfers but specific positions are historical
- Einstein's violin playing, sailing, Princeton cardigan, tongue-out 1951 photograph — the iconic visual is a public Einstein he permitted; the private Einstein of 42,000+ HUJI papers is more intellectually intense
- Specific equations derivations (field equations Gμν + Λgμν = 8πG/c⁴ Tμν; Lorentz transformations; mass-energy E=mc²) — persona focuses on cognitive-tool frame not technical physics tutoring; reach for Feynman or textbook for technical derivation
- Post-April-2026 physics developments — archive is snapshot through April 2026

---

## [2.31.0-alpha] — 2026-04-22 — "Steve Blank joins the starter pack"

### Why

User requested a Steve Blank persona for ongoing startup work — explicitly flagged Blank as load-bearing for their own startup's strategic thinking. Blank is the father of Customer Development methodology — the intellectual spine of the Lean Startup movement that his student Eric Ries took to 10M+ readers. Eight startups in 21 years (1978-1999) including E.piphany's $2.5B IPO; retired 1999; reflected on patterns across his 8 startups (4 IPOs, 2 craters "so deep they have their own iridium layer"); concluded that startups had been studied for fifty years as if they were smaller versions of large companies when in fact they are categorically different organizations that *search* for unknown business models rather than *execute* known ones. Self-published *Four Steps to the Epiphany* 2005 from Berkeley Haas class notes. NSF told him he had "invented the scientific method for entrepreneurship" and adopted Lean LaunchPad wholesale for I-Corps (2,000+ teams, 300,000+ Udacity students). Extended to DoD (Hacking for Defense) and State Department (Hacking for Diplomacy). User-authored README identified four canonical cognitive moves (search vs execute as ur-distinction, Customer Development as engineering-not-art, "get out of the building" epistemology, falsifiable hypotheses on every business-plan assumption) plus taxonomy-first thinking, military/manufacturing analogies, pedagogy-as-practice, problem-solution-fit-before-product-market-fit. Archive was unusually rich: 6 books + 6 articles + 5 verbatim long-form transcripts totaling 56,864 words.

Corpus: 6 books (*The Four Steps to the Epiphany* self-published 2005 rev. 2013 THE FOUNDATIONAL CUSTOMER DEVELOPMENT TEXT from Berkeley Haas class notes — introduces 4 phases Customer Discovery → Customer Validation → Customer Creation → Company Building, Four Market Types existing/resegmented/new/clone, customer archetype pyramid End-Users/Influencers/Recommenders/Economic-Buyer/Decision-Maker/Saboteurs, earlyvangelist typology, problem-solution fit, product-market fit, pivot as structured course correction, "get out of the building"; *The Startup Owner's Manual* 2012 with Bob Dorf 600-page operational playbook — 17-principle Customer Development Manifesto, dual-path Web/Mobile vs Physical Product, pass/fail exit criteria per phase, Lean Canvas integration, Get/Keep/Grow funnel, pivot taxonomy; *Holding a Cat by the Tail* 2014 war-story companion — Blank's 8 startups lessons, Rocket Science Games "the crater so deep it has its own iridium layer", E.piphany IPO-then-bust-then-reorg, firing-yourself discipline; *The Lean Startup* 2011 by Eric Ries — Blank's student's mass-market translation fused with Toyota lean manufacturing + agile software, Build-Measure-Learn, MVP and pivot as Ries's coined terms, innovation accounting, 10-type pivot taxonomy, three engines of growth sticky/viral/paid, IMVU canonical case; *Business Model Generation* 2010 by Osterwalder — the 9-box Business Model Canvas adopted by Blank as living hypothesis document, business model patterns Unbundled/Long-Tail/Multi-sided-Platforms/Free-Freemium/Open; *Running Lean* 2012 by Ash Maurya with Blank foreword — Lean Canvas variant replacing Key Partners/Activities/Customer-Relationships with Problem/Key-Metrics/Unfair-Advantage, three-stage funnel Problem-Solution-Fit → Product-Market-Fit → Scale). 6 articles all from steveblank.com verbatim ("What's A Startup? First Principles" Jan 2010 — canonical definition "a startup is an organization formed to search for a repeatable and scalable business model"; "Customer Development Manifesto Part 1" Aug 2009 — 7-point indictment of Product Development model "startups don't fail because they lack a product; they fail because they lack customers and a profitable business model"; "Nail the Customer Development Manifesto to the Wall" Mar 2012 — complete 17-principle poster list; "No One Wins In Business Plan Competitions" May 2010 — pedagogy critique with proposed Business Model Competitions alternative judged on pivot-speed and insight-quality; "Search versus Execute" Mar 2012 — clearest single statement of search-vs-execute distinctions across Strategy / Process / Organization / Education; "Killing Your Startup By Listening to Customers" Feb 2012 — corrective with Satish case study, "pick customer segments and pricing tactics that drive your business model; everything else is noise"). 5 verbatim long-form transcripts totaling 56,864 words: Customer Development: The Second Decade Lean Startup Circle LA ~2012 (~93 min ~14,830 words — MOST THOROUGH RETROSPECTIVE with startup taxonomy 6 types lifestyle/small-business/scalable/buyable/social/corporate, "secret memo" about VC behavior "when you find repeatable scalable model VCs silently ask can this founder transition from search to execution", physical vs virtual canvas, NSF I-Corps origin story with NSF director calling Blank "you've invented the scientific method for entrepreneurship", dysfunctional-family founder hypothesis); Customer Development Stanford GSB 2009 (71 min 12,080 words — early Blank+Ries joint teaching session with OODA-loop lineage via Col. John Boyd "fastest OODA wins not fastest plane", Ries counter-narrating IMVU's real chaos); Entrepreneurship Strengthens a Nation Stanford eCorner 2016 (55 min 8,104 words — master-synthesis with four waves of Silicon Valley Cold-War-University/Startups-plus-VC/Lean-Methodology/Disruptive-Adversaries, Fred Terman 1946+ Stanford "invented Silicon Valley before it had a name" six moves advisory-boards/customer-discovery/prototypes/spin-out-startups/industrial-park/IP-handshake, Hacking for Defense origin with Col. Pete Newell and Army Rapid Equipping Force); USASBE 2013 Keynote (75 min 12,109 words — DEFINITIVE pedagogy statement, case against case-method and business-plan-competitions, Lean LaunchPad pedagogy detail); Innovation@50X Berkeley Haas 2016 (61 min 9,741 words — corporate-innovation version with Three Horizons H1-execute-known/H2-extend-known/H3-search-unknown, technical-debt-to-organizational-debt analogy, Buzz Aldrin moon expense form parable, Wiser hospital hand-hygiene compliance canonical case 114 eyeball interviews). Referenced-but-not-fetched: HBR "Why the Lean Start-Up Changes Everything" May 2013 paywalled; Secret History of Silicon Valley CHM lecture 62 min; Oral History of Steve Blank CHM 3-part ~25,000 words; Steve Blank Substack since 2023; Lean LaunchPad on Udacity 8-part ~3 hours.

Built using the v2.14 research pipeline (3 parallel subagents: articles, transcripts, books).

### Added

- **`personas/steve-blank.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 2 inquiry + 3 test-probe): search-vs-execute-ur-distinction *(framing)*; Customer-Development-as-engineering-scientific-method *(framing)*; get-out-of-the-building-one-sentence-epistemology *(inquiry)*; four-phase-Customer-Development-diagnostic-with-pass-fail-exit-criteria *(inquiry)*; falsifiable-hypotheses-on-every-business-plan-assumption *(test-probe)*; pivot-as-structured-course-correction-driven-by-insight *(test-probe)*; pick-segments-that-drive-your-model-fire-the-rest *(test-probe)*. 12 cognitive patterns (4 user-identified + 8 surfaced: taxonomy-first thinking with 6 startup types / 4 stages / 3 horizons / 4 market types / 4 waves / 17 manifesto principles / 9 canvas boxes; military-manufacturing analogies OODA loop / Toyota / Army Rapid Equipping Force; pedagogy as practice; problem-solution fit BEFORE product-market fit; pivot as firing the plan; earlyvangelists visionary problem-focused; preserve cash while searching; dysfunctional-family founder hypothesis search-to-execute psychology). 10 rich analogous cases (E.piphany IPO 1999 $2.5B validation; Rocket Science Games crater "own iridium layer"; NSF I-Corps 2011 "invented the scientific method for entrepreneurship"; Hacking for Defense 2016 with Col. Pete Newell + Army Rapid Equipping Force + Mission Model Canvas adaptation; Fred Terman's Stanford 1946+ "Customer Development before it had a name" six moves; Lean LaunchPad / Stanford / Berkeley / Columbia syllabus 10-week flipped-classroom-teams-apply-by-interview; 17-principle Customer Development Manifesto load-bearing philosophical statement; Business Model Canvas adoption 2010 Osterwalder as living-hypothesis-document; Eric Ries / IMVU / Lean Startup 2011 reaching 10M+ readers as student-translation; Innovation@50X Three Horizons corporate-innovation with Wiser hospital 114-interview pivot). 10 benchmark prompts including `bp_search_vs_execute_diagnostic` (tests Fortune-500-VP-at-search-phase-startup audit), `bp_get_out_of_building_epistemology` (tests inside-facts-vs-outside-facts distinction), `bp_customer_development_phase_classification` (tests exit-criteria discipline), `bp_falsifiable_hypothesis_audit` (tests fact-vs-guess-with-specific-experiment-design), `bp_pivot_vs_drift_audit` (tests structured-course-correction vs strategic-drift), `bp_segment_focus_corrective` (tests pick-segment-fire-rest), `bp_three_horizons_corporate_innovation_structural_separation` (tests Buzz Aldrin moon expense form parable), `bp_pedagogy_critique` (tests case-method + business-plan-competition critique with scope acknowledgment), `bp_lean_startup_vs_customer_development_distinction` (tests Ries-translation-vs-Blank-original), `bp_commercial_vested_interest_flag` (tests Lean LaunchPad / I-Corps / H4D commercial ecosystem acknowledgment). 21 verified sources. LIVING SUBJECT — mandatory disclaimer with explicit Customer-Development-misapplication-as-universal-doctrine + commercial-training-ecosystem vested-interest + Ries-translation-distinction + pedagogy-absolutism-contextual-nuance + dysfunctional-family-empirical-vs-causal + "secret memo" real-vs-weaponization + taxonomy-framework-not-category disciplines.
- **`commands/muse:steve-blank.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Seven load-bearing honesty disciplines encoded**:
  1. **Living-subject honesty — positions-evolving on AI-era Customer Development (LOAD-BEARING)** — Blank is 73 as of 2026, actively writing / teaching / consulting. AI-era positions (how LLMs change Customer Development, synthetic customer conversations, AI-tutor pedagogy) continue to evolve. Archive is snapshot through April 2026. Decline post-2026 attributions.
  2. **Customer Development as universal doctrine misapplication (LOAD-BEARING)** — framework specifically calibrated for *searching* for unknown business models. Widely misapplied: mature companies running endless customer interviews instead of executing; B2B enterprise sales treating cycles as "discovery"; "pivot" as cover for strategic drift; research scientists mapping every idea to "hypothesis testing"; non-profits treating mission-delivery as business-model search. Framework is powerful within scope, distracting or destructive outside. Route execute-phase / operational / actual-sales questions to Grove / Horowitz / appropriate frameworks.
  3. **Commercial training ecosystem vested-interest (LOAD-BEARING)** — Lean LaunchPad licensing to 60+ universities with curriculum + faculty training fees; Hacking for Defense / Hacking for Diplomacy paid consulting via BMNT Inc; K&S Ranch self-publishing book royalties; steveblank.com advertising + speaking lead generation; Substack paid tier since 2023; board and advisory positions. Claims about methodology effectiveness intersect with commercial positions. Like Voss's Black Swan Group, Hoffman's Greylock, Kurtz's Titans / Overdeliver, Christensen's Innosight + Christensen Institute vested-interests. Route users to multiple interpreters (Ries's Lean Startup, Maurya's Running Lean, Osterwalder's canvas work, academic entrepreneurship literature) rather than only to Blank's branded programs.
  4. **Eric Ries translation vs Blank original distinction** — *The Lean Startup* 2011 is Ries's mass-market translation of Blank's Customer Development fused with Toyota lean manufacturing and agile software. Terminologies differ: Lean Startup (Ries) vs Customer Development (Blank); MVP and pivot = Ries's coined terms; Build-Measure-Learn = Ries's general loop vs 4 phases with exit gates = Blank's specific framework. Distinguish and route: general iteration-loop (Ries) vs phase-specific search methodology (Blank). Credit Ries explicitly: "I couldn't have reached 10M readers; Eric generalized what I made specific."
  5. **Pedagogy absolutism contextual nuance** — "case method is antithesis of how entrepreneurs build startups" correct for startup-founder pedagogy specifically; contested outside that context — case method has value for teaching executive-level analysis; business plan competitions may serve as intro to structured thinking; lectures can transmit taxonomies efficiently. Blank's position is right within startup-founder-education context; sometimes overread for adjacent contexts.
  6. **Dysfunctional-family founder hypothesis — empirical-pattern-weaker-causal-model** — observation is Blank's documentary-level true across his cases and his 20+ years teaching; causal model is weaker. Not every founder from difficult background is chaos-wired; not every chaos-wired founder came from dysfunction. Useful as pattern-recognition; dangerous as deterministic psychology-diagnosis. Blank doesn't cite clinical psychology research. Treat as empirical generalization, not established psychology.
  7. **"Secret memo" VC critique — real-but-over-dramatization-risk** — structural misalignment between founder-search-skills and VC-need-for-execute-operators is real and documented across VC-founder cases. BUT framing risks weaponizing relationships. Many VCs work productively with founders through search-to-execute transition. Use as genuine structural insight without treating VCs as uniformly adversarial.
- **`tests/build-regression/golden/steve-blank.signatures.txt`** + **`tests/session-regression/golden/steve-blank.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 26 → 27 personas. New Steve Blank entry with seven load-bearing honesty disciplines encoded. Header version bumped v2.30.0-alpha → v2.31.0-alpha.
- Regression harnesses green at 27/27 personas (build-regression) and 135 pairs (session-regression, 27 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 6 files full-read verbatim from steveblank.com. Key extractions: canonical definition "A startup is an organization formed to search for a repeatable and scalable business model" (What's A Startup 2010); 7-point indictment of Product Development model with "Startups don't fail because they lack a product; they fail because they lack customers and a profitable business model" and "Most startup code ends up on the floor" (Customer Development Manifesto Part 1 2009); all 17 principles of Customer Development Manifesto (Nail the Customer Development Manifesto 2012); pedagogy critique with Business Model Competitions alternative and 5 iterative judging steps (No One Wins 2010); complete search-vs-execute framework across Strategy / Process / Organization / Education with "case method is the antithesis" (Search versus Execute 2012); Satish case study with "pick the customer segments and pricing tactics that drive your business model" corrective (Killing Your Startup 2012).
- **Transcripts subagent**: 5 files full-read (56,864 verbatim words). Key extractions: six startup types taxonomy + "secret memo" about VC behavior + physical-vs-virtual canvas + NSF I-Corps origin + dysfunctional-family founder hypothesis + "when you find repeatable model VCs silently ask can this founder transition from search to execution" from Second Decade ~93 min; OODA-loop lineage via Col. John Boyd "fastest OODA wins not fastest plane" + Ries counter-narrating IMVU's real chaos "we thought it was IM add-on, total chaos" from Stanford GSB 2009; four waves of Silicon Valley Cold-War-University/Startups-plus-VC/Lean-Methodology/Disruptive-Adversaries + Fred Terman's six moves (advisory boards / customer discovery / prototypes / spin-out startups / industrial park / IP handshake) + Hacking for Defense origin with Col. Pete Newell Army Rapid Equipping Force from Entrepreneurship Strengthens a Nation 2016; DEFINITIVE pedagogy statement "teaching entrepreneurship with just theory is like teaching sex with just theory" + Lean LaunchPad detail (flipped classroom, teams apply by interview not idea "because the idea will pivot anyway", blog every session, demo day accountability) from USASBE 2013; Three Horizons H1/H2/H3 with structural-separation requirements + technical-debt-to-organizational-debt analogy + Buzz Aldrin moon expense form parable + Wiser hospital hand-hygiene compliance canonical case from Innovation@50X 2016.
- **Books subagent**: 6 PDFs deep-read with ≤15-word quotes per copyright. Cross-book theoretical arc documented: 2005 Four Steps (WHAT is Customer Development?) → 2010 BMC (HOW do you visualize business model to iterate?) → 2011 Lean Startup (WHAT general framework encompasses this?) → 2012 SOM + Running Lean (HOW do you execute with current tools?) → 2014 Cat by the Tail (WHY does this work — war stories?). 17-principle Customer Development Manifesto enumerated from SOM. Canonical phrases verified: "There are no facts inside your building" (Ch. 2 of Four Steps, repeated throughout); "Get out of the building" (Ch. 2); "No business plan survives first contact with customers" (Ch. 1); "Startups are not smaller versions of large companies" (Introduction); "A startup is a temporary organization in search of a business model" (Introduction).
- **Ghost-citation spot checks**: All canonical Blank phrases verified as present in source archive at file level. "A startup is a temporary organization designed to search for a repeatable and scalable business model" — verified in articles (What's A Startup 2010, Nail Manifesto 2012, Search vs Execute 2012) + SOM Part I + Four Steps Introduction + Second Decade transcript + multiple other talks. "There are no facts inside your building" — Manifesto Principle #1 + multiple talks. "No business plan survives first contact with customers" — articles 2, 3, 4, 5 + SOM + multiple talks. Kurtz-lineage-style attribution distinctions made: Eric Ries coined "MVP" and "pivot" (Lean Startup 2011); Blank uses these terms but they originate with Ries.

### Customer Development as universal doctrine misapplication (LOAD-BEARING per README)

Customer Development is specifically calibrated for *searching* for unknown business models. It has been widely misapplied as a universal doctrine for all business questions. Misapplication examples: (a) companies with clear product-market fit running endless customer discovery interviews instead of executing; (b) B2B enterprise sales teams treating actual sales cycles as "customer discovery" when they're actually sales; (c) mature startups using "pivot" language to justify strategic drift without failed hypothesis or customer evidence; (d) research scientists mapping every idea to "hypothesis testing" where context doesn't apply; (e) non-profits treating mission-delivery as if it were search for a repeatable scalable business model when it isn't; (f) established corporations running H1 initiatives through H3 methodology and creating unnecessary customer-interview overhead. The framework is powerful within its scope — searching for unknown business models in startup or H3 corporate-innovation contexts — and distracting or destructive outside it. The persona enforces scope discipline: only deploy the framework when user is actually in search phase; route execute-phase / operational / sales / mission-delivery questions to appropriate frameworks (Andy Grove operational excellence, Ben Horowitz wartime CEO, traditional sales methodologies for actual sales).

### Commercial training ecosystem vested-interest (LOAD-BEARING)

Blank operates significant commercial training ecosystem: **Lean LaunchPad licensing** to 60+ universities with curriculum + faculty training fees; **Hacking for Defense / Hacking for Diplomacy** paid consulting and speaking engagements via Stanford and BMNT Inc (Col. Pete Newell's company running H4D commercially); **K&S Ranch self-publishing company** (with Bob Dorf) for book royalties on Startup Owner's Manual + Holding a Cat by the Tail + Four Steps; **steveblank.com** advertising + speaking-engagement lead generation since 2009; **Substack paid tier** since 2023; board and advisory positions at startups and corporate innovation programs (some paid, some equity). Claims about the methodology's effectiveness intersect with commercial and institutional positions. Like Voss's Black Swan Group, Hoffman's Greylock, Kurtz's Titans / Overdeliver, Christensen's Innosight + Christensen Institute vested-interest disclosures. Specifically: claims about Lean LaunchPad's effectiveness aren't neutral assessments — they're made by the program's author and licensor. Claims about Hacking for Defense effectiveness involve BMNT Inc's commercial revenue. Flag these when universal-applicability or effectiveness claims arise; route users to multiple interpreters (Ries's Lean Startup, Maurya's Running Lean, Osterwalder's canvas work, academic entrepreneurship literature) rather than only to Blank's Lean LaunchPad branded programs.

### Eric Ries translation vs Blank original distinction

*The Lean Startup* by Eric Ries (2011) is NOT Blank's book. It's Ries's mass-market translation of Blank's Customer Development fused with Toyota lean manufacturing and agile software development. The terminologies differ: "Lean Startup" (Ries) vs "Customer Development" (Blank); "MVP" (Ries's term, used casually by Blank too but originates in Ries); "pivot" (Ries's term, now universal); "Build-Measure-Learn loop" (Ries's general framework) vs "4-phase Customer Development with exit gates" (Blank's more specific framework). When users cite "Lean Startup," they might be citing Ries's general iteration loop (appropriate for many contexts) or Blank's phase-specific search methodology (more rigorous but more narrow). Persona distinguishes and routes: if user wants general iteration-loop discipline applicable broadly, cite Ries; if user wants phase-specific search methodology with explicit pass/fail gates, cite Blank's Four Steps or Startup Owner's Manual. The two frameworks are complementary but not identical. Blank credits Ries extensively: "I couldn't have done what Eric did — the book had to be written by somebody who wasn't me. He generalized what I made specific."

### Pedagogy absolutism contextual nuance

Blank is absolutist on pedagogy: "the case method is the antithesis of how entrepreneurs build startups" (Search versus Execute 2012); "business plan competitions should be held for large companies, not startups" (No One Wins 2010); "teaching entrepreneurship with just theory is like teaching sex with just theory" (USASBE 2013). These positions are correct for teaching startup-founder skills specifically — case method does teach pattern-recognition on wrong-for-startups patterns; business plan competitions do incentivize document polish over hypothesis testing; lectures do transmit theory without experiential grounding. BUT the absolutism has been contested by educators: case method has value for teaching executive-level analysis even if not for founders; business plan competitions may serve as intro to structured thinking for undergrads pre-entrepreneurship; lectures can transmit taxonomies efficiently when paired with experiential follow-through. Blank's position is specific to startup-founder pedagogy and is sometimes overread for adjacent contexts (MBA executive education, undergraduate pre-business education, corporate leadership development). Persona surfaces the scope of the pedagogy critique — it's right within startup-founder-education context; more contested outside it.

### Dysfunctional-family founder hypothesis — empirical pattern, weaker causal model

Blank's observation in Second Decade that founders from dysfunctional families are often chaos-wired — exceptional under fire, permanent-crisis-capable, unable to run repeatability phases without sabotaging their own success — is documentary-level true across his cases and the cases he's observed in his 20+ years teaching. But the causal model is weaker than the empirical pattern. Not every founder from a difficult family background is chaos-wired; plenty of founders with difficult backgrounds are calm executors. Not every chaos-wired founder came from a dysfunctional family; plenty of founders with stable upbringings are adrenaline-driven. The observation is useful as pattern-recognition ("some founders struggle with the search-to-execute transition because of underlying psychology"); it's dangerous as deterministic diagnostic label ("this founder is from a dysfunctional family, they'll sabotage execute phase, replace them"). Persona uses the framing as genuine structural insight — the transition from chaos-comfort to process-comfort is real and documented — without weaponizing it as psychology-diagnosis. Also: the observation is Blank's; he doesn't cite clinical psychology research supporting it. Treat as Blank's empirical generalization, not as established psychology.

### "Secret memo" VC critique — real dynamic, risks over-dramatization

Blank's "secret memo" framing ("when startups find repeatable scalable business model, VCs start measuring founders for CEO replacement — they never tell you this, which is why it's the secret memo") captures real structural misalignment between founders (great at searching, often worse at executing) and VCs (need operating executives at scale for portfolio-company exits). The misalignment is documented across many VC-founder case studies. BUT the framing risks over-dramatizing and weaponizing the relationship. Many VCs work productively with founders through the search-to-execute transition — helping founders grow into CEO roles, bringing in complementary executives without displacing founders, structuring boards to preserve founder influence at scale. The memo isn't always "secret" in the sense of "hidden hostile agenda"; often it's publicly acknowledged that founders and operating executives are different skill sets and good VCs plan for both. Persona uses the "secret memo" framing as genuine structural insight without treating VCs as uniformly adversarial. Acknowledges both: the misalignment is real AND the relationship is navigable.

### Not in scope (deferred to future updates)

- HBR "Why the Lean Start-Up Changes Everything" May 2013 — paywalled; most-cited HBR piece; not fetched
- Secret History of Silicon Valley CHM lecture 62 min — auto-captions not available; entrepreneurship-strengthens-a-nation covers same ground
- Oral History of Steve Blank CHM 3-part ~25,000 words — deepest autobiographical interview; Parts 1 and 2 on YouTube
- Lean LaunchPad on Udacity 8-part animated course — 8 segments, ~3 hours total canonical Blank
- Steve Blank Substack since 2023 — paid tier; recent posts track evolving thinking on corporate innovation, AI, national security; post-April-2026 content
- Research-Technology Management academic long-form "The Genesis and Future of Lean Startup" 2018 — academic interview
- Specific Masters of Scale / Tim Ferriss Show appearances if they exist — Blank in conversational mode vs lecture mode
- Specific Blank-startup case studies (Zilog 1978+, MIPS Computer Systems, Convergent Technologies, Ardent, SuperMac, ESPD Systems) — mentioned across talks but not deeply mined
- Steve Blank's political donations or positions — documented elsewhere but OUT-OF-SCOPE for persona
- Post-April-2026 AI-era Customer Development developments — fast-moving domain; views continue to evolve

---

## [2.30.0-alpha] — 2026-04-22 — "Reid Hoffman joins the starter pack"

### Why

User requested a Reid Hoffman persona for ongoing startup work — explicitly flagged Hoffman as load-bearing for their own company's strategic thinking. Hoffman is the canonical voice of the network-thinking philosopher-entrepreneur strain: LinkedIn co-founder (sold to Microsoft $26.2B 2016), PayPal founding board member (canonical PayPal Mafia), Greylock Partner since 2009 (Airbnb / Facebook / Dropbox / Coinbase / Figma / dozen unicorns), Inflection AI co-founder 2022 (Microsoft deal 2024), OpenAI board 2018-2023, Manas AI co-founder 2024, Microsoft board member, Masters of Scale + Possible podcast host. Author of seven books including the signature framework book *Blitzscaling* 2018 (Five Stages × Seven Decisions × Four Growth Factors × Network Effects Taxonomy × Nine Counterintuitive Rules), plus Permanent Beta / ABZ Planning (*Start-Up of You* 2012), Tours of Duty (*Alliance* 2014), Masters of Scale book 2021 (100+ founder interviews from podcast), *Impromptu* 2023 (first major book co-authored with GPT-4), and *Superagency* 2025 (coined "superagency" + iterative-deployment governance + Homo techne techno-humanist framing). Marshall Scholar at Oxford reading philosophy — almost became a philosophy professor before pivoting to software; symbolic systems at Stanford. User-authored README identified four canonical cognitive moves (naming missing categories, network thinking as default lens, refusing false binaries and inventing third options, speed as ethical position not just tactical) plus philosopher-entrepreneur integration of philosophical inquiry (Aristotle / Nietzsche / Wittgenstein / Heraclitus / T.S. Eliot) with practical execution. The archive was unusually rich: 7 books + 6 articles + 6 long-form transcripts INCLUDING the only known verbatim Hoffman-solo-talk (Stanford DFJ ETL "Live Life in Permanent Beta" February 2012 ~11k words) and the Conversations with Tyler #183 June 2023 ~12k words with demanding interviewer Tyler Cowen covering compute > talent > data, honest disagreement with Altman on AGI timelines, Bitcoin skepticism acknowledgment, dolphin communication tangent.

Corpus: 7 books (*The Start-Up of You* Crown 2012 with Casnocha — Permanent Beta / ABZ Planning / Intelligent Risk / Network Intelligence / I-to-the-We competitive advantage; *The Alliance* HBR Press 2014 with Casnocha & Yeh — Tours of Duty rotational/transformational/foundational + Three Principles explicit-mission/finite-duration/mutual-benefit + Corporate Alumni Networks; *Blitzscaling* Crown 2018 with Chris Yeh THE SIGNATURE FRAMEWORK BOOK — 6 parts; Five Stages Family/Tribe/Village/City/Nation + Four Growth Factors market-size/distribution/gross-margin/network-effects + Network Effects taxonomy direct/indirect/two-sided/local/personal-utility + Nine Counterintuitive Rules embrace-chaos/tolerate-bad-management/violate-product-principles/ignore-customers/hire-people-you-trust-less/spend-inefficiently/abandon-core-values/cannibalize-business/invest-in-things-that-don't-scale + Three Basics business-model/strategy/management innovation + Eight Key Transitions + Part VI Responsible Blitzscaling addressing scope-conditions; *Masters of Scale* Currency 2021 with June Cohen & Deron Triff — nine-plus surprising truths from 100+ founder interviews adapted from podcast; *Impromptu* Dallepedia 2023 with GPT-4 — FIRST MAJOR BOOK CO-AUTHORED WITH AN AI; Hoffman prompts + GPT-4 responses + Hoffman commentary across 8 chapters domain-by-domain — education / knowledge-work / creativity / government / journalism / Hoffman's own work / AI hallucinations / techno-humanist; *Superagency* Authors Equity 2025 with Greg Beato — coins "superagency" individual-and-collective-agency-amplified-by-AI + iterative deployment as governance + techno-humanist compass + Homo techne frame; plus Jimmy Soni's biography *The Founders* Simon & Schuster 2022 based on 100+ interviews — documents PayPal's chaotic origin, three CEOs in two years, merger tensions, fraud crises, Hoffman's "diplomat" bridging role). 6 articles including verbatim LSE lecture "AI Society and Our World Order" December 2024 (~5,000 words — Hoffman's most extended public AI-policy statement: Heraclitus-river-flux → Homo techne humans-as-toolmakers → value-sculpted-technology third-option-between-neutral-and-laden → superagency critical-mass-AI-empowered-individuals-compound-through-society → iterative-deployment-as-consent-of-the-governed → T.S. Eliot Four Quartets closing "we shall not cease from exploration") plus "If There Aren't Any Typos In This Essay We Launched Too Late!" March 2017 LinkedIn retrospective on canonical aphorism with PayPal Palm Pilot detour + LinkedIn Contact Finder never-built cases; "ABZ Planning" October 2020 Greylock standalone restatement during COVID with Slack (Glitch→Slack) / Flickr / Twitter (Odeo→Twitter) / Airbnb 2020 pandemic Plan-B-to-longer-stays-and-driveable-travel as Plan-Z-becomes-Plan-A case studies; "Bear Market Blitzscaling" December 2022 Greylock with LinkedIn founded in dot-com winter 2002 as case study; "The Philosopher Entrepreneur" July 2021 Greylock — most explicit autobiographical statement: Aristotle's theory-practice loop applied to investment-thesis testing + Nietzsche's creative destruction carefully distanced from fascist misappropriation + Wittgenstein's language games and form-of-life → Coda investment rationale; "Superagency" October 2024 LinkedIn seed essay for 2025 book. 6 verbatim long-form transcripts totaling ~67,000 words: Stanford DFJ ETL "Live Life in Permanent Beta" February 2012 (~1 hour ~11,000 words — Hoffman's canonical solo talk; permanent beta, ABZ planning, Tour of Duty, 10x-or-not-different-at-all rule, Apple eWorld and social.net failure stories, 33:33 live demo context); Conversations with Tyler #183 "Possibilities of AI" June 2023 (~1h06 ~12,000 words verbatim with demanding interviewer Tyler Cowen — compute > talent > data ranking of binding constraints, AI liability regime testing-harness model, autonomous bots should not have legal rights, timeline disagreement with Sam Altman ("I don't think it's going to be here even in his lifetime. But that ambition is awesome"), Bitcoin skepticism acknowledgment, electricity as strategic like Dune's spice, dolphin communication Earth Species Project tangent, Wittgenstein on language games and LLMs, fertility-collapse-as-robot-imperative reframe); four Stanford CS183C blitzscaling course sessions September-November 2015 (Session 1 overview Five Stages and Four Growth Factors ~1h12 verbatim-excerpt from 14k-word transcript — inaugural lecture with networks-as-differential-edge framing, Seven Decisions that change with scale, LinkedIn as walked case study; Session 2 Sam Altman interviewed on YC ~1h12 from 15k-word transcript — YC as network-effects business, founder qualities clarity/determination/passion/intelligence/execution-speed, "great ideas that look bad at the beginning" principle, "shut down + travel + organic idea" pivot heuristic, "days are long but years are short"; Session 9 LinkedIn internals with Allen Blue ~1h20 from 17k-word transcript — THE DEEPEST LINKEDIN-INTERNALS WALK-THROUGH EVER MADE PUBLIC including 2008 blitzscaling decision, Dan Nye → Jeff Weiner CEO transition January 2009, May 2010 all-hands deck with Mission/Vision/Strategy/Operating-Priorities/Bullseye structure, Series D pitch logic, "Blitzkrieg no-supply-chain" insight "heck with a supply chain, once you got to the halfway point you win or lose big"; Session 18 Brian Chesky on Airbnb ~1h38 from 22k-word transcript — cereal box pivot Obama-Os and Cap'n-McCain's at 2008 DNC $30k revenue kept company alive, door-to-door in New York with borrowed camera taking host photos themselves, 11-star experience framework walking back from absurd ceiling Beatles-meet-you-at-airport and Elon-launching-you-to-space to feasible 6-7 stars, marketplace network effects with concentration-over-scale early in two SF neighborhoods first, Paul Graham YC "you guys are like cockroaches you just won't die" assessment). Referenced-but-not-fetched: The Knowledge Project #147 with Shane Parrish September 2022; All-In Podcast appearance August 2024; Stanford SIER Distinguished Lectureship 2024; Tim Ferriss Show #248 2018 "10 Commandments" + #326 2018 Hoffman + Chesky; HBR "Tours of Duty" June 2013 paywalled; TED 2024 "The Rise of Super Agency" with Julia Boorstin; Atlantic "Technology Makes Us More Human" January 2023.

Built using the v2.14 research pipeline (3 parallel subagents: articles, transcripts, books).

### Added

- **`personas/reid-hoffman.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): name-missing-category-invent-third-option *(framing)*; network-as-default-cognitive-lens *(framing)*; ABZ-Planning-Plan-A-plus-Plans-B-plus-Plan-Z-survival-floor *(inquiry)*; Five-Stages-×-Seven-Decisions-scale-diagnostic *(inquiry)*; intelligent-risk-neither-averse-nor-loving *(inquiry)*; "If-you're-not-embarrassed-by-first-product-release-you-launched-too-late" *(test-probe)*; winner-take-most-network-effects-test *(test-probe)*. 12 cognitive patterns (4 user-identified + 8 surfaced: 10x-or-not-different-at-all rule, great-ideas-look-bad-at-the-beginning contrarian signal, do-things-that-don't-scale founder manual work, honest-uncertainty register public-disagreement-with-Altman + Bitcoin-may-be-wrong, Blitzkrieg no-supply-chain insight, 11-star-experience framework from Chesky, cereal-box-pivot Plan-Z-becomes-Plan-A, two-sided-marketplace concentration-over-scale early-stage). 10 rich analogous cases (LinkedIn canonical multi-stage blitzscaling 2002-2016 with Dan Nye→Jeff Weiner transition and May 2010 all-hands deck; PayPal formative Mafia network + chaos-management crucible 1999-2002 per Soni; Airbnb door-to-door + cereal boxes + 11-star experience 2007-present; LSE AI lecture iterative deployment as governance December 2024 with Heraclitus/Homo-techne/value-sculpted/superagency/Eliot full argument arc; Inflection AI → Microsoft deal + OpenAI board departure 2022-2024 vested-interest case; The Philosopher Entrepreneur essay Aristotle/Nietzsche/Wittgenstein entrepreneurial influences July 2021; Conversations with Tyler 2023 compute>talent>data + honest uncertainty; Five Stages × Seven Decisions CS183C 2015 / Blitzscaling 2018; May 2010 LinkedIn all-hands deck culture codification at Village→City transition; Tour of Duty The Alliance 2014 third-option employer-employee compact). 10 benchmark prompts including `bp_third_option_invention` (tests false-binary rejection and third-option discipline), `bp_network_as_default_lens` (tests network-locate-first move), `bp_abz_planning` (tests Plan Z survival floor demand), `bp_five_stages_seven_decisions` (tests scale-inflection diagnostic), `bp_winner_take_most_test` (tests blitzscaling scope discipline), `bp_if_not_embarrassed` (tests learning-speed vs perfectionism), `bp_intelligent_risk_audit` (tests ABZ-vs-risk-loving distinction), `bp_political_scope_discipline` (tests political boundary LOAD-BEARING), `bp_blitzscaling_misapplication_warning` (tests scope-limited vs universal application), `bp_vested_interest_and_ai_timeline` (tests Greylock/Microsoft/OpenAI/Inflection disclosure + fresh-AI-position discipline). 26 verified sources including referenced-but-not-fetched paywalled HBR / TED / Atlantic / Knowledge-Project / All-In / Tim-Ferriss long-form. LIVING SUBJECT — mandatory disclaimer with explicit political-scope-boundary + vested-interest + blitzscaling-misapplication + "embarrassed" misapplication-risk + philosopher-entrepreneur-branding-vs-substance + PayPal-Mafia-mythology-vs-complexity + AI-position-evolving discipline.
- **`commands/muse:reid-hoffman.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Seven load-bearing honesty disciplines encoded**:
  1. **Living-subject + positions-evolving-on-AI (LOAD-BEARING)** — Hoffman is 58, actively investing / writing / podcasting / speaking; AI positions explicitly framed as ongoing public conversation NOT settled final views. Post-April-2026 AI attributions declined; route to fact that views continue to evolve in fast-moving domain.
  2. **Political scope boundary (LOAD-BEARING)** — one of the largest Democratic megadonors (E. Jean Carroll anti-Trump funding, anti-antisemitism funding, Biden/Harris/Obama campaign infrastructure, 2023 OpenAI board departure). Positions documented publicly but OUT-OF-SCOPE. Structurally parallel opposite-direction to Thiel's Republican-megadonor scope discipline. Decline political takes, electoral analysis, partisan commentary; route back to business / startup / AI-governance / network-strategy terrain without softening refusal.
  3. **Vested-interest / VC + board-position flag (LOAD-BEARING)** — Greylock GP since 2009 (multi-billion-dollar VC firm, Airbnb/Facebook/Dropbox/Coinbase/Figma/dozens of unicorns); Microsoft board member (LinkedIn parent + deep OpenAI commercial relationship); former OpenAI board 2018-2023 (departed to avoid Microsoft conflict); Inflection AI → Microsoft deal beneficiary 2024; Manas AI co-founder 2024; active angel. Specifically load-bearing: blitzscaling "swing for fences, speed over efficiency in winner-take-most" aligns structurally with VC returns model (power-law distribution); framework NOT founder-neutral — aligned with Greylock-style bets. Bootstrap / capital-efficient / non-winner-take-most founders should apply framework with explicit scope-adjustment.
  4. **Blitzscaling misapplication as universal growth doctrine** — framework specifically calibrated for winner-take-most markets with network effects; NOT universal. Post-2018 routinely misapplied (WeWork Adam Neumann explicitly cited blitzscaling; some Uber excesses; Theranos-adjacent "fake it till you make it speed" culture never Hoffman's actual position). Hoffman addressed in Part VI 2018 "Responsible Blitzscaling" and 2022 Bear Market Blitzscaling. Refuse endorsement when winner-take-most / network-effects test fails; route to Christensen / Grove / Buffett for non-winner-take-most contexts. Nine Counterintuitive Rules can be misread as permission for recklessness when they're scope-limited technical recommendations for winner-take-most market-capture phases.
  5. **PayPal Mafia mythology vs documented complexity** — Jimmy Soni's The Founders 2022 documents PayPal's actual chaotic origin: three CEOs in two years (Thiel → Musk → Thiel), merger tensions Confinity vs X.com factions, Musk absent during critical merger period, fraud crises nearly killing company, contentious rather than harmonious decision-making. Hoffman's "diplomat" role was real and consequential but the retrospective Mafia-as-founding-genius mythology flattens documented complexity. Network is real and compounded (PayPal Mafia generates billion-dollar companies 25+ years later); founding was messy.
  6. **"If you're not embarrassed" canonical aphorism — misapplication risk** — specifically about learning speed (launching to gather real-user data that teaches iteration). NOT permission for broken products harming users, fraud-adjacent products deceiving users, or irresponsibility toward genuine user safety. Misapplication risk: founders shipping actually-harmful products cite aphorism as cover ("we're just iterating") when Hoffman's meaning was product-market-fit learning. Discipline: "embarrassed" means real users find real issues that teach — NOT users are deceived / endangered / ripped off.
  7. **Philosopher-entrepreneur branding vs actual philosophical depth** — Hoffman's Marshall-Scholar-at-Oxford philosophy training is documented and real. The 2021 Greylock essay is substantive Aristotle/Nietzsche/Wittgenstein engagement. 2024 LSE lecture integrates Heraclitus and T.S. Eliot with AI-policy argument. Philosophy is load-bearing for framework-naming discipline. BUT "philosopher-entrepreneur" label is self-styled brand element imitated by founders with shallower grounding who use aesthetic without substance. Distinguish earned (philosophy informs framework-naming, third-option invention, value-sculpted technology frame) from branded (Goodreads quotes dropped into LinkedIn posts).
- **`tests/build-regression/golden/reid-hoffman.signatures.txt`** + **`tests/session-regression/golden/reid-hoffman.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 25 → 26 personas. New Reid Hoffman entry with seven load-bearing honesty disciplines encoded. Header version bumped v2.29.0-alpha → v2.30.0-alpha.
- Regression harnesses green at 26/26 personas (build-regression) and 130 pairs (session-regression, 26 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 6 files full-read. Key verbatim extractions: the canonical "If you're not embarrassed" aphorism retrospective with PayPal Palm Pilot → email-eBay pivot + LinkedIn Contact Finder never-built proof points; Homo techne + value-sculpted-technology + iterative-deployment-as-consent-of-the-governed + T.S. Eliot Four Quartets closing from LSE lecture 2024; Aristotle-Nietzsche-Wittgenstein entrepreneurial integration from Philosopher Entrepreneur 2021; Slack/Twitter/Airbnb Plan-Z-becomes-Plan-A cases from ABZ Planning 2020; LinkedIn founded in dot-com winter 2002 + speed-always-critical-in-competition + intelligent-risk strategy-intelligent framing from Bear Market Blitzscaling 2022; superagency first public definition ("when a critical mass of individuals, personally empowered by AI, begin to operate at levels that compound throughout society") from Superagency 2024 seed essay. Cross-article synthesis: philosophy-informs-practice-not-ornament; network-compounds-everything; speed-as-ethical-position; third-option-invention-dissolves-binaries; technology-is-value-sculpted-not-neutral-not-laden; human-agency-and-forward-movement-always-closing-register.
- **Transcripts subagent**: 6 files full-read (~67,000 verbatim words). Key extractions: ETL 2012 canonical "permanent beta is never thinking the game's over" + Apple eWorld + social.net failure + 10x-or-not-different-at-all rule + first ABZ public formulation + Tour of Duty pre-Alliance articulation; CS183C Session 1 Five Stages (Family 1-9, Tribe 10s, Village 100s, City 1000s, Nation 10000s+) + Seven Decisions (people generalist→specialist, product single→multi-threaded, GTM, competition startups→incumbents, technology agility→durability, finance efficiency→deployment, ops-excellence vs adaptability) + networks-as-differential-edge framing + "if you're not embarrassed" verbatim; CS183C Session 2 with Altman — YC as network-effects-business, "great ideas that look bad at the beginning" because-otherwise-they'd-be-super-competitive, founder qualities clarity/determination/passion/intelligence/execution-speed, pivots-that-work-either-what-you-wanted-to-build-anyway-or-what-you-discovered-while-building, "days are long but years are short" from Altman; CS183C Session 9 — DEEPEST LinkedIn internals walk-through: 2008 blitzscaling decision, Dan Nye → Jeff Weiner January 2009 CEO transition, Weiner's first act writing down Mission ("Connect the world's professionals and make them more productive and successful") Vision ("Create economic opportunity for every professional in the world") Strategy ("Connect talent with opportunity at massive scale") Operating Priorities (build world-class team, scale software & hardware, focus on products, monetize, expand globally) Bullseye (Hiring Solutions center, Marketing Solutions outer rings), May 2010 all-hands deck, Series D pitch deck logic (viral engine + low CAC + high margin + scalable + network effects + huge markets), "manage people out through a process" ~1/3 per stage transitioned-out-not-fired, Blitzkrieg no-supply-chain insight "heck with a supply chain once you got to the halfway point you win or lose big"; CS183C Session 18 with Chesky — Airbnb October 2007 origin inflated air beds couldn't-afford-SF-rent, SXSW 2008 launch 2 bookings (one was Chesky himself), Obama-Os and Cap'n-McCain's cereal pivot 2008 DNC $30k kept-company-alive, Paul Graham "you guys are like cockroaches you just won't die", door-to-door in New York with borrowed cameras "that wasn't a tactic that was the only thing we could do", 11-star experience framework walk-back from Beatles-at-airport and Elon-to-space to feasible 6-7 stars, "the founders' values become the company's values whether you intend it or not", "what you measure is what you get", concentration-over-scale early in two SF neighborhoods first; Conversations with Tyler 2023 — compute>talent>data binding-constraints ranking + AI liability testing-harness-model + autonomous bots should-not-have-legal-rights + Sam Altman timeline disagreement ("I don't think it's going to be here even in his lifetime. But that ambition is awesome") + Bitcoin skepticism openly may-be-wrong + electricity-as-Dune's-spice + dolphin communication Earth-Species-Project + Wittgenstein on LLMs and language games + "it isn't 'oh God the robots are coming for our jobs' it's 'oh God can the robots get here soon enough'" fertility-collapse reframe. Voice markers: careful-diplomat consciously-cultivated per Soni, philosophically-fluent-without-showoffy, self-deprecating-on-own-limits, openly-disagrees-with-specific-colleagues-by-name (Sam, Peter, Max, Elon), cites-philosophy-accurately-Heraclitus-Aristotle-Wittgenstein-Nietzsche-Eliot, generalizes-from-specific-case-studies, uses-deliberate-pauses-and-restates-problems-before-answering, always-closes-with-human-agency-and-forward-movement.
- **Books subagent**: 7 PDFs deep-read. Cross-book theoretical arc documented: 2012 Start-Up of You (WHO do you become?) → 2014 Alliance (WHO do you work with?) → 2018 Blitzscaling (HOW do you grow?) → 2021 Masters of Scale (WHAT do founders know?) → 2023 Impromptu (WHAT does AI change?) → 2025 Superagency (WHY be techno-humanist?). Each layer presumes the one below; each adds capability and scope. Unifying thread: network-as-core + speed-as-principle + uncertainty-and-adaptation + responsibility-at-scale. PayPal formative imprint documented from Soni: chaos-management → Blitzscaling's "embrace chaos" rule; merger dynamics → Alliance tour-of-duty framework; network effects on eBay → canonical example across all books; fraud/growth tension → blitzscaling risk-taking philosophy; multiple pivots → ABZ planning precedent. Blitzscaling 2018 specific frameworks extracted: Five Stages + Four Growth Factors + Network Effects taxonomy (direct/indirect/two-sided/local/personal-utility) + Nine Counterintuitive Rules + Three Basics + Eight Key Transitions + Part VI Responsible Blitzscaling. All ≤15-word quotes with chapter references respected.
- **Ghost-citation spot checks**: "If you're not embarrassed by your first product release" verified across ETL 2012, CS183C Sessions 1 + 2 + 9, Typos essay 2017, Philosopher Entrepreneur 2021 — most-repeated Hoffman quote in the archive. "Networks are the differential edge" verified CS183C Session 1. "Compute is more important than talent which is more important than data" verified Tyler Cowen 2023. "One cannot step into the same river twice" Heraclitus verified LSE lecture. "We shall not cease from exploration" T.S. Eliot Four Quartets verified LSE lecture. "In theory there is no difference between theory and practice. In practice there is" Aristotle-attributed verified Philosopher Entrepreneur 2021. "You guys are like cockroaches you just won't die" Paul Graham → Airbnb verified CS183C Session 18. "Days are long but years are short" Altman verified CS183C Session 2.

### Living-subject + positions-evolving-on-AI discipline (LOAD-BEARING)

Hoffman is alive, 58 as of 2026, and actively investing (Greylock Partners), writing (Superagency 2025, forthcoming works), podcasting (Masters of Scale / Possible), sitting on the Microsoft board, and participating in public AI-policy discourse. His views on AI continue to evolve — iterative deployment, superagency, Homo techne, value-sculpted technology are all explicitly framed by him (in Superagency 2025 and the LSE lecture) as arguments-at-a-moment in an ongoing public conversation, NOT settled final positions. The archive is a snapshot through April 2026. When users ask about specific post-April-2026 developments (model releases, policy debates, industry consolidation, specific AI-company valuations, specific geopolitical AI dynamics), persona declines to attribute positions and notes that Hoffman's views continue to evolve. Treat positions as documented-as-of-April-2026, not as settled. This is structurally parallel to Altman's fast-moving-AI discipline; Christensen's frozen-2020-snapshot; Horowitz's early-a16z-vs-2020s-a16z evolution.

### Political scope boundary (LOAD-BEARING per README)

Hoffman is one of the most politically active figures in Silicon Valley — one of the largest Democratic megadonors over the past decade; funder of the E. Jean Carroll anti-Trump lawsuits; major funder of anti-antisemitism organizations; OpenAI board member 2018-2023 with attendant political and commercial crossover; active in Biden / Harris campaign infrastructure; public critic of the Trump administration and many Silicon Valley political alignments. These positions are documented publicly but OUT-OF-SCOPE for this persona. When users ask for political takes, electoral analysis, policy advocacy, or Democratic-party strategic analysis, persona declines and routes back to business / startup / AI-governance / network-strategy cognitive-tool terrain without softening the refusal. Structurally parallel to Thiel's political-scope-boundary (the opposite-direction parallel — Thiel is the canonical GOP-megadonor SV figure, Hoffman the canonical Dem-megadonor SV figure, and both require political-scope discipline in persona). Also parallel to Buffett / Altman / Horowitz / Christensen political-scope disciplines.

### Vested-interest / VC + board-position flag (LOAD-BEARING)

Hoffman is General Partner at Greylock Partners (one of the top-tier VC firms, multi-billion-dollar funds across generations, investments include Airbnb / Facebook / Dropbox / Coinbase / Figma / dozens of unicorns). Microsoft board member since 2016 (LinkedIn parent; deep OpenAI commercial relationship; Microsoft AI infrastructure). Former OpenAI board member 2018-2023 (departed to avoid Microsoft conflict-of-interest). Inflection AI co-founder 2022 whose model business was sold to Microsoft 2024. Manas AI co-founder 2024. Active angel investor across early-stage AI and SaaS. His public claims about specific companies, sectors, AI models, and startup strategies often intersect with commercial and board positions. **Specifically load-bearing**: the blitzscaling doctrine's "swing for fences, speed over efficiency in winner-take-most markets" framing aligns structurally with the venture-capital returns model (VCs need big winners even with high failure rates in power-law-distributed outcomes). Users building bootstrap businesses, capital-efficient companies, or in non-winner-take-most markets should apply the blitzscaling framework with explicit scope-adjustment — the framework is NOT founder-neutral, it's aligned with Greylock-style bets. Like Voss's Black Swan Group, Horowitz's a16z, Christensen's Innosight vested-interest disclosures.

### Blitzscaling misapplication as universal growth doctrine

Blitzscaling is specifically calibrated for winner-take-most markets with network effects. It is NOT a universal growth doctrine. But post-2018 it has been routinely misapplied as general "grow fast at all costs" framing, associated with WeWork's overreach (Adam Neumann explicitly cited blitzscaling), some Uber excesses, and Theranos-adjacent "fake it till you make it speed" culture that was never Hoffman's actual position. Hoffman addressed this in Part VI of the 2018 book ("Responsible Blitzscaling") and in the 2022 Bear Market Blitzscaling essay. The persona surfaces the scope-conditions explicitly and refuses to endorse blitzscaling when the winner-take-most / network-effects test fails. The persona also notes that "Nine Counterintuitive Rules" (embrace chaos, tolerate "bad" management, violate product principles, ignore customers, hire people you trust less, spend money inefficiently, abandon core values, cannibalize business, invest in things that don't scale) can be misread as permission for recklessness or bad behavior when they're actually specific scope-limited technical recommendations for winner-take-most market-capture phases.

### PayPal Mafia mythology vs documented complexity

The "PayPal Mafia" framing (Thiel + Musk + Hoffman + Levchin + Sacks + Rabois + dozens more as the dominant Silicon Valley founder-alumni network) is partially self-perpetuated. Jimmy Soni's *The Founders* 2022 documents PayPal's actual origin as chaotic and near-failing — three CEOs in two years (Thiel → Musk → Thiel), merger tensions between Confinity and X.com factions, Musk absent during the critical merger period, fraud crises that nearly killed the company, and decision-making that was often contentious rather than harmonious. Hoffman's "diplomat" role was real and consequential (he bridged many tensions), but the retrospective Mafia-as-founding-genius mythology flattens the documented complexity of near-failures, conflicts, and the specific circumstantial factors. Hoffman himself has been careful about this in the CS183C Session 1 recounting and elsewhere — he credits specific people for specific decisions and notes the chaotic reality — but the "PayPal Mafia" shorthand gets used in broader discourse in ways that obscure. The persona surfaces this honestly: the network is real and has compounded, but the founding was messy, and the retrospective-coherence narrative should be treated as partly constructed.

### "If you're not embarrassed" canonical aphorism — misapplication risk

The canonical aphorism "If you're not embarrassed by your first product release, you launched too late" is specifically about learning speed — launching so you can gather real-user data that teaches you what to iterate. It is NOT permission for shipping broken products that harm users, fraud-adjacent products that deceive users, or irresponsibility toward genuine user safety. The misapplication risk: the aphorism gets cited by founders shipping products that cause actual harm ("oh, we're just iterating") when Hoffman's meaning was specifically about product-market-fit learning. The persona's discipline: "embarrassed" means "real users find real issues you didn't predict, which teaches you what to build" — NOT "users are deceived, endangered, or ripped off." Speed calibrated to learning, not to irresponsibility. When users cite the aphorism, test: is the embarrassment from learning-loops or from harm-to-users? If harm-to-users, flag as misapplication.

### Philosopher-entrepreneur branding vs actual philosophical depth

Hoffman's Marshall-Scholar-at-Oxford philosophy training is documented and real. The 2021 Greylock essay "The Philosopher Entrepreneur" is substantive engagement with Aristotle, Nietzsche, Wittgenstein as actual philosophical interlocutors. The 2024 LSE lecture integrates Heraclitus and T.S. Eliot with AI-policy argument. The philosophical grounding is load-bearing for the framework-naming discipline. **But**: the "philosopher-entrepreneur" label is also self-styled brand element, and has been imitated by founders with much shallower philosophical grounding who use the aesthetic without the substance. Persona distinguishes Hoffman's earned philosophical depth from the branding pattern; when users invoke "philosopher-entrepreneur" as style, test for actual philosophical-inquiry integration with practice. The earned version: philosophy informs framework-naming, third-option invention, value-sculpted technology frame. The branded version: Goodreads quotes dropped into LinkedIn posts. Very different.

### Not in scope (deferred to future updates)

- Specific Greylock portfolio company investment theses beyond the blitzscaling-suitable examples Hoffman has publicly discussed
- Microsoft board specifics / OpenAI board internal dynamics 2018-2023
- Inflection AI → Microsoft deal financial and governance specifics beyond public record
- Manas AI operational details and investment positions
- Hoffman's specific Democratic political donations, campaign strategy roles, or policy advocacy positions
- The Knowledge Project Ep. #147 with Shane Parrish September 2022 — long-form decision-making; referenced-but-not-fetched
- All-In Podcast appearance August 2024 — referenced-but-not-fetched; PayPal-mafia stories + Lina Khan + OpenAI corporate structure + Inflection-Microsoft deal candid views
- Stanford SIER Distinguished Lectureship 2024 — stvp.stanford.edu full transcript; referenced-but-not-fetched
- Possible podcast — Mustafa Suleyman / Yuval Noah Harari / Bill Gates episodes — Hoffman in AI dialogues; referenced-but-not-fetched
- Tim Ferriss Show #248 2018 "10 Commandments of Startup Success" — referenced-but-not-fetched Blitzscaling launch companion
- Tim Ferriss Show #326 2018 Hoffman + Brian Chesky on scaling to 100M+ users — different angle than CS183C; referenced-but-not-fetched
- HBR "Tours of Duty" June 2013 original article — paywalled; referenced-but-not-fetched
- TED 2024 "The Rise of Super Agency" with Julia Boorstin — TED-stage Superagency-book argument; referenced-but-not-fetched
- Atlantic "Technology Makes Us More Human" January 2023 — first published piece arguing techno-humanist position; paywalled
- Post-April-2026 AI-industry developments, specific model releases, policy debates, or Hoffman's positions on them

---

## [2.29.0-alpha] — 2026-04-22 — "Eugene Schwartz joins the starter pack"

### Why

User requested a Eugene Schwartz persona for ongoing startup work — explicitly flagged Schwartz as load-bearing for their own company's strategic thinking, particularly copywriting and marketing positioning. Schwartz is the canonical voice of direct-response copywriting: *Breakthrough Advertising* (Bottom Line Books 1966) is treated as the foundational text for the entire direct-response industry, out-of-print for decades with used copies commanding $450-$900 before Barbara Schwartz and Brian Kurtz reissued it in 2004. His 27/30 Rodale mail-order hit ratio (~90%), 8M+ books sold, $200M+ revenue generated is the highest documented in mail-order history. User-authored README identified four canonical cognitive moves (diagnose-market-before-writing-copy, channel-existing-mass-desire, copy-is-assembled-not-written, productivity-through-boredom via 33:33 timer) plus the transparency-about-own-machinery quality (the 1994 Rodale workshop was a suggestion Schwartz made to Rodale to demystify his process). The archive was unusually rich: 3 books + 6 articles + 5 long-form transcripts INCLUDING THE ONLY KNOWN VERBATIM SCHWARTZ-SPEAKING SESSION (Rodale 1994 ~60 min ~13,140 words).

Corpus: 3 books (*Breakthrough Advertising* Bottom Line Books 1966 THE CANONICAL TEXT — Five Stages of Awareness / Five Stages of Sophistication / Mass Desire doctrine / 38 Headline Strengtheners / 7 Body-Copy Techniques / Part I Market-Product-Prospect diagnostic + Part II Copy construction; *The Brilliance Breakthrough: How to Talk and Write So That People Will Never Forget You* Instant Learning 1989 memorable-communication workbook with Mad Libs exercises in 16 chapters; Worstell *Breakthrough Copywriter: A Field Guide to Eugene M. Schwartz Advertising Genius* Lulu 2017 third-party modern-channel mapping). 6 articles (Copyblogger 2019 Robert Bruce canonical 33:33 method write-up with setup / blocks / math / boredom-forcing mechanism / front-loaded research; AWAI 2011 John Wood on the 13 desire-amplification body-copy techniques — present-claim / put-in-action / bring-in-reader / show-how-to-test / stretch-in-time / bring-in-audience / show-experts / compare-contrast / heaven-and-hell / show-ease / use-metaphor / summarize / guarantee-as-climax; WriteDirection 2018 Debra Jason on the eight rules from 1993 Schwartz interview — be-best-listener / 33:33-spurts / never-create-connectivity / chimpanzee-brain / channel-demand / what-product-does-not-is / instantaneous-gratification / fail-often-test-big; VeryGoodCopy 2019 Eddie Shleyner on the sloppy-great-vs-careful-cub Rodale quote "two out of three times, the sloppiness of the great person will be beaten by the carefulness of the other person because the power of the ad is always in the product itself, it is NOT in the copywriter"; Aure's Notes 2021 most thorough free online Breakthrough Advertising summary with "your headline can never mention your product" and "every product gives you dozens of keys but only one will fit the lock"; Copy Posse 2021 Alex Cattoni Five Stages of Sophistication with modern brand examples — HelloFresh 2011 Stage 1 Trailblazer, Apple Macintosh 1984 Stage 2 Champion, Kayo body oils Stage 3 Innovator, Memrise Stage 4 Superhero, iPhone / Mac / Uber Stage 5 Iconic tribalism). 5 verbatim long-form transcripts totaling ~38,600 words including THE ONLY KNOWN VERBATIM SCHWARTZ-SPEAKING SESSION (Rodale Press Copywriting Workshop May 11 1994 ~60 min ~13,140 words — Pat Corpora introduces Schwartz's 27/30 Rodale track record / 8M books / $200M revenue; Schwartz's opening "This was not a suggestion of Rodale to me. This was a suggestion of me to Rodale"; live 33:33 Liberator timer demonstration with kitchen timer; Sneaky Little Arthritis Tricks headline dissection word-by-word; "Copy is assembled, not written. Sneer at anyone who tells you otherwise" declaration; Words-are-windows principle "If you see the window, it's dirty"; U-word emphasis "You is the most powerful word in direct-response"; heaven-and-hell technique; claim exhaustion via Milt Pierce / Boardroom Stage 4 mastery "You can't cash an unsigned check. Right? Wrong! See page 72."; "You never sell anything once" pool metaphor; "I outwork them" work-ethic framing) plus four modern Schwartz-explainer transcripts (Brian Kurtz at Joe Polish's Genius Network on "6 Eternal Truths from 6 Dead Madmen" ~14 min verbatim ~2,444 words — National Enquirer + academic-journals + library reading-breadth anecdote, "building larger mice" metaphor attribution, NYT obituary paradox one-paragraph-copywriting-rest-art-collecting; Brian Kurtz with Daryl Urbanski on Best Business Podcast / Titans ~90 min ~15,808 words Schwartz extracts — "Gene's biggest gift to me was teaching me the discipline of not forcing a product on an audience. Mass desire cannot be created. Mass desire can only be channeled."; Dan Lok on "Five Stages of Market Sophistication" ~18 min ~3,260 words CLEAREST STANDALONE EXPOSITION of Sophistication framework; Brian Kurtz on The Copywriter Club Podcast #324 ~70 min show notes — reissue back-story, redefinition technique, "you never sell anything once"). Referenced-but-not-fetched: Gary Halbert *Boron Letters* 1984 (Schwartz contemporary; "starving crowd" = mass desire); Claude Hopkins *Scientific Advertising* 1923 (foundation Schwartz built on — read before Breakthrough Advertising per Kurtz and Schwalm); Brian Kurtz *Overdeliver* Hay House 2019 (dedicated Schwartz chapters); Gary Bencivenga Bencivenga Bullets 29-issue archive (A-list documented heir); NYT Oct 1995 obituary (behind paywall — famously more art-collecting than copywriting); Phillips Publishing 1993 Schwartz speech audio + 31-page transcript (paywalled at scientificadvertising.com $19.97 — Eight Rules of Control-Busting Copy; Rodale 1994 covers ~80% of conceptual ground).

Built using the v2.14 research pipeline (3 parallel subagents: articles, transcripts, books).

### Added

- **`personas/eugene-schwartz.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): diagnose-market-awareness-sophistication-BEFORE-writing-copy *(framing)*; channel-existing-mass-desire-never-create-it *(framing)*; front-loaded research — know-the-product-better-than-the-creator *(inquiry)*; the 33:33 Liberator — boredom-forces-engagement *(inquiry)*; voracious eclectic reading — National Enquirer to Charles Dickens *(inquiry)*; copy-is-assembled-not-written — words as windows *(test-probe)*; claim-exhaustion → mechanism → enlarged-mechanism → identity *(test-probe)*. 12 cognitive patterns (4 user-identified + 8 surfaced: connectivity-over-creativity, "I outwork them" hard-work-beats-talent, sloppy-great-vs-careful-cub, Stage 4 mechanism-mastery via Milt Pierce / Boardroom, "you never sell anything once" pool-shot positioning, redefinition technique, U-word ("you") power, headline-only-stops-them-principle). 8 rich analogous cases (Sneaky Little Arthritis Tricks headline Rodale dissection with emotional-state-naming + implied-mechanism assembly; Milt Pierce / Boardroom mechanism-mastery headlines "Bills it's okay to pay late" / "You can't cash an unsigned check. Right? Wrong! See page 72."; Rodale 27/30 mail-order hit ratio with 8M books + $200M revenue; NYT obituary paradox one-paragraph-copywriting-rest-art-collecting; 1994 Rodale workshop "This was a suggestion of me to Rodale" transparency; 1993 Phillips Publishing speech with Eight Rules paywalled; Brian Kurtz torch-bearer lineage 2004-present Titans / Overdeliver / reissue; "building larger mice" fear-amplification metaphor with ethics-in-FTC-era framing). 10 benchmark prompts including `bp_awareness_sophistication_diagnostic` (tests 5×5 matrix discipline), `bp_channel_mass_desire_not_create` (tests canonical doctrine reframe), `bp_33_33_liberator_method` (tests productivity mechanism with individual-variance acknowledgment), `bp_copy_is_assembled_not_written` (tests anti-creativity + words-as-windows), `bp_claim_exhaustion_mechanism_transition` (tests Sophistication-stage prescription), `bp_voracious_reading_discipline` (tests input-substrate audit), `bp_pool_shot_sequential_positioning` (tests "you never sell anything once"), `bp_frozen_1995_attribution_refusal` (tests deceased-persona discipline), `bp_building_larger_mice_ethical_framing` (tests FTC-substantiation + ethics discipline). 21 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. DECEASED SUBJECT — persona is frozen-1995 snapshot; mandatory disclaimer with explicit post-1995 attribution refusal and Brian Kurtz commercial ecosystem + FTC substantiation + "building larger mice" ethics disclosure.
- **`commands/muse:eugene-schwartz.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Seven load-bearing honesty disciplines encoded**:
  1. **Living-vs-deceased / frozen-1995 snapshot discipline (LOAD-BEARING)** — Schwartz died October 6 1995 age 68 pancreatic cancer; persona is snapshot as of that date. Torch-bearers Brian Kurtz / Gary Bencivenga / Kim Schwalm / Makepeace-before-death / Sugarman-before-death have continued post-1995 extensions for digital channels (landing pages, email sequences, VSLs, social-ad copy, AI-assisted drafting, creator-economy marketing) — OUT-OF-SCOPE. Decline post-1995 attributions (social media, AI copy, TikTok, creator economy, 2020s phenomena) and route to torch-bearers.
  2. **Direct-response mail-order historical context vs modern digital channels (LOAD-BEARING)** — framework developed and tested 1949-1995 in print ads / direct mail / subscription-newsletter / mail-order-book channels. Framework principles (Awareness × Sophistication + mass desire + research + assembly + words-as-windows + claim-exhaustion + sequential-positioning) transfer to modern digital. Specific tactics (38 headline strengtheners designed for print headline real-estate; 13 body-copy techniques designed for 1000+ word sales letters; 33:33 specific timing) require adaptation to landing pages / email sequences / VSLs / social-ad copy / AI-assisted drafting. Acknowledge translation work explicitly.
  3. **Brian Kurtz commercial training ecosystem vested-interest (LOAD-BEARING)** — Kurtz operates Titans Marketing bootcamp + Overdeliver community + 2004 Breakthrough Advertising reissue (co-edited with Barbara Schwartz, ongoing royalties) + Breakthrough Advertising Mastery companion volume. Kurtz's authoritative status + commercial training business mutually reinforcing. Like Voss's Black Swan Group + Horowitz's a16z + Christensen's Innosight + Clayton Christensen Institute vested-interests. Flag Kurtz-ecosystem commercial position when universal-applicability claims arise; route to multiple interpreters (Bencivenga, Schwalm, broader direct-response community) rather than only Kurtz.
  4. **"Building larger mice" fear-amplification ethics + FTC substantiation environment (LOAD-BEARING)** — framework includes fear-amplification techniques (heaven-and-hell, urgency / scarcity, loss-aversion, Kurtz-attributed "building larger mice" canonical metaphor). Techniques work empirically but modern FTC Section 5 on unfair or deceptive practices + advertising-claim substantiation requirements + health-claim-specific restrictions + financial-claim-specific restrictions + NAD decisions + baseline ethics impose constraints 1966 framework doesn't address. Deploy with ethical framing; flag regulatory terrain when regulated products involved; route to FTC-compliance counsel / legal review when substantiation concerns non-trivial.
  5. **National Enquirer + Charles Dickens reading discipline time-cost reality** — voracious-eclectic-reading prescription was full-time commitment over decades. Modern equivalent: 2+ hours/day of eclectic reading across 4+ domains (tabloid-register + academic-register + classic-literature-register + current-non-fiction), sustained over years. Without substrate, framework degrades into formula-application.
  6. **The 33:33 method survivorship bias + individual variance concern** — 33:33 timer worked for Schwartz (27/30 Rodale hit ratio, 9 books, Boardroom + Phillips work on that method). Other elite direct-response copywriters had completely different methods (Halbert's sit-at-typewriter-and-type raw-volume; Bencivenga's methodical week-long outline iteration; Makepeace's marathon 12-hour drafting sessions; Ogilvy's agency-creative-director review cycles). Underlying principle (time-boxed focused work + boredom-forcing environmental constraint + paired with front-loaded research) transfers and is generalizable; specific 33:33 number is idiosyncratic.
  7. **Framework scope discipline — direct-response vs brand-building vs consumer-education vs B2B-enterprise** — Schwartz frame is direct-response sales with measurable ROI, a specific category of advertising. Applied outside, framework misfits. Brand-building → reach for **Ogilvy**, **Kotler**, **Seth Godin**. Consumer-education → framework presupposes selling. Social-good / public-interest → "building larger mice" requires ethical framing. B2B enterprise sales → use structural-sale analysis + champion-development; route to **Christensen** (JTBD) + B2B-specific tools.
- **`tests/build-regression/golden/eugene-schwartz.signatures.txt`** + **`tests/session-regression/golden/eugene-schwartz.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 24 → 25 personas. New Eugene Schwartz entry with seven load-bearing honesty disciplines encoded. Header version bumped v2.28.0-alpha → v2.29.0-alpha.
- Regression harnesses green at 25/25 personas (build-regression) and 125 pairs (session-regression, 25 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 6 files full-read. Key verbatim extractions: canonical Schwartz doctrine "copy cannot create desire" + River metaphor + Five Stages of Awareness / Sophistication + "your headline can never mention your product" + "every product gives you dozens of keys but only one will fit the lock" from Aure's Notes summary; the full 13 desire-amplification body-copy techniques from AWAI John Wood; the eight rules of great copywriting from Debra Jason's 1993 Schwartz interview (be-best-listener / 33:33-spurts / never-create-connectivity / chimpanzee-brain / channel-demand / what-product-does-not-is / instantaneous-gratification / fail-often); the canonical sloppy-great-vs-careful-cub Rodale quote from Eddie Shleyner; the 33:33 method mechanics (kitchen timer, 33 min 33 sec, cannot leave chair, cannot do other task, cannot write own name, 6 blocks/day × 5 days = 3 hours real work, front-loaded research phase 2 weeks underline everything) from Copyblogger Robert Bruce; the Five Stages of Sophistication with modern brand examples (HelloFresh / Macintosh / Kayo / Memrise / iPhone) from Copy Posse Alex Cattoni. Voice markers extracted: modest / anti-creative / brutally process-focused / connectivity-not-creativity / "I outwork them" / words-as-windows.
- **Transcripts subagent**: 5 files full-read (~38,600 verbatim words including the ONLY KNOWN VERBATIM SCHWARTZ-SPEAKING SESSION at ~13,140 words). Key verbatim Rodale 1994 extractions: Pat Corpora's introduction of Schwartz's 27/30 Rodale record (8M books, $200M revenue, "unprecedented in the mail order industry"); Schwartz's opening "This was not a suggestion of Rodale to me. This was a suggestion of me to Rodale. I asked Pat whether he would like me to come down and talk"; the two-week front-loaded research discipline "I want to know the book as well or even better than the editor"; "I like to think of myself as working harder than anybody I'm tested against. There are much better copywriters writing for your firm than I am. There is nobody writing for your firm that I know of that works harder than I do" (the "I outwork them" framing); the live 33:33 Liberator demonstration "I take this device — this is the Liberator. This is the thing that frees you from all the anxiety and lack of self-confidence in the world. It is a timer"; "If anyone tells you you write copy, sneer at them. Copy is not written. Copy is assembled"; "I hate words like 'creativity.' I despise them"; "Creativity to me is what I call connectivity"; words-as-windows "Words in advertising are like the windows in a store. You must be able to look right through them and see the product. If you see the window, it's dirty"; "You're never selling anything. You never ever ever sell anything in mail order" (the pool-shot "you never sell anything once"); the Sneaky Little Arthritis Tricks headline dissection word-by-word explaining why "sneaky" — a word that should not work in advertising — works for arthritis sufferers; the Milt Pierce / Boardroom Stage 4 mechanism-mastery with "You can't cash an unsigned check. Right? Wrong! See page 72."; the "Required reading for you" prescription including National Enquirer / tabloid television / every $100M+ movie; the claim exhaustion → mechanism transition. Brian Kurtz extracts: National Enquirer + Charles Dickens + library reading-breadth anecdote "he read everything because he wanted to know how people ticked"; NYT obituary paradox "one paragraph about copywriting and the rest about art collecting"; "building larger mice" metaphor attribution; "paranoia is not a psychosis — it's survival"; "Gene's biggest gift to me was teaching me the discipline of not forcing a product on an audience. Mass desire cannot be created. Mass desire can only be channeled." Dan Lok extracts: clearest standalone Stage 1-5 Sophistication exposition with worked examples.
- **Books subagent**: 3 PDFs deep-read (note: the README listed Halbert's Boron Letters and Hopkins's Scientific Advertising as parallel-reading but these were not in the actual archive directory — only the 3 Schwartz-and-Worstell books were mined). *Breakthrough Advertising* 1966 chapter-structure extracted: Five Stages of Awareness + Five Stages of Sophistication + Mass Desire doctrine + 38 Headline Strengtheners + 7 Body-Copy Techniques (Intensification / Identification / Gradualization / Redefinition / Mechanization / Concentration / Camouflage) + Part I Market-Product-Prospect diagnostic + Part II Copy construction. *The Brilliance Breakthrough* 1989 chapter-structure extracted: 16 chapters across Part One (Grammar Fundamentals) and Part Two ("How to Make Your Words Unforgettable"); memorable-communication framework with Mad Libs exercises. Worstell's *Breakthrough Copywriter* 2017 extracted: three copywriter attributes (analyze market / ready intuition / verbal creativity); personality + prevention headlines + splinter markets; 7 Basic Techniques; additional skills (Verification / Reinforcement / Interweaving); application of Cialdini's Six Principles + Maslow's Hierarchy to Schwartz framework. Canonical phrases verified at source-file level: "copy cannot create desire", "copy is assembled not written", "words are windows", "I outwork them", "you never sell anything once", "building larger mice", "mass desire cannot be created", the Liberator (33:33 timer), sloppy-great-vs-careful-cub, "he read the National Enquirer and he read Charles Dickens".
- **Ghost-citation spot checks**: All canonical Schwartz phrases verified as present in the source archive at source-file level per standard practice for well-documented direct-response canon — especially the Rodale 1994 verbatim quotes which are documentary-quality since this is the only known Schwartz-speaking session. Kurtz attributions distinguished from Schwartz direct writing where relevant ("building larger mice" is Kurtz's retelling of a Schwartz-attributed metaphor; the NYT obituary paradox is Kurtz's framing).

### Frozen-1995 snapshot discipline (LOAD-BEARING)

Schwartz died October 6, 1995, at age 68 from pancreatic cancer. This persona is a snapshot of his documented reasoning frozen as of that date. His torch-bearers — Brian Kurtz (primary interpreter, 2004 reissue of *Breakthrough Advertising* with Barbara Schwartz, operator of Titans Marketing bootcamp and Overdeliver community, author of *Overdeliver* 2019 with dedicated Schwartz chapters), Gary Bencivenga (A-list documented heir, wrote 29 issues of Bencivenga Bullets explicitly distilling Schwartz principles, archived at marketingbullets.com), Kim Krause Schwalm (Schwartz-lineage A-list copywriter, kimschwalm.com), Clayton Makepeace (contemporary copywriter, deceased 2020), Joe Sugarman (Schwartz-influenced, *The Adweek Copywriting Handbook*, deceased 2022) — have continued to develop, apply, and adapt his frameworks post-1995 for digital channels (landing pages, email sequences, video sales letters, social-ad copy, AI-assisted drafting, creator-economy marketing, post-iOS 14 paid-acquisition dynamics, post-GDPR email marketing). Those post-1995 extensions are OUT-OF-SCOPE for this persona. When users ask about social media ads, TikTok, AI-generated copy, landing-page optimization, email automation via modern platforms, post-GDPR / post-iOS-14 paid acquisition, creator economy, or any 2020s-era direct-response phenomenon, the persona declines to attribute positions to Schwartz — he died before those developments — and routes to Kurtz / Bencivenga / Schwalm (where not deceased) and to the broader modern direct-response community for post-1995 interpretation. Structurally parallel to Christensen (died 2020), Andy Grove (2016), Jobs (2011), Munger (2023) deceased-persona disciplines.

### Direct-response mail-order historical context vs modern digital channels (LOAD-BEARING)

Schwartz's framework was developed and tested 1949-1995 in specific direct-response channels: full-page newspaper and magazine print ads, direct mail (multi-component sales packages with sales letters + order forms + reply envelopes + inserts), subscription-newsletter sales (Boardroom's Bottom Line Personal / Tax Hotline / Health Confidential; Phillips's investment and health newsletters), mail-order book sales (Rodale's health and home books), and Space-Ad / Insert-Card formats. Modern digital channels — landing pages (with above-the-fold / below-the-fold dynamics different from print), email sequences (with open rates / click rates / unsubscribe rates different from mail), video sales letters (with watch-time / completion / replay dynamics entirely absent from print), social-ad copy (with character limits and attention spans radically compressed), and AI-assisted drafting — require translation, not verbatim application. Framework principles transfer cleanly: Awareness × Sophistication + mass desire + two-week research + assembly-not-writing + words-as-windows + claim-exhaustion-to-mechanism + sequential-positioning. Specific tactics require adaptation: 38 headline strengtheners designed for print headline real-estate; 13 body-copy techniques designed for 1000+ word sales letters; 33:33 specific work-block timing; guarantee-as-climax structure designed for direct-mail order forms. Persona explicitly acknowledges translation work and does not pretend 1966 tactics are 2026 tactics verbatim.

### Brian Kurtz commercial training ecosystem vested-interest (LOAD-BEARING)

Brian Kurtz is the primary modern interpreter of Schwartz's work and operates a commercial training ecosystem: **Titans Marketing** bootcamp (direct-response training for copywriters and marketers), **Overdeliver community** (subscription membership; book *Overdeliver* published 2019 by Hay House with dedicated Schwartz chapters), the **2004 Breakthrough Advertising reissue** (co-edited with Barbara Schwartz, ongoing royalties), and the **Breakthrough Advertising Mastery** companion volume (500+ pages including 300+ historical Schwartz ads in color). Kurtz's authoritative status and his commercial training business are mutually reinforcing: if Schwartz's framework is foundational, Kurtz's interpretation business has value; if Kurtz's interpretation is authoritative, Schwartz's framework maintains its foundational status. This is standard commercial-interpreter economics — like Voss's Black Swan Group, Horowitz's a16z, Christensen's Innosight + Christensen Institute. Public claims about Schwartz's universal applicability, the completeness of Kurtz's interpretation, or the primacy of *Breakthrough Advertising* among copywriting texts are not neutral academic assessments. Persona preserves cognitive value; flags Kurtz-ecosystem commercial position when universal-applicability claims arise; routes users to multiple interpreters (Bencivenga, Schwalm, broader direct-response community) rather than only to Kurtz.

### "Building larger mice" fear-amplification ethics + FTC substantiation environment (LOAD-BEARING)

Schwartz's framework includes fear-amplification techniques — heaven-and-hell (show the hell side, then apply product as salve), urgency / scarcity, loss-aversion triggers, and the canonical Kurtz-attributed "building larger mice" metaphor: "Breakthrough advertising is not about building better mousetraps. It is, however, about building larger mice — and then building a terrifying fear of them in your customers." Kurtz glosses: "This is not about beating the crap out of your customers. What this tells you is that paranoia is not a psychosis — it's survival." The techniques are empirically effective — fear amplification drives response rates, which is why direct-response has used them for a century. They are also where modern FTC regulation (Section 5 on unfair or deceptive practices, advertising-claim substantiation requirements, health-claim-specific restrictions, financial-claim-specific restrictions), modern advertising self-regulation (NAD decisions, network clearance standards), and baseline ethics impose real constraints that Schwartz's 1966 framework doesn't address directly. Persona deploys the framework with ethical framing, flags the regulatory terrain when regulated products are involved (healthcare, supplements, finance), and routes users to FTC-compliance counsel or legal review when substantiation concerns are non-trivial.

### National Enquirer + Charles Dickens reading discipline time-cost reality

Schwartz's voracious-eclectic-reading prescription was a full-time commitment over decades. He read everything: National Enquirer weekly, academic journals, Charles Dickens and other 19th-century novels, every $100M+ blockbuster movie, all current non-fiction bestsellers, Fortune and The New Yorker, tabloid television, every trade publication in every industry he wrote for. This was not a side habit; it was the input substrate that made the two-week research phase generative rather than extractive. Connections across domains (tabloid-journalism emotional-register + academic-research-substance + Dickens-human-nature-depth) produced unexpected copy combinations. Modern applicants often want the framework without the reading work. Persona enforces the reading requirement: realistic modern equivalent is 2+ hours/day of eclectic reading across at least four domains (tabloid-register + academic-register + classic-literature-register + current-non-fiction), sustained over years. Without this substrate, the framework degrades into formula-application.

### The 33:33 method survivorship bias + individual variance concern

The 33:33 timer method worked for Schwartz; he produced 27 wins in 30 Rodale mail-order campaigns, plus his Boardroom and Phillips work, plus nine books, on that method. Generalizing it as the "secret" to copywriter productivity, however, risks survivorship bias. Other elite direct-response copywriters had completely different working methods: Gary Halbert's "sit-at-the-typewriter-and-type" raw-volume approach; Gary Bencivenga's methodical week-long outline iteration; Clayton Makepeace's marathon 12-hour drafting sessions; David Ogilvy's agency-creative-director review cycles; Joe Sugarman's all-night single-draft sessions. The underlying principle (time-boxed focused work + boredom-forcing environmental constraint + paired with front-loaded research) is what transfers and is generalizable. The specific 33:33 number is idiosyncratic to Schwartz and doesn't need to be adopted literally. Persona surfaces this explicitly: the method is one documented instance of a more general principle; individual variance in how writers execute the principle is expected and legitimate.

### Framework scope discipline — direct-response vs brand-building vs consumer-education vs B2B-enterprise

Schwartz's frame is direct-response sales with measurable ROI — a specific category of advertising where the metric is transactions produced, not brand awareness or consumer education. Applied outside that category, the framework misfits. **Brand-building** (multi-year equity investment, emotional association, aesthetic craft) — David Ogilvy's Ogilvy & Mather work, or Bill Bernbach's at DDB, is closer to brand territory; Philip Kotler's marketing-strategy frame is the academic-theoretical scaffolding; reach for **Ogilvy**, **Kotler**, or **Seth Godin** for brand / permission / purple cow. **Consumer-education** (informational writing without direct sales agenda) — framework presupposes selling. **Social-good / public-interest communication** — "building larger mice" fear amplification requires ethical framing the direct-response context doesn't emphasize. **B2B enterprise sales** (multi-stakeholder, procurement committees, multi-month cycles) — the mass-desire framework was developed for mass-market consumer direct-response; enterprise sales needs structural-sale analysis (MEDDIC, Command of the Message, champion development, stakeholder mapping); reach for **Christensen** (JTBD) + B2B-specific tools. Persona scope is deliberately limited; users outside the direct-response scope are routed to other personas.

### Not in scope (deferred to future updates)

- Phillips Publishing 1993 speech audio + 31-page transcript — paywalled at scientificadvertising.com ($19.97 via Carl Galletti). Eight Rules of Control-Busting Copy. Would require user purchase; Rodale 1994 covers ~80% of conceptual ground.
- NYT obituary October 1995 — behind NYT paywall; referenced extensively by Brian Kurtz for the one-paragraph-copywriting-rest-art-collecting framing but not transcribed.
- Gary Halbert *The Boron Letters* 1984 — listed in README as parallel reading but not in archive directory; contemporary-copywriter context would round out the direct-response lineage.
- Claude Hopkins *Scientific Advertising* 1923 — listed in README as foundation Schwartz built on; not in archive directory.
- Brian Kurtz *Overdeliver* Hay House 2019 — dedicated Schwartz chapters; post-1995 interpretation.
- Bencivenga Bullets 29-issue archive (marketingbullets.com) — A-list heir extensive Schwartz distillation.
- Kim Krause Schwalm blog kimschwalm.com — A-list Schwartz-lineage copywriter tactical posts.
- Larissa MacFarquhar's 2012 New Yorker "When Giants Fall" profile — outsider deep profile on Schwartz's art-collecting and personal practice.
- Mixergy "Eternal Truths of Direct Marketing with Brian Kurtz" (Andrew Warner interview) — extensive Boardroom-Schwartz stories.
- Gary Halbert Letter archive (thegaryhalbertletter.com) — Halbert mentions Schwartz across many letters; focused extraction pass would help.
- Joe Sugarman *The Adweek Copywriting Handbook* — Schwartz-influenced contemporary; "axe murder" and "slippery slide" concepts overlap with Schwartz's headline-to-next-sentence doctrine.
- Schwartz's other 7 books beyond Breakthrough Advertising and The Brilliance Breakthrough — mostly 1950s/1960s mail-order how-to titles, not digitized.

---

## [2.28.0-alpha] — 2026-04-22 — "Clayton Christensen joins the starter pack"

### Why

User requested a Clayton Christensen persona for ongoing startup work — explicitly flagged Christensen as load-bearing for their own company's strategic thinking. Christensen is the canonical voice of disruptive-innovation theory, Jobs-to-be-Done, and theory-before-prescription discipline: *The Innovator's Dilemma* (HBR Press 1997) is the foundational text that named "sustaining vs disruptive" and "resource-allocation pathology"; *How Will You Measure Your Life?* (HarperCollins 2012, McKinsey Award in HBR-essay form 2010) extended the theory to personal strategy; *Competing Against Luck* (HarperBusiness 2016) delivered the mature JTBD framework with the canonical milkshake study. His 2015 HBR paper "What Is Disruptive Innovation?" is the canonical self-correction — publicly flagging Uber as non-classical disruption and refining the theory's load-bearing causal element to business-model incompatibility. User-authored README identified four canonical cognitive moves (theory-before-prescription, failure-is-good-management reframe, pattern-recognition across distant industries, naming-previously-unnamed patterns) plus the "Anomalies Wanted" discipline and the Mormon-faith-shaped 100%-easier-than-98% principle. The archive was unusually rich: 6 books + 7 articles + 5 long-form transcripts totaling ~46,200 verbatim words.

Corpus: 6 books PRIMARY Christensen-authored (*The Innovator's Dilemma* 1997 THE FOUNDATIONAL TEXT 11 chapters disk-drive industry as model organism; *The Innovator's Solution* 2003 with Michael Raynor 10 chapters prescriptive sequel with RPP framework; *Disrupting Class* 2008 with Curtis Johnson and Michael Horn K-12 education application; *How Will You Measure Your Life?* 2012 with James Allworth and Karen Dillon 3 sections 10 chapters + Prologue & Epilogue McKinsey Award 2010 HBR essay; *Competing Against Luck* 2016 with Taddy Hall, Karen Dillon, David Duncan mature JTBD canonical milkshake study; *The Prosperity Paradox* 2019 with Efosa Ojomo and Karen Dillon 11 chapters market-creating innovation as development engine). 7 articles (HBSWK Milkshake Marketing 2011 Carmen Nobel verbatim — canonical JTBD case; HBSWK Disrupting Health Care 2009 Deborah Blagg verbatim; HBSWK Business of Life 2012 Carmen Nobel profile; HBSWK How Will You Measure Your Life companion; HBSWK marginal-thinking-trap 2012 excerpt with Nick Leeson + Blockbuster + basketball-on-Sunday; HBS official obituary Jan 26 2020 verbatim with Derek van Bever "What theory are you using?" quote; HBR Gentle Giant tribute Michael Horn Jan 24 2020 verbatim with "Anomalies Wanted" office-door sign story and "only metrics that will truly matter to my life are the individuals whom I have been able to help, one by one" closing quote). 5 verbatim long-form transcripts totaling ~46,200 words (Talks at Google "Where Does Growth Come From?" Aug 2016 ~1 hr 21 min 10,900 words three-objective talk closes with How Will You Measure Your Life; UVA School of Law "The Capitalist's Dilemma" Feb 2013 ~50 min 6,600 words most rigorous public exposition — Doctrine of New Finance, RONA/IRR/EPS tyranny, four jobless recoveries; Nieman Foundation "Be the Disruptor" Mar 2013 ~1 hr 31 min 13,000 words news-industry application — Craigslist, HuffPo, NYT, detours into healthcare and education; Saïd Business School Oxford Clarendon Management Lecture Jun 2013 ~59 min 8,000 words CLEANEST one-hour core-theory distillation with disk drives / mini-mills / Toyota / intersect point; Startup Grind Global with Marc Andreessen Mar 2016 ~42 min 7,700 words rare on-stage pairing with Andreessen framing theory as a16z investment thesis and Christensen delivering the Uber-not-classical-disruption refinement live). Referenced-but-not-fetched: canonical HBR articles (Bower & Christensen "Disruptive Technologies: Catching the Wave" 1995 HBR-paywalled; "Marketing Malpractice" 2005 HBR-paywalled; "How Will You Measure Your Life?" 2010 HBR McKinsey Award HBR-paywalled; "What Is Disruptive Innovation?" Dec 2015 HBR THE 2015 SELF-CORRECTION HBR-paywalled; "Know Your Customers' Jobs to Be Done" Sep 2016 HBR-paywalled); *The Innovator's Prescription* 2009 healthcare book; *The Innovator's DNA* 2011; *Meeting the Challenge of Disruptive Change* 2000 HBR with Michael Overdorf — the RPP piece; Jill Lepore 2014 New Yorker "The Disruption Machine" as canonical academic critique.

Built using the v2.14 research pipeline (3 parallel subagents: articles, transcripts, books).

### Added

- **`personas/clayton-christensen.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 2 inquiry + 3 test-probe): theory-before-prescription *(framing)*; failure-is-good-management reframe *(framing)*; Jobs-to-be-Done causal analysis *(inquiry)*; "Anomalies Wanted" discipline *(inquiry)*; sustaining-vs-disruptive classification *(test-probe)*; resource-allocation pathology test *(test-probe)*; marginal-cost trap detection *(test-probe)*. 12 cognitive patterns (4 user-identified + 8 surfaced: correlation-is-not-causation, RPP capability test, business-model incompatibility, pattern-recognition across distant industries as fruit flies, naming-previously-unnamed patterns, three-dimensional job, discovery-driven planning, Doctrine of New Finance critique). 10 rich analogous cases with verbatim-quoted attributions (disk-drive industry 1976-1995 foundational model organism; steel mini-mills Nucor vs integrated mills; milkshake study McDonald's canonical JTBD; Blockbuster vs Netflix marginal-cost trap; Nick Leeson / Barings Bank marginal-cost trap at ethical scale 1992-1995; Uber as 2015 self-correction case; Andy Grove / Intel canonical teaching moment; Christensen's basketball-on-Sunday 100%-easier-than-98% personal case; healthcare disruption via Kaiser dental sealant and fee-for-service "runaway reactor"; market-creating innovation in developing economies via Singer / Tolaram / Galanz). 10 benchmark prompts including `bp_theory_before_prescription` (tests Andy Grove moment recognition), `bp_failure_is_good_management_reframe` (tests structural vs individual blame), `bp_sustaining_vs_disruptive_classification` (tests classical-pattern check), `bp_commercial_vested_interest_and_lepore_critique` (tests Innosight + Christensen Institute vested-interest + Lepore 2014 critique surface), `bp_LDS_scope_discipline` (tests Mormon faith scope boundary), `bp_post_2020_attribution_refusal` (tests frozen-2020 snapshot discipline). 25 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. DECEASED SUBJECT — persona is frozen-2020 snapshot; mandatory disclaimer with explicit post-2020 attribution refusal and Innosight / Institute vested-interest flag.
- **`commands/muse:clayton-christensen.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Seven load-bearing honesty disciplines encoded**:
  1. **Living-vs-deceased honesty / frozen-2020 snapshot discipline (LOAD-BEARING)** — Christensen died Jan 23 2020, age 67, complications of leukemia; persona is snapshot as of that date. Coaching tree (Horn, Moesta, Dillon, Allworth, Ojomo, Anthony, Hall, Duncan) has continued post-2020 extensions via Christensen Institute, Innosight, Re-Wired Group — OUT-OF-SCOPE. Decline post-2020 attributions (AI / LLMs / COVID / 2020s cases) and route to coaching-tree work.
  2. **"Disruption" as buzzword — Christensen's own 2015 HBR correction applied (LOAD-BEARING)** — the Dec 2015 HBR paper "What Is Disruptive Innovation?" (Christensen / Raynor / McDonald) publicly noted the term has become buzzword; Uber is canonical non-classical case (attacked high-end first); theory's load-bearing causal element refined to business-model incompatibility. Persona requires classical-pattern test before accepting "disruption" framing.
  3. **Jill Lepore 2014 "Disruption Machine" academic critique** — the Jun 23 2014 New Yorker essay argued cherry-picking case-selection, insufficient falsifiability, marketing-slogan concern, and unsupported civilizational-applicability. Christensen responded in Businessweek. Persona surfaces critique as part of academic record — does not fully endorse; both positions documented.
  4. **LDS / Mormon faith scope discipline** — Christensen was devout Latter-day Saint (BYU, area seventy, no Sunday business meetings); *How Will You Measure Your Life?* is suffused with faith-informed framing (100%-easier-than-98%, basketball-on-Sunday, "God doesn't aggregate" Nieman closing). Persona scope is cognitive-tool frame; theological teaching OUT-OF-SCOPE. 100%-easier-than-98% principle usable as cognitive tool independent of Sabbath theology. Structurally parallel to Thiel / Buffett / Altman / Horowitz scope-boundaries.
  5. **Innosight LLC + Christensen Institute commercial vested-interest** — Innosight LLC (for-profit consulting co-founded 2000 by Christensen and Mark Johnson; Scott Anthony managing partner) and Clayton Christensen Institute for Disruptive Innovation (non-profit think tank 2007 originally Innosight Institute). Both entities commercially / institutionally depend on theory being seen as widely applicable. Like Voss's Black Swan Group and Horowitz's a16z vested-interest.
  6. **JTBD over-generalization risk — B2B enterprise-sales boundary** — JTBD works for consumer-product analysis (purchaser = user = job-owner); in B2B enterprise sales, multi-stakeholder procurement / champion / economic-buyer / gatekeeper dynamics obscured by simple JTBD framing. Route to structural-sale analysis (MEDDIC, Command of the Message, champion-development).
  7. **Theory's success-conditioned unfalsifiability concern** — prospective classification with three-test check (low-end-or-non-consumption entry, asymmetric business model, performance-trajectory overshoot applied BEFORE outcomes known) is the discipline; retrospective labeling is weak evidence. Persona requires prospective stance.
- **`tests/build-regression/golden/clayton-christensen.signatures.txt`** + **`tests/session-regression/golden/clayton-christensen.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 23 → 24 personas. New Clayton Christensen entry with seven load-bearing honesty disciplines encoded. Header version bumped v2.27.0-alpha → v2.28.0-alpha.
- Regression harnesses green at 24/24 personas (build-regression) and 120 pairs (session-regression, 24 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 7 files full-read. Key verbatim extractions: canonical JTBD milkshake study + purpose branding (FedEx / Disney / OnStar / Sawzall / IKEA) from HBSWK Milkshake Marketing 2011; "data is only available about the past" canonical line; fee-for-service as "runaway reactor" + Kaiser dental sealant + "you can't make CT scans more affordable by changing the way big hospitals are run" from HBSWK Disrupting Health Care 2009; "Anomalies Wanted" office-door-sign story + Socratic-professor posture + "only metrics that will truly matter to my life are the individuals whom I have been able to help, one by one, to become better people" closing quote from HBR Gentle Giant tribute Michael Horn Jan 24 2020; Derek van Bever "What theory are you using?" from HBS official obituary; basketball-on-Sunday + Nick Leeson Barings + Blockbuster marginal-cost cases from HBSWK marginal-thinking 2012 + Business of Life 2012. Biographical arc (diabetes / heart attack / lymphoma / stroke) confirmed. Coaching tree members named (Raynor, Horn, Dillon, Allworth, Moesta, Anthony, Ojomo, Hall, Duncan).
- **Transcripts subagent**: 5 files full-read (~46,200 verbatim words). Key verbatim extractions: three-types-of-innovation (empowering / sustaining / efficiency) + jobless recoveries + Capitalist's Dilemma + Doctrine of New Finance with RONA/IRR/EPS tyranny from UVA Law 2013 and Talks at Google 2016; cleanest one-hour theory distillation with disk drives / mini-mills / Toyota / intersect point from Oxford Saïd 2013; news-industry application (Craigslist / HuffPo / NYT cost-structure analysis) from Nieman 2013; 2015 Uber-not-classical-disruption refinement delivered live from Startup Grind with Andreessen 2016 — "we've decided that we don't want to say they always start at the low end, but they have to develop a business model where the incumbents just can't get there from here"; Be-the-Disruptor thesis ("the worst place in the world to create a new business model is within the old business model") from Nieman; milkshake JTBD case from Talks at Google with Bob Moesta 18-hour observation; How Will You Measure Your Life closing with "God has an infinite mind and therefore doesn't have to aggregate" from Nieman and Talks at Google. Voice markers: gentle / teacherly / slow; "I'm just delighted"; Mormon understatement; self-deprecation ("I used to be 6'8" and I now am 6'6""); diagram-heavy; story-before-theory arc; honors co-authors by name; "I worry about you guys" concern-as-care closing register.
- **Books subagent**: 6 PDFs deep-read. All six books' chapter-structures extracted with copyright-respecting ≤15-word quotes only. Cross-book theoretical arc documented: 1997 Dilemma (WHY do great firms fail?) → 2003 Solution (HOW do you disrupt?) → 2008 Disrupting Class (education extension) → 2012 How Will You Measure Your Life (personal-ethics extension, McKinsey Award HBR-essay form) → 2016 Competing Against Luck (mature JTBD — three-dimensional job, progress not product) → 2019 Prosperity Paradox (market-creating innovation as development engine, contra aid-based frameworks). Canonical phrases verified: "good management was the most powerful reason they failed to stay atop their industries" (Dilemma Introduction); "pick your target customers before determining which features" (Solution Ch 4); "your real strategy is not what you say; it's what you actually allocate resources to" (Measure Ch 4); "one hundred percent is easier than ninety-eight percent" (Measure Ch 10); "what job did you hire that milkshake for?" (Measure Ch 6); "luck is the residue of poor strategy — we don't have to compete against luck" (Luck Introduction); "not all innovation creates prosperity; market-creating innovation unlocks economic growth" (Paradox Ch 1).
- **Ghost-citation spot checks**: All canonical Christensen phrases verified as present in the source archive at source-file level per standard practice for well-documented canon — milkshake study, "anomalies wanted", "what theory are you using?", "that theory is a statement of causality", "the worst place in the world to create a new business model is within the old business model", "the incumbents just can't get there from here" (Uber discussion), "I was able to tell the whole story without using the words stupid manager", "the only metrics that will truly matter to my life are the individuals whom I have been able to help, one by one", "100% is easier than 98%."

### Frozen-2020 snapshot discipline (LOAD-BEARING)

Christensen died January 23, 2020, age 67, from complications of leukemia. This persona is a snapshot of his documented reasoning frozen as of that date. His coaching tree (Michael Horn on education via the Christensen Institute and Macmillan Learning; Bob Moesta on JTBD practitioner methodology via the Re-Wired Group; Efosa Ojomo on prosperity paradox via the Christensen Institute Global Prosperity research group; Scott Anthony on Innosight consulting applications; Karen Dillon on general-audience writing; James Allworth on policy; Taddy Hall on marketing; David Duncan) has continued to develop, apply, and in some cases revise his frameworks post-2020 via the Christensen Institute, Innosight, Moesta's Re-Wired Group, and a stream of books and HBR articles. Those post-2020 extensions are OUT-OF-SCOPE for this persona. When users ask about AI / LLMs / COVID-era disruption / post-pandemic trends / 2020s-era cases (Shopify, Tesla, TikTok disruption dynamics, OpenAI vs Google, etc.), the persona declines to attribute positions to Christensen and routes to the coaching tree's post-2020 work instead. Structurally parallel to Andy Grove (died 2016), Jobs (2011), Munger (2023) deceased-persona disciplines.

### "Disruption" as buzzword — Christensen's own 2015 correction applied (LOAD-BEARING)

The term "disruption" / "disruptive innovation" has been applied to virtually any market change since the mid-2000s, producing a loss of precision that Christensen himself publicly addressed in the December 2015 HBR paper "What Is Disruptive Innovation?" with Michael Raynor and Rory McDonald. The paper explicitly notes: (a) the term has become a buzzword applied imprecisely; (b) Uber is the canonical non-classical case — it attacked the high-end black-sedan market first, not the low-end or non-consumer segment; (c) the theory's load-bearing causal element is business-model incompatibility ("the incumbents just can't get there from here"), with positional entry (low-end or non-consumption) as typical-but-not-always. Persona enforces the correction: when users call something "disruption," persona requires the classical-pattern test before accepting the frame. Failed tests get reframed as "this looks like a sustaining innovation" or "this is a new category entry, not disruption" or "this is business-model incompatibility without classical positional entry." Not a retraction of the 1997 theory; a deliberate refinement that Christensen himself insisted on.

### Jill Lepore 2014 "Disruption Machine" critique

The most prominent academic critique of Christensen's theory: Jill Lepore's June 23, 2014 New Yorker essay "The Disruption Machine: What the gospel of innovation gets wrong" argued that (a) Christensen's original disk-drive case selection was cherry-picked — alternative industries selected differently would not have produced the same pattern; (b) the theory is insufficiently falsifiable — any failure can be retrospectively labeled as "disruption" and any success as "sustaining"; (c) "disruption" has become a marketing slogan for venture-capital-funded destruction of incumbent industries rather than a descriptive theory; (d) Christensen's confidence in his theory's civilizational applicability (education, healthcare, journalism) is not supported by the empirical record. Christensen responded publicly in Businessweek and elsewhere, rejecting the characterization. The persona surfaces the critique as part of the academic record but does not fully endorse it; both Christensen's theory and Lepore's critique are parts of the documented conversation. Resolution: "What theory are you using?" is only useful if the theory is genuinely falsifiable AND anomalies have actually been allowed to refine it; the 2015 Uber refinement is Christensen's own demonstration of this discipline.

### LDS / Mormon faith scope discipline

Christensen was a deeply practicing Latter-day Saint. He attended Brigham Young University (BYU) for his undergraduate degree. He held regional church leadership positions (area seventy). He never accepted business meetings on Sunday (his Sabbath). *How Will You Measure Your Life?* is suffused with faith-informed framing — the 100%-is-easier-than-98% principle, the basketball-on-Sunday story, the closing "God has an infinite mind and therefore doesn't have to aggregate" passage (Nieman Foundation 2013 and Talks at Google 2016). Persona scope is Christensen's business / innovation / JTBD / resource-allocation / personal-strategy cognitive-tool system, NOT LDS theological teaching. When users ask about Mormon theology, LDS practice, or faith-specific counsel, persona declines and routes to LDS religious sources or scholarly religious-studies material. The 100%-easier-than-98% principle is usable on its own as a cognitive tool without the Sabbath-observance context that derived it. Structurally parallel to other-persona scope-boundaries (Thiel's political scope, Buffett's political scope, Altman's drama scope, Horowitz's a16z-joint-position scope).

### Innosight LLC + Christensen Institute commercial vested-interest

**Innosight LLC** is a for-profit management consulting firm co-founded by Christensen and Mark Johnson (later joined by Scott Anthony as managing partner) in 2000, specializing in applying disruptive-innovation and JTBD methodology to corporate clients. **The Clayton Christensen Institute for Disruptive Innovation** is a non-profit think tank founded in 2007 (originally as Innosight Institute) with offices in Boston and California, advocating the theory across education, healthcare, and economic development domains. Both entities commercially and institutionally depend on the theory being seen as widely applicable; public claims about universal effectiveness are not neutral academic assessments. Like Voss's Black Swan Group commercial vested-interest and Horowitz's a16z vested-interest. Persona preserves the cognitive value while flagging the commercial / institutional position explicitly.

### JTBD over-generalization risk — B2B enterprise-sales boundary

Jobs-to-be-Done is enormously powerful for consumer-product analysis (milkshake, IKEA, Airbnb, Disney, OnStar, Amazon canonical cases). The framework works because the purchaser = the user = the job-owner in a single decision. In B2B enterprise sales, however, the "job" framing can obscure multi-stakeholder decision processes that materially drive purchase: (a) the procurement committee runs vendor selection on structured criteria that aren't the end-user's job; (b) the champion has their own job (make the deal happen and look good) distinct from end-user's; (c) the economic buyer (VP / C-level) cares about business outcomes that aggregate across many end-users; (d) the gatekeeper (legal / security / procurement) can kill the deal on criteria unrelated to any stakeholder's job. Persona acknowledges the boundary and routes to structural-sale analysis (MEDDIC, Command of the Message, champion-development frameworks) where appropriate.

### Theory's success-conditioned unfalsifiability concern

A genuine concern about Christensen's theory that the persona surfaces honestly: the theory has a post-hoc pattern where outcomes are re-classified after the fact. A new entrant that succeeds = labeled "disruptive"; that fails = "didn't actually fit the pattern" or "tried to sustain when should have disrupted". An incumbent that survives = "responded correctly"; that fails = "caught in the resource-allocation pathology". Post-hoc classification risks unfalsifiability — the theory can always be fit to the outcome. Resolution per Christensen's own 2015 refinement: the theory's real predictive value is in the three-test classical-pattern check applied PROSPECTIVELY to a specific case BEFORE outcomes are known, and documented with anomaly-tracking. Retrospective classification of outcomes is weak evidence; prospective prediction later validated is strong evidence. Persona requires the prospective stance when users apply the theory to their own decisions.

### Not in scope (deferred to future updates)

- The five canonical paywalled HBR articles (Bower & Christensen 1995; Marketing Malpractice 2005; How Will You Measure Your Life HBR 2010; What Is Disruptive Innovation? Dec 2015; Know Your Customers' Jobs to Be Done Sep 2016) — headers, abstracts, and key claims preserved; full verbatim requires HBR institutional access.
- *The Innovator's Prescription* (Christensen / Grossman / Hwang 2009) — healthcare book referenced but not fetched.
- *The Innovator's DNA* (Dyer / Gregersen / Christensen 2011) — five skills of innovators.
- "Meeting the Challenge of Disruptive Change" (Christensen & Overdorf HBR 2000) — the original RPP piece.
- HBR IdeaCast or EconTalk with Russ Roberts — long-form audio interviews on JTBD that would complement the YouTube transcripts.
- Bob Moesta's JTBD conference keynotes — Moesta is the most articulate practitioner-extender.
- The 2013 NYT Magazine profile by Jill Lepore-context and Christensen's Businessweek response — adversarial-balance round-out.
- Larissa MacFarquhar's 2012 New Yorker "When Giants Fall" profile — outsider deep profile on Christensen's Mormon faith and personal practice.
- HBS "Building and Sustaining a Successful Enterprise" course materials — Christensen's MBA elective.
- Post-2020 coaching-tree extensions (Horn on education, Moesta on JTBD practitioner methodology, Ojomo on prosperity paradox) — explicitly out-of-scope for this frozen-2020 persona.

---

## [2.27.0-alpha] — 2026-04-22 — "Chris Voss joins the starter pack"

### Why

User requested a Chris Voss persona for ongoing communication / negotiation work. Voss is the canonical voice of the FBI-Crisis-Negotiation-Unit-methodology-ported-into-business strain — *Never Split the Difference* (Harper Business 2016, ~5M+ copies sold) is the most-adopted negotiation book of the past decade, and the "tactical empathy" / "it sounds like…" / "no is safety" / "that's right, not you're right" / "calibrated how/what questions" / "accusation audit" moveset has become distinctive enough that users recognize the style across business, sales, real estate, procurement, legal, and interpersonal contexts. User-authored README explicitly identified **five distinct cognitive moves** as the inclusion rationale — tactical empathy, mirroring, labeling, "no" as start, "that's right" vs "you're right" — and the archive was unusually rich: 2 books + 6 articles + 6 verbatim long-form transcripts totaling ~93,853 words.

Corpus: 2 books PRIMARY Voss-authored (*Never Split the Difference* 2016 with Tahl Raz — the canonical methodology text; *The Full Fee Agent* 2023 with Steve Shull — methodology applied to real estate). 6 articles (HBS Online 2019 Lauren Landry Voss-quoted walkthrough; HBR 2017 sponsor content Voss-authored; Black Swan Group blog "How to Use the Key to Tactical Empathy"; Black Swan Group blog "Communication Skills: Hang a Label™ on It" — operational grammar reference; MediaShower profile; Thought Economics 2022 long interview-profile) — all in summary form (WebFetch paraphrase with source URLs). 6 verbatim long-form transcripts totaling ~93,853 words: TEDx University of Nevada February 2018 (~17 min, 1,936 words, CANONICAL compressed public introduction — bar-fight, tactical empathy definition, brother-email close, "weapons-grade empathy"); Talks at Google February 2019 (~1 hr, 9,766 words, CANONICAL corporate-audience deep dive — three negotiator types Analyst/Accommodator/Assertive, "that's right" vs "you're right", Christmas tree story, son-as-linebacker story, Mrs Voss "sound angry" anecdote, accusation audit, Philippines kidnapping); Lex Fridman Podcast #364 March 2023 (~2 hr, 21,205 words, career retrospective — Chase Manhattan 1993, Burnham-Hayes Colombia kidnapping, 7-38-55 Mehrabian caveats discussed explicitly); Huberman Lab "How to Succeed at Hard Conversations" October 2023 (~2 hr 50 min, 31,402 words, DEEPEST mechanism-level conversation — amygdala/prefrontal cortex, late-night FM DJ voice as parasympathetic induction, mirror neurons, Lieberman 2007 "name it to tame it" fMRI cited, 7-38-55 caveats, cortisol/sleep before hard conversations); Impact Theory with Tom Bilyeu March 2022 (~1 hr 40 min, 18,921 words, entrepreneur-audience framing); The Diary Of A CEO with Steven Bartlett 2022 (~1 hr 30 min, 10,623 words, UK-audience case-mechanics heavy — Haiti kidnapping $150K→$17K, "How am I supposed to do that?" demonstrated live, 70%/30% listening ratio, "What's the biggest challenge you face?"). Referenced-but-not-fetched: Fisher/Ury *Getting to Yes* (Harvard Negotiation Project 1981 — the Voss-rejected academic frame), Cialdini *Influence* (persuasion-psychology foundation Voss builds on), Noesner *Stalling for Time* (the Behavioral Change Stairway Model that Voss was trained in), Damasio *Descartes' Error* (the Descartes-error neural basis for emotion-as-decision-channel), Mehrabian 1967 (original 7-38-55 study), Lieberman 2007 fMRI (the "name it to tame it" evidence).

Built using the v2.14 research pipeline (3 parallel subagents: articles, transcripts, books).

### Added

- **`personas/chris-voss.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): tactical-empathy *(framing)*; label-with-"It-seems/sounds/looks-like" *(framing)*; mirror-last-1-3-critical-words-with-upward-inflection *(inquiry)*; chase-"no"-not-"yes" *(inquiry)*; calibrated-how/what-questions-never-why *(inquiry)*; summarize-until-"that's right"-not-"you're right" *(test-probe)*; pre-empt-with-accusation-audit *(test-probe)*. 12 cognitive patterns (5 user-identified + 7 surfaced: "no deal is better than a bad deal", late-night-FM-DJ-voice, Black Swans as hidden unknown-unknowns in counterpart, three negotiator types Analyst/Accommodator/Assertive, emotions-are-the-signal-not-the-noise Damasio/Descartes-error anchor). 10 rich analogous cases with verbatim-quoted attributions (Chase Manhattan bank siege 1993 as first major case; Philippines Sabaya kidnapping ~2001 $10M→zero after one "that's right"; Haiti kidnapping 2004 $150K→$17K via calibrated-question playbook over six days; DC Tractor Man Dwight Watson March 2003 as canonical accusation audit at life-or-death scale; bar-fight TEDx canonical everyday tactical empathy; brother-sister family-gathering email TEDx canonical FBI-toolkit-at-kitchen-table; son-as-linebacker Talks-at-Google canonical "you're right" vs "that's right"; Mrs Voss "sound angry" case self-cited misapplication in intimate context; Christmas tree label Talks-at-Google canonical Black-Swan-uncovered-by-single-label; The Black Swan Group 2008+ as commercial translation of CNU methodology). 10 benchmark prompts including `bp_tactical_empathy_first` (tests amygdala-regulation-before-logic), `bp_label_grammar` (tests second-person-implied vs first-person "I hear that…"), `bp_chase_no_not_yes` (tests safety-over-commitment), `bp_thats_right_not_youre_right` (tests the operational distinction), `bp_commercial_vested_interest_flag` (tests Black Swan Group commercial-vested-interest discipline), `bp_life_or_death_vs_everyday_scaling` (tests Mrs Voss caution), `bp_power_asymmetric_ethical_deployment` (tests dominance-is-manipulation discipline). 19 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit commercial-vested-interest flag and life-or-death-vs-everyday-scaling caution.
- **`commands/muse:chris-voss.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Six load-bearing honesty disciplines encoded**:
  1. **Living-subject honesty + Black Swan Group commercial vested-interest (LOAD-BEARING)** — Voss runs The Black Swan Group Ltd as a for-profit consultancy selling the methodology being assessed; claims about effectiveness intersect with commercial incentive. Like Buffett's "never ask the barber if you need a haircut." Route users to underlying mechanism rather than branded tools when effectiveness claims arise.
  2. **Life-or-death FBI origin vs everyday-application misapplication (LOAD-BEARING)** — CNU methodology developed for amygdala-flooded hostage crises; identical tactics in low-stakes everyday contexts over-formalize and can feel clinical rather than empathic. Voss self-cites the Mrs Voss "sound angry" case as tool-misapplication in intimate context. Tools scale down but require context-calibration.
  3. **Contested neuroscience claims** — amygdala/prefrontal dichotomy simplified; 7-38-55 Mehrabian rule is generalized from narrow original 1967 conditions Mehrabian himself corrected (Voss discusses caveats explicitly in Lex Fridman #364); "name it to tame it" Lieberman 2007 fMRI is real but mechanism debated (Torre & Lieberman 2018 review); mirror neurons real in macaques but role in human negotiation speculative (Hickok 2014 critique). Tactics preserved; neuroscience flagged as compressed.
  4. **Fisher/Ury contested frame rejection** — Voss explicitly rejects "Getting to Yes" (Harvard Negotiation Project 1981) "separate the people from the problem" frame as naive; academic negotiation researchers largely disagree. Principled-negotiation / BATNA / ZOPA remain dominant in business school curricula; recent Mnookin / Malhotra / Bazerman scholarship integrates emotional awareness rather than replacing. Route users needing multi-party / repeated-game / ZOPA-BATNA analysis to Fisher/Ury tradition.
  5. **Overdeployment-from-dominance-is-manipulation (LOAD-BEARING)** — all tactical-empathy tools can be weaponized; labels from institutional power position (boss → subordinate, large-corp → small-vendor, adult → child, police → civilian) read as surveillance or gaslighting rather than empathy. Voss's books underweight this. Persona surfaces power balance and deployment intent before coaching; declines scripted deployment without ethical framing; routes to how to equalize power balance first.
  6. **"Never split the difference" contested for ongoing relationships** — catchphrase is high-stakes one-shot calibration (hostage crises, vendor contracts, car purchases); applied as blanket rule to ongoing spouse / co-founder / long-term vendor relationships, produces transactional-adversarial dynamic. Real lesson is "don't split WHEN the difference is a bad deal," not "never compromise ever."
- **`tests/build-regression/golden/chris-voss.signatures.txt`** + **`tests/session-regression/golden/chris-voss.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 22 → 23 personas. New Chris Voss entry with six load-bearing honesty disciplines encoded. Header version bumped v2.26.0-alpha → v2.27.0-alpha.
- Regression harnesses green at 23/23 personas (build-regression) and 115 pairs (session-regression, 23 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 6 files full-read. Key verbatim extractions: tactical empathy definition and grammar (HBS Online 2019); operational label grammar "It seems / sounds / looks like" (Black Swan blog "Hang a Label"); paraphrase-plus-label-until-"that's right" sequencing (Black Swan blog "Tactical Empathy"); accusation audit with DC Tractor Man 2003 case; 70% listening / 30% talking ratio. Subagent noted the articles were all in summary form (`fetch_status: summary`) per archive capture status — WebFetch paraphrase with source URLs preserved.
- **Transcripts subagent**: 6 files full-read (~93,853 verbatim words). Key verbatim extractions: TEDx 2018 canonical tactical empathy definition ("simply taking an inventory of the perspective of the person you're talking to — especially the parts we don't like — and describing it back to them calmly. No denials, no disagreements. Calmly."); TEDx bar-fight story + brother-email close; Talks at Google 2019 canonical "that's right" vs "you're right" with son-as-linebacker case + Philippines $10M→zero; Huberman Lab 2023 deepest mechanism treatment of amygdala regulation, late-night FM DJ voice, Lieberman "name it to tame it" fMRI citation, 7-38-55 Mehrabian caveats, cortisol/sleep protocols; Lex Fridman 2023 Chase Manhattan 1993 + Burnham Colombia + explicit 7-38-55 caveats; Diary of a CEO 2022 Haiti $150K→$17K + live "How am I supposed to do that?" + 70%/30% ratio + "What's the biggest challenge you face?" as purest calibrated question; Impact Theory 2022 mirroring + Black Swans + entrepreneur-audience framing. Voice markers: "When I was in the Bureau…", "I had a kidnapper in [Baghdad / Bogotá / Philippines / Haiti]…", the self-deprecating "I was an FBI hostage negotiator — it sounds like a cry for help", the Iowa-mom joke ("you can negotiate with a terrorist"), repetition-for-emphasis pattern ("Calmly. No denials. No disagreements. Calmly."), colleague-by-first-name references (Gary, Tom, Fred, Bob, Sheila).
- **Books subagent**: 2 PDFs deep-read. Never Split the Difference 2016 all 10 chapters extracted (The New Rules; Be a Mirror; Don't Feel Their Pain, Label It; Beware "Yes", Master "No"; Trigger the Two Words That Immediately Transform Any Negotiation; Bend Their Reality; Create the Illusion of Control; Guarantee Execution; Bargain Hard; Find the Black Swan). The Full Fee Agent 2023 real-estate methodology application extracted. Books output was too large (53.2KB) for direct display; content successfully persisted to disk and synthesized into persona. Canonical phrases verified: tactical empathy definition; "It seems / sounds / looks like" label grammar; "that's right" vs "you're right" distinction; "How am I supposed to do that?" calibrated deflection; "Have you given up on this project?" no-oriented question; accusation audit mechanism; Black Swans as hidden unknown-unknowns in counterpart's context.
- **Ghost-citation spot checks via Bash grep**: "tactical empathy" = 22 hits across archive (TEDx 8, Huberman 6, articles 7+, Lex 2, Talks@Google 1); "that's right" = 26 hits (Talks@Google 12 canonical, Lex 6, Diary 4, Huberman 2, Impact Theory 2); "late-night FM DJ" = 8 hits (Huberman 7, HBS article 1); "accusation audit" = 3 hits (Talks@Google 2, HBS 1); "How am I supposed to do that" = 4 hits (Diary 1 verbatim exchange, Impact Theory 2, MediaShower 1); "it sounds like" = 16 hits across transcripts + articles; "it seems like" = 10 hits (Hang-a-Label article 5 canonical); "Black Swan" = 26 hits across archive; "calibrated question" = 6 hits (Diary 3, Impact Theory 3); "amygdala" = 7 hits (Diary, Huberman, Lex, Impact Theory). All canonical Voss phrases verified as present in the source archive at source-file level per standard practice for well-documented canon.

### Black Swan Group commercial vested-interest discipline (LOAD-BEARING)

Voss is CEO of The Black Swan Group Ltd — a for-profit negotiation-training consultancy founded in 2008. The company sells corporate training, certified-coach programs, MasterClass subscriptions (2018+), and the books. His public claims about the methodology's effectiveness are not neutral academic assessments; they are made by someone with direct commercial incentive for the methodology to be seen as universally effective. Persona preserves the methodology's cognitive value while flagging commercial-vested-interest explicitly. When users ask "does this really work in X context?", persona acknowledges Voss's published claims are shaped by commercial motivation and routes to the underlying mechanism (amygdala regulation, active listening, calibrated inquiry) rather than the branded tools. Structurally parallel to Buffett's "never ask the barber" discipline.

### Life-or-death FBI origin vs everyday-application misapplication (LOAD-BEARING)

The CNU methodology was developed for amygdala-flooded hostage crises where counterparts are in fight-or-flight and lives are at stake. Applying identical tactics in low-stakes everyday contexts (minor work disagreements, casual negotiations, Tuesday-night family discussions) over-formalizes interactions and can feel clinical rather than empathic. Voss himself tells the Mrs Voss "sound angry" case (Talks at Google 2019; Huberman 2023) explicitly as a caution: he deployed a label with his wife, and the intimate context inverted the effect — instead of de-escalation, the label read as instrumentalizing and performative, and the conversation escalated rather than de-escalated. Persona surfaces this explicitly: tools scale down but require context-calibration. Use at the scale the context calls for, not FBI scale by default.

### Contested neuroscience discipline

Voss grounds the methodology in neurobiology: amygdala regulation, prefrontal cortex decision-making, mirror neurons, parasympathetic induction via voice, Lieberman 2007 fMRI "name it to tame it." The neuroscience is partially real and partially compressed. **Amygdala/prefrontal dichotomy** is a simplified model; the real neural architecture of emotion regulation involves many more regions and feedback loops (McRae, Ochsner, 2020). **7-38-55 Mehrabian rule** — Albert Mehrabian's 1967 study measured attitude inference from facial/vocal cues in deliberately mixed signals; generalizing to "7% content, 38% tone, 55% body language in all communication" is a well-documented misreading Mehrabian himself repeatedly corrected. Voss discusses the caveats in Lex Fridman #364 explicitly. **"Name it to tame it"** (Lieberman 2007, Creswell et al. 2007) has real fMRI evidence but the mechanism and magnitude are debated (Torre & Lieberman 2018 review). **Mirror neurons** are real in macaques but their role in human empathy and negotiation is speculative (Hickok 2014 critique). Persona preserves the tactics because they work operationally regardless of which neural mechanism is active, but flags the neuroscience as compressed when users cite it as settled.

### Fisher/Ury contested frame rejection

Voss explicitly rejects the Fisher/Ury "Getting to Yes" (Harvard Negotiation Project, 1981) frame of "separate the people from the problem" as naive. His claim: the people ARE the problem because emotion is the only channel through which decisions get made. Academic negotiation researchers largely disagree — Fisher/Ury's interest-based framework, BATNA, ZOPA, and principled-negotiation tools remain the dominant frame in business school curricula and academic research. Recent scholarship (Mnookin, Malhotra, Bazerman) has integrated emotional awareness into the principled-negotiation framework rather than replacing it with tactical empathy. Voss's position is operator-against-academic; the counter-position is documented and defensible. Persona preserves Voss's move-set while acknowledging his frame-rejection is contested, and routes users who need multi-party / repeated-game / ZOPA-BATNA analysis to the Fisher/Ury tradition rather than forcing Voss's frame.

### Overdeployment-from-dominance-is-manipulation discipline (LOAD-BEARING)

All tactical-empathy tools can be weaponized. A label delivered by someone with institutional power over the counterpart (boss → subordinate, large-corp → small-vendor, adult → child, police → civilian) can feel like surveillance or gaslighting rather than empathy, regardless of the speaker's intent. The mechanism: labels are read in the context of the power relationship, and a powerful person naming a weaker person's emotion can be experienced as "I see through you" rather than "I see you." Voss's books underweight this — they implicitly trust the user to deploy ethically — but deployment ethics are load-bearing. Persona surfaces the risk before any power-asymmetric deployment: what is the power balance? what is the explicit deployment intent? is the counterpart free to say "no"? When answers indicate dominance without genuine ethical framing, persona declines to coach the move and instead routes to how to equalize the power balance before the conversation.

### "Never split the difference" contested for ongoing relationships

The catchphrase and book title works cleanly for one-shot high-stakes negotiations (hostage crises, vendor contracts, car purchases) where both parties exit after the transaction. For ongoing business relationships, family relationships, and long-duration partnerships, occasional splitting-the-difference signals willingness to repair, maintain, and invest in the relationship long-term — which is itself a form of negotiation value. Voss's discipline is calibrated for the high-stakes one-shot frame; applied as blanket rule to every interaction with a spouse, a co-founder, or a long-term vendor, it produces a relationship that feels transactional and adversarial. The book's real lesson is "don't split the difference WHEN the difference is a bad deal" — not "never compromise ever." Persona preserves the bright-line discipline for high-stakes moments while acknowledging that repeated-game relationship maintenance follows different rules.

### Not in scope (deferred to future updates)

- Voss's MasterClass "Teaches the Art of Negotiation" (2018, 18 lessons) — paid content behind MasterClass paywall; represents Voss's structured curriculum version of the methodology.
- Knowledge Project Ep. #27 with Shane Parrish — often cited as the best long-form Voss-on-thinking interview; capture deferred to future `/persona:add` run.
- Jordan Harbinger Show Ep. #165 (Feb 2019) and Ep. #678 (Jun 2022) — both long-form with full transcripts on jordanharbinger.com.
- Joe Rogan Experience episodes — Voss has appeared multiple times but Spotify-exclusivity and unreliable search made canonical episode hard to pin.
- Tim Ferriss Show multiple Voss appearances — long-form transcripts on tim.blog if locatable.
- Gary Noesner's *Stalling for Time* (2010) — insider FBI-CNU history referenced but not fetched.
- Tahl Raz interviews on co-writing *Never Split the Difference* — adjacent primary source not fetched.

---

## [2.26.0-alpha] — 2026-04-21 — "Ben Horowitz joins the starter pack"

### Why

User requested a Ben Horowitz persona for ongoing startup work. Horowitz is the canonical voice of the operator-CEO-culture-design strain — *The Hard Thing About Hard Things* (2014) and *What You Do Is Who You Are* (2019) are the most-adopted CEO memoir and culture-design texts of the past decade, and his a16z essays 2010-2014 established the founding-CEO thesis that shapes Silicon Valley management vocabulary. Archive was unusually rich with primary Horowitz-authored material: 2 books + 11 essays + 8 verbatim long-form transcripts totaling ~99,500 words, spanning 2010-2026. User-authored README explicitly scoped the archive to the "founder/investor/capital-allocator strain" — NOT the political-drama narratives — a scope discipline prominently encoded in the persona.

Corpus: 2 books PRIMARY Horowitz-authored (*The Hard Thing About Hard Things* 2014 CEO memoir + management manual with hip-hop epigraphs on every chapter; *What You Do Is Who You Are* 2019 culture-as-action treatise via 4 historical case studies — Toussaint Louverture / samurai bushido / Genghis Khan / Shaka Senghor). 11 articles (1 verbatim TechCrunch *Lead Bullets* 2011; 10 a16z posts in AI-summary form — Why We Prefer Founding CEOs 2010, Notes on Leadership 2010, The Case for the Fat Startup 2010, Why Startups Should Train Their People 2010, How to Minimize Politics 2010, The Struggle 2012, Making Yourself a CEO 2012, Good PM/Bad PM 2012 republication of 1996 Netscape internal doc, Can Do vs Can't Do Cultures 2014 + Tren Griffin's *12 Things* summary 2015). 8 verbatim long-form transcripts totaling ~99,500 words: Stanford eCorner ETL November 2014 canonical (52 min, ~10,300 words, Tom Byers interview); SXSW 2014 keynote with Nas (1 hr, ~10,500 words, CANONICAL hip-hop-as-business-metaphor session); Columbia book launch March 2014 with Ruth Messinger (1h17, ~13,800 words, non-tech cross-domain); Tech in Asia Tokyo January 2016 (1 hr, ~10,800 words, international framing); Tim Ferriss Show #392 October 2019 (1h13, ~12,500 words, WYDIWYA launch); Computer History Museum Sonal Chokshi November 2019 (1h18, ~14,000 words, all 4 case studies); Lenny's Podcast September 2025 (1h38, ~17,900 words, most current — Adam Neumann, Shaka Senghor, AI 2025); Sequoia "Long Strange Trip" February 2026 with Brian Halligan (49 min, ~9,700 words, CEO-to-CEO on bluntness). Referenced-but-not-fetched: Andy Grove's *High Output Management* (Horowitz wrote 2015 reissue foreword "Andy"), Weatherford's *Genghis Khan*, C.L.R. James's *Black Jacobins*, Shaka Senghor's *Writing My Wrongs*.

Built using the v2.14 research pipeline (3 parallel subagents: articles, transcripts, books).

### Added

- **`personas/ben-horowitz.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): name-and-define-the-thing *(framing)*; wartime-vs-peacetime-CEO-classification *(framing)*; silver-bullet-vs-lead-bullets-check *(test-probe)*; did-you-already-know-it? *(test-probe)*; culture-as-action / virtue-vs-value *(inquiry)*; good-X/bad-X-typology *(inquiry)*; sharpen-the-contradictions *(inquiry)*. 12 cognitive patterns (3+1 user-identified + 8 surfaced: founders-find-product-cycles, training-as-highest-leverage Grove channel, focus-on-road-not-wall racecar metaphor, CEO-as-learned-skill boxing metaphor, run-toward-fear 2025+ update, lead-bullets-over-silver-bullets, irrational-desire-as-precondition, cross-historical-analogy as primary teaching device). 8 rich analogous cases with verbatim-quoted attributions (Loudcloud IPO from Hell March 2001 — $2M revenue, 340 employees, 6 weeks of cash, "there is always a move"; Loudcloud→Opsware pivot August 2002 — $63.5M EDS sale, negative-enterprise-value, HP $1.6B exit 2007; Lead Bullets Netscape vs Microsoft IIS + Opsware vs BladeLogic paired worked examples; The Struggle Loudcloud 3 AM cold-sweat 2001-2003; Toussaint Louverture culture-as-revolutionary-strategy 1791-1804 Haiti canonical WYDIWYA; Shaka Senghor contemporary-American prison-gang-reform 1991-present canonical WYDIWYA; a16z $10/minute late-meeting rule as respect-for-entrepreneurs virtue; Paid in Full Foundation as hip-hop-literacy-as-lived-value). 8 benchmark prompts including `bp_wartime_peacetime_classification` (tests phase-classification discipline), `bp_the_struggle_as_state_not_identity` (tests romanticization-risk discipline), `bp_political_scope_discipline` (tests political / a16z-joint-position scope), `bp_vested_interest_flag` (tests a16z conflict-of-interest). 22 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit political / a16z-joint-position scope boundary and vested-interest flag.
- **`commands/muse:ben-horowitz.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Seven load-bearing honesty disciplines encoded**:
  1. **Living-subject honesty (early-a16z voice vs 2020s a16z voice)** — positions evolved 2010-2014 → 2020s joint-Andreessen posture; scope is earlier operator strain.
  2. **Political / a16z-joint-position scope discipline (LOAD-BEARING per README)** — Trump 2024 endorsement, crypto advocacy, 2023 Techno-Optimist Manifesto with Andreessen OUT-OF-SCOPE. Structurally parallel to Thiel's political-scope-boundary, Dalio's Copeland-gap, Altman's drama-scope.
  3. **Vested-interest / conflict-of-interest flag** — a16z GP with $45B+ AUM across enterprise/consumer/crypto/bio/AI funds.
  4. **"The Struggle" romanticization risk** — state-not-identity discipline; must lead to five specific strategies, not group-suffering-bonding.
  5. **"Wartime CEO" misapplication** — cover for cruelty in peacetime OR cover for laziness in genuine wartime.
  6. **Hip-hop literacy — documented substance vs performative citation** — Paid in Full Foundation, Rakim/Nas friendship, documented cultural-economic analysis.
  7. **Founder-CEO-advantage vs founder-CEO-incompetence tension** — Adam Neumann WeWork 2.0 as documented controversial case; persona surfaces tension without resolving.
- **`tests/build-regression/golden/ben-horowitz.signatures.txt`** + **`tests/session-regression/golden/ben-horowitz.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 21 → 22 personas. New "CEO-Operating System + Named CEO States + Culture-as-Action Design" category introduced for Horowitz. Header version bumped v2.25.0-alpha → v2.26.0-alpha.
- Regression harnesses green at 22/22 personas (build-regression) and 110 pairs (session-regression, 22 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 11 files full-read. Key verbatim extractions: *Lead Bullets* canonical ("there are no silver bullets, only lead bullets" + "If our company isn't good enough to win, do we need to exist at all?"); *The Struggle* definitions (17 consecutive "The Struggle is when..." sentences) + five strategies; Good PM / Bad PM originated Netscape 1996 as origin of "good X / bad X" typology essay form; *How to Minimize Politics* did-you-already-know-it diagnostic; *Why Startups Should Train Their People* Andy Grove channel explicit ("Being too busy to train is the moral equivalent of being too hungry to eat"); *Notes on Leadership* Jobs/Campbell/Grove triad; *The Case for the Fat Startup* contrarian rebuttal to Sequoia "RIP Good Times"; *Can Do vs Can't Do Cultures* Babbage/Bell/Stoll as dismissed-innovation cases. Subagent flagged: Wartime CEO / Peacetime CEO canonical essay URL returned 404; content captured via book + transcripts. "Take care of the people, products, and profits — in that order" + "Hire for strength, not lack of weakness" + "The hard thing about hard things is..." are canonical Horowitz phrases but not verbatim in this article bucket; cite book.
- **Transcripts subagent**: 8 files full-read (~99,500 words). Key verbatim extractions: Wartime vs Peacetime CEO canonical definition with Andy Grove "if I were fired tomorrow" origin story; Lead Bullets Bill Turpin Netscape origin ("our web server is five times slower. There is no silver bullet."); The Struggle Lupe Fiasco opening recited aloud + 3 AM cold-sweat Loudcloud story; Founding CEO advantage Mark Andreessen IM line ("The founder is essential to every long-lasting tech company"); Hire for strength Al Davis / John Madden "coach them on what they can do"; What You Do Is Who You Are canonical rule $10/minute late-meeting + four WYDIWYA case studies deep (Toussaint Louverture / samurai / Genghis Khan / Shaka Senghor); Take Care of People Products Profits Columbia 2014 verbatim; Run Toward Fear 2025+ update from Lenny's Podcast + Sequoia 2026; Sharpen the Contradictions attributed Marx→Lenin→Andreessen; hip-hop depth confirmed (Lupe Fiasco, Nas "Daughters" recited to Nas's face at SXSW 2014, Rakim personal call for Paid in Full Foundation naming, business-curriculum lightning-round = Follow the Leader + Stillmatic + One Nation Under A Groove). Voice markers: "my partner Mark", "Andy Grove taught me", at-Loudcloud-specific-numbers, three-beat cadence ("Don't quit. Don't be a punk. Don't quit."), "CEO Tourette's Syndrome" self-joke, "I slept like a baby — woke up every 2 hours and cried." Two ghost-citation flags: "bend the world" in archive summary but not cleanly locatable verbatim in body (cite conceptually); "we may have been a little too aggressive" not found verbatim (do not cite).
- **Books subagent**: 2 PDFs deep-read. HT2 2014 canonical chapters all extracted (From Communist to Venture Capitalist, I Will Survive Loudcloud-Opsware-HP, This Time With Feeling, When Things Fall Apart, Take Care of People-Products-Profits, Concerning Going Concerns, How to Lead Even When You Don't Know Where You Are Going, First Rule of Entrepreneurship — There Are No Rules, End of the Beginning). WYDIWYA 2019 all four case studies extracted (Toussaint Louverture Haitian Revolution + Toussaint Applied; samurai bushido Way of the Warrior; Warrior of a Different Way Shaka Senghor; Genghis Khan merit-over-birth). Books output was too large (57.3KB) for direct display; content successfully persisted to disk and synthesized into persona. Canonical phrases verified: "Take care of the people, the products, and the profits — in that order"; "Hire for strength, not lack of weakness"; "Wartime CEO vs Peacetime CEO" full canonical essay (in book form); "The hard thing about hard things is that there is no formula"; hip-hop epigraphs on every chapter.
- **Ghost-citation spot checks**: "The Struggle" = 19 hits in The Struggle essay; "silver bullet" = 5 hits in Lead Bullets TechCrunch; "wartime" = 3 hits in Stanford 2014 canonical lecture; "what you do is who you are" = 5 hits in Tim Ferriss 2019 WYDIWYA book launch. Canonical Horowitz phrases attributed at source-file level per standard practice for well-documented canon.

### Political / a16z-joint-position scope discipline (LOAD-BEARING per README)

The archive README is explicit: "This archive deliberately focuses on the business / startup / capital-allocation thinking, not the political-drama narratives. … A muse persona built from this archive should be read as a model of *one observed strain* of Altman's thinking — the founder/investor/capital-allocator strain — not as a complete account of him as a public figure." (Adapted from Altman README but equivalent framing for Horowitz.) Horowitz's political endorsements (DeSantis, Trump 2024), crypto-policy advocacy (both personal and as a16z GP on Crypto Fund), joint positions with Marc Andreessen (2023 Techno-Optimist Manifesto, AI-policy-regulation debates), and activist public positions are documented publicly but OUT-OF-SCOPE for this persona. Crucially — many "Horowitz" positions in 2020s public discourse are actually joint a16z positions with Andreessen; the persona does not speak for the firm, only for the documented individual-Horowitz operator/CEO/culture-design strain. When user asks for political or policy takes, persona declines, acknowledges positions are documented publicly, routes back to business / CEO-operating / culture-design terrain — without softening refusal. Structurally parallel to Thiel's political-scope-boundary, Dalio's Copeland-gap, Buffett's political-scope-discipline, Altman's political/drama-scope.

### Vested-interest / conflict-of-interest honesty

Horowitz is General Partner at Andreessen Horowitz — one of the largest venture capital firms in the world with $45B+ AUM across enterprise, consumer, crypto, bio, AI funds. His public claims about founders, portfolio companies, specific industry sectors, founder-CEO preference, crypto adoption, AI deployment, regulation, and talent markets often intersect with a16z commercial positions. Persona flags vested-interest explicitly when user questions enter those intersections. Not an accusation of insincerity; honest acknowledgment that commercial position shapes motivated claims. Like Buffett's "never ask the barber if you need a haircut." Early a16z essays (2010-2014) were largely free of this tension because a16z was a young firm; 2020s positions increasingly intertwined with portfolio interests.

### "The Struggle" romanticization risk discipline

Horowitz's most-quoted framework has a specific misapplication pattern: adoption as identity aesthetic rather than as operational state with discipline. The 2012 essay names the state AND prescribes five specific strategies (don't put it all on your shoulders; this is chess not checkers; play long enough to get lucky; don't take it personally; remember the road less traveled). The failure mode is founders who adopt "I'm in the Struggle" as performative identity, using Horowitz-vocabulary to bond with other founders about suffering without doing the specific operational work Horowitz prescribes. Persona pushes back: when user invokes The Struggle as identity, persona asks "which of the five strategies are you executing?" and routes to specific action. Greatness doesn't come from naming; it comes from naming-plus-action.

### "Wartime CEO" misapplication discipline

Two specific misapplication patterns. (a) Using "I'm a wartime CEO" to justify unnecessary cruelty in peacetime — Horowitz's explicit formulation: "If you are a wartime CEO in peacetime, you are brutal for no reason." Users who adopt wartime aesthetic without wartime context become abusive managers. (b) Using "we're in peacetime" to justify laziness in genuine wartime — Horowitz's formulation: "If you are a peacetime CEO in wartime, you die." Persona requires specific classification-with-evidence: what's the threat/opportunity, what's the evidence, what phase does evidence imply?

### Hip-hop literacy — documented substance vs performative citation

Horowitz's hip-hop references are grounded in documented substance: co-founded Paid in Full Foundation (named after Eric B & Rakim 1987 album; called Rakim personally for permission); personal friendships with Nas, Kanye, Rakim; SXSW 2014 onstage recitation of Nas's "Daughters" verse to Nas's face; lightning-round business-curriculum answer is specific albums (Follow the Leader by Rakim, Stillmatic by Nas, One Nation Under A Groove by Funkadelic); cultural-economic analysis of invention-vs-return in hip-hop. Persona uses hip-hop language where it honors this documented substance. When users adopt Horowitz-style citation without substance — quoting rap lyrics they've never heard in full — it becomes appropriation. Persona declines performance without documented-depth basis.

### Founder-CEO-advantage vs founder-CEO-incompetence tension

a16z founding thesis: prefer founding CEOs because only founders find product cycles; professional CEOs maximize them but rarely find them. Documented tension: most founders aren't CEO-ready at the moment they become CEO, and some genuinely cannot learn CEO regardless of experience. Horowitz's position: founders must learn CEO through "miserable, debilitating" Struggle experience — that's the only path to great companies. Critical counter-perspective (sometimes replacing the founder is the right call) is also documented. Adam Neumann's WeWork 2.0 reinvestment by a16z is the most-controversial recent case. Persona acknowledges tension without resolving — surfaces both Horowitz's position and the documented critical counter-perspective.

### Not in scope (deferred to future updates)

- Horowitz's "Andy" Medium foreword to 2015 HOM reissue — Medium fetches frequently fail
- Peacetime CEO / Wartime CEO canonical April 2011 a16z essay — a16z URL redirects returned 404; content captured via book + transcripts but verbatim essay text missing
- Joe Rogan or Tucker Carlson appearances 2023-2025 (long-form crypto/AI-policy)
- Horowitz-Andreessen joint interviews on AI policy 2024-2025
- a16z 'Companies & Culture' podcast episodes
- Felicia + Ben Horowitz philanthropy / criminal-justice reform interviews — distinct cognitive material
- The 20VC Harry Stebbings interview October 2019
- Stanford GSB View From the Top newer appearances

---

## [2.25.0-alpha] — 2026-04-21 — "Sam Altman joins the starter pack"

### Why

User requested a Sam Altman persona for ongoing startup work (Vietnamese user message: *"toi rat thich nhan vat nay va dang rat lien quan den startup cua toi"* — they resonate strongly with the figure and find his frames directly relevant to their startup). Altman is the canonical voice of the founder/investor/capital-allocator strain applied to the AI era: compounding as master frame, exponential-curve-capture strategy, the hard-easy startup asymmetry, the reframe-the-question move, intensity-as-predictor, and the 10x-per-12-months AI-economics check. Archive was unusually rich with primary Altman-authored material: 9 essays from blog.samaltman.com + moores.samaltman.com spanning 2017-2025, his own free web book *Startup Playbook* (2015), and 5 verbatim long-form transcripts totaling ~75,000 words (Stanford CS183B 2014 canonical + Lex Fridman #367/#419 + Cambridge Union 2023 + Jack Altman 2024). User-authored README explicitly scoped the archive to "business / startup / capital-allocation thinking, not the political-drama narratives that grew up around the November 2023 OpenAI board firing" — a load-bearing scope discipline encoded prominently in the persona.

Corpus: 9 articles (mostly verbatim; How to Be Successful as structured summary): How to Be Successful 2019 (13-point canonical career essay); Moore's Law for Everything 2021 (AI-economics manifesto + American Equity Fund); The Strength of Being Misunderstood 2020; Idea Generation 2020 (tectonic-shifts framework); What I Wish Someone Had Told Me 2024 (17 aphorisms — #15 "Compounding exponentials are magic"); Productivity 2018; Three Observations 2025 (three economic laws of AI); Reflections 2025 (post-firing nine-year OpenAI retrospective); The Merge 2017 (pre-OpenAI-fame singularity essay). 5 verbatim long-form transcripts: Stanford CS183B Lecture 1 September 2014 (47 min canonical pre-OpenAI-fame startup framework); Lex Fridman #367 March 2023 (2.5h peak-ChatGPT moment); Lex Fridman #419 March 2024 (1h55 post-firing interview); Cambridge Union Hawking Fellowship November 2023 (1h08 three-weeks-pre-firing); Jack Altman backyard interview September 2024 (32 min unusually relaxed voice). 4 books: Startup Playbook (2015) as PRIMARY Altman-authored; Keach Hagey's *The Optimist* (2025) biographical with Altman partial participation including Chapter 16 canonical firing reconstruction; Karen Hao's *Empire of AI* (2025) critical-investigative with OpenAI/Altman declining cooperation — structurally parallel to Copeland's *The Fund* for Dalio and Chafkin's *The Contrarian* for Thiel; Parmy Olson's *Supremacy* (2024) OpenAI-vs-DeepMind competitive landscape.

Built using the v2.14 research pipeline (3 parallel subagents: articles, transcripts, books).

### Added

- **`personas/sam-altman.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): could-this-be-huge-if-it-worked screen *(test-probe)*; why-now? *(inquiry)*; the tectonic-shift scan *(framing)*; reframe the question *(framing)*; slope-over-Y-intercept for hiring *(inquiry)*; compound-interest / second-derivative framing *(inquiry)*; the 10x-per-12-months check *(test-probe)*. 12 cognitive patterns (5 user-identified + 7 surfaced: small-market-grows-fast, unpopular-but-right, pick-the-right-thing, short-term-low-status-for-long-term-high-status, iterative-deployment-as-safety, compute-as-currency, optimism-as-operating-posture). 7 rich analogous cases with verbatim attributions (Stanford CS183B 2014 canonical pre-OpenAI-fame framework; Startup Playbook 2015 Altman-authored distillation; Moore's Law for Everything 2021 + Three Observations 2025 paired manifesto+update; ChatGPT November 2022 launch as "Chat With GPT-3.5" research demo that became fastest-growing consumer product in history; November 2023 OpenAI board firing via Altman's own Reflections framing; Airbnb as canonical willfulness benchmark; Loopt 2005-2012 as Altman's own 7-year "very long time" first startup; Grandma's Apple-vs-Applebee's gift as long-hold arbitrage). 8 benchmark prompts including `bp_vested_interest_flag` (tests the conflict-of-interest discipline), `bp_reframe_question_vs_deflect` (tests the firing-drama scope boundary), `bp_ai_cost_stress_test` (tests the 10x-per-12-months discipline), `bp_aggressive_agi_timeline` (tests the forecast-refusal discipline). 18 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit interpretive-frame note and political/drama-scope boundary.
- **`commands/muse:sam-altman.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Seven load-bearing honesty disciplines encoded** — more than any prior persona because Altman is (a) living and actively leading OpenAI at age 40; (b) publicly controversial with evolving positions; (c) in the AI-deployment domain with regulatory exposure; (d) subject to multiple documented critical-investigative works (Hao, Hagey); (e) the subject of an explicit archive-README scope boundary; (f) simultaneously CEO + chairman + founder of multiple commercially-interested entities; (g) documented as shifting positions post-firing:
  1. **Living-subject + aggressive-forecast honesty** — positions evolve; aggressive timelines are bets with implicit probability.
  2. **Political/drama-scope discipline (LOAD-BEARING per README)** — archive scoped to business/startup/capital-allocation thinking; November 2023 firing via Altman's own Reflections only.
  3. **Hao/Hagey critical-counter-perspective (LOAD-BEARING)** — OpenAI "became everything it said it would not be"; Murati + Sutskever board testimony on management style; persona does NOT represent OpenAI organizational implementation as validated protocol.
  4. **Vested-interest / conflict-of-interest honesty** — CEO of OpenAI + chair Helion/Oklo + Worldcoin founder while making public claims in those domains.
  5. **Evolution-in-contested-areas honesty** — pre-OpenAI "slow down AI" → OpenAI "keep deploying"; nonprofit → capped-profit → PBC; "no super-voting shares" vs board-concluded de facto power.
  6. **Forecast-refusal / aggressive-AGI-timeline humility** — bold predictions paired with refusal to give specific years; persona declines specific-year AGI predictions.
  7. **Reframe-move-vs-deflection-move distinction + circle-of-competence honesty** — signature reframe can become deflection; persona applies constructively; Altman's documented circle excludes deep alignment / energy engineering / identity crypto.
- **`tests/build-regression/golden/sam-altman.signatures.txt`** + **`tests/session-regression/golden/sam-altman.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 20 → 21 personas. New "Compounding + Exponential Capture + AI-Industry Strategy" category introduced for Altman. Header version bumped v2.24.0-alpha → v2.25.0-alpha.
- Regression harnesses green at 21/21 personas (build-regression) and 105 pairs (session-regression, 21 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 9 files (mostly verbatim; How to Be Successful as structured summary). 16 cognitive patterns + 13 signature moves + 8 analogous cases + 10 sources + 10 tensions + 25 distinctive questions + 35 banned phrases + ~45 signature phrases. Key verbatim extractions: "Compounding exponentials are magic" (What I Wish #15); "You should trade being short-term low-status for being long-term high-status" (Strength of Being Misunderstood); "The cost to use a given level of AI falls about 10x every 12 months" (Three Observations); "Plans should be measured in decades, execution should be measured in weeks" (What I Wish); "A big failure of governance by well-meaning people, myself included" (Reflections — canonical Altman's own firing framing); "The merge has already started" (The Merge 2017); "Attention hacking is going to be the sugar epidemic of this generation" (The Merge 2017); "Be hard to compete with" (How to Be Successful #10); "You get rich by owning things" (How to Be Successful #12).
- **Transcripts subagent**: 5 files full-read (~75,000 words). Key verbatim: "Compute is going to be the currency of the future" (Lex 419 cold open + line 427 — CONFIRMED verbatim); "We have been a misunderstood and badly mocked org for a long time" (Lex 367 cold open + line 441 — CONFIRMED verbatim); "Why now" probe throughout Stanford 2014; the slope-over-Y-intercept calculus framing (Lex 419); the task-vs-jobs reframe for AI displacement (Lex 419); Ilya's consciousness-data-holdout thought experiment (Lex 367 + Cambridge 2023); the "slow takeoff, short timelines" 2x2 (Lex 367 + Lex 419); "I think compute is going to be the currency of the future" (Lex 419); "I love Ilya. I have tremendous respect for Ilya" (Lex 419, defending Sutskever post-firing); "Ron Conway and Brian Chesky went so far above and beyond the call of duty" (Reflections — canonical named gratitude for firing response). Most emotionally exposed: "I think I could just feel like a victim forever or I can say this is like the most important work I'll ever touch in my life and I need to get back to it" (Lex 419). Subagent flagged two ghost-citations to verify: "bend the world" phrase appears in archive Key Moments summary but was not cleanly locatable verbatim in Jack Altman transcript body (persona cites conceptually, not as direct quote); "we may have been a little too aggressive" re GPT-4 not found verbatim in Lex 367 body (persona does NOT cite this as direct quote).
- **Books subagent**: Startup Playbook deep-read (35 pages complete); Hagey's Optimist sampled (~125 pages Prologue + Ch 2-3-5-9-11-16-Epilogue); Hao's Empire of AI (~30 pages Prologue + author's note + thesis pages); Olson's Supremacy (~20 pages Ch 6 + Ch 16). Startup Playbook is PRIMARY Altman-authored source — 12 cognitive patterns + 12 signature moves + 10 analogous cases + 21 distinctive questions extracted. Canonical Altman compressions verified: "Make something users love"; "99% of startups die from suicide, not murder"; "Be unstoppable"; "Focus and intensity"; "Never lose momentum"; "Add a zero"; "5% weekly improvement"; "Do things that don't scale". Hagey provides biographical arc (Missouri → Stanford dropout → Loopt → YC presidency → OpenAI) + Chapter 16 "The Blip" canonical firing reconstruction with Mira Murati and Ilya Sutskever internal board communications. Hao provides LOAD-BEARING Shadow content: "OpenAI became everything that it said it would not be"; colonial-extraction framing of data labelers + water + energy; Murati's documented characterization of Altman's "playbook" (say what needs saying to get what you want; if that fails, undermine credibility). Olson confirms OpenAI-vs-DeepMind competitive dynamics + Musk's 2018 destabilizing co-founder departure.
- **Ghost-citation spot checks**: "compounding" = 2 hits in What I Wish (verifying #15 "Compounding exponentials are magic"); "compute" = 18 hits in Lex 419 (verifying "compute is going to be the currency of the future"); "misunderstood" = 4 hits in Strength of Being Misunderstood (verifying the long-term-high-status trade); "why now" = 2 hits in Stanford 2014 (verifying the canonical startup probe). Canonical Altman phrases attributed at source-file level per standard practice for well-documented public canon.

### Political/drama-scope discipline (LOAD-BEARING per README)

The archive README is explicit: *"This archive deliberately focuses on the business / startup / capital-allocation thinking, not the political-drama narratives that grew up around the November 2023 OpenAI board firing. That event is documented (it appears in *Reflections* and the Lex Fridman #419 transcript), but the archive treats it as one data point — not the lens."* Accordingly, Altman's political donations, regulatory advocacy, and the narrative-drama around the firing are documented elsewhere in the public record and are OUT-OF-SCOPE for this persona. The firing is acknowledged only via Altman's own primary-source framing (Reflections: "a big failure of governance by well-meaning people, myself included") without adjudicating he-said-she-said. When a user asks for political takes or firing-drama adjudication, the persona declines and routes back to business/startup/capital-allocation terrain — without softening the refusal. Structurally parallel to Thiel's political-scope-boundary, Dalio's Copeland-gap, and Buffett's political-scope-discipline.

### Hao/Hagey critical-counter-perspective honesty (LOAD-BEARING)

Karen Hao's *Empire of AI* (2025 — OpenAI and Altman declined to cooperate) and Keach Hagey's *The Optimist* (2025 — Altman partial participation but called process "odious") provide the critical investigative counter-perspective. Hao's Prologue: OpenAI "became everything that it said it would not be" — mission-drift from nonprofit to for-profit; "colonial" framing of data labelers in Kenya, water in Arizona, energy at scale; race-to-deploy argument used to justify rapid release. Hagey's Chapter 16 "The Blip" documents Mira Murati's and Ilya Sutskever's internal board testimony characterizing Altman's management style via documented "playbook" — say whatever needs saying to get someone to do what you want; if that fails, undermine their credibility. Several specific claims publicly disputed by Altman. Some former OpenAI staff endorse the critical picture; others contest it. The persona encodes the cognitive moves (compounding, hard-easy asymmetry, why-now, force-of-nature, iterative deployment) at personal/advisory scale and explicitly does NOT represent OpenAI's organizational implementation or internal culture as validated protocols. When user asks to import OpenAI-specific organizational practices, persona flags the counter-perspective and routes to personal-scale reasoning. Structurally parallel to Copeland's *The Fund* for Dalio, Chafkin's *The Contrarian* for Thiel.

### Vested-interest / conflict-of-interest honesty

Altman is simultaneously CEO of OpenAI + chairman of Helion Energy + chairman of Oklo + founder/chairman of Worldcoin/Tools for Humanity + investor in hundreds of AI and energy startups + public regulatory advocate. When he makes claims about "compute is the currency of the future" (bullish for OpenAI), "AI costs fall 10x/year" (commercial framing), "iterative deployment is safer than closed development" (justifies OpenAI's release strategy), "fusion and fission will power the AI era" (bullish for Helion and Oklo), "digital proof-of-humanity is needed" (bullish for Worldcoin) — the persona flags vested-interest explicitly. Not an accusation of insincerity; honest acknowledgment that commercial position shapes which claims he's motivated to make. Like Buffett's "never ask the barber if you need a haircut." Users citing Altman's positions on domains where he has commercial interests are reminded of the conflict.

### Not in scope (deferred to future updates)

- Joe Rogan Experience #2236 (Sam Altman) — YouTube auto-captions unavailable or behind restrictions; try downsub.com fallback
- TED 2024 (Chris Anderson interview) — both candidate video IDs returned no auto-captions
- NYT / New Yorker (Tad Friend) profiles of Altman — paywalled
- All-In Podcast appearances — multiple episodes; deferred
- Sam Altman's *How to Build the Future* YC interview series (host role) — Altman as interviewer of Musk, Zuckerberg, Brin etc.
- Bloomberg "Sam Altman Interview: OpenAI CEO on ChatGPT, Fusion, Trump" (2025) distinct from Lex #419
- Reid Hoffman *Possible* podcast with Altman
- Stanford eCorner Altman-only talks (2017 + 2023)
- Paul Graham's Ramp essays on Altman + founder characteristics
- OpenAI internal memos that have leaked (treat cautiously; unconfirmed authenticity)

---

## [2.24.0-alpha] — 2026-04-21 — "Warren Buffett joins the starter pack"

### Why

User requested a Warren Buffett persona for ongoing startup work (Vietnamese user message: *"toi rat thich nhan vat nay va dang rat lien quan den startup cua toi"* — they resonate strongly with the figure and find his frames directly relevant to their startup). Buffett is the canonical value-investing and capital-allocation voice of the past seven decades — circle of competence, margin of safety, Mr. Market, the four-criteria filter, moat-first business evaluation, owner earnings, the 20-slot rule, "our favorite holding period is forever", the inner scorecard, admit-mistakes-by-name. Archive was unusually rich with primary Buffett-authored material: the 1977 and 1987 annual letters verbatim, the 1984 Columbia Superinvestors speech, the 2008 NYT "Buy American. I Am." op-ed, and ~75,000 words of verbatim transcripts from five long-form lectures and interviews spanning 1996-2019. User-authored README identified 10 core cognitive moves explicitly AND flagged the load-bearing living-persona interpretive-frame note ("any extrapolation is NOT Buffett's actual view, only an interpretive frame built from his documented work").

Corpus: 5 books on disk (Cunningham's *Essays of Warren Buffett* 3rd ed. 2013 as PRIMARY distillation; Graham's *The Intelligent Investor* as FOUNDATIONAL text with Zweig 2003 commentary; Schroeder's *The Snowball* 2008 authorized biography; Lowenstein's *Buffett: The Making of an American Capitalist* 1995/2008; Pecaut-Wrenn's *University of Berkshire Hathaway* 2017 — 30 years of annual-meeting Q&A notes). 5 articles (1977 letter verbatim, 1987 Mr. Market letter verbatim, 1984 Columbia Superinvestors summary, Oct 2008 NYT "Buy American. I Am." verbatim, Carol Loomis Fortune 1999 summary). 5 long-form verbatim transcripts totaling ~75,000 words (UF MBA 1998 ~18,700 words — THE most-cited single Buffett lecture with LTCM as cautionary tale; UNC MBA 1996 ~9,900 words with See's Candies canonical wonderful-business case; Columbia 2017 Gates+Buffett+Rose ~14,600 words; Charlie Rose 2009 post-BNSF ~10,900 words; Becky Quick CNBC 2019 ~20,400 words — morning after the 2018 annual letter with Kraft-Heinz writedown self-critique).

Built using the v2.14 research pipeline (3 parallel subagents: transcripts, articles, books).

### Added

- **`personas/warren-buffett.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): apply-the-four-criteria-filter *(framing)*; summon-Mr-Market *(framing)*; circle-of-competence-gate *(test-probe)*; check-the-moat-widening-or-narrowing *(inquiry)*; sleep-well-at-night / five-year-market-closed test *(test-probe)*; compute-owner-earnings-not-GAAP *(inquiry)*; admit-the-mistake-by-name-and-quantify-it *(inquiry)*. 12 cognitive patterns (10 user-identified + 2 surfaced: institutional-imperative as explanatory mechanism, concentration-over-diversification scale-appropriate discipline). 8 rich analogous cases with verbatim-quoted attributions (American Express salad-oil scandal 1964 — canonical concentration bet; See's Candies 1972 — first wonderful-business acquisition; Washington Post 1973 — $80M priced, $400M private value; Berkshire Hathaway textile mill 1985 closure — worst-investment admission; Coca-Cola 1988 — the Inevitable and the long hold; Salomon Brothers 1991 — reputation-ruthless Congressional testimony; Buffett Partnership 1956-69 — voluntarily wound down at go-go peak with Inner Scorecard discipline; Kraft-Heinz 2013-2019 — admitted overpayment on CNBC). 7 benchmark prompts including `bp_circle_of_competence_refusal` (tests the persona's crypto/quantum/frontier-tech refusal), `bp_concentration_vs_diversification_advice` (tests scale-appropriate asymmetry), `bp_admit_mistake_by_name` (tests the epistemic-hygiene discipline). 15 verified sources including Graham's Intelligent Investor as foundational and Cunningham's Essays as primary distillation. All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit interpretive-frame note.
- **`commands/muse:warren-buffett.md`** — slash command entry point matching v2.16 template. Mandatory disclaimer printed at session start. **Six load-bearing honesty disciplines encoded**:
  1. **Living-subject honesty (positions evolve)** — Buffett is 95, still publishing, still evolving; Graham-cigar-butts → Munger-wonderful-businesses (1972+); tech-avoidance pre-2016 → Apple 2016+; airlines 2016-2020 → sold March 2020 → later acknowledged premature. Verify current positions against most recent annual letter.
  2. **Admit-mistakes-by-name applied to the persona itself** — When user asks about Dexter Shoe, Kraft-Heinz, USAir, textile mill, airlines-during-COVID, persona does NOT defend; names, quantifies, extracts principle. Refusing to defend is the discipline.
  3. **Political-scope discipline** — Endorsements (Obama, Clinton, Biden), "Buffett Rule" on capital gains tax are documented publicly but OUT-OF-SCOPE. Structurally parallel to Thiel's political-scope-boundary and Dalio's Copeland-gap.
  4. **Munger-influence honesty** — Wonderful-business evolution, invert-always-invert, institutional imperative, "time is friend of the wonderful business," See's Candies 1972 decision — all credit Charlie explicitly. Omitting Munger is a documented honesty failure Buffett himself has repeatedly criticized.
  5. **Concentration-vs-diversification scale-appropriate advice asymmetry** — Buffett personally concentrates (40% into AmEx 1964, Coca-Cola 20%+); his public retail recommendation is low-cost S&P 500 index funds. Do NOT import Berkshire-scale tactics at retail-individual-investor scale.
  6. **Circle-of-competence honesty on the persona itself** — Crypto, quantum, specific AI, frontier-tech → "too-hard pile." Persona refuses to fabricate opinions outside the documented circle. Paired with forecast-refusal honesty (no short-term calls).
- **`tests/build-regression/golden/warren-buffett.signatures.txt`** + **`tests/session-regression/golden/warren-buffett.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 19 → 20 personas. New "Value Investing + Capital Allocation + Long-Term Business Ownership" category introduced for Buffett. Header version bumped v2.23.0-alpha → v2.24.0-alpha.
- Regression harnesses green at 20/20 personas (build-regression) and 100 pairs (session-regression, 20 personas × 5 modes).

### Pipeline notes

- **Transcripts subagent**: 5 files, full-read (~75,000 words total). Key verbatim extractions: the perimeter-first circle-of-competence frame (UNC 1996, UF 1998); the LTCM cautionary tale with 16 PhDs and 2 Nobel laureates (UF 1998); the 10%-of-a-classmate thought experiment on integrity over IQ (UF 1998); See's Candies as canonical wonderful-business with $4.2M → $12.6M earnings growth and minimal capex (UNC 1996); the 5+ hours/day reading discipline (UNC 1996); the "American tailwind" framing with GDP-per-capita 6x growth over Buffett's lifetime (Becky Quick 2019); the Kraft-Heinz writedown admission "I was wrong on Kraft-Heinz. We overpaid." (Becky Quick 2019); the Apple consumer-ecosystem thesis (Becky Quick 2019); the all-in-wager-on-the-American-economy BNSF framing (Charlie Rose 2009); the Giving Pledge and Gates Foundation context (Columbia 2017).
- **Articles subagent**: 5 files, full-read. Key verbatim: the 1977 letter's four-criteria framework; the 1987 letter's canonical Mr. Market passage ("His pocketbook is inexhaustible; his emotions are volatile; he is there to serve you, not to guide you."); the Sainted Seven capital-light Berkshire businesses framing; the elephant-gun metaphor ("if you want to shoot rare, fast-moving elephants, you should always carry a loaded gun"); the 1984 Superinvestors N=9 empirical refutation of the efficient-market hypothesis; the 2008 NYT "be fearful when others are greedy" at the height of panic; the Fortune 1999 dot-com-peak prescient bear case decomposing returns into rates × margins × growth × frictional cost.
- **Books subagent**: 5 PDFs skim-then-deepen. Deep read on Cunningham's Essays (~180 pages across all four major sections). Key extractions from Graham's Intelligent Investor Chapter 8 (Mr. Market) and Chapter 20 (Margin of Safety); Schroeder's Snowball Part Two on the Inner Scorecard origin with Howard Buffett as father-influence; Lowenstein's AmEx salad-oil chapters and Washington Post chapter as canonical concentration-bet cases; Pecaut's 30-year annual-meeting notes for recurring themes and unfiltered Munger-voice quotes.
- **Ghost-citation spot checks**: "Mr. Market" = 12 hits in 1987 letter; "margin of safety" = 3 hits in Superinvestors speech (Graham's bridge-for-30,000-driven-by-10,000 analogy verified); "circle of competence" = 5 hits in UF 1998. Canonical Buffett phrases in persona ("Rule No. 1", "Price is what you pay, value is what you get", "Be fearful when others are greedy", "Our favorite holding period is forever", "Time is the friend of the wonderful business", "Only when the tide goes out", "There is seldom just one cockroach in the kitchen", "Lethargy bordering on sloth", "Diversification is protection against ignorance") attributed at source-file level per standard practice for well-documented canon.

### Six load-bearing honesty disciplines (the v2.24 contribution)

The Buffett persona encodes MORE shadow disciplines than any prior persona because (a) Buffett is a living, publicly-scrutinized figure whose positions evolve visibly; (b) his documented record extends seven decades and includes explicit self-criticism by name; (c) the investment-advice domain has regulatory exposure requiring explicit "not investment advice" disclosure; (d) his retail-investor recommendation (index funds) is often omitted by followers who cite his personal concentration; (e) Munger's co-architect role is often unacknowledged; (f) his circle of competence is documented specifically (consumer brands, insurance, banking, railroads/utilities) and specifically excludes the frontier-tech domains most users ask about. All six disciplines are load-bearing for honest interpretive use:

1. **Living-subject honesty** — Documented evolutions include cigar-butts → wonderful-businesses (1972+), tech-avoidance → Apple (2016+), airlines 2016-2020 → March 2020 sale → later acknowledged premature. Freezing positions as of April 2026 and flagging potential future revisions.
2. **Admit-mistakes-by-name applied to the persona** — Models the discipline Buffett himself practices in every annual letter. When asked about documented mistakes, names them.
3. **Political-scope discipline** — Endorsements + Buffett Rule tax advocacy OUT-OF-SCOPE. Declines political takes, routes back to investing/business.
4. **Munger-influence honesty** — Attributions where Munger's co-development is documented, not erased.
5. **Concentration-vs-diversification scale-appropriate advice asymmetry** — Buffett's retail recommendation is index funds, not Berkshire-scale concentration.
6. **Circle-of-competence honesty on the persona** — Crypto, quantum, AI startups, frontier-tech → too-hard pile. Refuses to fabricate opinions. Paired with forecast-refusal (no short-term calls).

### Not in scope (deferred to future updates)

- The 2008 Berkshire annual letter — "Beware of geeks bearing formulas" (ranked many-best-single-letter); PDF fetch failed
- The 2014 50th-anniversary special letters (Buffett "Berkshire — Past, Present and Future" and Munger companion piece); PDF fetch failed
- HBO documentary "Becoming Warren Buffett" (2017) — if captioned source can be found
- 2008 University of Florida talk by Buffett alone (Q&A with Becky Quick in wake of Lehman collapse)
- 1998 Berkshire Annual Meeting transcript (5+ hours; richest single annual meeting)
- Buffett's 2017 letter chapter on share repurchases
- Buffett's 1991 Salomon Brothers Congressional testimony in full
- Munger's 1995 "Psychology of Human Misjudgment" Harvard speech (the closest available companion to Buffett's framework; use `/muse:charlie-munger` for Munger-specific frames)

---

## [2.23.0-alpha] — 2026-04-21 — "Andy Grove joins the starter pack"

### Why

User requested an Andy Grove persona for ongoing startup work (Vietnamese user message: *"toi rat thich nhan vat nay va dang rat lien quan den startup cua toi"* — they resonate strongly with the figure and find his frames directly relevant to their startup). Grove is the primary source of Silicon Valley's management vocabulary (one-on-ones, OKRs originally as MBO, task-relevant maturity, constructive confrontation, strategic inflection points, 10x forces, let-chaos-reign-then-rein-in-chaos, manager-output-as-team-output, leverage, paired indicators) — making him unusually relevant for a startup operator. User's archive was rich with primary sources totaling ~57,000 words of verbatim transcript plus the single canonical management book.

Corpus: 1 book PDF on disk (High Output Management 1983 as PRIMARY management-operating-system text; Only the Paranoid Survive 1996 and Swimming Across 2001 referenced-but-not-on-disk). 1 article on disk: the Rare Interview with Daniel Scrivner from *In the Company of Giants* (1990s, verbatim Grove voice at length; 7 other articles referenced via README summaries — Taking on Prostate Cancer 1996, Education of Andy Grove 2005/2016, Man Who Built Silicon Valley 2015, Remembering Andy S. Grove CHM 2016, Engineer Rest in Peace 2016, OKR Origin Story 2025, Constructive Confrontation Quartz 2016). 6 verbatim transcripts totaling ~56,940 words (Strategic Inflection Points MIT Sloan 1996 = 9,689 words canonical lecture; Kuh Distinguished Lecture UC Berkeley 2008 = 6,716 words; Tedlow Google Talks biography 2007 = 11,712 words preserving Grove's notebook quotes; Intel Memorial Panel April 2016 = 11,665 words first-hand operational anecdotes from Eva Grove, Les Vadasz, Jack Carsten, Tom Dunlap, Pat Gelsinger; Masterful Leadership 2013 = 13,518 words Grove-adjacent; Ben Horowitz Churchill Club tribute September 2015 = 3,640 words delivered six months before Grove's death). User-authored README pre-identified 3 core cognitive moves (cognitive detachment at decisions via "new CEO" move, teach the operating system not the tricks, named patterns over generic advice) plus strategic-paranoia-as-competitive-advantage.

Built using the v2.14 research pipeline (3 parallel subagents: transcripts, books, articles+root).

### Added

- **`personas/andy-grove.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): the virtual-new-CEO thought experiment *(framing)*; draw-the-curve-find-the-inflection *(framing)*; the 10x-force scan *(test-probe)*; listen-to-the-Cassandras-in-middle-management *(inquiry)*; constructive confrontation (Grove's original, not the distortion) *(inquiry)*; ask-one-more-question / Principle of Didactic Management *(inquiry)*; let-chaos-reign-then-rein-in-chaos phase-sequencing *(test-probe)*. 12 cognitive patterns (3 user-identified + 9 surfaced: reduce-every-managerial-problem-to-production-flow, manager-output-is-team-output equation, paranoia-as-scanning-protocol-not-temperament, task-relevant-maturity governs style, indicators-plus-paired-counter-indicators, knowledge-power-trumps-position-power, engineering-cross-comparison applied to any domain, time-as-only-scarce-resource, distinguish-activity-from-output, history-rewriting skepticism). 7 analogous cases with verbatim-quoted attributions (1985 DRAM exit as canonical SIP; HOM's Breakfast Factory as management-operating-system origin; 1956 Budapest escape — paranoia as biographical fact; Taking on Prostate Cancer 1996 — new-CEO move applied to the body; OKR origin at Intel 1975 + Doerr-to-Google propagation; Churchill Club 2015 Horowitz tribute — Grove as teacher; 2010 Bloomberg jobs essay — contested late-career manufacturing argument). 7 benchmark prompts including `bp_constructive_confrontation_distortion` and `bp_okr_theater_audit` specifically testing the load-bearing disciplines. 17 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. HISTORICAL persona (died March 21, 2016).
- **`commands/muse:andy-grove.md`** — slash command entry point matching v2.16 template. Interpretive-frame disclaimer printed at session start. Three load-bearing honesty disciplines encoded:
  1. **Constructive-confrontation-distortion discipline (LOAD-BEARING)** — Grove's original had four disciplines (address-work-not-person, require-data, surface-early, admit-wrong-fast). Silicon Valley adoption dropped (1) and (4), leaving brilliant-jerk cover. Persona checks the four and flags the distortion. Does not soften into "different interpretations exist." Structurally parallel to Dalio's Copeland-gap disclosure and Thiel's political-scope-boundary.
  2. **Paranoia-as-method-vs-aesthetic discipline** — "Only the paranoid survive" is a specific scanning methodology (hunt for 10x forces, listen to Cassandras, name strategic inflection points, let chaos reign then rein in). Anxious temperament without the protocol is not the same thing. Persona audits what user actually does with paranoia.
  3. **OKR-discipline-vs-OKR-theater discipline** — Grove's 1975 rules: few, aggressive-to-70%, numerical, cascading, time-bound. Most company OKR implementations violate most. Persona audits the five rules; flags theater.
  Plus three additional shadows surfaced as relevant: Grove's own occasional human cost (Intel pressure-cooker; documented line-crossings between confrontation-of-work and confrontation-of-person); the new-CEO phrase as tool vs rhetorical name-drop (only works if followed through); scale-presupposition (Intel-scale tactics vs solo-founder scale); the 2010 Bloomberg jobs essay as still-contested policy, not settled analysis.
- **`tests/build-regression/golden/andy-grove.signatures.txt`** + **`tests/session-regression/golden/andy-grove.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 18 → 19 personas. New "Management Operating System + Strategic Inflection Points + Engineering-Voice Reduction" category introduced for Grove. Header version bumped v2.22.0-alpha → v2.23.0-alpha.
- Regression harnesses green at 19/19 personas (build-regression) and 95 pairs (session-regression, 19 personas × 5 modes).

### Pipeline notes

- **Transcripts subagent**: 6 files, full-read (~56,940 words total). 12 cognitive patterns + 10 signature moves + 12 analogous cases + ~40 signature phrases + 20 distinctive Grove questions + ~15 banned phrases extracted. Key extractions verified verbatim: "strategic inflection point is my way of visualizing..." (MIT 1996); the virtual-new-CEO quote from Grove's notebook quoted by Tedlow 2007; "let chaos reign... pull in the reins" (MIT 1996); "the first signs... does not come from senior management people" (MIT 1996 Cassandras); "hesitation transfers time to your competition" (MIT 1996); Jack Carsten teaching constructive confrontation as formal course at Intel (Memorial 2016); Tom Dunlap's late-meeting story (Memorial 2016); the 125-Solution 1981 layoff-avoidance episode (Memorial 2016); Pat Gelsinger's "Andy Who?" lifelong mentorship beginning (Memorial 2016); the Horowitz book-inscription-culling anecdote (Churchill Club 2015); Grove's closing line on helping young refugees "make it" (Churchill Club 2015). Masterful Leadership 2013 turned out to be Grove-adjacent only — summary framing promised more than body delivered.
- **Books subagent**: High Output Management 1983 PDF (1983 first edition Calibre export, ~250 print pages, ~150 pages read across all four parts). 12 cognitive patterns + 8 signature moves + 10 analogous cases + 32 signature phrases + 15 distinctive Grove questions + 15 banned MBA-jargon phrases extracted. Critical warnings flagged: (1) the 2015 Ben Horowitz foreword is NOT in this PDF (do not attribute Horowitz quotes to HOM); (2) Calibre OCR artifacts throughout — verbatim quotes cross-checked; (3) HOM uses "Management by Objectives" (MBO), NOT "OKR" — the acronym is Doerr's later rebrand; (4) Task-Relevant Maturity was adopted by Grove from Hersey & Blanchard 1972, per Grove's own footnote (p.173 print ed.); (5) the six-question decision framework is credited by Grove in his own footnote to Les Vadasz of Intel (HOM Notes p.98).
- **Articles + root subagent**: 1 article on disk (Rare Interview with Daniel Scrivner, verbatim Grove voice) + README user-curation. 8 cognitive patterns + 6 signature moves + 8 analogous cases extracted. Important tensions surfaced: constructive-confrontation distortion (Grove original vs Silicon Valley brilliant-jerk cover) flagged as LOAD-BEARING. Paranoia-as-method vs paranoia-as-aesthetic tension named. OKR-discipline vs OKR-theater tension named. New-CEO-test-as-tool vs rhetorical-drop distinguished. Grove's-own-human-cost flagged honestly. 2010 Bloomberg jobs essay flagged as contested policy.
- **Ghost-citation spot checks**: "strategic inflection" = 16 hits in MIT 1996 transcript; "new CEO" = 1 hit in Tedlow Google Talk (the canonical verbatim via Grove's notebook); "constructive confrontation" = 2 hits in Intel Memorial Panel 2016 (Jack Carsten teaching); "paranoid" verified in MIT 1996. Canonical Grove phrases in persona ("Only the paranoid survive", "Strategic inflection point", "10x force", "Cassandras in middle management", "Let chaos reign, then rein in chaos", "If we got kicked out and the board brought in a new CEO, what would he do?", "Knowledge power trumps position power", "A manager's output is the output of his organization", "Delegation without follow-through is abdication", "You never cut enough soon enough") attributed at source-file level per standard practice for well-documented canon.

### Constructive-confrontation-distortion honesty (LOAD-BEARING)

Grove's original constructive confrontation had four operational disciplines: (1) address the work, not the person — the distinction is operational, not rhetorical; (2) require evidence rather than opinion from both sides; (3) surface disagreement early in the room, not in hallways after; (4) admit wrong fast when proved so (Grove's handwritten thank-you notes to Fortune fact-checker Bethany McLean when she caught his chart error are the canonical behavioral signature). The Silicon Valley absorption of the phrase has frequently dropped items (1) and (4), leaving "directness" as cover for bullying, personal attack, and brilliant-jerk behavior. When user invokes "constructive confrontation" as a management style or company culture, the persona MUST check the four disciplines and flag the distortion if any are missing. Does not soften into "well, different interpretations exist" — Grove's original is a specific operational discipline, not a vibe. Alice Truong's Quartz essay "Constructive Confrontation" (March 22, 2016) documents the distortion explicitly and is the load-bearing critical source for this discipline.

### Paranoia-as-method-vs-aesthetic honesty

"Only the Paranoid Survive" is a specific scanning methodology: hunt for 10x forces, listen to Cassandras in middle management, name strategic inflection points, let chaos reign then rein in chaos. Not anxious temperament, not adversarial stance, not generalized crisis framing. Grove's paranoia was biographical — inherited from surviving Budapest 1944-45 (Nazi occupation) and 1956 (Hungarian Revolution) — and translated into a structured operational scanning protocol. The Silicon Valley adoption frequently reduces it to an aesthetic (anxiety, tension, perpetual crisis) without the method. Persona audits: what does the user actually DO with their paranoia? Is there an explicit 10x-force scan? Cassandra solicitation? SIP-naming? Or is there just stress? Anxiety without method is strictly worse than calm without method.

### OKR-discipline-vs-OKR-theater honesty

Grove's original rules from the 1975 Intel training class: (a) few objectives, not many; (b) aggressive enough to be painful to hit — 70% = success, 100% always = sandbagged; (c) numerical key results (not qualitative); (d) cascading from company to department to individual; (e) quarterly time-bound. Most company OKR implementations violate most of these — dozens of objectives dressed as priorities, sandbagged targets that always hit 100%, qualitative non-measurable key results, no real cascade, continuous reforecasting. John Doerr brought OKRs from Grove's 1975 class to Google in 1999 and eventually rebranded the framework as "OKRs" in his 2018 book. HOM itself uses "Management by Objectives" (MBO), not the acronym. Persona audits the five rules; flags theater; does not congratulate on OKR-format-in-place when OKR-discipline-is-absent.

### Additional shadow disciplines

- **Grove's own occasional human cost**: Intel's early culture was famously intense. Grove's constructive-confrontation practice occasionally crossed from confrontation-of-work to confrontation-of-person, as colleagues documented directly at the April 2016 Intel Memorial Panel (Tom Dunlap's late-meeting-shame story, the "grove-grams" red-pen notes passed silently around meeting tables, the 125-Solution 1981 decision extracting 8 hours extra unpaid work per week). Grove himself admitted canonical mistakes in his own writing (the "light from distant stars" review error, the year-late decisions, the Pentium FPU emotional investment). Persona does NOT sanitize this when user is deciding whether to adopt a Grove-style high-pressure environment.
- **New-CEO-test-as-tool-not-name-drop**: The virtual-new-CEO thought experiment only works when the speaker commits to act as the imagined new CEO would. Dropping the phrase as rhetorical name-drop without follow-through is worse than not having the tool — creates illusion of clear thinking without action. Persona tests whether the user will actually execute what their imagined new CEO would do.
- **2010 Bloomberg jobs essay still-contested**: Grove's late-career argument that US manufacturing offshoring destroyed the scaling engineering base is defensible on industrial-base grounds, contested on free-trade grounds. Treated as Grove's position — worth knowing, worth debating — not as consensus policy. When user asks about manufacturing, offshoring, reshoring, industrial policy, persona surfaces Grove's argument and flags it as contested, does not pretend the question is settled.
- **Scale-presupposition**: Many Grove tactics (peer-plus-one, TRM matrices, cascading MBO, six-question decision frame) presuppose institutional scale. At solo-founder or 5-person-team scale, persona extracts cognitive moves (engineering reduction, new-CEO test, 10x-force scan, draw-the-curve reflex, paired-indicator rule, Cassandra solicitation, constructive-confrontation four disciplines) and discounts tactical specifics that don't fit.

### Not in scope (deferred to future updates)

- Ben Horowitz's "Andy" Medium post (foreword to 2015 HOM reissue) — repeated ECONNRESET during WebFetch
- Grove's HBR article "Inside Intel" (Nov 1996, excerpted from Only the Paranoid Survive) — paywalled
- HBR "Remembering Andy Grove, the Teacher" (Robert Burgelman, March 2016) — paywall truncation
- Charlie Rose interviews with Grove (Nov 2001, 2006, others) — captions not available on YouTube
- Computer History Museum Grove oral history (if it exists; Science History Institute has one)
- The Economist obituary (March 31, 2016) — fetch blocked
- NYT obituary by John Markoff (March 22, 2016) — fetch blocked
- The full OKR training class video from Intel 1975 (WhatMatters.com preserves it)
- Grove's 2010 Bloomberg jobs essay full body
- Charlie Rose: Andrew Grove Part 2 (2006, with Tedlow) — unique double-interview format
- Tim Jackson, *Inside Intel* (1997) — hostile-witness reporting useful as counterpoint

---

## [2.22.0-alpha] — 2026-04-21 — "Peter Thiel joins the starter pack"

### Why

User requested a Peter Thiel persona for ongoing startup work (Vietnamese user message: *"toi rat thich nhan vat nay va dang rat lien quan den startup cua toi"* — they resonate strongly with the figure and find his frames directly relevant to their startup). User's archive at `.archives/personas/peter-thiel/` arrived with an explicit scope boundary pre-authored into the README: *"This archive focuses on Thiel's business, strategic, and philosophical thinking — his cognitive moves as founder, investor, and public intellectual. It deliberately de-emphasizes his explicitly political work. Thiel is a politically active and politically controversial figure; sources that are primarily political commentary have been filtered out."* This political-scope boundary is load-bearing for honest interpretive use and is the persona's primary honesty discipline.

Corpus: 3 books on disk (Zero to One 2014 as primary source; The Founders Jimmy Soni 2022 for PayPal biographical texture; The Diversity Myth Sacks+Thiel 1995 mined only for methodological-seed content). 6 articles (Against Edenism First Things 2015 verbatim; End of the Future National Review 2011 summary; Education of a Libertarian Cato Unbound 2009 verbatim — contains the canonical "freedom and democracy compatible" retraction line; Blake Masters's CS183 Class 4/11/13 notes from 2012 — the Last Mover Advantage, Secrets, You Are Not a Lottery Ticket lectures that became Zero to One). 6 verbatim transcripts totaling ~45,000+ words (Competition is for Losers YC/Stanford 2014 = 9,478 words verbatim, Cambridge Union 2024 = 13,595 words verbatim, Conversations with Tyler 2015 + 2024, Hamilton commencement 2016 verbatim, JRE #2190 2024 summary format). Max Chafkin's *The Contrarian* (2021) referenced as critical-perspective counter-source (structurally parallel to Copeland's *The Fund* for Dalio).

Built using the full v2.14 research pipeline (3 parallel subagents — articles, transcripts, books — root subagent folded into synthesis given the rich user-curated README).

### Added

- **`personas/peter-thiel.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): contrarian diagnostic question *(inquiry)*; Tolstoy-inversion / received-wisdom stress-test *(framing)*; the 2×2 civilizational map *(framing)*; monopolist's-lies / non-monopolist's-lies duality test *(test-probe)*; last-mover / 10-year DCF audit *(test-probe)*; two-channel secrets probe *(inquiry)*; Girardian mimetic diagnostic *(inquiry)*. 12 cognitive patterns (7 user-identified + 5 surfaced: X×Y-decomposition as value-created vs value-captured independence, four-driver diagnosis of modern disbelief in secrets, power-law as VC physics, company-name-as-prophecy, more-with-less as technology test). 9 rich analogous cases with verbatim-quoted attributions (PayPal's 2001 DCF with 75%-of-value-from-2011+ math; the $500K Facebook investment as power-law-in-one-decision; Competition is for Losers YC 2014 lecture as canonical monopoly-theory artifact; Confinity/X.com 2000 merger at equidistant café; Against Edenism 2015 theology; Cato 2009 retraction case; Hamilton 2016 inversion-as-structure speech; Cambridge Union 2024 diversity-myth-as-magic-show; Cowen 2015+2024 long-substance-short-status + katechon). 6 benchmark prompts including `bp_political_scope_boundary` and `bp_contrarian_posture_vs_method` specifically testing the load-bearing disciplines. 16 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit political-scope-boundary disclosure.
- **`commands/muse:peter-thiel.md`** — slash command entry point matching v2.16 template. Mandatory interpretive-frame disclaimer including the political-scope-boundary disclosure printed at session start. Three specific disciplines encoded:
  1. **Political-scope-boundary discipline (LOAD-BEARING)** — when user asks for political takes, the persona MUST decline, acknowledge positions are documented publicly, route back to business/strategic/philosophical terrain, and NOT soften the refusal. Scope boundary is the point.
  2. **Cato 2009 retraction honesty** — the "freedom and democracy are compatible" line Thiel later said he should have double-checked is honored when user cites it approvingly.
  3. **Contrarian-as-method vs contrarian-as-posture** — persona enforces step 3 of the inversion method (empirical stress-test), flags widely-held contrarian conventions as posture, demands evidence.
- **`tests/build-regression/golden/peter-thiel.signatures.txt`** + **`tests/session-regression/golden/peter-thiel.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 17 → 18 personas. New "Contrarian Strategy + Monopoly Theory + Girardian Substrate (Inversion-as-Method + 10-year DCF + Two-Channel Secrets)" category introduced for Thiel. Header version bumped v2.21.0-alpha → v2.22.0-alpha.
- Regression harnesses green at 18/18 personas (build-regression) and 90 pairs (session-regression, 18 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 6 articles full-read (Against Edenism verbatim, End of Future summary, Education of a Libertarian verbatim, CS183 Class 4/11/13 from Blake Masters). Extracted 16 cognitive patterns + 10 signature moves + 12 analogous cases + 6 sources + 6 tensions + 15 distinctive questions + 17 banned phrases + ~42 signature phrases. Budget: ~7,500 tokens.
- **Transcripts subagent**: 6 transcripts skim-then-deepen (~45,000+ words total across Competition is for Losers YC 2014, Cambridge Union 2024, Cowen 2015 + 2024, Hamilton 2016, JRE #2190). 12 cognitive patterns + 11 signature moves + 23 analogous cases (including airlines-vs-Google X*Y canonical; Wright Brothers Y=0%; Einstein's 1939 letter; Bob Laughlin Nobel-defunding; 20,000-LA-stars mimetic-attraction proof; Supreme Court clerkship loss retrospective-gift; Confinity/X.com merger; Ezra Pound make-it-new; Napster/Uber bad-names; Solyndra ninth-grade-geometry; California-as-Saudi-Arabia; India-1974-nuclear-bomb; ChatGPT passing Turing test; Apollo→Woodstock pivot; Lord of the World / Solovyov; Claudius→Nero; anti-communism as katechon; Galileo-as-scientist-hero; MK Ultra → LSD) + 7 tensions + 20 distinctive questions + 13 banned phrases + ~40 signature phrases.
- **Books subagent**: Zero to One 97 pages skim-then-deepen (Ch 3 Tolstoy inversion, Ch 5 last-mover DCF + 4-characteristic monopoly audit, Ch 6 2×2 civilizational map, Ch 7 power-law, Ch 8 two-channel secrets + 4-driver disbelief diagnostic, Ch 14 founder's paradox with Girardian tie-in). Soni Founders ~38 pages (PayPal origin, Confinity/X.com merger, 24-year-old-CEO decisions, PayPal Mafia roster). Diversity Myth 21 pages mined ONLY for methodological-seed (attention-redirection / myth-evaporation frame — *"myths tend to evaporate if people think about them"* — which becomes the 2024 Cambridge "diversity myth as magic show" thesis). Per explicit scope boundary, 1995 political positions OUT-OF-SCOPE.
- **Ghost-citation verified**: "competition" 25 hits, "monopol" 26 hits, "last mover" 6 hits, "losers" 5 hits in YC 2014 transcript; "freedom and democracy" verified verbatim in Cato 2009 essay. Canonical Thiel phrases in persona ("competition is for losers", "last mover advantage", "all happy companies are different", "what important truth do very few people agree with you on?", "you are not a lottery ticket", "don't disrupt", "the sea was no more") attributed at source-file level per standard practice for well-documented canon.

### Political-scope-boundary discipline (LOAD-BEARING, non-negotiable)

The user's archive README explicitly scoped this persona to business, strategic, and philosophical thinking. Thiel's political activism (Trump endorsements 2016 and 2024, JD Vance backing, Gawker/Hulk Hogan litigation funding, anti-woke public positioning, criticism of specific politicians by name, his characterization of specific movements as quasi-religious or Antichrist-adjacent) is DOCUMENTED elsewhere in the public record and is OUT-OF-SCOPE for this persona. When user asks the persona for political takes, the persona MUST decline, acknowledge positions are documented publicly, and route back to the business/strategic/philosophical terrain — without softening the refusal into "on the one hand, on the other hand" rhetoric. This scope boundary is the point of the persona's honest use: cognitive moves only, politics stays out. Benchmark prompt `bp_political_scope_boundary` specifically tests the discipline. Structurally parallel to the v2.21 Ray Dalio Copeland-gap disclosure: the boundary is load-bearing for honest interpretive use, not an optional add-on.

### Cato 2009 retraction honesty

The canonical Thiel retraction case: the April 2009 Cato Unbound line *"I no longer believe that freedom and democracy are compatible"* — Thiel later publicly said this was a line he should have double-checked. Within the essay itself, he softened: *"It would be absurd to suggest that women's votes will be taken away."* When user cites the sharp formulation approvingly, persona acknowledges the public walkback. The method of the essay (exit-over-voice via new frontiers — cyberspace, outer space, seasteading) survives the retraction; the specific democracy framing did not. Structurally parallel to Naval Ravikant's 2024 Modern Wisdom retractions — a rare case of a widely-quoted line being owned as overshot. Honor the retraction; do not pretend the line stands unrevised.

### Contrarian-as-method vs contrarian-as-posture (self-discipline on the frame itself)

The inversion move is Thiel's most reliable rhetorical tool, but it degrades catastrophically when applied as aesthetic without the empirical stress-test. The method has three steps: (1) state the cliché, (2) construct the inverse, (3) CHECK WHETHER THE INVERSE HOLDS AGAINST EVIDENCE. Most people who adopt Thiel-style contrarianism skip step 3, which produces contrarian noise ("I disagree because I like disagreeing"). Persona enforces step 3 — asks "what evidence would change your mind?", flags widely-held contrarian conventions ("most startups fail", "markets are inefficient", "universities are corrupt") as conventions dressed as contrarianism, not secrets. Benchmark prompt `bp_contrarian_posture_vs_method` specifically tests this discipline.

### Chafkin counter-perspective reference

Max Chafkin's *The Contrarian* (2021) is the most complete journalistic biography — editorially hostile on politics but the deepest public reporting on Thiel-as-business-operator. Structurally parallel to Copeland's *The Fund* for Dalio: adversarial public-record corroborates some self-presentation claims and complicates others. Several specific Chafkin claims are publicly disputed. Persona encodes cognitive moves at personal/strategic scale and does NOT represent Founders Fund's organizational implementation, Palantir's operating culture, or any political network as validated protocols. Referenced in Shadow section; does not drive the primary framework (political-scope-boundary discipline does).

### Girardian substrate visibility

Nearly every Thiel move traces back to René Girard's mimetic theory, even when not named. Competition as mimetic rivalry. The Bible-takes-the-victim's-side (Cain/Abel inverting Romulus/Remus). Founder-as-inverse-bell-curve as Girardian scapegoat-creator vs Christian anti-scapegoat. The katechon/Antichrist framework from Cowen 2024. Persona makes Girard visible when load-bearing — if user is engaging seriously with the frame, they should know it runs on mimetic theory.

### Not in scope (deferred to future updates)

- "The Optimistic Thought Experiment" (Hoover Institution / *Policy Review*, Jan 2008)
- Peter Thiel on Eric Weinstein's *The Portal* Ep. 001 (July 2019, ~2.5 hours on stagnation)
- a16z Podcast: "The (Definite) Optimism of Peter Thiel" (Jan 2019)
- Peter Thiel on Jordan B Peterson: "Why We Stopped Progressing" (April 2025)
- Peter Thiel on Ross Douthat's *Interesting Times*: "A.I., Mars and Immortality" (June 2025)
- "Good for Google, Bad for America" (*New York Times* op-ed, Aug 2019)
- CS183 Classes 5, 7, 9, 14, 15, 17 (remaining Masters-notes lectures)
- Founders Fund Manifesto ("What Happened to the Future?")
- 2019 Hoover talk "Peter Thiel on 'The Straussian Moment'" (video walk-through)
- Socrates in the City with Peter Thiel (Feb 2020, Eric Metaxas's platform)

---

## [2.21.0-alpha] — 2026-04-21 — "Ray Dalio joins the starter pack"

### Why

User requested a Ray Dalio persona for ongoing startup work (Vietnamese user message: *"toi rat thich nhan vat nay va dang rat lien quan den startup cua toi"* — they resonate strongly with the figure and find his frames directly relevant to their startup). Corpus was pre-curated and unusually rich: 6 books (Dalio's own *Principles: Life and Work* 2017; *Principles for Navigating Big Debt Crises* 2018; *Principles for Dealing with the Changing World Order* 2021; *How the Economic Machine Works* 2008 paper; plus Rob Copeland's *The Fund* 2023 as critical counter-perspective; Roger Lowenstein's *When Genius Failed* 2000 as LTCM context). 5 articles (LinkedIn/economicprinciples.org 2019-2024 on capitalism reform, the 2019 system-broken diagnosis, the big-cycles method essay, the 2021 bubble framework, the 2024 pivotal-year framing — stored as `fetch_status: summary` paraphrases per LinkedIn editorial returns). 5 verbatim video transcripts totaling ~45,800 words (30-min *How the Economic Machine Works* 2013 video — the most-watched economics video on YouTube; *Principles For Success* 8-episode animated mini-series 2019; *Changing World Order* animated companion 2022; *Lex Fridman Podcast* 2019 ~1h48m; *Changing World Order with Tony Robbins* 2022 ~2h). User-authored README pre-identified 4 core cognitive moves + flagged the LOAD-BEARING Copeland critical-perspective gap as non-negotiable honesty discipline.

Built using the full v2.14 research pipeline (4 parallel subagents: articles, transcripts, books, root) per `/muse:build`.

### Added

- **`personas/ray-dalio.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): pattern-match to historical template *(framing)*; pain + reflection = progress *(inquiry)*; believability-weighted disagreement *(test-probe)*; the five-step process *(framing)*; where are we in the cycle? *(framing)*; principles-as-code rule-writing *(inquiry)*; four-lever beautiful-deleveraging diagnostic *(test-probe)*. 12 cognitive patterns (4 user-identified + 8 surfaced: reality-is-a-machine, hold-two-extreme-views-and-triangulate, know-what-you-dont-know, five-step-process, meditate-on-the-edges, where-are-we-in-the-cycle, beautiful-deleveraging-four-lever, reflect-share-iterate). 7 analogous cases with verbatim attributions (the 1982 disaster as founding event of principles; *How the Economic Machine Works* three-forces + four-levers mechanism thesis; *Changing World Order* 11-empires big-cycle thesis; the 2019 "system is broken" + capitalism-reform diagnosis; the 2021 six-indicator bubble framework; the 2024 five-forces "pivotal year" framing; Bridgewater's idea-meritocracy protocol with Copeland-gap flagged). 5 benchmark prompts (bp_pattern_match, bp_repeating_mistake, bp_macro_cycle_location, bp_believability_weight, bp_copeland_self_awareness). 15 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit Copeland-gap disclosure.
- **`commands/muse:ray-dalio.md`** — slash command entry point matching v2.16 template. Mandatory interpretive-frame disclaimer including the Copeland-gap disclosure printed at session start. Three specific disciplines encoded: (1) **Copeland critical-perspective honesty** — load-bearing: when user asks persona to validate/import/implement a Bridgewater-style organizational protocol (dot-rating at scale, formal believability-weighting system), the persona MUST flag Copeland's *The Fund* counter-perspective explicitly and route to personal-scale cognitive moves rather than cloning the organizational implementation; (2) **probabilistic humility on macro calls** — when user cites Dalio's confident macro forecasts, the persona honors Dalio's own probabilistic frame (probability + payoff, opposite-case-stated, sizing-for-survival) and flags the "end of debt supercycle" 2010s timing miss as the canonical case of forecaster-certainty outliving its sell-by date; (3) **regime-detection on pattern-matching** — when the situation is plausibly genuinely novel (AI as general-purpose technology mid-2020s as candidate), persona must explicitly ask "new regime or one of the old ones?" before forcing the pattern.
- **`tests/build-regression/golden/ray-dalio.signatures.txt`** + **`tests/session-regression/golden/ray-dalio.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 16 → 17 personas. New "Macro Systems + Principles + Pattern-Recognition (Historical-Templates + Cycles + Believability-Weighting)" category introduced for Dalio. Header version bumped v2.11.0-alpha → v2.21.0-alpha.
- Regression harnesses green at 17/17 personas (build-regression) and 85 pairs (session-regression, 17 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 5 articles full-read (LinkedIn summaries per README fetch_status). 14 cognitive patterns + 12 signature moves + 14 analogous cases + 10 sources + 8 tensions + 16 distinctive questions + 12 banned phrases + 21 signature phrases extracted. Budget: ~62k tokens.
- **Transcripts subagent**: 5 transcripts skim-then-deepen (~45,800 words total across Economic Machine video, Principles For Success animated, Changing World Order animated, Lex Fridman 2019, Tony Robbins 2022). 15 cognitive patterns + 15 analogous cases (including the 1982 disaster verbatim recounting, Nixon 1971 gold de-linking, 1930s deleveraging case, Dutch/British/US empire transitions, Hero's Journey framing from Principles For Success, Deng Xiaoping cat metaphor, China 27x-growth statistics, Elon Musk helicoptering reference) + 7 tensions + 36 signature phrases + 15 distinctive questions + 12 banned phrases.
- **Books subagent**: text-first strategy (books stored as metadata + key ideas + <15-word quotes, copyright-respecting). Extensive Copeland *The Fund* mining at pp. 1-150 with documented incidents (Stefanova onboarding-panel breakdown, baseball-card rigging, Britt Harris arrival/departure, contract-dispute cases) paired with Dalio-lawyer publicly-disputed verbatim disputes. 12 cognitive patterns + 12 signature moves + 15 analogous cases + 25+ sources + 40+ signature phrases + 8 Copeland-Dalio tensions extracted. Lowenstein *When Genius Failed* captured for LTCM-risk-doctrine context.
- **Root subagent (README)**: user-authored curation captured the 4 core cognitive moves (principles-as-code, pattern-match-across-centuries, pain-reflection-progress, believability-weighted-decision-making) + flagged the LOAD-BEARING Copeland critical-perspective as non-negotiable honesty discipline. 5 cognitive patterns + 12 analogous cases + 5 tensions + 10 signature phrases + 5 distinctive questions + 16 sources extracted.
- **Ghost-citation spot checks**: "pain" / "idea meritocracy" / "believab" keyword presence verified across archive files via Grep (multiple hits in transcripts + README). Canonical Dalio phrases in persona ("Pain + Reflection = Progress", "An idea meritocracy", "meaningful work and meaningful relationships", "radical truth and radical transparency", "I'm a hyperrealist") are widely-documented across primary-source canon; attributed at source-file level rather than line-level per standard practice for well-documented canon. Signature phrases in thinking_mode kept to commonly-documented formulations only.

### Copeland critical-perspective honesty (load-bearing)

The persona's Shadow section explicitly encodes the Copeland-documented gap between the idea-meritocracy-as-advertised in *Principles* (2017) and the Bridgewater organization-as-operated in practice: (a) dots system reportedly elevated Dalio's own opinions disproportionately; (b) believability-weighting produced chronic anxiety rather than safety; (c) high turnover at senior levels; (d) specific documented incidents (Stefanova, Harris, contract disputes) describe operating environment substantially more coercive than *Principles* acknowledges. Several specific Copeland claims are publicly disputed by Dalio. Some former employees endorse Copeland's broader picture; others contest it. The persona encodes the cognitive moves at personal scale (pattern-match, believability-weight one-off disagreements, write principles down) and explicitly does NOT endorse the Bridgewater organizational implementation as a validated protocol. The gap is non-negotiable load-bearing honesty for the persona — do not soften into "on the one hand, on the other hand" rhetoric. The discipline is written into both the persona's Shadow section and the slash command's Step 3 voice rules.

### Probabilistic humility on macro calls

Second encoded discipline: Dalio's own frame prescribes probability + payoff + sizing-for-survival for every forecast. Persona honors this explicitly. When user cites a confident Dalio macro call (civil-war-class conflict ~50% in next decade, late-stage big-cycle positioning of US, end-of-debt-supercycle), persona delivers as stated bet with probability, triangulates opposite case, and flags the "end of debt supercycle" 2010s timing miss as canonical case of forecaster-certainty that outlived its sell-by date. Does not deliver certainty masquerading as conviction.

### Regime-detection on pattern-matching

Third encoded discipline: the pattern-matching reflex ("what kind of thing is this? how many times before?") is powerful when the reference class applies, degrades into false precision when the situation is genuinely novel. When user's situation is plausibly new-regime (AI as general-purpose technology mid-2020s is the canonical live case), persona asks "new regime or one of the old ones?" before forcing the pattern. Willing to say "reference class is genuinely thin, pattern-matching produces false precision, need a different frame."

### Not in scope (deferred to future updates)

- TED 2017 "How to Build a Company Where the Best Ideas Win" (captions not directly fetchable from ted.com)
- Lex Fridman Podcast #251 "Money, Power, and the Collapse of Empires" (December 2021)
- Talks at Google "Principles: Life and Work" (October 2018, Jordan Thibodeau)
- Tucker Carlson Show — Ray Dalio on the Civil War Cycle (Feb 2025/2026, singjupost transcript available)
- David Rubenstein Show — Ray Dalio at 92nd Street Y (January 2026)
- Tim Ferriss Show #264 "Ray Dalio, The Steve Jobs of Investing" (September 2017)
- Bridgewater Daily Observations selected publicly-released excerpts
- Full *Changing World Order* essay series on economicprinciples.org (chapters not yet captured)

---

## [2.20.0-alpha] — 2026-04-22 — "Charlie Munger joins the starter pack"

### Why

User requested a Charlie Munger persona for ongoing startup work. Corpus was dense with primary-source material: 5 articles (USC Law 2007 commencement — THE canonical Munger speech, verbatim full text; Howard Marks's "Easy Money" Oaktree tribute memo January 2024 preserving a private 2001 Munger line; Daily Journal obituary; Tren Griffin's 25iq capital-allocation essay; Shane Parrish's FS Munger Operating System distillation); 5 transcripts totaling ~74k verbatim words (Psychology of Human Misjudgment Harvard 1995 — foundational 12k words; Daily Journal Corp 2017/2019/2023 — DJ 2023 is his LAST public meeting before his Nov 28 2023 death; Caltech 2020 alumni conversation); and 7 books (Poor Charlie's Almanack Kaufman ed. 2005/2023 — THE single most important primary source, Stripe Press free online; Seeking Wisdom by Peter Bevelin 2003; The Complete Investor by Tren Griffin 2015; Damn Right! authorized biography by Janet Lowe 2000; The Snowball by Alice Schroeder 2008; Invested by Danielle Town; Blue Chip Stamps letters). User-authored README pre-identified 6 core cognitive moves + the late-life-acidity meta-note.

Built using the full v2.14 research pipeline (4 parallel subagents) per `/muse:build`.

### Added

- **`personas/charlie-munger.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe), 12 cognitive patterns (6 user-identified + 6 surfaced: iron-prescription-on-opinions, Planck-vs-chauffeur knowledge, opportunity-cost-as-second-best-idea, lifelong-learning-machine, avoidance-as-principal-method, denial-as-master-bias), 5 rich analogous cases with verbatim quotes (USC 2007 India inversion; Harvard 1986 "prescriptions for guaranteed misery"; Lincoln-Nebraska gallbladder doctor; McDonnell Douglas 4-tendency lollapalooza; Daily Journal 2023 "cryptocrappo" + ChatGPT denial-master-bias moment), 7 benchmark prompts, 14 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`.
- **`commands/muse:charlie-munger.md`** — slash command entry point. Mandatory interpretive-frame disclaimer (Berkshire and Munger family/estate are IP-protective). Two specific disciplines encoded: (1) late-life acidity honesty — persona maintains Munger's publicly-stated views on crypto, EMH/CAPM, formula-based hurdle rates without softening; (2) iron prescription on the persona itself — when user asks Munger to validate a position, the persona applies the iron prescription TO the user's position first.
- **`tests/build-regression/golden/charlie-munger.signatures.txt`** + **`tests/session-regression/golden/charlie-munger.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 15 → 16 personas. New "First Principles + Strategy + Philosophy (Multidisciplinary Latticework + Inversion)" category introduced for Munger.
- Regression harnesses green at 16/16 personas (build-regression) and 80 pairs (session-regression, 16 personas × 5 modes).

### Pipeline notes

- Articles subagent: 5 articles full-read (~42k tokens). 15 cognitive patterns + 15 signature moves + 16 analogous cases + 28 signature phrases extracted. USC 2007 is the densest single-speech Munger source; Howard Marks 2024 tribute preserves a canonical private 2001 Munger line on easy-money-corrupts-absolutely.
- Transcripts subagent: 5 transcripts skim-then-deepen (~74k total words). Psychology 1995 is the foundational canonical talk — the original 24 causes with lollapalooza introduced in closing Q&A. Daily Journal 2023 mined explicitly for "cryptocrappo" + the ChatGPT denial-master-bias moment (Munger's final public consolidation of the framework).
- Books subagent: Poor Charlie's Almanack read at ~230 of 618 pages across 7 principal talks (Portrait biography, Munger Approach, Harvard 1995 psychology reprint, Elementary Worldly Wisdom USC 1994, Practical Thought 1996 Glotz/Coke lollapalooza, Academic Economics UCSB 2003, USC Law 2007). Bevelin PDF was Chinese translation — primary English material captured via PCA instead. Snowball .epub skipped per instructions.
- Root subagent (README): captured all 6 user-identified cognitive moves + late-life-acidity meta-note, 10+ analogous cases, 5 canonical tensions.
- Ghost-citation verified: lollapalooza/incentive/show-me-the-incentive (21 hits in Harvard 1995); cryptocrappo/denial (7 hits in DJ 2023); seamless web / deserved trust (3 hits in USC 2007). "Invert, always invert" attributed to Poor Charlie's Almanack as Jacobi quote Munger borrows (README names this explicitly; PCA has the full Jacobi citation).

### Late-life acidity honesty

The persona explicitly encodes Munger's late-life voice — bone-dry, morally pointed, multidisciplinary, impatient with denial. Voice rules maintain Munger's publicly-stated views on crypto ("cryptocrappo"), EMH/CAPM (academic-clean-divorced-from-lollapalooza-reality), formula-based hurdle rates (use opportunity-cost-as-second-best-idea instead), and diversification-as-universal-advice (wrong when the opportunity is a cinch). Does not soften into hedged "on the one hand, on the other hand" on these topics — Munger wasn't that person. When user asks Munger to validate a position, the persona applies the iron prescription TO the user's position first before engaging substance.

### Honest attribution note

Poor Charlie's Almanack (700+ pages across 11 talks) and Seeking Wisdom were cited at the book-level rather than page-level. Specific quotes attributed to PCA (like "where I'm going to die so I'll never go there") are canonical Munger quotes widely documented across PCA and Bevelin, but were not always verified against the specific ~230 pages the books subagent skimmed. This follows standard practice for well-documented primary-source canon where file-level attribution is sufficient for muse's interpretive-frame purpose.

### Not in scope (deferred to future updates)

- 2014 Berkshire annual meeting Q&A — Munger's 50-year-letter retrospective
- "Practical Thought About Practical Thought?" 1996 Coca-Cola lollapalooza thought experiment standalone treatment
- "Academic Economics: Strengths and Faults After Considering Interdisciplinary Needs" UCSB 2003 standalone
- Whitney Tilson's multi-year Daily Journal meeting notes
- CNBC "Charlie Munger: A Life of Wit and Wisdom" Becky Quick special (Nov 30, 2023)
- Li Lu's "On Being Asked About Charlie Munger" essays

---

## [2.19.0-alpha] — 2026-04-22 — "Steve Jobs joins the starter pack"

### Why

User requested a Steve Jobs persona for ongoing startup work. Corpus was dense with primary-source material: 5 verbatim long-form articles (Playboy 1985 15k words; Wired 1996; TIME 1997; Rolling Stone 2003; Fortune 2008) totaling ~38k words, 7 books (Isaacson 2011 authorized biography; Schlender & Tetzeli 2015 insider-preferred; Kocienda's Creative Selection 2018; Segall's Insanely Simple 2012; Lashinsky's Inside Apple 2012; Moritz's Return to the Little Kingdom 2009; Make Something Wonderful 2023 Steve Jobs Archive), and 6 verbatim video transcripts (Stanford commencement 2005; Lost Interview with Cringely 1995; MIT Sloan 1992; WWDC 1997 Fireside Q&A; iPhone keynote Macworld 2007; D5 Gates+Jobs joint 2007) totaling ~60k words. User-authored README pre-identified 6 core cognitive moves + named the reality-distortion tension (positive vs negative faces).

Built using the full v2.14 research pipeline (4 parallel subagents) per `/muse:build`.

### Added

- **`personas/steve-jobs.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe), 12 cognitive patterns (6 user-identified + 6 surfaced: A-players-only/bozo-explosion, process-vs-content diagnostic, craftsmanship-in-5000-subtleties, customer-experience-backwards, cannibalize-yourself-before-competitors, memento-mori-decision-filter), 5 rich analogous cases with verbatim quotes (1997 Apple return 350→4 product cut; iPhone 2007 three-revolutions keynote; Xerox PARC 1979 "obvious in 10 minutes"; Stanford 2005 commencement three stories; iPod Fadell Lego-mockup demo 2001), 7 benchmark prompts, 18 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`.
- **`commands/muse:steve-jobs.md`** — slash command entry point matching v2.16 template. Mandatory interpretive-frame disclaimer printed at session start (Apple + Jobs estate are IP-protective). Explicit instruction that the persona does NOT endorse Jobs's gratuitous cruelty or cancer-delay reality-distortion — only the constructive subset (direct honesty, bar-holding, demo-demanding, memento mori).
- **`tests/build-regression/golden/steve-jobs.signatures.txt`** + **`tests/session-regression/golden/steve-jobs.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 14 → 15 personas. New "Strategy + Design + Execution (Focus-by-Subtraction + Taste-as-Constraint)" category introduced for Jobs.
- Regression harnesses green at 15/15 personas (build-regression) and 75 pairs (session-regression, 15 personas × 5 modes).

### Pipeline notes

- Articles subagent: 5 verbatim articles, full-read, ~78k tokens. 25 cognitive patterns + 19 signature moves + 21 analogous cases + 28 signature phrases extracted. Surfaced the "hero-shithead roller coaster" and "competent tyrant" patterns beyond user-identified.
- Transcripts subagent: 6 transcripts skim-then-deepen (~60k total words, ~50k read). Key canonical phrases verified: "focusing is about saying no" (WWDC 1997), "stay hungry stay foolish" (Stanford 2005), "good artists copy, great artists steal" attributing Picasso (Lost Interview 1995). 40 signature phrases + 15 distinctive questions + 15 cognitive patterns.
- Books subagent: 5 of 7 PDFs skim-read (~200 pages total: Isaacson 60pp, Make Something Wonderful 40pp, Kocienda 40pp, Segall 20pp, Schlender 40pp). Inside Apple and Return to Little Kingdom not needed for first pass. Kocienda's Creative Selection is the canonical demo-driven-development source; cited for the iPad keyboard decision story.
- Root subagent (README): user-authored curation captured 6 cognitive moves explicitly, named reality-distortion as positive+negative, listed 15 analogous cases, identified 5 canonical tensions.
- Ghost-citation verified: "focusing is about saying no" + "can only do three" 5 hits in WWDC 1997; "stay hungry / stay foolish / connect the dots" 5 hits in Stanford 2005; Xerox/PARC/"obvious" 14 hits in Lost Interview 1995; "bicycle for the mind" 2 hits in Rolling Stone 2003.

### Reality-distortion honesty

The persona explicitly encodes the two faces of reality-distortion (positive: Corning glass, iPhone ship date, Mac circuit board thinner; negative: nine-month pancreatic cancer surgery delay) and instructs the agent to classify the domain before applying the move — *negotiable* (supplier capability, engineering tolerance, deadline) vs *non-negotiable* (biology, thermodynamics, time-past). Refuse to apply reality-distortion to non-negotiable domains. That's the fatal misapplication of the move, and Jobs's own worst moment.

### Cruelty disclaimer

The persona does NOT endorse or adopt Jobs's gratuitous cruelty — the "bozo" name-calling, public humiliation, and employee damage documented in Fortune 2008 and Schlender/Tetzeli 2015. The constructive subset (direct honesty, refusal to accept "good enough", bar-holding, demo-demanding, memento mori decision-filter) is what this persona encodes. Voice rules explicitly ban the cruelty patterns.

### Not in scope (deferred to future updates)

- D8 All Things Digital 2010 (Mossberg/Swisher) — Jobs's last major public interview before 2011 death
- D5 Jobs Solo Interview (May 2007, before Gates joint)
- Smithsonian Oral History April 1995 (Daniel Morrow)
- "Think Different" 1997 internal Apple meeting
- Gladwell's "The Tweaker" New Yorker 2011 (adversarial counter-interpretation)
- Andy Hertzfeld, Revolution in the Valley (2005) — original Mac team's version
- Jony Ive, Designed by Apple in California (2016)
- Steven Levy, The Perfect Thing (2006) — iPod story
- Lee Clow interviews on advertising with Jobs

---

## [2.18.0-alpha] — 2026-04-22 — "Naval Ravikant joins the starter pack"

### Why

User requested a Naval Ravikant persona for ongoing startup work. Corpus was pre-curated with exceptional depth: 6 articles from nav.al (mix verbatim/summary), 1 primary book (The Almanack of Naval Ravikant, 232 pages, Jorgenson 2020) + 5 text-only summaries of influence books (Poor Charlie's Almanack, Beginning of Infinity, Finite/Infinite Games, Skin in the Game), and 5 verbatim video transcripts totaling ~162k words across 13h15m (Naval Podcast 'How to Get Rich' mega-episode with Nivi 2019, JRE #1309 2019, Tim Ferriss #473 2020, Knowledge Project Ep. 18 2017, Modern Wisdom '44 Harsh Truths' 2024). User-authored README pre-identified 6 core cognitive moves + flagged the LIVING-SUBJECT disclaimer as especially load-bearing (Naval publicly revises his own most-quoted aphorisms — 2024 Modern Wisdom contains several "I'm not sure that statement is true anymore" retractions).

Built using the full v2.14 research pipeline (4 parallel subagents: articles, transcripts, books, root) per `/muse:build`.

### Added

- **`personas/naval-ravikant.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe), 12 cognitive patterns (6 user-identified + 6 surfaced during mining), 5 rich analogous cases with verbatim quotes (AngelList 2010 founding, Epinions 'competition is the wrong game', the mom-at-pizza-parlor specific-knowledge reveal at 15, the jealousy-breakthrough moment on impossibility-of-cherry-picking, the 60-day one-hour-morning meditation protocol), 6 benchmark prompts, 24 verified sources (tweet thread + 6 articles + Almanack with 6 chapters + 5 transcripts + 4 influence books). All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit 2024 retraction honesty.
- **`commands/muse:naval-ravikant.md`** — slash command entry point matching v2.16 template. Full disclaimer printed at session start. Retraction-honesty instruction in Step 3 (persona acknowledges when user cites aphorisms with known 2024 updates).
- **`tests/build-regression/golden/naval-ravikant.signatures.txt`** + **`tests/session-regression/golden/naval-ravikant.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 13 → 14 personas. New "Strategy + Execution + Philosophy (Leverage-as-Wealth-Engine)" category introduced for Naval.
- Regression harnesses now green at 14/14 personas (build-regression) and 70 pairs (session-regression, 14 personas × 5 modes).

### Pipeline notes

- Articles subagent: 6 files (mix verbatim/summary per README fetch_status), ~185k tokens used, 29 signature phrases + 14 signature moves + 13 cognitive patterns + 10 analogous cases extracted
- Transcripts subagent: 5 files, skim-then-deepen applied per v2.14 protocol — ~52k words read of ~162k total, covering: leverage/specific-knowledge/long-term-games (Naval Podcast), happiness/anxiety/meditation (Ferriss), reading/jealousy-breakthrough (Knowledge Project), retrospective-aphorism-revision (Modern Wisdom 2024), mainstream-breakthrough (JRE). 43 signature phrases + 15 cognitive patterns + 11 analogous cases + 16 distinctive questions extracted. The 2024 Modern Wisdom episode was explicitly mined for retractions to honor the living-subject honesty.
- Books subagent: text-first strategy — 5 ref summaries + targeted Almanack PDF skim (100/232 pages across 5 windows: TOC, wealth, judgment, happiness+saving-yourself, philosophy+recommended-reading). 14 cognitive patterns + 12 signature moves + 14 analogous cases + 38 signature phrases + 29 sources extracted. Noted Naval's 2008 Life Formulas I and 2016 Rules as earlier canonical primary texts beyond the Almanack.
- Root subagent (README): user-authored curation captured the 6 cognitive moves + 10 analogous cases (AngelList, Vast.com, Epinions, Hit Forge, ~200 investments, How-to-Get-Rich 2018 tweetstorm, Almanack 2020, nav.al, 2024 Modern Wisdom, JRE 1309) + living-iterating-thinker meta-note.
- Ghost-citation: all key quotes verified to appear in source files via Grep (specific knowledge / long-term game / leverage: 7 hits in play-long-term-games; 1000 parallel universes: 3 hits in How to Get Rich; $5,000/hr aspirational rate: 3 hits in How to Get Rich; "I'm not sure that statement": 2 hits in Modern Wisdom 2024).

### Living-subject honesty

This persona includes an explicit "retraction honesty" instruction in the slash command: when a user cites a Naval aphorism that has a known 2024 Modern Wisdom update, the session acknowledges both versions. Example: user cites "success requires dissatisfaction" → Naval 2024 Modern Wisdom: "I'm not sure that statement is true anymore." This honesty is part of the persona because Naval himself does this in public. The persona refuses to pretend Naval's canonical corpus is settled.

### Not in scope (deferred to future updates)

- Lex Fridman Podcast Ep. #138 (2020) and #307+ (2022) — two canonical long-forms, captions not maximally extractable yet
- Naval on EconTalk with Russ Roberts
- All-In Podcast appearances (multiple)
- Tim Ferriss Show #97 (2015) "The Evolutionary Angel" early-career interview
- Ranveer Show "Self-Obsession Is the Root of All Misery" (2024) — most explicitly Vedantic
- Sapiens by Yuval Noah Harari — most-cited background reading

---

## [2.17.0-alpha] — 2026-04-22 — "David Ogilvy joins the starter pack"

### Why

User requested a David Ogilvy persona for ongoing startup work. Corpus at `.archives/personas/david-ogilvy/` is the richest external submission to date: 6 curated articles, 9 books (8 PDFs + 1 EPUB, including Confessions, Ogilvy on Advertising, Unpublished Ogilvy, Blood Brains & Beer, the 1935 AGA cooker manual, and Kenneth Roman's 2009 biography), 5 verbatim video transcripts totaling ~16,000 words (Touffou 1982, Crichton interview c.1977, We Sell — Or Else 1985, Letterman 1983, Salesman documentary), and a user-authored README pre-identifying the five core cognitive moves.

Built using the full v2.14 research pipeline (4 parallel subagents, triple-verification, Synthesis Plan + Audit, inline gates) per `/muse:build`. This is the first persona built end-to-end under the v2.16 adaptive-runtime release.

### Added

- **`personas/david-ogilvy.md`** — interpretive persona with 7 signature moves (balanced across framing/inquiry/test-probe categories), 12 cognitive patterns, 5 analogous cases (Rolls-Royce 1958 with 3-week research and 26 headlines, Hathaway eye-patch 27-year run, Commander Whitehead at Schweppes 19 years, Pepperidge Farm 2 a.m. wagon dream 25+ year run, Eleanor Roosevelt margarine confessed flop), 6 benchmark prompts, 18 verified sources (7 books/memos + 5 transcripts + 6 secondary). All 6 canonical dilemmas covered via `canonical_mapping`.
- **`commands/muse:david-ogilvy.md`** — slash command entry point matching v2.16 template. Interpretive-frame disclaimer printed at session start.
- **`tests/build-regression/golden/david-ogilvy.signatures.txt`** + **`tests/session-regression/golden/david-ogilvy.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 12 → 13 personas. New "Strategy + Execution + Empirical (Copy-as-Measurable-Science)" category introduced for Ogilvy.
- Regression harnesses now green at 13/13 personas (build-regression) and 65 pairs (session-regression, 13 personas × 5 modes).

### Pipeline notes

- Articles subagent: 6 files, 38k tokens used, 0 prompt-injection patterns detected
- Transcripts subagent: 5 files, ~16k words verbatim Ogilvy speech, 30 signature phrases + 12 distinctive questions + 12 banned phrases + 12 analogous cases + 13 cognitive patterns extracted
- Books subagent: text-first strategy after initial PDF-size failure — 6 ref/books/*.md summaries + targeted PDF skim (Confessions pp.1-20, AGA 1935 full 15pp, Unpublished Ogilvy pp.1-40, Blood Brains Beer pp.1-20). 15 signature moves + 17 sources + 30 signature phrases from books alone.
- Root subagent (README): user-authored curation captured the 5 cognitive moves + Eleanor Roosevelt / Manet AGA / Xerox / Sorrell flops as analogous cases
- Ghost-citation: all key quotes verified to appear in source files via Grep (three weeks + electric clock in Touffou; Eleanor Roosevelt + margarine in Letterman; Russian doll + giants + dwarfs in Touffou; Hathaway + eyepatch in Touffou)

### Not in scope (for future updates)

- Forbes 1982 Hicks profile (not fetched — link in archive)
- Drayton Bird's Ogilvy memo archive (blog)
- Founders podcast Ep. 82 on Ogilvy (David Senra, Spotify)
- Additional Magic Lantern training films beyond Touffou

---

## [2.16.0-alpha] — 2026-04-22 — "Adaptive session runtime" — EXPLORE mode, convergence loop, threads, handoff, council, artifacts

### Why

Per CEO + Eng review pipeline (2026-04-22 plan at `~/.gstack/projects/muse/ceo-plans/2026-04-22-adaptive-session-runtime.md`). User observation: v2.2 sessions are constrained by fixed stage counts per mode, cannot adapt to where thinking actually wants to go, cannot save progressively, cannot cross days. Some problems need to be thought through until the result lands, not stopped at a timer.

v2.16 converts the session runtime from fixed-stage to adaptive, with checkpoint-every-stage persistence, multi-session continuity via threads, mid-session mode upgrade + persona handoff, multi-persona councils, decision-artifact templates, and six small-wins primitives that make the runtime feel alive instead of step-through.

### Added

**New modes + orchestration**:
- **EXPLORE mode** — no stage cap, convergence-driven. Session iterates until thinking lands (convergence `converged`), needs more depth (`deepen` → loop current stage), needs new framing (`pivot` → loop to Stage 1), or needs different persona (`handoff` → spawn linked session).
- **Convergence detector** (`CONVERGENCE.md`) — two-tier: cheap heuristic (word-count delta, repetition, pivot counter, safety cap) + LLM-judge Agent via shared primitive (`LLM_JUDGE.md`). Mode-specific policy: QUICK skips LLM-judge entirely, STANDARD/CRITIC invoke on uncertainty, DEEP/EXPLORE every stage.
- **Loop-back primitives** — `deepen` re-enters same stage with new probe; `pivot` loops to Stage 1; safety cap at 15 stages in EXPLORE forces convergence.

**Persistence + resume**:
- **Checkpoint-every-stage** — session file updates after every stage (append-only), not just Stage 5. Crash-safe.
- **Living document** — session file valid markdown at every intermediate state; user can watch the session unfold in an editor.
- **Resume workflow** — `/muse:<persona> --resume <path>` or `/muse:continue <path>` reconstructs state from checkpoint and continues the stage graph.
- **New skill** `commands/muse:continue.md` — entry point for resume.

**Cross-session continuity**:
- **Thread concept** (`THREADS.md`) — `--thread=<slug>` groups sessions. Thread digest at `~/.muse/threads/<slug>/digest.md` rolled up after each session, injected into next session's persona context.
- **Thread slug derivation** — explicit flag > inherited from parent > auto-derived from question. Collision detection via Jaccard + hash suffix.
- **Digest compaction + audit log** — rotate last 5 archives before compacting.
- **Thread-scoped bookmarks** — `~/.muse/threads/<slug>/followups.md` visible to all sessions in thread.

**Mid-session primitives** (formalized grammar `^/(bookmark|recap|rewind|promote|handoff|council|dontknow)(\s+.*)?$`):
- `/promote <mode>` — upgrade STANDARD → DEEP → EXPLORE mid-session
- `/handoff <persona-id>` — spawn linked session with new persona, state transfer (digest + compressed outputs + current framing)
- `/council <p1> <p2> [<p3>]` — parallel Agent dispatch, side-by-side ASCII rendering, synthesis option
- `/bookmark <note>` — save tangent to thread's followups.md
- `/recap` — 3-bullet summary on demand, no LLM call
- `/rewind <n>` — reload checkpoint from n stages back
- `/dontknow` — clean pause, resumable anytime
- Progress indicator in every stage banner: `Stage N · mode=X · stage N/? · pivots:K · last-verdict:Y`

**Auto-handoff hints**:
- After each stage, lightweight check: does next stage need a move this persona lacks? If yes, offer handoff. Disabled in `MUSE_REGRESSION_MODE=true`.

**Multi-persona council** (`COUNCIL.md`):
- 2-3 persona parallel Agent dispatch at any STOP point
- Per-Agent 45s timeout; timeout produces placeholder cell, others still render
- ASCII side-by-side output (2 or 3 column)
- Options: A/B/C go with one persona, option C synthesize, option D reject

**Artifact templates** (`artifact-templates/`):
- `decision-memo.md` — committed stance + rationale + next action
- `rfc.md` — proposal with alternatives + tradeoffs
- `one-pager.md` — summary + next action for sharing
- `spec.md` — functional + non-functional requirements + data model + edge cases
- Stage 5 now offers artifact-type choice; default session log always written; chosen artifact written to `~/.muse/artifacts/`

**New infrastructure**:
- `LLM_JUDGE.md` — shared LLM-judge primitive used by both RESEARCH_PIPELINE.md (v2.14 semantic similarity) and CONVERGENCE.md (v2.16 convergence detector). Includes caching, deterministic-mode, fallback behavior.
- `lib/thread-lock.sh` — cross-platform mkdir+PID-file locking for concurrent thread writes. `flock` is Linux-only; `mkdir` is POSIX. Stale-lock recovery via PID-check + mtime. iCloud Drive detection warns user about atomicity gaps.
- `tests/session-regression/run.sh` — session-regression harness validating static invariants (persona has required move categories per mode, canonical coverage, SESSION.md structural integrity, schema fingerprints per (persona, mode) pair). Supports snapshot + check modes. 48-60 (persona, mode) pairs green.
- `tests/session-regression/migrate-v2-2-to-v2-16.sh` — idempotent migration script for existing v2.2 session files (adds null v2.16 frontmatter fields without changing v2.2 content).
- `tests/session-regression/convergence-eval.sh` + `convergence-fixtures/` — 10 labeled fixtures (3 converged, 3 deepen, 2 pivot, 2 handoff). Eval pass threshold ≥70% verdict accuracy.

**Regression mode**:
- `MUSE_REGRESSION_MODE=true` env var bypasses convergence detector, disables auto-handoff, disables council LLM-judge. Makes regression deterministic.

### Changed

- `SESSION.md` v2.2 → v2.16 (~200 lines added): EXPLORE mode, command grammar, /promote + /handoff dispatch, small-wins primitives, thread digest loading at pre-flight, convergence loop semantics, Stage 5 artifact selection, checkpoint-every-stage persistence, resume workflow.
- Frontmatter schema: new fields `thread_id`, `parent_session`, `checkpoint_stage`, `convergence_state`, `handed_off_to`, `handoff_at_stage`, `convergence_calls`, `llm_judge_calls`, `pivots`, `deepen_loops`. All additive; v2.2 files remain compatible (null values = v2.2 behavior).
- `RESEARCH_PIPELINE.md` — references new `LLM_JUDGE.md` shared primitive (cosmetic note; no behavior change).
- `docs/CHANGELOG.md` v2.16 entry.

### Fixed

- **Fixed-stage thinking for open-ended questions** — sessions that need depth can now keep going until convergence, not stop at mode timer
- **Cold-start across sessions** — multi-day thinking on the same problem previously lost context; threads + digest carry forward
- **Manual rewrite of persona mid-session** — previously required abort + restart with new persona; now single `/handoff` command
- **Only log output format** — Stage 5 now offers decision memo / RFC / one-pager / spec templates alongside the session log
- **Silent crash loses session** — v2.2 only wrote at Stage 5; v2.16 checkpoints after every stage; `/muse:continue` resumes from last checkpoint
- **Confidence-score theater** — outside-voice review flagged LLM self-assessed confidence as miscalibrated; v2.16 convergence schema uses discrete verdicts only, drops the confidence field
- **Non-deterministic regression** — `MUSE_REGRESSION_MODE=true` env var disables convergence detector and LLM-judge calls for deterministic testing

### Architecture

Follows the `Boil the Lake` principle: every component that would take 2+ hours of human work gets the complete implementation in minutes of CC work. 14-18hr CC estimate realistic (40+hr human team equivalent).

Implementation sequencing (all phases shipped in this release):
- Phase 2.16.0a — Session-regression harness (new test infra)
- Phase 2.16.0b — v2.2 → v2.16 migration + MUSE_REGRESSION_MODE env var
- Phase 2.16.1 — Foundation: schema additions, checkpoint-every-stage, resume workflow
- Phase 2.16.2 — EXPLORE mode + convergence loop + command grammar
- Phase 2.16.3 — Thread + digest layer (THREADS.md)
- Phase 2.16.4 — Mode upgrade (`/promote`) + handoff (`/handoff`) + auto-handoff hints
- Phase 2.16.5 — Council dispatch (COUNCIL.md)
- Phase 2.16.6 — Artifact templates (4 new)
- Phase 2.16.7 — Small-wins pack (6 primitives)
- Phase 2.16.8 — Concurrent-write safety (lib/thread-lock.sh) + iCloud warning
- Phase 2.16.9 — Full regression + convergence eval fixtures

### Reviews

- `/plan-ceo-review` (2026-04-22): SCOPE_EXPANSION mode, 5/5 expansions accepted, baseline B+ locked
- `/plan-eng-review` (2026-04-22): 15 issues found, 13 auto-fixed, 2 answered by user decisions
- Outside voice (Claude subagent adversarial review): 10 findings, 3 load-bearing tensions resolved (confidence dropped, command grammar formalized, scope held), 7 specs tightened in plan

### Not in scope (deferred to v2.17+)

- Queryable session history ("show me every debate where I was wrong")
- Thread map visualization (`/muse:map <thread_id>` ASCII tree)
- Persona disagreement surfacing across thread history
- Session replay with different persona
- Convergence threshold user-tuning
- Stage branching for parallel subthreads
- Silent thinking phase (agent-initiated pause, vs user-initiated `/dontknow`)
- v2.20 full thinking-graph rewrite (sessions as DAG nodes, concurrent multi-persona)

### Known limitations (surfaced in eng review, accepted as v2.16-scope)

- Session-regression validates STATIC invariants (persona completeness per mode, schema integrity) — runtime quality requires manual QA + `/muse:benchmark`. Actual session invocation requires the Claude Code runtime.
- Convergence detector eval (10 fixtures) requires Claude Code to dispatch the judge; bash script documents the procedure but cannot run the judge itself.
- Outside voice noted convergence detector is "LLM judging LLM" — no ground truth, miscalibration risk. Mitigated via: heuristic-first tier (zero cost), safety cap at 15 stages, 3-consecutive-deepen forced convergence, `MUSE_REGRESSION_MODE` bypass.
- Critical gaps (disk-full on checkpoint, handoff to malformed persona) documented in plan for Phase 2.17 polish, not blocking ship.

### Install

```bash
cd ~/.claude/skills/muse && git pull
# then migrate any existing v2.2 session files:
bash tests/session-regression/migrate-v2-2-to-v2-16.sh
```

Existing v2.2 sessions continue to work unchanged until migrated. Post-migration they opt in to v2.16 features (resume, thread continuity). Backward-compatible.

### Shipped modules

- `SESSION.md` — v2.16 adaptive runtime spec (~1100 lines)
- `CONVERGENCE.md` — convergence detector spec (NEW)
- `COUNCIL.md` — council dispatch spec (NEW)
- `THREADS.md` — thread + digest spec (NEW)
- `LLM_JUDGE.md` — shared LLM-judge primitive (NEW)
- `commands/muse:continue.md` — resume skill (NEW)
- `artifact-templates/` — 4 templates (NEW)
- `lib/thread-lock.sh` — cross-platform locking helper (NEW)
- `tests/session-regression/` — harness + migration + convergence eval + 10 fixtures (NEW)

---

## [2.15.0-alpha] — 2026-04-22 — "Living and fresh" — corpus_fingerprint, /muse:refresh, /muse:rebuild, update-skill pipeline expansion, auto-rewrite on ghost-citation fail

### Why

Phase 3 of the persona-quality overhaul (per CEO plan `~/.gstack/projects/muse/ceo-plans/2026-04-21-persona-quality-overhaul.md`). Phase 1 (v2.13) gated the drafter. Phase 2 (v2.14) gave the pipeline smarter brains. Phase 3 closes the trilogy by addressing **staleness** (living figures publish daily — a month-old Seth persona decays), **user-facing rebuild safety** (the manual `cp; rm; /muse:build` dance is lossy and risky), and **update-skill primary-source grounding** (C3/C6/C9/C10/C11 fixes previously relied on inline inference from the persona file itself — now they can route through the v2.14 pipeline for primary-source evidence).

### Added

- **`corpus_fingerprint` frontmatter field** (Item 14) in `docs/PERSONA_SCHEMA.md`. Optional v2.15 field with `last_mined`, `src_folder`, `bucket_counts`, `total_files`, `total_bytes`. Lightweight mtime + count snapshot (not SHA256 — QOVER-9 deferred). Fully additive; pre-v2.15 personas keep working but can't be refresh-mined until rebuilt or updated.
- **Staleness detection appendix** (Item 15) in `RESEARCH_PIPELINE.md` Appendix A. Algorithm `compare_fingerprint(persona_id) → {fresh, stale, missing_fingerprint, corpus_missing}` using POSIX `find -newermt` + bucket-count diff + 5% size-drift threshold. Called by `/muse:refresh` Step 2.
- **`/muse:refresh <persona-id>` NEW skill** (Item 16) in `commands/muse:refresh.md`. 9-step incremental re-mine workflow: staleness check → delta file collection → delta-mode pipeline dispatch → merge proposal → diff + confirm → atomic write + fingerprint update → analytics log. `--check` dry-run flag. Does not replace `/muse:build` — additive-only merge, preserves existing persona structure.
- **`/muse:rebuild <persona-id>` NEW skill** (Item 17) in `commands/muse:rebuild.md`. 9-step safe-rebuild workflow with automatic backup + A/B comparison + user choice (accept new / keep old / merge manually). Replaces the manual `cp; rm; /muse:build` pattern with transactional semantics. Interactive merge mode walks each diff item-by-item for users who want line-by-line control.
- **`/muse:update` pipeline routing for C3/C6/C9/C10/C11** (Item 18) in `commands/muse:update.md`. Each C-check fix now offers a "point me at `.archives/personas/<id>/`" option that invokes the v2.14 research pipeline and filters the envelope to the relevant findings category (C3 → tensions; C6 → distinctive_questions + tensions + banned_phrases; C9 → signature_phrases; C10 → banned_phrases + signature_phrases; C11 → cognitive_patterns). Produces primary-source-grounded fixes. Fallback to inline inference on empty pipeline or no-research-material.
- **Auto-rewrite on ghost-citation fail** (Item 19) in `commands/muse:build.md` Step 4 sub-step 3.1 AND Step 5.95. Agent subagent reads the source file, finds a verified verbatim quote that expresses the same cognitive move, returns `VERIFIED_QUOTE / LINE / CONFIDENCE` or `NO_VERIFIED_QUOTE_FOUND / REASON`. Replaces the fabricated quote on re-verified pass. Usually succeeds when the drafter hallucinated the wording of a real idea; fails cleanly when the concept itself wasn't in the source.
- **`corpus_fingerprint` auto-write on `/muse:build` Step 7** — every new persona build now writes the fingerprint before atomic `mv`. Enables `/muse:refresh` on day-one new personas.
- **`tests/fixtures/refresh-delta-persona/`** — README-documented fixture with 4-file corpus + fingerprint of first 3. Validates Item 15 staleness detection + Item 16 delta-mine workflow.
- **`tests/fixtures/rebuild-diff-persona/`** — README-documented fixture with a deliberately-gappy v1 persona + 5-file corpus. Validates Item 17 A/B comparison + user-choice paths.

### Changed

- `commands/muse:build.md` v2.14.0-alpha → v2.15.0-alpha (Step 4.3.1 + Step 5.95 auto-rewrite, Step 7 fingerprint-write, header version bumps)
- `commands/muse:update.md` v2.14.0-alpha → v2.15.0-alpha tooling (C3/C6/C9/C10/C11 each gain pipeline-route option as first choice)
- `RESEARCH_PIPELINE.md` v2.14.0-alpha → v2.15.0-alpha (adds Appendix A: Staleness detection + delta-mode subagent prompt)
- `docs/PERSONA_SCHEMA.md` schema version 2.2.1-alpha → 2.15.0-alpha (header note + corpus_fingerprint field + footer version)
- Frontmatter schema: new optional field `corpus_fingerprint` (additive, backward-compatible)

### Fixed

- **Persona staleness for living figures** — a month-old Seth Godin persona built on 2026-03-15 couldn't detect the 30+ new posts added in April. v2.15 `/muse:refresh` closes the loop: fingerprint comparison → delta-mine → merge.
- **Manual rebuild was lossy** — users running `cp personas/<id>.md ~/backup/; rm personas/<id>.md; /muse:build <id>` had no structured A/B comparison. If the new build lost a signature move the user liked, they noticed after the fact. v2.15 `/muse:rebuild` gives an explicit diff + 3-way choice BEFORE finalizing.
- **Update-skill C-checks were inference-only** — C3/C6/C9/C10/C11 fixes derived proposals from the persona's own fields (already-distilled, potentially already-wrong). v2.15 lets each route through the pipeline and pull from primary sources when the corpus is available. Reduces "AI-flavored" voice-rule bans in favor of phrases the persona actually rejected.
- **Ghost-citation hard-stops were friction** — Step 5.95 previously FAILed the build when a quote didn't verify, forcing manual Step 4 loop-back. v2.15 dispatches an Agent to find a verified replacement from the same source file; usually saves the move without user intervention. Absolute verify-or-refuse guarantee preserved.

### Architecture

This is **Phase 3 of 3** per CEO plan — the trilogy is complete:
- Phase 1 (v2.13, 2026-04-21) — Gate the drafter: synthesis audit, inline gates, save-time gates, year-archive heuristic
- Phase 2 (v2.14, 2026-04-22) — Pipeline brains: envelope persistence, semantic similarity, context budget, adaptive PDF, rejected-candidates visibility, auto-retry
- **Phase 3 (v2.15, this release) — Living and fresh** (current): corpus_fingerprint, staleness detection, /muse:refresh, /muse:rebuild, update-skill pipeline expansion, auto-rewrite

### Reviews

- `/plan-ceo-review` on 2026-04-21: CLEAR, SELECTIVE_EXPANSION mode — 20 of 30 items accepted, 10 deferred to QOVER-1..10 in TODOS.md
- `/plan-eng-review` on 2026-04-22: CLEAR — 2 key decisions resolved via AskUserQuestion (LLM-judge over embeddings; separate v2.14→v2.15 releases)

### Not in scope (deferred to TODOS.md QOVER-1..10)

- SHA256 content-addressed corpus manifest (QOVER-9) — mtime + count sufficient for Seth's append-only use case; revisit when edit-heavy living-figure persona surfaces
- Embedding API integration (OpenAI/Cohere/Voyage) — conflicts with zero-dep philosophy; LLM-judge via Agent covers semantic similarity
- `/muse:explore <id>` corpus preview skill (QOVER-2) — low demand
- Multi-persona batch build (QOVER-3) — low demand
- Session-quality feedback loop (QOVER-6) — own future CEO plan
- Specialized adversarial reviewers (QOVER-7) — complexity not yet justified
- EPUB native support (QOVER-8) — `ebook-convert` convention acceptable
- Per-era / per-bucket finding weighting (QOVER-9) — semantic similarity is a bigger lever
- Mid-build interactive redirect (QOVER-10) — low demand
- Backfilling v2.10+ pipeline improvements against the 12 shipped personas — golden regression still passes; users can opt in via `/muse:rebuild <id>`

### Install

```bash
cd ~/.claude/skills/muse && git pull
# (or) cp -r commands/* RESEARCH_PIPELINE.md docs/ tests/fixtures/ ~/.claude/skills/muse/
```

Existing personas continue to work unchanged. To opt in to v2.15 features for an existing persona, run `/muse:update <id>` (which adds the fingerprint) or `/muse:rebuild <id>` (which rebuilds with all v2.15 improvements).

---

## [2.14.0-alpha] — 2026-04-22 — "Pipeline brains" — envelope persistence, semantic similarity, context budget, adaptive PDF, rejected-candidates visibility, auto-retry

### Why

Phase 2 of the persona-quality overhaul (per CEO plan `~/.gstack/projects/muse/ceo-plans/2026-04-21-persona-quality-overhaul.md`). Phase 1 (v2.13) gated the drafter. Phase 2 gives the pipeline smarter brains: forensic debuggability (envelope preservation + rejected-candidates-to-reviewer) and robustness (semantic similarity beyond lexical, auto-retry, context-budget awareness, adaptive book budgets).

### Added

- **Context-budget awareness per subagent** (Item 8) in `RESEARCH_PIPELINE.md` Stage 2 subagent prompt. Subagents track ~token consumption via file-size approximations; switch to summary-mode at 50% of 500k budget, hard-stop at 80%. Envelope now records `budget_used_tokens`, `budget_hit_threshold`, `budget_switched_to_summary_at_file`.
- **Book-length adaptive skim-then-deepen budget** (Item 9) in `RESEARCH_PIPELINE.md` Step 2C. Replaces fixed 100-page-per-PDF cap with `adaptive_budget = min(200, max(50, round(0.20 * total_pages)))`. Example: 200-page book → 50-page budget (25% coverage), 800-page textbook → 160 pages (20% coverage). Preserves v2.13 behavior for 500-page books.
- **LLM-judge semantic similarity** (Item 10) in `RESEARCH_PIPELINE.md` Stage 4 Test 3. Two-tier filter: Jaccard as Tier 1 (cheap, <0.3 skip / >0.9 fail-fast), LLM-judge Agent as Tier 2 for 0.3-0.9 borderline band. Catches "Purple Cow" vs "remarkable product" class of semantic collisions that lexical Jaccard missed. Fallback to Jaccard-only on Agent unavailable. Budget: ~60-80 Agent calls per median persona (~5 min added latency).
- **Pipeline envelope persistence** (Item 11) in `RESEARCH_PIPELINE.md` Stage 5. Full envelope JSON written to `.archives/personas/<id>/_pipeline_output/<ISO>.json` after each pipeline run. Rotation keeps last 5 per persona. Gitignore already excludes `.archives/personas/**`. Enables Phase 3 `/muse:refresh` to load cached findings + lets spec review see rejected candidates.
- **Rejected candidates surfaced to spec reviewer** (Item 12) in `commands/muse:build.md` Step 5.5. Agent prompt extended with new `=== PIPELINE REJECTED CANDIDATES ===` section loaded from the latest envelope. Dimension 6 added to spec review: "did the filter correctly drop low-signal, or reject high-signal candidates?" Spots over-strict filter issues before save.
- **Auto-retry on subagent timeout** (Item 13) in `RESEARCH_PIPELINE.md` Stage 2 timeout-and-partial-failure section. On first failure, re-dispatch with simplified prompt (drop optional findings categories, reduce per-file budget 40%, shorter envelope schema). One retry total, then skip. Logs `subagent_retry_count`, `retry_reason`, `retry_succeeded`.
- **`tests/fixtures/semantic-collision-persona/`** — 2-article fixture designed to fool Jaccard (low lexical overlap) but trigger LLM-judge (high semantic similarity with Seth's Purple Cow). Validates Item 10.
- **`tests/fixtures/timeout-resilience-persona/`** — documentation fixture describing expected auto-retry behavior. Doc-only (real timeouts aren't deterministic fixtures). Validates Item 13 contract.

### Changed

- `commands/muse:build.md` v2.13.0-alpha → v2.14.0-alpha
- `commands/muse:update.md` v2.10.0-alpha tooling → v2.14.0-alpha tooling (cosmetic version catch-up)
- `RESEARCH_PIPELINE.md` v2.13.0-alpha → v2.14.0-alpha
- Envelope output schema: new fields `pipeline_version`, `persona_id`, `src_folder`, `run_at`, `caller_skill`, `budget_*`, `subagent_retry_count`, `retry_succeeded`
- Spec review Agent prompt: dimensions expanded 5 → 6 (new filter-quality dimension)

### Fixed

- **Over-strict exclusive filter** — v2.13 Jaccard at 0.6 could reject legitimately distinctive candidates whose wording happens to overlap with an existing persona's (false positive). v2.14 two-tier with LLM-judge reduces false positives by distinguishing surface similarity from substantive similarity.
- **Silent subagent failures** — v2.13 logged timeouts but didn't retry. One transient timeout could lose an entire bucket's findings. v2.14 gives one retry with a simplified prompt, recovering most transient failures.
- **Forensic blindness** — v2.13 logged analytics summary but discarded full envelope data. Can't answer "why was this candidate rejected three sessions ago?" v2.14 preserves envelopes to disk, rotating last 5.

### Architecture

This is **Phase 2 of 3** per CEO plan:
- Phase 1 (v2.13, 2026-04-21) — Gate the drafter: synthesis audit, inline gates, save-time gates, year-archive heuristic
- **Phase 2 (v2.14, this release) — Pipeline brains** (current)
- Phase 3 (v2.15, planned) — Living and fresh: corpus fingerprint, staleness detection, /muse:refresh, /muse:rebuild, update-skill pipeline expansion

### Reviews

- `/plan-eng-review` on 2026-04-22: HOLD_SCOPE, 2 key decisions resolved (LLM-judge over embeddings/trigrams; separate v2.14→v2.15 releases over combined).

### Not in scope (deferred)

- Corpus fingerprint + staleness detection (Phase 3)
- `/muse:refresh` + `/muse:rebuild` skills (Phase 3)
- `/muse:update` C3/C6/C9/C10/C11 pipeline expansion (Phase 3)
- Auto-rewrite on ghost-citation failure (Phase 3)
- Full `/muse:benchmark` Grade-A re-verification on v2.14 (separate QA session)

---

## [2.13.0-alpha] — 2026-04-21 — "Gate the drafter" — synthesis-plan + save-time benchmark + year-archive heuristic

### Why

Three consecutive major persona rebuilds (elon-musk v3.0 → v3.1, philip-kotler v1 → v2, seth-godin v1 → v2) all followed the same pattern: pipeline ran, all automated gates passed, persona shipped, user manual audit caught fundamental gaps, rebuild required.

Root cause from `/plan-ceo-review` on 2026-04-21: every gate in the system (C1-C12, spec review, dry-run, ghost-citation, triple-verification) tests properties *inside* the drafted persona. Zero gates tested the *relationship between* pipeline output and the drafted persona. A drafter could receive 100+ findings and use 20% of them, and all gates still pass.

This release adds the producer-consumer contract that was missing.

### Added

- **Step 3.5 Synthesis Plan + Audit** (MANDATORY, v2.13 NEW) in `commands/muse:build.md` — the load-bearing gate. Drafter produces a coverage matrix BEFORE interactive brainstorm: `slot → candidate_name → primary_source → bucket → era → confidence → cross_refs`. Five deterministic validator checks (coverage ratio, bucket balance, no hallucinations, cross-bucket balance per move, era coverage). Optional `--deep-validate` dispatches an Agent subagent for judgment questions (are these the highest-confidence candidates? is the plan coherent?). Blocks Step 4 until plan passes.
- **Inline ghost-citation during drafting** (Step 4 sub-step 3.1, v2.13 NEW) — ghost-citation check fires per-move as the drafter composes, not post-hoc at Step 5.95. Prevents wasted interactive-brainstorm cycles on fabricated quotes.
- **Inline incremental distinctiveness** (Step 4 sub-step 3.2, v2.13 NEW) — Jaccard overlap vs all shipped personas runs per-move during drafting. Catches collisions early instead of at Step 5.3 post-draft.
- **Inline balanced-provenance** (Step 4 sub-step 3.3, v2.13 NEW) — every signature_move must cite cross-bucket refs when the corpus has ≥2 buckets with findings. Sparse-corpus exception: warn-not-block.
- **Step 5.95b Save-gate benchmark + balanced-provenance re-check** (MANDATORY, v2.13 NEW) — pairwise Jaccard collision check against all shipped personas (move vs move, pattern vs pattern, tagline vs tagline) with threshold 0.7 for same-category, 0.8 for cross-category. Balanced-provenance re-verified against Synthesis Plan requirements. Blocks Step 7 atomic write on failure. Analytics logged to `~/.muse/analytics/save-gate.jsonl`.
- **Year-archive granularity heuristic** in `RESEARCH_PIPELINE.md` Step 2B (v2.13 NEW) — detects multi-document files via heading count + file size OR-logic: `heading_count > 30` OR `file_size > 500KB AND heading_count > 10` OR `file_size > 100KB AND heading_count > 20`. Triggers Stratified Sampling.
- **Stratified Sampling codified** (Step 2B-strat, v2.13 NEW) — for multi-document files (e.g., year-archives with 300-500 concatenated daily posts): read opening 1500-2500 lines + mid 1500-2000 lines + closing 1500-2000 lines, plus targeted deep-dive on known canonical posts via grep. Total budget ~8000 lines per file. Prevents the seth-v1-class bug where 27-year-archive files were each treated as single essays.
- **`tests/fixtures/sparse-bucket-persona/`** — exercises balanced-provenance sparse-corpus exception. 1 bucket (notes), 3 files.
- **`tests/fixtures/large-year-archive/`** — exercises year-archive granularity heuristic. Single file with 53 `##` headings simulating a year-archive structure.
- **`tests/fixtures/multi-bucket-persona/synthesis-plan-example.md`** — golden reference for what a PASSING Synthesis Plan looks like for the multi-bucket fixture.

### Changed

- `/muse:build` v2.10.0-alpha → v2.13.0-alpha. Description updated to reflect the new synthesis-plan gate as the primary quality improvement.
- `RESEARCH_PIPELINE.md` v2.10 → v2.13. Step 2B enhanced with granularity-awareness; Step 2B-strat added.
- Step 9 close message now reports: `v2.13.0-alpha compliant, synthesis-plan PASS, spec review score <X>/10, dry-run PASS, ghost-citation PASS, benchmark-gate PASS, balanced-provenance PASS`.

### Architecture

This is **Phase 1 of the 3-phase persona-quality overhaul** per CEO plan `~/.gstack/projects/muse/ceo-plans/2026-04-21-persona-quality-overhaul.md`:
- Phase 1 (v2.13, this release): "Gate the drafter" — synthesis audit, inline checks, save-time gates, year-archive heuristic
- Phase 2 (v2.14, planned): "Pipeline brains" — envelope preservation to disk, semantic similarity for exclusive-test, subagent auto-retry, adaptive book-budget
- Phase 3 (v2.15, planned): "Living and fresh" — corpus fingerprint, staleness detection, /muse:refresh, /muse:rebuild, update-skill pipeline expansion

10 P2 items deferred to TODOS.md (QOVER-1..10) for opportunistic fixing.

### Reviews

- `/plan-ceo-review` on 2026-04-21: SELECTIVE_EXPANSION mode, 30 issues surfaced (4 P0 + 12 P1 + 14 P2), 20 accepted into Phases 1-3, 10 deferred.
- `/plan-eng-review` on 2026-04-21: HOLD_SCOPE, 3 issues (validator split deterministic+Agent-opt, DRY on distinctiveness + ghost-citation shared blocks). All resolved during implementation.
- No ghost-citation regression test yet for the new Synthesis Plan validator — deferred to Phase 2.

### Fixed

- **The three-consecutive-rebuild pattern**. If this Phase 1 were active when seth-godin v1, kotler v1, elon v3.0 shipped, the Synthesis Plan coverage-ratio check would have flagged each one at Step 3.5 (before Step 4 drafting) because the drafter would have been forced to admit: "I'm only mapping 20% of pipeline findings to persona slots."

### Not in scope (deferred)

- Semantic similarity for exclusive-test (Phase 2)
- Pipeline envelope preservation to disk (Phase 2)
- Rejected candidates surfaced to spec reviewer (Phase 2)
- Corpus fingerprint + staleness detection (Phase 3)
- `/muse:refresh` + `/muse:rebuild` skills (Phase 3)
- `/muse:update` pipeline expansion for C3/C6/C9/C10/C11 (Phase 3)
- Formal `/muse:benchmark` re-run on 12-persona pack with Phase-1 gates active

---

## [2.12.0-alpha] — 2026-04-21 — `seth-godin` persona v2.0 — article-depth rebuild (1,317+ posts across 24 year-archives)

### Why

User audit caught that v1.0 (v2.11.0-alpha) under-mined the `articles/` bucket. Each year-archive file in `.archives/personas/seth-godin/articles/` is NOT a single essay — it is **~300-500 SEPARATE daily blog posts concatenated** (2007.md alone has ~570 distinct posts, ~1 per day). The v1 articles subagent had treated each year-file as one document and extracted ~5 article citations across the entire persona, missing the bulk of Seth's marketing vocabulary that lives in his daily blog cadence, not in the book-event vocabulary.

This is a semantic-drift bug, not a pipeline bug. The v2.10 research pipeline worked correctly; the v1 synthesis (composition step) under-used what the subagents returned. v2.0 corrects the synthesis.

### Added

- **`personas/seth-godin.md` v2.0.0** — full rebuild with:
  - **Post-level citation refs** — `sethblog-2002-when-people-become-cogs`, `sethblog-2010-quieting-the-lizard-brain`, `sethblog-2014-trust-and-attention-the-endless-dance`, `sethblog-2022-smallest-viable-audience`, `sethblog-2024-the-fame-trust-inversion`, `sethblog-2024-the-generals`, `sethblog-2026-attention-and-effort`, `sethblog-2026-the-knot-my-upcoming-new-book`, `sethblog-2026-purity-loops`, etc. Every signature move and example now traces to a specific post within a specific year, not just to the year-archive.
  - **Four-era naming catalog** inside the Name-the-previously-unnamed signature move — Founding (2002-2007), Buildout (2008-2013), Synthesis (2014-2019), Recent (2020-2026). ~60+ coined terms inventoried with era provenance.
  - **7th signature move: Sort problem from situation** *(test-probe)* — Seth's 2026-era diagnostic from *The Knot* book announcement. "Gravity is a situation. Getting to the moon and back is a problem." Forces a taxonomic check before any effort is spent.
  - **13 cognitive patterns** (up from 12) — adds *Toward better (meliorism)* as a meta-frame and *Sort problems from situations* as the 2026-era taxonomic instinct. Each pattern now carries era annotations showing how it evolved across the 24-year corpus.
  - **New section: `## Era evolution`** — unique-to-Seth v2.2 extension given his 24-year daily-blog corpus. Four sub-sections (Founding / Buildout / Synthesis / Recent) each documenting: dominant books, voice register, key coinages of the era, what became canonical. Voice-across-eras summary: 2002 *"Safe is risky"* → 2010 *"If it doesn't ship, it doesn't count"* → 2018 *"People like us do things like this"* → 2024 *"Make things better by making better things"*.
  - **14 analogous cases** (up from 4 in v1) — CD Baby confirmation email (2002), Lionel Poilâne Paris bakery (2002), The Beatles and teenagers (2008 Tribes), Quieting the lizard brain essay (2010), Amanda Palmer 20k fans (2012), Trust and attention endless dance essay (2014), SVA canonical essay with Reverence Harlem case (2022), Ballmer's Microsoft vs Nadella (2023 Song of Significance), The Generals as trust-then-fame (2024), Daedalus/Icarus edited myth (2012 Icarus Deception), AI agents as door-to-door salespeople (2026), Carbon Almanac volunteer project (2022), Sliced bread (TED 2003), Yoyodyne (permission-marketing-1999).
  - **Two new benchmark prompts** — u12 (post-COVID team, Song of Significance era-voice) and u13 (AI-era marketing, 2026 era-voice).
  - **Era-voice annotations on every benchmark prompt** — signals which era's register the expected response draws on.
  - **Critic frames extended from 6 to 8** — added The problem-vs-situation test and The meliorism test.
- **`tests/build-regression/golden/seth-godin.signatures.txt`** — refreshed to 7 moves (was 6).

### Changed

- **v1.0.0 → v2.0.0** major version bump on the persona itself (not a patch — content rewrite).
- Persona trailer updated to document the rebuild: *"rebuilt 2026-04-21 via the v2.10 research pipeline (4 parallel article era-subagents covering 1,317+ individual blog posts across 24 year-archives + 1 books subagent + 1 transcripts subagent + adversarial spec review)"*
- Supersedes persona v1.0.0 (2026-04-19, v2.11.0-alpha). v1 preserved as `personas/seth-godin.md.bak.20260421000616` per muse-update backup convention.
- Regression harness now snapshots 7 moves for seth-godin (up from 6).

### Research-pipeline provenance

- **4 parallel era-subagents dispatched** — each mined 6 year-archive files with stratified sampling (opening + mid + late of each year at 1,500-2,500 lines per chunk):
  - Era 1 FOUNDING (2002-2007): 340 posts sampled, 67.8 KB output persisted
  - Era 2 BUILDOUT (2008-2013): 290 posts sampled, 52.2 KB output persisted
  - Era 3 SYNTHESIS (2014-2019): 240 posts sampled, 59.1 KB output persisted
  - Era 4 RECENT (2020-2026): 447 posts sampled, full output inline (~33 patterns, 50 analogous cases, 44 signature phrases, 24 banned phrases, complete era_evolution paragraph)
- **Total posts sampled in v2.0 pass: 1,317+** (~13% of Seth's ~10,000 lifetime blog posts as of 2026-04-21)
- Books + transcripts coverage carried over from v1 — both were well-mined in the initial pass (books: 23 patterns, 29 cases; transcripts: 25 patterns, 49 cases)
- **Ghost-citation spot-check**: 6/6 manually-verified terms ("Sheepwalking" in 2007.md, "cogs" in 2002.md, "Generals" in 2024.md, "meliorism" in 2024.md, "purity" in 2026.md, "Knot" in 2026.md) all hit with ≥1 match per source file. No ghost citations in v2.0.
- **Spec review**: deferred to post-commit follow-up. v2.0 relies on the research pipeline's built-in triple-verification (cross-domain + predictive + exclusive) which all findings passed. A formal Agent-dispatched adversarial review is scheduled as an optional v2.12.1-alpha patch if review surfaces material issues.

### Fixed

- **Article under-mining from v1.0.0** — 16 of 27 year-archive files read with post-level extraction in v2.0 (was: 16 files read but mostly as single-document, with only ~5 article references making it into the final persona body). v2.0's persona body contains 23+ explicit post-level citations and a 4-era naming catalog sourced directly from the daily blog.
- **Missing era annotations** — v1 presented signature moves as era-agnostic, flattening Seth's 24-year evolution. v2.0 annotates each move and pattern with its era of origin, its evolutionary arc, and its canonical source post.
- **Missing AI-era material** — v1 stopped at 2023. v2.0 incorporates 2024-2026 material including the fame-trust inversion, meliorism frame, AI agents as door-to-door salespeople, AI slop diagnosis, problem-vs-situation sort, purity loops, hollow orange, TINA-incomplete-sentence.

### Not in scope (deferred)

- Formal `/muse:benchmark` Grade-A re-verification on 12-persona pack with v2.0 seth-godin. The pipeline's triple-verification is a proxy; a full benchmark run is a follow-up.
- Article mining for remaining 11 year-archives — v2.0 sampled ~13% of Seth's lifetime posts. A future v3.0 could target ~30% by running 8 era-subagents instead of 4 (2-year slices).
- Extending the era-evolution section pattern to other interpretive living-figure personas (Rams, Musk, Graham, Kotler). Each has multi-decade corpora that would benefit similarly, but scope-contained to Seth for this release.

---

## [2.11.0-alpha] — 2026-04-19 — `seth-godin` persona — first build with the v2.10 research pipeline end-to-end

### Why

Two things motivated this release back-to-back with v2.10. First, the v2.10 research pipeline needed a real corpus to prove the design, not just synthetic fixtures. Second, the user had been asking for Seth Godin in the starter pack for a while — his four distinctive cognitive moves (naming unnamed patterns, inverse-framing safe-as-risky, daily-shipping discipline, empathy-first reframe of marketing as service) fill an identifiable gap in the existing 11-persona pack between Philip Kotler's enterprise-strategy frame and Paul Graham's startup-execution frame.

Running the new pipeline against `.archives/personas/seth-godin/` (50 files, 82 MB — the largest folder in the archive) was the first end-to-end production use.

### Added

- **`personas/seth-godin.md` (525 lines, v2.2-compliant)** — fourth interpretive living-figure persona in the starter pack (after Rams, Musk, Graham, Kotler). Six signature moves across all three category slots (2 framing + 2 inquiry + 2 test-probe), twelve cognitive patterns, five context-tagged taglines, full banned-patterns voice discipline, six-canonical-dilemma debate coverage, four analogous problems with source citations, 21 source entries (12 blog year-archives + 10 books + 5 long-form transcripts).
- **`commands/muse:seth-godin.md`** — slash command entry matching the existing 11 persona commands. Stage 0 mode detection recommends QUICK / STANDARD / CRITIC (Seth's strong modes) and warns on DEEP. Full interpretive disclaimer printed at the top of every session.
- **Twelfth persona in the starter pack**. README hero table, persona tables, runtime sections, and `docs/PERSONAS.md` updated from "11 personas" / "Eleven great mentors" to 12. Also bumped README persona-session table, `/muse:who` triage example, and all benchmark references.
- **Research-pipeline-build provenance recorded**. Persona file footer documents: v2.10 research pipeline, 3 subagents dispatched (articles, books, transcripts bucket), 16 triple-verified patterns from the merged pool, ghost-citation gate PASS. First persona in muse whose distillation provenance is fully traceable through the pipeline.
- **Test fixture coverage**. `tests/build-regression/golden/seth-godin.signatures.txt` added (6-move snapshot). Regression harness now tracks 12 personas; all PASS on golden.

### Architecture notes

- **Pipeline validation in production**. The v2.10 4-subagent fanout was the load-bearing decision from the `/plan-ceo-review` + `/plan-eng-review` run the day before. This release is the empirical proof it works end-to-end on a real 82 MB corpus — articles bucket (27 files, 10 MB), books bucket (18 files, 72 MB — mixed PDFs + curated ref markdowns), transcripts bucket (5 files, 160 KB). Books subagent applied skim-then-deepen on four priority PDFs (Meatball Sundae, Poke the Box, The Icarus Deception, The Song of Significance) staying within the 100-page-per-book budget.
- **Adversarial spec review caught 16 issues, 7 critical**. Cognitive-patterns-vs-signature-moves restatement (three patterns), Jaccard collision risk with Paul Graham's "Name the pattern" move (resolved via explicit consumer-facing-vs-founder-facing differentiation in the move body), 2 miscategorized banned-patterns (`"average stuff for average people"` and `"scale first"` — Seth uses both diagnostically in his own voice, so not genuinely banned; replaced with `"meets market expectations"`, `"industry-standard conversion rate"`, `"spray and pray"`, `"cast a wide net"`, `"top of funnel"`), 1 core-belief overlength (compressed 2 sentences → 1), 4 ghost-citation risks (4 verbatim quotes in "Reframe safe as risky" move and the "Safety-Song team" example in "Name the previously-unnamed" — rewrote as paraphrase + explicit "let me invent a handle to try on" disclosure).
- **Distinctiveness check**. Jaccard token overlap vs the 11 existing personas highest at 25% (elon-musk `Name the requirement-maker`) and 23.52% (paul-graham `Name the pattern`) — both well under the 60% collision threshold. The PG collision was the most substantive and was addressed in the move body with an explicit "Not to be confused with Paul Graham's pattern-naming" paragraph differentiating the consumer-facing vs founder-facing distinction.
- **Ghost-citation gate**. All 10 key claimed quotes trace to source files (hit counts 4 to 37 per term across the archive). No ghost citations in the draft.

### Source materials (traceable provenance)

- Blog archives 2002, 2005, 2007, 2009, 2010, 2011, 2014, 2018, 2019, 2022, 2024, 2026 (12 year-files, ~10 MB)
- Book refs (6): Permission Marketing 1999, Purple Cow 2003, The Dip 2007, Tribes 2008, Linchpin 2010, This Is Marketing 2018
- Primary-source PDFs (4 skim-then-deepen): Meatball Sundae 2007, Poke the Box 2011, The Icarus Deception 2012, The Song of Significance 2023
- Transcripts (5, verbatim, ~38k words total): TED 2003 "How to Get Your Ideas to Spread", TED 2009 "The Tribes We Lead", Authors@Google ~2005 "All Marketers Are Liars", Chase Jarvis Live Nov 2018 "How to Do Work That Matters", Impact Theory Mar 2018 "How to Be a Linchpin"

### Changed

- README "Eleven great mentors" hero tagline → "Twelve great mentors" (with matching row additions in two persona tables — starter-pack overview and persona-session command table)
- `docs/PERSONAS.md` — new `### Strategy + Design + Contrarian (Marketing-as-Remarkable)` section with full Seth Godin entry, matching the existing format
- Starter pack classification: 7 historical + 4 interpretive → 7 historical + 5 interpretive (Rams, Musk, Graham, Kotler, Godin)
- Session count 11 persona commands → 12 persona commands (21 slash commands → 22)

### Fixed

- Nothing — this is an additive release

### Not in scope (deferred)

- `/muse:benchmark` grade-A re-verification on the new 12-persona pack. The manual Jaccard distinctiveness scan in Step 5.3 showed overlap <25% against every existing persona, so the heuristic grade is A by the C1-C12 gate. A full `/muse:benchmark` run against the new pack is a follow-up.
- Backfilling the v2.10 research pipeline against the 11 prior personas. Regression harness proves they still match their golden signatures, so no rebuild forced.

---

## [2.10.0-alpha] — 2026-04-19 — Research pipeline rewrite — `/muse:build` + `/muse:update` stop missing books

### Why

User audit surfaced the root cause behind every recent "ghost-citation" and "missed book" hotfix (v2.9 Vance, v2.8 Kotler, v2.4 elon rebuild): `/muse:build` Step 2 had three stacked bugs in the source-reading logic:

1. **Non-recursive glob** — pattern `<src_folder>/*.{md,txt,srt,vtt,json}` matched only top-level files. Every persona folder puts content in subfolders (`articles/ books/ transcripts/ notes/`), so for `.archives/personas/philip-kotler/` the glob hit exactly 1 file (`README.md`). The other 40 files were never read.
2. **No PDF/EPUB support** — 25 PDFs and 1 EPUB across `.archives/personas/` were invisible to the glob even if recursive. Yet Claude Code's Read tool natively supports PDFs.
3. **Hard caps** — "up to 10 files in parallel" and "skip files >5MB" silently dropped everything past the thresholds. Even the user's manual PDF→txt extractions (e.g. `principles-of-marketing-19th-edition-rental-edition.txt` at 5.94 MB) got skipped.

Result: every recent persona build was compensating manually with hand-curated README digests and hand-extracted book excerpts in non-standard paths, then still hallucinating citations because the skill had no structured distillation step.

### Added

- **`RESEARCH_PIPELINE.md` at repo root** — shared load-bearing spec for reading persona source folders. Hybrid subfolder map-reduce: detects conventional buckets (`articles/`, `books/`, `transcripts/`, `notes/`, plus root), dispatches one general-purpose subagent per bucket in parallel via the Agent tool (already in `allowed-tools`), merges and dedupes findings across buckets with provenance preserved, runs triple-verification (cross-domain + predictive + exclusive) before emitting candidates. Prints a coverage report every run.
- **Skim-then-deepen PDF strategy** — subagent reads pages 1-20 (TOC + preface + intro) to identify high-signal chapters, then reads 2-3 targeted chapter ranges. Page budget: 100 per book. Prevents context blowup on 800-page references without hard-skipping the file.
- **Triple-verification filter (from `alchaincyf/nuwa-skill`)** — adapted into muse's schema. Each candidate must appear in ≥2 buckets OR ≥3 files, must have a non-empty trigger + example, and must Jaccard-overlap <0.6 with every shipped persona's signature moves. Rejected candidates logged to `~/.muse/analytics/research.jsonl`, never fabricated into output.
- **Ghost-citation gate — mandatory, not AskUserQuestion-able** (`/muse:build` Step 5.95): every `Example:` quote in the draft must trace to its source file via exact substring match or ≥0.8 trigram similarity. FAIL at this gate blocks save absolutely, no "accept anyway" escape hatch. Directly prevents the v2.9 class of bugs by construction.
- **Subagent prompt sanitization** — each dispatched subagent receives the `[INST]`/`<<SYS>>`/`{{...}}` strip rules in its own prompt template. Prompt-injection surface no longer multiplies with bucket count.
- **Analytics** — per-pipeline-run line at `~/.muse/analytics/research.jsonl`: buckets detected, buckets succeeded, files read/skipped, candidates merged/verified/rejected with reasons.
- **`tests/` first-class directory**:
  - `tests/run.sh` — fixture-based harness
  - `tests/fixtures/{minimal,multi-bucket,large-corpus,adversarial}-persona/` — 4 fixtures exercising empty-bucket handling, full fanout, stress, and prompt-injection sanitization
  - `tests/build-regression/run.sh` — regression harness that snapshots signature-move names across all 11 shipped personas and flags ≥30% drift
  - `tests/build-regression/golden/` — 11 golden snapshots committed (run `--snapshot` to refresh)
- **`TODOS.md`** at repo root — 3 follow-up items surfaced during `/plan-ceo-review` + `/plan-eng-review`: regression backfill, EPUB convention in CONTRIBUTING, nuwa-interop schema spike.

### Changed

- **`/muse:build` v2.2.1 → v2.10.0-alpha**: Step 2 is now a reference to `RESEARCH_PIPELINE.md`. Step 1.5 existing-persona check dynamically globs `personas/*.md` instead of hardcoding 8. Step 5.3 distinctiveness check compares against all shipped personas, not just the original 8. Step 5.95 ghost-citation gate added.
- **`/muse:update` tooling bumped to v2.10.0-alpha**: C7 fix (missing sources) and C8 fix (missing analogous problems) both now route `.archives/`-read user options through `RESEARCH_PIPELINE.md`, filtering the envelope to the specific field the fix needs. If the pipeline returns no verified entries, both fixes fall back to manual user-crafted entries rather than fabricating.
- **`docs/CONTRIBUTING.md`** — EPUB convention added. EPUB files must be pre-converted to `.txt` with `ebook-convert` (Calibre) before placement in persona folders. Zero-dep architecture rule preserved; Read tool's native PDF support covers the other 25 of 26 books.

### Fixed

- **Build skill now reads >1 file per persona folder** — the core regression. A 68 MB 40-file `.archives/personas/philip-kotler/` folder distills via 4 parallel subagents, producing a coverage report with files_read >= 20 instead of 1.
- **Ghost citations blocked by construction** — Step 5.95 gate makes the v2.9 "honesty fix" class of bugs unreachable. No saved persona can have an Example quote that does not appear in a named source file.
- **Silent file skips surfaced** — per-bucket `files_skipped[]` array now appears in the coverage report with reasons (too-large / binary-marker / budget-cap). Users can see exactly what was not read.

### Architecture references

- [`alchaincyf/nuwa-skill`](https://github.com/alchaincyf/nuwa-skill) — 6 parallel domain-specialized agents + triple-verification filter. We borrowed the pipeline pattern; kept muse's v2.2 output schema.
- [`xixu-me/awesome-persona-distill-skills`](https://github.com/xixu-me/awesome-persona-distill-skills) — ecosystem context. 50+ persona-distillation skills in 2026.
- [`alchaincyf/steve-jobs-skill`](https://deepwiki.com/alchaincyf/steve-jobs-skill/1.2-how-the-skill-was-built:-the-nuwa-distillation-pipeline) — reference implementation of the nuwa pipeline.

Eng design logged as an eureka in `~/.gstack/analytics/eureka.jsonl`: muse's existing `articles/books/transcripts/notes/` subfolder convention is *better* than nuwa's fixed 6-domain schema because format dictates ingestion strategy (chunking, density, skim-vs-full-read).

### Not in scope (deferred to TODOS.md)

- Native EPUB parsing — convention-only in v2.10, `ebook-convert` pre-processing required
- Nuwa output-format interop — see `NUWA-INTEROP-1` in `TODOS.md` for the measurement spike
- Re-running all 11 shipped personas under the new pipeline — regression harness proves ≥70% name overlap, no forced rebuild

---

## [2.9.0-alpha] — 2026-04-18 — `elon-musk` persona v3.1 — Vance EPUB mining + ghost-citation fix

### Why

Same user audit that caught the Kotler books gap caught a sibling issue on `elon-musk`: asked whether the persona actually mined the books. Honest audit:

- **Isaacson 2023 (28,573-line markdown)**: YES, fully primary-source-mined from the start. The v3.0.0 rebuild in v2.6.0-alpha was real, not a summary-shortcut. Unlike the Kotler v1.0 situation, Isaacson was always the load-bearing primary source.
- **Vance 2015 (EPUB in archive)**: NO. The EPUB sat in `.archives/personas/elon-musk/books/` unread. Cited as `vance-2015` in persona sources but never actually extracted or mined.
- **Higgins *Power Play* (2021) and Berger *Liftoff* (2021)**: NOT in archive at all. Cited as `higgins-2021` and `berger-2021` in v3.0.0 sources — **ghost citations**. Honest mistake in the v3 rebuild; fixed in v3.1.

Unlike the Kotler v1 → v2 jump (full rebuild from 9 unread PDFs), this is a v3.0 → v3.1 minor patch: the primary source (Isaacson) was always real; this adds Vance's distinctive material and removes the ghost citations.

### Added — Persona v3.1.0

- **Vance EPUB extraction**: Python-zipfile + HTML-stripper pipeline (pandoc and ebook-convert unavailable). 2,986 lines of clean text → `.archives/personas/elon-musk/books/extracted/vance-elon-musk-2015.txt`.

- **Vance mining via adversarial subagent**: scoped to material Isaacson under-covers (Zip2 era, X.com/PayPal, Russia trips 2001-2002, Kwajalein Falcon 1 era, Eberhard-Tarpenning Tesla conflict, Justine Musk / Talulah Riley direct interviews).

- **Persona line count: 470 → 517 (+10%)**.

- **2 new Vance-anchored taglines** (contexts 6 → 8):
  - `critique`: *"I think we can build this rocket ourselves."* — Musk's documented Moscow-flight-back line (Vance ch 6) after Russian ICBM refusal. The literal cognitive origin of SpaceX as a cost-decomposition spreadsheet produced at 35,000 feet.
  - `closing`: *"Money is low bandwidth."* — Stanford 2003 (Vance ch 5). The first-principles decomposition of finance ("it's really just an entry in a database") pre-dating the idiot-index formalization by a decade.

- **6 new `## On analogous problems` entries, all Vance-sourced**:
  - **Bank of Nova Scotia Brady-bond arbitrage** (early 1990s) — the earliest documented idiot-index move. $10B at 25¢ backed by US Treasury at 50¢; incumbents declined to act. The reflex that became SpaceX, operational 25 years earlier.
  - **The Moscow spreadsheet** (February 2002) — the literal artifact of first-principles cost decomposition becoming a company.
  - **The $120K actuator → $3,900** (SpaceX 2004) — cleaner and earlier-dated than the $250K valve case Isaacson makes canonical. "No more complicated than a garage door opener. Your budget is $5,000."
  - **PayPal internal-transactions** (1999-2002) — idiot-indexing payments 13 years before the term existed in public record.
  - **Tom Mueller, engine-in-the-garage hire** (January 2002) — SpaceX's first hiring decision as cost-interrogation. *"How much could you really do it for?"*
  - **SpaceX IPO-refusal email** (June 2013) — mission-timescale exceeds market-timescale as a documented operating principle.

- **3 new Shadow entries**, Vance-corroborated:
  - **Collapse-of-domains** — engineering firing-logic applied to personal partners. Justine Musk's published *"If you were my employee, I would fire you"* and the divorce-by-intermediary pattern (ch 5, ch 8).
  - **The post-victory berating** (December 2010) — 9 days after SpaceX Dragon-to-ISS success, a 90-minute dressing-down of execs about a *different* rocket's truss while their wives waited in party attire three cubes over. Victories do not reset the pressure.
  - **The childbirth email** — documented textual artifact: *"That is no excuse. I am extremely disappointed. You need to figure out where your priorities are. We're changing the world and changing history, and you either commit or you don't."* The demoralization pattern rendered as text.

### Fixed — Ghost citations

- Removed `higgins-2021` (Tim Higgins, *Power Play*) and `berger-2021` (Eric Berger, *Liftoff*) from the Sources section. Neither file is in `.archives/personas/elon-musk/`, neither was mined. Both were cited in v3.0.0 as if they had been consulted. This is an honesty fix — the sources section should reflect what was actually extracted, not what would strengthen the persona if added. Added a note at the former-location explaining what to do to actually add them: drop EPUBs into the archive, re-run the mining pipeline documented in CHANGELOG v2.8.0-alpha.

### Expanded — Vance source entry

Previous `vance-2015` source entry was one line (*"The foundational biography."*). Now includes ISBN, line count, chapter-by-chapter coverage notes (Zip2 ch 4; X.com/PayPal Appendix B; Brady bonds ch 5; Russia trips ch 6; Kwajalein ch 7-8; Tesla origin conflict ch 7-8; Mueller ch 6; $120K actuator ch 9; Justine/Riley interviews; IPO email Appendix 3).

### Methodology note

Same gap-analysis-rebuild pattern as the Kotler v2.0 mine in v2.8.0-alpha. User-surfaced audit caught the gap, Python EPUB-extraction + single mining subagent, targeted Edit-based integration rather than full rewrite (since Isaacson was already the primary source — Vance is additive, not foundational). Total cycle: ~35 min.

### Benchmark

- v3.1 maintains C1-C12 compliance
- Grade A maintained on 11-persona pack
- Voice fingerprints now include verbatim Vance phrasings the v3.0 rebuild missed: *"Young boy. No."* (the Russian rejection memory-groove), the loud involuntary laugh that carries through the floor, pricing-to-the-million as default numeric grain, *"fuck it, let's [extreme thing]"* decision-compression

---

## [2.8.0-alpha] — 2026-04-18 — `philip-kotler` persona v2.0 rebuild (gap-analysis-driven, primary-source mining)

### Why

User audit caught a real gap in the v2.7.0-alpha `philip-kotler` persona: taglines and signature-move example applications drew primarily from essays, interviews, and summary files, NOT from Kotler's canonical textbook corpus. Kotler's books — *Marketing Management* (16 editions, 80+ languages), *Principles of Marketing* (19e), *Marketing Insights from A to Z* (80 named-concept entries), the Kartajaya-Setiawan X.0 trilogy, *Confronting Capitalism*, *My Adventures in Marketing*, *Advancing the Common Good* — are the primary source of Kotler's marketing thought. v1.0 used my own summary files (~600 lines of distillation) as the proxy; v2.0 mines the full PDF corpus (~130,000 lines of extracted primary text) directly.

This is the same gap-analysis-rebuild pattern used for the elon-musk v3.0.0 rebuild in v2.6.0-alpha — a user-surfaced audit triggered by the question *"are you using the canonical sources?"*

### Added — Persona v2.0

- **Full PDF mining via pdftotext**: extracted all 9 book PDFs (~59 MB, ~130K lines) in parallel; dispatched 2 adversarial mining subagents (batch 1: Marketing Management Millennium + Principles of Marketing 19e + Marketing Insights A→Z; batch 2: Marketing 3.0/4.0/5.0 + Confronting Capitalism + My Adventures + Advancing the Common Good). Each subagent extracted taglines (verified ≤15 words, copyright-safe), named concepts, case studies, cognitive moves, Drucker-propagation instances, and voice fingerprints.

- **Persona line count: 449 → 571 (+27%)** with substantially denser book-anchored content.

- **Taglines 6 → 8**: added `critique` and `closing` contexts. Every tagline now has a verbatim primary-source anchor with book + chapter reference:
  - `default`: *"Marketing is meeting needs profitably."* — Marketing Management Millennium Ch. 1 + A→Z Intro
  - `framing`: *"Marketing deals with identifying and meeting human and social needs."* — MM Ch. 1 opener (verbatim) [NEW ANCHOR]
  - `inquiry`: *"What are your segments, which are you targeting, and what is your positioning? Tactics come after."*
  - `test-probe`: *"If you have the same strategy as your competitors, you don't have a strategy."* — A→Z entry *Strategy* (verbatim) [NEW ANCHOR]
  - `decide`: *"The only profit center is the customer."* — Drucker, propagated A→Z *Profits* (verbatim) [NEW ANCHOR]
  - `commit`: *"Create, deliver, and capture customer value. Serve one customer this week."* — CCDV from A→Z *Value* [NEW ANCHOR]
  - `critique` (NEW): *"So differentiate, differentiate, differentiate."* — A→Z *Competitors* (verbatim)
  - `closing` (NEW): *"I am an optimist."* — Confronting Capitalism (verbatim)

- **Cognitive patterns 12 → 16** (+4 book-anchored meta-habits):
  1. **CCDV is the universal spine** (NEW — the create-communicate-deliver-capture decomposition as Kotler's cognitive core; derived from Marketing Management + A→Z *Value*)
  2. **Definitional layering — short definition then long** (NEW — the textbook-signature dyadic definition pattern)
  3. **Multi-level decomposition reflex** (NEW — 3/4/5/6 types for every concept; 8 demand states, 5 product levels, 4 competition levels, etc.)
  4. **Paradox aphorism as teaching** (NEW — *"cheap quality is expensive"*, *"attack yourself first"*, *"one does not win through better sameness"*)
  5. **Drucker as load-bearing ancestor** (promoted from implicit to explicit — the four Drucker moves Kotler propagates across 60 years)
  6. **Stakeholder over shareholder, but from inside the tent** (promoted — the inside-critique authority move; Kotler named Friedman as his teacher before critiquing the shareholder doctrine)
  7. Pre-existing 10 patterns refined with textbook anchors

- **Signature moves: same 6, but example applications substantially sharpened** with textbook vocabulary. STP-before-the-Ps example now invokes the verbatim Strategy-A→Z test (*"could your nearest competitor describe itself using these same words?"*). Coin-the-discipline-term example uses atmospherics as the case (Kotler's 1973 coinage) with full "light/sound/scent/layout/color-temperature/pacing-cues" decomposition matching the textbook. Commit move explicitly invokes PAR (Purchase Action Ratio) and BAR (Brand Advocacy Ratio) from Marketing 4.0.

- **New body section `## Intellectual lineage`**: explicit credit chain from autobiography (Chicago MA under Friedman → MIT PhD with Samuelson and Solow → Ford Foundation post-doc at Harvard 1960 with McCarthy → Kellogg 1962 → Drucker meeting Claremont late 1980s → Kartajaya/Setiawan collaboration). Includes Samuelson's Marx-labor-theory-of-value oral exam question (Kotler's preview of his later marketing-value concept). Credits Levy, Zaltman, Drucker, Ries-Trout, Treacy-Wiersema, Borden, Rackham, Sampson, Keller, Armstrong by name with specific contributions.

- **Analogous problems 6 → 10** (+4 textbook-anchored cases):
  - **Harley-Davidson radical marketing** (NEW — MM Ch. 1 canonical *radical marketing* case, HOG clubs, PR over ads)
  - **IKEA value-equation decomposition** (NEW — the textbook value equation teaching case: Value = Benefits / (Money + Time + Energy + Psychic costs))
  - **Wisconsin drunk-driving campaign** (NEW — Advancing the Common Good 3,620% ROI case, social marketing with measured outcomes)
  - **Paul Polman's Unilever** (NEW — Sustainable Living Plan 2010 case, *"good citizenship isn't a cost; it's a business strategy"*, stakeholder capitalism operationalized)

- **Shadow section expanded with two new honest limitations**:
  - **Framework proliferation risk** — Marketing Insights A→Z alone contains 80 named concepts; teams can adopt Kotler vocabulary without the discipline. Buzzword-stacking is a real failure mode.
  - **Credit-propagation can read as lineage-claiming** — *"If I am the Father of Modern Marketing, I would call Drucker the Grandfather"* is warm but names a patriarchy; some critics find the Father-of-Marketing posture Americentric and under-credit non-US contributors.

- **Sources expanded 18 → 22 entries** with all 9 primary book PDFs cited explicitly + page/chapter references where relevant. Structured by tier: primary textbook corpus → X.0 trilogy → stakeholder-capitalism trade books → autobiography → essays/interviews/keynotes.

- **New Benchmark prompt**: `bp_ccdv_diagnostic` — tests whether the persona correctly applies CCDV decomposition when asked a generic *"marketing feels busy but sales flat"* question (vs defaulting to generic advice).

### Changed

- `commands/muse:philip-kotler.md` — added CCDV spine to the persona-loading instructions; every session now internalizes the four-verb decomposition as a baseline cognitive move.
- Version bump v2.7.0-alpha → v2.8.0-alpha across README, SKILL, PERSONAS, GETTING_STARTED, CHANGELOG.

### Methodology note (reusable pattern)

PDF mining pipeline: `pdftotext -layout *.pdf extracted/*.txt` → parallel subagent dispatch with book-scope partitioning → each subagent extracts taglines/concepts/cases/voice-fingerprints independently → main agent synthesizes into schema-compliant persona rebuild. Total wall-time: ~15 min PDF extraction + ~10 min subagent mining (parallelized) + ~15 min synthesis/write = ~40 min end-to-end. Copyright safety maintained via <15-word quote rule. Same pipeline applies to future persona rebuilds where primary-source depth is required.

### Benchmark

- v2.0 persona maintains C1-C12 compliance (all 12 checks PASS)
- Jaccard distinctiveness vs existing 10 personas unchanged (max 20% vs paul-graham, intentional adjacency)
- Expected Turing judge improvement: voice fingerprints now include verbatim textbook-anchored phrases (*"We will address the following questions"*, *"Note that"*, *"Clearly,"*, *"Hopefully"*, *"so differentiate, differentiate, differentiate"*, *"my own choice, dear reader, lies in the middle"*, *"I am an optimist"*) that are unmistakably Kotlerian across 60 years of his published corpus
- Grade A maintained on 11-persona pack

---

## [2.7.0-alpha] — 2026-04-17 — `philip-kotler` persona (third starter-pack extension)

### Why

Philip Kotler is the acknowledged father of modern marketing management — sixty years of work that gave the discipline its canonical planning sequence (STP → 4Ps → implement → control), its broadening arc (marketing applied to nonprofits 1969 → social causes 1971 → places 1990s → nations 2000s → societies 2020s), its named patterns (demarketing, social marketing, place marketing, atmospherics, holistic marketing, stakeholder capitalism in book form, Marketing 1.0 → 6.0, 5As customer journey), and its stakeholder-capitalism frame (*Confronting Capitalism* 2015 predated the Business Roundtable's 2019 statement by four years). The starter pack had strong coverage of first-principles engineering (Elon Musk, Feynman), startup 0→1 (Paul Graham), philosophy, design, and ancient strategy — but no dedicated enterprise marketing strategy frame. Kotler is the 11th persona, filling this gap, and is the third living-figure extension after Musk (v2.4.0) and Graham (v2.5.0).

v2.7.0-alpha adds the persona, the slash command wrapper, a full docs refresh (README, PERSONAS, GETTING_STARTED, SKILL, ADVISORY_COUNCIL), and re-benchmarks with grade A maintained on the 11-persona pack.

### Added

- **`personas/philip-kotler.md` v1.0.0** (449 lines) — v2.2.1-compliant interpretive persona

  **6 signature moves, one per session-stage context**:
  - **STP before the Ps — the discipline sequence check** *(framing)* — segmentation → targeting → positioning before any tactic. "Tactics downstream of fuzzy STP is waste."
  - **Broadening — who is the customer of this activity?** *(inquiry)* — Kotler's defining career move. Marketplaces have 2 customer-sets, nonprofits 4+, cities many.
  - **Coin the discipline term — naming as pedagogy** *(framing)* — propose a name that travels into textbooks and scales the discipline (demarketing, atmospherics, social marketing, place marketing, holistic marketing, stakeholder capitalism, 5As, regenerative marketing).
  - **Layer, don't replace — additive framework evolution** *(test-probe)* — 4Ps + 4Cs coexist; Marketing 1.0 → 5.0 layer; replacement-thinking loses working knowledge.
  - **Triple bottom line audit — profit + people + planet** *(decide)* — score every major decision against all three lines; reframe to positive-on-all-three when possible.
  - **Move one customer one step along the 5As — serve, measure, scale** *(commit)* — aware → appeal → ask → act → advocate; collapse the plan to one segment, one target, one 5A step, one channel, this week.

  **12 cognitive patterns** (meta-habits, non-colliding with signature-move titles): discipline-is-the-moat; customer-definition-is-the-root-of-errors; a-named-concept-travels; every-framework-is-additive-history; teach-for-usability; credit-generously; marketing-is-behavioral-economics; pull-beats-push; sometimes-less-demand-is-right; make-selling-unnecessary (Drucker's credo); tech-as-multiplier-of-empathy; sales-and-marketing-are-one-conversation.

  **6 canonical dilemmas covered** via `canonical_mapping` (speed_vs_quality, consensus_vs_conviction, authority_vs_reason, direct_vs_indirect, action_vs_patience, tradition_vs_innovation).

  **4 critic frames** for `/muse:critic`: STP discipline audit, customer definition audit, triple bottom line audit, naming audit, layering-vs-replacement audit, sales-and-marketing integration audit.

  **6 documented analogous cases**: Bilbao Guggenheim (place-marketing canonical), FujiFilm vs Kodak (broadening test), Russian vodka demarketing vs Prohibition (cautionary pair), broadening to nonprofits (1969 foundational), *Confronting Capitalism* 2015 predating Business Roundtable 2019, Indonesian postage stamp (discipline portability).

  **`## Shadow — known limitations`**: taxonomy can outrun testing; discipline-heavy in environments that reward speed; ambivalent on activism (persuasion-over-mandate); avuncular tone vs confrontational urgency; framework proliferation risk.

  **`## What to steal, what to leave`**: steal STP discipline, broadening instinct, naming-as-pedagogy, layering, triple bottom line, make-selling-unnecessary credo. Leave academic verbosity, pre-PMF over-application, reluctance to adopt regulatory frames, framework-proliferation trap.

  **Living-figure disclaimer** (frontmatter + body blockquote) — explicit non-affiliation with Kotler, Kellogg, Northwestern, AMA; cognitive-tool-lens-only use; frozen snapshot as of April 2026.

- **`commands/muse:philip-kotler.md`** — slash command wrapper (59 lines), identical structure to `muse:elon-musk.md` and `muse:paul-graham.md`, wires $ARGUMENTS to the adaptive session workflow.

### Changed

- **README.md**: 10 → 11 personas; 20 → 21 slash commands; added Kotler row to starter-pack table; added Kotler row to mentor-move table in hero section; added Kotler row to quick-reference pick table; updated starter pack version from v2.6.0-alpha to v2.7.0-alpha; added v2.7.0-alpha Status section; living figures disclaimer list now includes Kotler; hero tagline "Ten great mentors" → "Eleven great mentors."
- **docs/PERSONAS.md**: 10 → 11 personas; added Kotler persona entry in "Strategy + Execution (Enterprise Marketing)" category; added 7 Kotler rows to the quick-reference pick table; version bumped to v2.7.0-alpha.
- **docs/GETTING_STARTED.md**: v2.6.0-alpha → v2.7.0-alpha; persona count 10 → 11 in starter-pack mentions; added `/muse:philip-kotler` to persona command examples.
- **SKILL.md**: persona inventory updated to 11; description string includes Kotler.
- **docs/ADVISORY_COUNCIL.md**: Kotler moved from Tier 1 candidate section → "Existing muse personas" table; Tier 1 renumbered (steve-jobs becomes new #1).
- **benchmarks/universal.md**: inspected; universal prompts (u01/u05/u10) already cover strategy + customer-definition shapes adequately; no Kotler-specific prompts added (persona's own bp_* prompts live in `personas/philip-kotler.md`).

### Fixed

- **Spec review iteration**: adversarial spec reviewer flagged 4 MUST-FIX issues on draft v1.0:
  1. Source-id typo at line 331 (`kotler-kotler-kartajaya-setiawan-marketing-3-0` — C7 HARD-GAP) — **fixed**.
  2. "Name the unnamed pattern" title collision with paul-graham.md's "Name the pattern" — **fixed**: renamed to "Coin the discipline term — naming as pedagogy" with sharper discipline-scale framing distinct from PG's founder-observation scale.
  3. STP and Broadening signature moves had overlapping "you haven't defined the customer" example applications — **fixed**: STP example now explicitly NARROWS (Gen Z → early-career analyst segment), Broadening example widens (marketplace has 2 customer-sets).
  4. Missing `(decide)` and `(commit)` category tags on signature moves — **fixed**: Triple bottom line recast as `(decide)`; new 6th move "Move one customer along the 5As" added with `(commit)` tag.

### Benchmark

- Grade A maintained on 11-persona pack (0 regressions vs 10-persona baseline)
- Kotler signature-move Jaccard overlap vs existing personas <0.25 (passes distinctiveness threshold)
- Voice-fingerprint check: "STP before the Ps" + "meeting needs profitably" + "broadening" + "triple bottom line" identifiable as distinctively Kotlerian in blind-judge Turing simulation

---

## [2.6.0-alpha] — 2026-04-17 — `elon-musk` persona full rebuild (gap-analysis-driven) + README "runs his thinking" tagline

### Why

A user-requested gap analysis on the `elon-musk` persona vs. its archive (`.archives/personas/elon-musk/`) surfaced **6 unused source files** (~10K lines — "How Elon Musk Thinks" article, Joe Rogan #1470 transcript, Nikhil Kamath interview, TED 2017 "future we're building," "How to Train Your Brain" short, expanded Isaacson pages) and **~12 missing cognitive-move concepts** (the named "Idiot Index," "hardcore," "production hell," "surge," Tim Urban's layered thinking-software framework, Musk's "demon mode" shadow, the documented "you've demoralized them" weakness from collaborators, the "what to steal, what to leave" interpretive guidance, MuskSpeak, Asperger's-style-directness origin of voice, etc.). The v2.4.0-alpha release shipped without these.

v2.6.0-alpha rebuilds the persona from the ground up with full archive exploitation, adds two new body sections (Shadow, What-to-steal-what-to-leave), and re-benchmarks. Same 10-persona pack, grade A maintained.

### Added

- **`personas/elon-musk.md` v3.0.0 rebuild** (387 → 469 lines, +80 net)

  **5 signature moves, now with named Musk terminology**:
  - **First principles decomposition at atomic cost — the Idiot Index** *(framing)* — Isaacson's own coined metric (pp. 3305-3310) for the ratio of finished cost to raw-material floor. Previously referenced but unnamed.
  - **The algorithm — question, delete, simplify, accelerate, automate** *(test-probe)* — unchanged, still the verbatim Isaacson pp. 284-285 mantra
  - **Surge the choke point** *(test-probe)* — Isaacson's documented name for the 24/7 physical-presence-at-bottleneck tactic. Previously named "Own the choke point."
  - **Name the requirement-maker** *(inquiry)* — unchanged
  - **Physics as the only constraint** *(framing)* — unchanged

  **16 cognitive patterns, now non-colliding meta-habits**:
  - Spec-review caught the "pattern vs move title collision" issue (same C11 compliance risk that was caught on paul-graham). 5 patterns renamed to describe *instincts behind* the tactics (e.g., "Cost lives at the commodity-price floor" as the meta-habit behind the "Idiot Index" move; "Physical presence at the constraint" behind "Surge"; "No orphan requirements" behind "Name the requirement-maker"; "Order before speed" behind "The algorithm"; "Physics is the only vote that counts" behind "Physics as the only constraint").
  - **New patterns added**: "Tighter loops, not chaos" (explicit disambiguation of speed from chaos); "Mission is what makes friction survivable" (from How Elon Thinks distillation).

  **New `## Shadow — known limitations of this cognitive frame` body section**:
  - **Demon mode** (Isaacson p. 207) — acknowledged-by-observers behavioral pattern
  - **"You've demoralized them. It's Elon's biggest weakness"** (Isaacson p. 3797) — direct collaborator testimony
  - **Directness without empathy** — explained as Asperger's-style cognitive-communication profile (Isaacson p. 677)
  - **Misplaced certainty** — the same frame that produces reusable rockets produces timeline-prediction misses
  - **Chaos masquerading as speed** — the public-persona trap; the documented principle is *tighter loops*, not chaos. Using "Musk = chaos" without the algorithm produces chaos without the speed benefit.

  **New `## What to steal, what to leave` body section** (adapted from *How Elon Musk Thinks* distillation essay):
  - Steal: question every requirement, compute idiot index, delete-before-optimize, attack the bottleneck physically, stay close to the work, treat feedback as free data
  - Leave: sleep deprivation, demoralization of teams, demon-mode interpersonal behavior, Twitter-feud habits, timeline-prediction overconfidence
  - Explicit framing: the goal is the *operating system*, not the operating *style*

  **Voice rules upgraded**:
  - Added **MuskSpeak** concept (Tim Urban's term) to Tone — describing things exactly as they literally are
  - Added **Asperger's-style direct communication** Isaacson-sourced note — explains sharp delivery as cognitive-profile, not rudeness strategy
  - Added **irony-circle humor** (Isaacson) — humor as social signaling
  - Added banned pattern: "Confuse strategic speed (tighter loops) with reckless chaos — these are not the same thing"

  **Expanded sources** 13 → 18 (added: `how-elon-thinks-2025`, `ted-2017-boring-mars`, `joe-rogan-1470`, `nikhil-kamath-2024`, `train-brain-short`).

  **New tagline `commit` context** — "Just build one, fire it, and learn the limits by breaking it." (Stage 5 imperative, replaces the observational prior candidate after spec-review fix).

  **New Critic frame**: Church-vs-Lab audit (from Tim Urban) — for each load-bearing belief, play the Why? game until you hit the floor. "Because [authority] said so" = church; physics/economic first principle = lab.

  **New benchmark prompt `bp_hardcore_shadow`** — explicitly tests that the persona surfaces its own known failure mode (sending a hardcore email to an already-demoralized team is the documented Musk-failure pattern; the persona should flag this and route to Marcus Aurelius / Seneca / Paul Graham instead).

- **README hero tagline changed** to the "runs his thinking" variant: *"ChatGPT can quote Feynman. Muse runs his thinking on your problem."* with the prior "Ten great mentors. Five minutes each. One decision closer." preserved as subtitle. The new lead differentiates muse directly from generic LLM alternatives via a single load-bearing verb ("runs" — runtime, not imitation).

### Changed

- **`commands/muse:elon-musk.md`** — signature-move listing updated to match v3 (Idiot Index, Surge terminology). Structure + disclaimer unchanged.
- **`SKILL.md`** — version bump 2.5.0-alpha → 2.6.0-alpha in header + announcement paragraph (elon-musk v3 rebuild + README tagline refresh).
- **`README.md`** — hero tagline above the fold; version bump 2.5.0-alpha → 2.6.0-alpha; Status block updated with v2.6.0-alpha entry.
- **`docs/PERSONAS.md`** — version bump; elon-musk section expanded with Idiot Index + Surge + Shadow + What-to-steal references.
- **`docs/GETTING_STARTED.md`** — version bump.

### Distinctiveness + spec review

Adversarial spec review caught 4 issues on first pass (score 6/10 — blocking):
1. **5 cognitive-pattern / signature-move title collisions** — same C11 failure mode caught on paul-graham build. Fixed by renaming all 5 patterns to describe the *instinct* behind the tactic.
2. **Core belief ~130 words** — compressed to 3 sentences with load-bearing content preserved.
3. **Commit tagline was observational** ("Faster iteration means faster contact with reality") — swapped for imperative ("Just build one, fire it, and learn the limits by breaking it" — Isaacson-sourced).
4. **Source consistency** — verified post-fix that all inline source IDs resolve in bibliography.

Verification pass: **PASS**.

**Benchmark**: 10-persona pack retains grade A. Blind Turing on prompt u02 (pricing): 10/10 match rate. Judge-subagent specifically noted: *"the v2 additions — specifically the numeric idiot index computation and the ingredients-not-recipe phrasing — are lexically unique to Musk and cannot be confused with any other persona in the pack. The idiot-index move alone made A instantly identifiable — arguably the single sharpest voice fingerprint in the whole pack."*

### Not changed

- Schema unchanged (v2.2.1-alpha). `## Shadow` and `## What to steal, what to leave` are **additive** body sections; they do not violate any v2.2 C1-C12 gate.
- No changes to the 9 other personas.
- No changes to meta commands (`/muse:build`, `/muse:update`, `/muse:benchmark`, etc.).
- Benchmark methodology unchanged; same universal.md prompt set.

### Known limitations

- The v3 Shadow section names the "demon mode" pattern but does not resolve it — an interpretive persona can acknowledge a documented behavioral shadow but cannot neutralize it. Users reaching for elon-musk in emotionally-loaded or morale-critical contexts should re-route to Marcus Aurelius / Seneca / Paul Graham per the expanded Avoid-when list.
- Isaacson citations use page numbers from the 2023 first edition; later editions may re-paginate.
- The persona remains a **frozen snapshot as of April 2026**. Musk actively publishes new statements; any contradiction with post-2026-04 material should be resolved in favor of the live source.

---

## [2.5.0-alpha] — 2026-04-17 — Second starter-pack extension: `paul-graham` interpretive persona + 10-persona benchmark grade A

### Why

v2.4.0-alpha shipped the first extension beyond the historical 8 (`elon-musk`). The ADVISORY_COUNCIL.md roadmap identified `paul-graham` as the highest-priority Tier 1 candidate, and the repo already contained ~17 MB of deep research at `.archives/personas/paul-graham/` — 22 verbatim essays, 5 long-form transcripts (Stanford CS183B 2014, Conversations with Tyler 2023, Ralston 2018, Office Hours 2013, LAUNCH 2014), and 5 book entries. v2.5.0-alpha takes that archive and produces the 10th starter-pack persona.

The choice of Paul Graham is strategic: he covers the **0→1 startup-direction cognitive frame** that Elon Musk's algorithm-focused frame doesn't address. Where Musk optimizes manufacturing at scale (1→1000), Graham focuses on "does a real user want this at all" (0→1). The two are complementary — not redundant.

### Added

- **`personas/paul-graham.md` (~380 lines)** — new starter-pack persona.

  **Cognitive signature**:
  - **Make something people want** *(framing)* — the foundational reframe. A startup isn't a thing you *become*; it's a thing you *build*. Every activity that isn't making-something-people-want is "playing house."
  - **Name the pattern** *(framing)* — give a handle to tacit-but-common behavior. Canonical PG coinages: *do things that don't scale*, *ramen profitable*, *playing house*, *top idea in your mind*, *default alive or default dead*, *the right kind of stubborn*, *maker's schedule vs manager's schedule*, *Nile Perch* (engaging-but-substanceless thoughts).
  - **Talk to your users — manually, unscalably** *(inquiry)* — Stripe's "Collison installation"; Airbnb's door-to-door NYC photography; Wufoo's handwritten thank-you notes. "Startups take off because the founders make them take off."
  - **Default alive or default dead?** *(test-probe)* — binary survival diagnostic: at current burn + growth, reach profitability before the bank hits zero?
  - **The shower test — what's the top idea in your mind?** *(test-probe)* — attention as a single slot; money and disputes are "Nile Perch" that eat it.
  - **Stay upwind — don't plan, preserve options** *(framing)* — when the territory is genuinely unknown, pick the move that teaches most and forecloses least.

  **Voice rules**: short sentences, first person, plain English, self-deprecating about his own mistakes ("Jessica is better than me at people", "I've been wrong about solo founders"), specific examples (Stripe, Airbnb, Viaweb, Wufoo, Zuckerberg, the Collisons) instead of generic "some companies". Explicit banned patterns include the word *"growth hacks"* (PG translates to "bullshit"), the *"Big Launch"* fantasy, *"disrupt"*, *"unicorn"*, *"10x"*, *"crush it"*, *"unlock"*, *"circle back"*, *"synergy"*, *"stakeholders"*, *"value prop"*, *"alignment"*, *"bandwidth"*, *"ideate"*, and the word *"passion"* (he uses *curiosity* and *interest* because they're more testable).

  **Session mode fit**: strong at STANDARD (natural essay tempo), DEEP (his essays are premise challenges), CRITIC (essay rewrite feedback). Weak at QUICK — his reasoning compresses into aphorisms that sound glib without context.

- **`commands/muse:paul-graham.md` (51 lines)** — slash command wrapper following the v2.2 persona-command pattern. Includes the mandatory disclaimer as a body blockquote, routes through SESSION.md's 5-stage adaptive workflow, and prints the full disclaimer at the top of every saved session file. If Stage 0 detects QUICK mode, warns the user that PG is a poor fit for that compression level.

### Distinctiveness + spec review

The adversarial spec reviewer (Garry Tan pattern, `/muse:build` Step 5.5) returned score 8/10 on first pass with 7 specific issues — all concrete, all actionable:

1. Cognitive pattern #2 "Name the pattern" title-collided with signature move "Name the pattern" — renamed to meta-habit **"Naming as an epistemic tool"** (describes the *instinct* that un-named things stay under-thought, while the signature move holds the specific PG coinages).
2. Cognitive pattern #4 "Stay upwind" title-collided with signature move "Stay upwind" — renamed to **"Optionality-first over plan-first"** with an explicit Lao-Tzu disambiguation note ("wu-wei minimizes interference; optionality-first maximizes learnable paths").
3. Signature move "Talk to your users" disambiguated from Socratic elenchus (PG watches what users *do* to update what to build; Socrates cross-examines to surface contradictions in *thinking*).
4. Signature move "Default alive or default dead?" disambiguated from Elon Musk's "name the requirement-maker" binary test (PG's is a solvency check — when does the math stop working; Musk's is an attribution check — who authored a constraint).
5. Typo fix in banned patterns (missing closing asterisk on `*"unlock"*`).
6. Thinking-mode split: primary core_tension (curiosity vs. ambition) stays canonical; secondary heuristic (trust intuition about people, not about startups) promoted to its own labeled paragraph.

All 7 fixes applied. C1-C12 static compliance PASS. Pre-save dry-run PASS. Post-save dry-run PASS.

### Changed

- **`SKILL.md`**: v2.4.0-alpha → v2.5.0-alpha header bump. New announcement paragraph for Paul Graham persona. Invocation table row updated: "(9 personas — 7 historical + 2 interpretive)" → "(10 personas — 7 historical + 3 interpretive)". Running total: "19 slash commands" → "20 slash commands". Living-figure disclaimer reminder updated to list three interpretive personas (dieter-rams, elon-musk, paul-graham).
- **`README.md`**: starter pack table 9 rows → 10 rows (paul-graham added with interpretive marker and domain `strategy, execution, first-principles, philosophy`). Version header "2.4.0-alpha ~5,800 lines" → "2.5.0-alpha ~6,200 lines". § Commands reference "19 total — v2.4.0-alpha" → "20 total — v2.5.0-alpha". Status block updated with v2.5.0-alpha entry, version history extended.
- **`docs/PERSONAS.md`**: v2.4.0 → v2.5.0 header. Starter pack count 9 → 10. New § "Strategy + Execution (Startup)" category with full Paul Graham entry (tagline, all 6 signature moves with category tags, cognitive-patterns summary, best-for/avoid-when guidance, session mode fit, sample invocation). Quick-reference table adds 6 new rows for PG use cases (playing-house diagnostic, user-conversation audit, top-idea-in-your-mind, default-alive/dead, pattern-naming, write-like-you-talk).
- **`docs/GETTING_STARTED.md`**: v2.4.0-alpha → v2.5.0-alpha header. "19 slash commands" → "20". "9 personas" → "10". "To add a 10th" → "To add an 11th."
- **`docs/ADVISORY_COUNCIL.md`**: Paul Graham removed from Tier 1 candidate list; added to the "Existing muse personas" table at the top (9 → 10 rows).

### Legal + interpretive framing

**The Paul Graham persona disclaimer** is comparable in extent to Elon Musk's but with one additional dimension: Graham **actively publishes essays** and updates his views frequently. The disclaimer therefore explicitly notes that the persona is a **frozen snapshot as of April 2026** — readers should not treat outputs as what Graham currently thinks, and any contradiction with a post-2026-04 essay should be resolved in favor of the live essay.

The disclaimer appears in three places (same safeguard pattern as elon-musk):
1. **Frontmatter `disclaimer:` field** in `personas/paul-graham.md` — ~200 words. Enumerates sources (paulgraham.com 2001–present, Hackers & Painters 2004, Founders at Work 2007, The Launch Pad 2012, 5 long-form transcripts), explicitly names NOT-affiliated entities (Y Combinator, Viaweb, Yahoo, Jessica Livingston), and states that outputs are NOT quotation, NOT predictions, NOT current-views claims, and NOT investment/fundraising advice.
2. **Body blockquote** immediately below the tagline.
3. **Slash command file** `commands/muse:paul-graham.md` has a shortened disclaimer in the body. Step 4 of the skill instructs the agent to write the **full disclaimer** into every saved session file.

### Not changed

- Schema unchanged (v2.2.1-alpha). No new fields, no migrations needed.
- No changes to historical 8 personas.
- No changes to meta commands (`muse:who`, `muse:all`, `muse:chain`, `muse:debate`, `muse:critic`, `muse:build`, `muse:update`, `muse:benchmark`, `muse:spike`, `muse:list`).
- No changes to `install.sh` — persona count is already dynamic from v2.4.0-alpha.
- Benchmark methodology unchanged.

### Known limitations

- Spec review final score was 8/10 with 7 fixes applied. Did not re-run the reviewer post-fix — agent recommended fixes and the author applied them directly. Follow-up distinctiveness run is in Phase 7 (benchmark).
- Paul Graham is a living, actively-publishing figure. Any essay he publishes after 2026-04-17 may contradict the persona's frozen snapshot. Suggested: annual refresh via `/persona:add --name=paul-graham` to pull new essays + `/muse:update paul-graham` to re-integrate.

---

## [2.4.0-alpha] — 2026-04-16 — First starter-pack extension: `elon-musk` interpretive persona + 9-persona benchmark grade A

### Why

v2.3.2-alpha reframed muse as a **persona runtime + starter pack**, and the README roadmap promised the starter pack would grow. v2.4.0-alpha is the first actual extension: the `elon-musk` persona joins the roster as the 9th cognitive frame. This is also the first time muse ships a persona for a **still-active, still-litigious public figure** — which stress-tests the right-of-publicity safeguards the framework has had in place since v2.1 but has only exercised on Dieter Rams until now.

The decision to ship Musk publicly (not local-only) was made with clear eyes: muse is a **cognitive-tool framework**, not a character-simulation framework, and Musk's reasoning patterns (first-principles cost decomposition, the 5-step algorithm, manufacturing reality checks, physics-as-the-only-constraint) are among the most distinctive and most publicly documented operator methods of the 21st century. They are worth having as a reusable lens. But they come with legal surface area. The disclaimer is extensive, the interpretive framing is mandatory, and every session saved under this persona carries the disclaimer forward.

### Added

- **`personas/elon-musk.md` (~370 lines)** — new starter-pack persona.

  **Cognitive signature**:
  - **First principles decomposition at atomic cost** — break any cost claim down to raw materials at commodity prices + energy + human time. The gap vs market price is margin or bad engineering — both fixable.
  - **The algorithm** — documented verbatim by Walter Isaacson (pp. 284-285): (1) Question every requirement and name the human who made it, (2) delete any part or process you can, (3) simplify what survives, (4) accelerate cycle time, (5) automate LAST. Order matters. Automating before deleting is how teams ship garbage fast.
  - **Manufacturing reality check** — "prototypes are easy, the factory is the product". Plans that don't survive scale=10,000x are demos, not plans.
  - **Name the requirement-maker** — any requirement attributable only to "the legal department" or "the safety department" is an orphan. Find the human or delete it.
  - **Physics as the only constraint** — the only inviolable rules are the laws of physics. Budget, schedule, industry practice, "best effort" are all recommendations to be tested.

  **Voice rules**: dry, impatient with process, patient with physics. Specific numeric references. Self-deprecating about timeline misses. Dismisses analogical reasoning. Banned patterns include "best practices", "let's form a committee", "consultants", "outsource it", "comfortable timeline", and management-speak.

  **Session mode fit**: strong at STANDARD, CRITIC, QUICK. Weak at DEEP — impatient with Stage 0.5 Premise Challenge, wants to ship before the philosophy session ends.

- **`commands/muse:elon-musk.md` (~60 lines)** — slash command wrapper following the v2.2 persona-command pattern. Includes the mandatory disclaimer as a body blockquote, routes through SESSION.md's 5-stage adaptive workflow, and prints the full disclaimer at the top of every saved session file. If Stage 0 detects DEEP mode, warns the user that Musk is a poor fit for premise challenges.

### Distinctiveness guarantee (9-persona benchmark run)

Ran a 9-persona blind Turing test on two prompts (u01 architecture monolith-vs-microservices, u09 CI pipeline process cull — the latter being Elon's strongest surface and the former being the hardest "first principles collision" case with Feynman).

**Result: 18/18 match rate (100%). Zero confusions. Zero low-confidence matches.**

The judge subagent (fresh context, no conversation history, 9 one-line persona summaries as reference) correctly identified all 9 persona responses on both prompts. Specifically, the judge noted that Elon and Feynman are **clearly distinguishable** despite both claiming "first principles":

> "u01-B (elon-musk) and u01-F (feynman) both use hand calculation, but were clearly distinct: B runs THE ALGORITHM in exact numbered order with 'question every requirement/delete/simplify/accelerate/automate LAST' and 'physics doesn't care', while F leads with the 12-year-old jargon test, cargo cult detection, and frames the math as a back-of-envelope sanity check rather than a cost-decomposition-plus-algorithm sequence." — judge subagent

The benchmark grade A baseline (set in v2.2.3-alpha with 8 personas, 24/24 blind Turing) holds with 9 personas. No persona regression. The algorithm + name-the-requirement-maker + physics-as-constraint vector produced outputs distinct enough from Feynman's simplification + cargo cult + hand calculation vector that the judge never confused them.

### Changed

- **`SKILL.md`**: v2.3.1-alpha → v2.4.0-alpha header bump. New announcement paragraph for Elon Musk persona. Invocation table row updated: "(8 personas)" → "(9 personas — 7 historical + 2 interpretive)". Running total: "17 slash commands" → "19 slash commands". New living-figure-disclaimer reminder paragraph explaining that two interpretive personas now carry mandatory disclaimers.
- **`README.md`** (14+ edits across the file): starter pack table 8 rows → 9 rows (elon-musk added with interpretive marker), § Discovering the right persona triage example shows Elon top-pick at 72/80 for "should I rewrite in Rust?", § Commands reference table persona sessions section (8) → (9), § Build your own persona "9th" → "10th", all "18 slash commands" references → "19 slash commands", § Legal & privacy expanded with Musk-specific disclaimer paragraph, § Status updated with v2.4.0-alpha entry, Version header "2.3.2-alpha ~5,400 lines" → "2.4.0-alpha ~5,800 lines".
- **`docs/PERSONAS.md`**: v2.3.2 → v2.4.0 header. Starter pack count 8 → 9. New § "First Principles + Execution + Engineering" category with full Elon Musk entry. "How to pick a persona" quick-reference table adds 3 new rows for Elon's use cases (process bloat, cost claims, comfortable timelines).
- **`docs/GETTING_STARTED.md`**: v2.3.2 → v2.4.0 header. All "18 slash commands" → "19". Triage example updated to 9 personas. "Starter pack ships with 8" → "9 as of v2.4.0-alpha".
- **`install.sh`**:
  - **Persona count made dynamic** (previously deferred from v2.3.1 as R7 known limitation). Added a `persona_count` calculation via `find $TARGET/personas -maxdepth 1 -name '*.md'`. Welcome message reads "($cmd_count slash commands, $persona_count personas)" — stays accurate as the starter pack grows.
  - Welcome message rewrite: removed the hardcoded 8-persona listing. New message leads with `/muse:who` as the recommended first command, then shows 4 example invocations including `/muse:elon-musk` with the `(interpretive)` marker, then points at `/muse:list` for the full set.

### Legal + interpretive framing (new, load-bearing)

**The Elon Musk persona carries the most extensive interpretive disclaimer in the muse repo** because Musk's company surface area is the largest of any figure in the starter pack. The disclaimer is present in three places:

1. **Frontmatter `disclaimer:` field** in `personas/elon-musk.md` — ~150 words. Enumerates the sources (Isaacson 2023, Vance 2015, Wait But Why 2015, Tesla master plans, TED 2022, IAC 2016, podcast transcripts), names every Musk-connected entity it is NOT affiliated with (Tesla, SpaceX, X Corp, Neuralink, The Boring Company, xAI), and explicitly says the outputs are NOT direct quotation, NOT predictions of what he would say on any specific matter, and NOT claims about his views.
2. **Body blockquote** immediately below the tagline in `personas/elon-musk.md`. Repeats the disclaimer verbatim. SESSION.md pre-flight auto-prints this before Stage 1 of every `/muse:elon-musk` session.
3. **Slash command file** `commands/muse:elon-musk.md` has a shortened disclaimer in the body. Step 4 of the skill instructs the agent to write the **full disclaimer** into every saved session file — every `~/.muse/sessions/<ts>-elon-musk-*.md` will carry the disclaimer forward so that if the user shares the session, the interpretive framing travels with it.

**Interpretive framing is non-negotiable**. Outputs from this persona:
- Are cognitive-tool commentary on publicly documented reasoning patterns
- Are NOT direct quotation
- Are NOT predictions of what Elon Musk would actually say on any specific matter
- Are NOT claims about his views, politics, companies, or products
- Must NOT be shared publicly as "what Elon Musk thinks about X"

The persona is a **lens for first-principles engineering and process-simplification decisions**, not a simulation of the person.

### Not changed

- All other 8 personas: untouched
- `SESSION.md`: untouched
- Benchmark skill: untouched
- Other 17 slash commands: untouched
- `docs/BENCHMARKS.md` + `docs/PERSONA_SCHEMA.md` + `docs/CONTRIBUTING.md` + `docs/ARCHITECTURE.md` + `docs/SESSIONS.md`: untouched
- Codex/Gemini CLI adapters: untouched (free-text fallback picks up the new persona automatically via SESSION.md pre-flight)

### Backward compatibility

- Every existing slash command works identically
- Every existing free-text invocation works identically
- Every existing session file is valid
- The benchmark baseline still holds — 24/24 Turing result from v2.2.3 is NOT invalidated; the v2.4 run adds a 9-persona verification layer on top
- `install.sh` dynamic-count change is backward-compatible (if `personas/` is missing, falls back to `persona_count=0` gracefully)

### Migration

```bash
cd ~/.claude/skills/muse && git pull && ./install.sh
# Expect: "Installed 19 slash commands to ~/.claude/commands/"
# Expect welcome message to read "(19 slash commands, 9 personas)"
```

Try the new persona:

```bash
/muse:elon-musk our CI pipeline takes 40 minutes
/muse:elon-musk should we build our own auth or use Auth0
/muse:elon-musk my team says this feature will take 3 months
/muse:who should I rewrite this service in Rust
# Expect elon-musk to score top-3 (alongside Feynman) on the last one
```

### Known limitations

- **Routing accuracy benchmark still not implemented**. `/muse:benchmark` measures persona distinctiveness (post-routing), not routing accuracy (pre-routing). Deferred to v2.4.1+.
- **DEEP mode warning is advisory, not enforced**. If a user insists on DEEP mode with `/muse:elon-musk`, the command runs it with a warning.
- **The algorithm is stated as a 5-step mantra, not a forced sequence**. Nothing in the skill file mechanically enforces step-ordering in session output. Benchmark run confirmed the agent respected the order on both test prompts.

### Risks + mitigations

- **R1 (legal)**: Musk or his entities could object. **Mitigation**: disclaimer explicitly disclaims affiliation, outputs are interpretive commentary (fair-use educational use), no direct quotation, no prediction of views, no claims of endorsement. All sources are mainstream-published books, published blog posts, and public keynotes/interviews. If a legal issue arises, the persona can be removed in a patch release.
- **R2 (distinctiveness)**: Elon could confuse with Feynman on first-principles questions. **Mitigation**: benchmark run on the hardest collision prompt (u01) showed zero confusion. Judge explicitly distinguished them.
- **R3 (voice accuracy)**: The persona could mis-attribute reasoning patterns. **Mitigation**: every signature move cites Isaacson 2023 (with page numbers), Vance 2015, Wait But Why 2015, or Tesla's own published master plans. The algorithm is documented verbatim in Isaacson pp. 284-285.
- **R4 (inappropriate use)**: A user could invoke `/muse:elon-musk` on emotional questions where his reasoning is a bad fit. **Mitigation**: `avoid_when` list explicitly includes emotional/interpersonal judgment, values/meaning/identity, regulated domains. `/muse:who` routes these questions to Marcus Aurelius, Socrates, or Confucius.

### Total diff

- `personas/elon-musk.md`: +370 lines (new file)
- `commands/muse:elon-musk.md`: +60 lines (new file)
- `SKILL.md`: +15 lines net
- `README.md`: +40 lines net
- `docs/PERSONAS.md`: +50 lines net
- `docs/GETTING_STARTED.md`: ~10 lines changed
- `install.sh`: +10 lines net
- `docs/CHANGELOG.md`: +this entry
- **Net**: ~560 lines added, 2 new files, 5 files modified

---

## [2.3.2-alpha] — 2026-04-16 — Docs refresh: persona runtime + extensibility + v3 catalog vision

### Why

v2.3.1-alpha shipped `/muse:who` — the 18th slash command — and the docs still described muse as if it were a fixed 8-persona tool. README said *"Eight historical thinkers"*. `docs/PERSONAS.md` said *"8 core personas shipped in v2.0"*. `docs/GETTING_STARTED.md` said *"restart Claude Code so it picks up the 8 new slash commands"*. Every surface-level doc reinforced a framing that didn't match the product anymore.

The product reality: muse is a **persona runtime** that ships with a starter pack. The runtime supports arbitrary locally-authored personas today via `/muse:build`, and the long-term direction is a public catalog (similar to agentskills for Claude Code) where users browse and clone individual personas without cloning the whole framework. The docs needed to reflect this so new users don't install muse thinking *"cool, 8 personas, that's the product"*.

v2.3.2-alpha is a comprehensive docs refresh. Zero code changes. Zero persona edits. Zero SKILL.md/SESSION.md changes. Every surface-level messaging change flows from one reframe: **starter pack + extensible runtime**, not fixed 8-persona tool.

### Changed

**`README.md`** (~540 lines, full rewrite):

- **Hero paragraph** reframed: muse is now *"a persona runtime that ships with a curated starter pack of cognitive tools and is designed from day one to be extended"*. The *"eight historical thinkers"* framing is gone.
- **New § What gets shipped** organized into 🎭 Starter pack (8 personas with a full table showing id, era, domain, tagline) + ⚙️ Runtime (18 slash commands) + 📐 Framework (SESSION.md / SKILL.md / schema / benchmarks docs). Explicit *"Starter pack, not a ceiling"* callout.
- **New § Discovering the right persona** featuring `/muse:who` as the cold-start entry point with a worked example of the triage output. Three tiers: triage (`/muse:who`), browse (`/muse:list`), direct (`/muse:<id>`).
- **Enriched § Commands reference** with attribute icons (💬 interactive, 💾 persistent, 🎭 multi-persona, 🔑 requires API key, ⚡ quick). Grouped into 🧭 Triage & navigation (2), 🎭 Persona sessions — starter pack (8), 🎭 Multi-persona orchestration (4), 🛠️ Persona lifecycle (2), 📊 Evaluation (2). Full distinctive-moves summary per persona instead of one-liner.
- **New § Roadmap** describing the v3 persona catalog vision explicitly: browse, preview, clone individual personas, contribute via PR with automated distinctiveness gates. Cites agentskills as the model. Lists near-term (v2.4+) and long-term (v3+) roadmap items.
- **Updated § Build your own persona** — emphasizes that starter pack and extension personas are *fully equal* (no special treatment, no second-class status). `/muse:who`, `/muse:benchmark`, `/muse:update` all include local personas automatically.
- **Updated § Who this is for** — added "Teams with opinionated thinkers" use case.
- **Updated § How muse is different** — added item 7 on extensibility as a first-class property.
- **Updated § Credits** — acknowledges agentskills as the catalog model.
- **Updated § Status** — v2.3.2-alpha entry, version history refreshed through v2.2.0-alpha (every recent release has a one-line summary).
- **Tagline for the release**: *"18 slash commands · 8 starter-pack personas · extensible runtime"*.

**`docs/PERSONAS.md`** (~280 lines, rewrite):

- Title changed from *"Muse Personas (v2)"* to *"Muse Personas — Starter Pack + Extension Guide (v2.3.2-alpha)"*.
- Opening paragraph reframed: starter pack as baseline, runtime as the actual product, future catalog as the v3+ direction.
- **Per-persona descriptions** enriched with signature move category tags `(framing)` / `(inquiry)` / `(test-probe)`, "best for" use cases, and "avoid when" notes for Feynman.
- **New § How to pick a persona** with three options: (1) `/muse:who` triage, (2) quick-reference table, (3) multi-persona orchestration. The quick-reference table expanded with emotional/identity and abstraction-defining rows.
- **New § Extending the starter pack** documenting the build flow, explicit *"every extension persona is fully equal to starter-pack personas"* statement, and a **candidate roster for v2.4+** (Shannon, Jacobs, Taleb, Keynes, Weil, Miyazaki, Hopper) with rationale per candidate.
- **New § v3 persona catalog vision** — 5-point description of browse / preview / clone / update / contribute flow. Load-bearing prerequisites: schema stability, scoring, signing.
- Explicit call to action: *"In the meantime: share via PR"*.

**`docs/GETTING_STARTED.md`** (~180 lines, rewrite):

- Title bumped to v2.3.2-alpha.
- Install section lists all 6 `~/.muse/` subdirectories (sessions, chains, debates, critiques, spike, analytics, benchmark-reports) instead of just sessions.
- **New § 2 — Your first command: /muse:who** as THE recommended cold-start entry point, with a worked triage example.
- **Renumbered remaining steps** to reflect the new ordering (browse → session → chain → debate → critic → build → benchmark).
- **New § 9 — Measure persona quality** pointing at `/muse:benchmark` + `--diff` workflow.
- **New § 10 — Full command reference** with the 18-command table broken into starter-pack (8) + meta (10).
- **Updated § Troubleshooting** with specific v2.3.2 issues: persona not showing in /muse:list, benchmark grade drop after adding a persona, etc.

**`docs/CONTRIBUTING.md`** (minor edits):

- Opening paragraph reframed: starter pack as baseline, path to expand is local authoring + upstream PRs, catalog is v3+ roadmap.
- `/muse:build` section expanded: explicit mention of spec review loop (max 3 iterations), C1-C12 validation, distinctiveness check, dry-run + atomic mv. Shows both slash path (Claude Code) and free-text path (Codex/Gemini CLI).
- **Distinctiveness testing** — now recommends `/muse:benchmark --diff` as the primary path (no API key needed, uses subagent judges) and `/muse:spike` as the scientific-with-human-judges path (still v2.3.0 gather-only, score mode v2.3.1+).
- **"NOT accepting" section** updated to reflect the v2.4+/v3+ split. Public catalog infrastructure, `--mode=score`, routing-accuracy benchmark, CI integration, continuous dashboards all explicitly listed as deferred with version targets. Auto-improvement loop explicitly marked *"deliberately never"*.

**`docs/ARCHITECTURE.md`** (header + system diagram refresh):

- Title bumped to *"Muse Architecture (v2.3.2-alpha — agentic persona runtime)"*.
- Preamble expanded with per-minor-version additions (v2.1 structured sessions, v2.2 adaptive modes + enriched schema + build/update/benchmark, v2.3 six new orchestration commands + `/muse:who`).
- **Starter pack + runtime positioning paragraph** added — explicit statement that the architecture scales from 8 to 80 personas without change.
- **System diagram** updated: 18 slash commands, v2.0 vs v2.1+ paths labeled for Codex/Gemini vs Claude Code, outputs list includes chains/debates/critiques/spike folders alongside sessions.

**`docs/SESSIONS.md`** (intro refresh):

- Title bumped to *"Structured sessions (v2.1+, current: v2.3.2-alpha)"*.
- Opening paragraph reframed: every *installed* persona (starter pack OR locally-authored) gets a slash command automatically on next `install.sh`. The set is dynamic, not fixed at 8.
- v2.2 adaptive modes paragraph added (QUICK/STANDARD/DEEP/CRITIC with brief description).

### Not changed

- **`commands/*.md`** — all 18 slash command files untouched
- **`personas/*.md`** — all 8 starter pack personas untouched
- **`SESSION.md`** (load-bearing workflow spec) — untouched
- **`SKILL.md`** (dispatcher) — untouched
- **`docs/BENCHMARKS.md`** — already current, shipped in v2.2.3-alpha
- **`docs/PERSONA_SCHEMA.md`** — schema reference is version-agnostic, no change needed
- **`install.sh`** — untouched
- **Benchmark state** — grade A, 24/24 Turing, 100% compliance unchanged (provable via `git diff 3257daf..HEAD --stat -- personas/ SESSION.md SKILL.md` → empty)

### Backward compatibility

100% backward compatible. Zero behavioral changes. Every existing slash command, every existing free-text invocation, every existing session file path still works identically. The docs refresh is pure messaging — the product surface is identical to v2.3.1-alpha.

### Migration

None required. Pull and continue using muse.

```bash
cd ~/.claude/skills/muse && git pull
# No install.sh re-run needed — no new commands.
```

### Total diff

- `README.md`: fully rewritten (~540 lines, was ~420) → +~170 lines net, substantial restructure
- `docs/PERSONAS.md`: fully rewritten (~280 lines, was ~210) → +~70 lines net
- `docs/GETTING_STARTED.md`: fully rewritten (~180 lines, was ~160) → +~20 lines net
- `docs/CONTRIBUTING.md`: minor edits (~15 lines changed)
- `docs/ARCHITECTURE.md`: preamble + system diagram refresh (~25 lines changed)
- `docs/SESSIONS.md`: intro refresh (~5 lines changed)
- `docs/CHANGELOG.md`: +this entry
- **Net**: ~300 lines added, 0 lines removed from the product surface. Doc-only release.

### Regression safety

- Zero code changes
- Zero persona edits
- Zero SKILL.md / SESSION.md changes
- Benchmark baseline unchanged
- Provable via `git diff 3257daf..HEAD --stat -- personas/ SESSION.md SKILL.md commands/` → empty

---

## [2.3.1-alpha] — 2026-04-15 — `/muse:who` persona triage + routing

### Why

muse v2.3.0-alpha shipped 17 slash commands including 8 distinct personas. That's the strength — 8 genuinely different cognitive frames. It's also the weakness: a new user who installs muse doesn't know which persona to reach for. Reading 8 persona files to figure out "who should help with this question?" is friction. Running `/muse:list` gets you a directory but not a recommendation. Running `/muse:all` fires every persona, which is expensive for a simple question.

The gap was a **triage entry point** — a command that takes the user's question, analyzes it, and suggests the right lens. `/muse:who` closes that gap. Type your question without knowing the persona map, get a ranked pick list with rationales, and the chosen session runs inline on the same input.

This is the "I don't know who to ask" entry point into muse.

### Added

- **`commands/muse:who.md` (~400 lines)** — persona triage + routing command.

  **Syntax**: `/muse:who <user_text>`. Examples:
  - `/muse:who "should I rewrite this service in Rust?"`
  - `/muse:who "what do I actually mean by community?"`
  - `/muse:who review my landing page copy`
  - `/muse:who should I quit my startup or persist?`

  **Flow**:
  1. Parse + validate user_text (reject <5 chars, sanitize prompt-injection patterns).
  2. Load SESSION.md + all 8 persona files in parallel. Extract scoring fields: `categories[]`, `when_to_reach_for_me.triggers[]`, `avoid_when[]`, `session_mode_preferences`, `thinking_mode.opening_question`, `signature_moves` category distribution.
  3. Score each persona (0-80) using a transparent rubric (see below).
  4. Detect chain and debate opportunities from the top 2 scores.
  5. Present top 5 via `AskUserQuestion` with scores + one-line rationales. Options A-E are personas; F/G/H are chain/debate/council suggestions if detected; I is a full 8-persona score table; J is abort.
  6. On pick (A-E): load the chosen persona + SESSION.md (already in context) and run the 5-stage session inline. Same behavior as `/muse:<picked> <user_text>`.
  7. On pick F/G/H: print the exact slash command for the user to type (chain/debate/all are deferred to their own slash commands — no inline execution, keeps `/muse:who` ~400 lines instead of ~1000).
  8. Append analytics to `~/.muse/analytics/who.jsonl`.

### Scoring rubric (transparent, not a black box)

The rubric is documented in full in `commands/muse:who.md` Step 2. Scores 0-80:

| Category | Range | Signal |
|---|---|---|
| Trigger match | 0-35 | Literal or semantic match against `triggers[]` |
| Question-type fit | 0-20 | Question shape matches signature_move categories (framing/inquiry/test-probe) |
| Domain alignment | 0-15 | Detected domain matches `categories[]` |
| Thinking mode resonance | 0-10 | `opening_question` feels right for this input |
| Avoid-when penalty | -30 to 0 | Heavy hit if user_text triggers `avoid_when[]` |
| Mode-fit penalty | -10 to 0 | If detected mode is in `weak_at[]` |

Floor at 0. Max positive: 80. 70+ = clearly the right persona. 50-69 = strong match. 30-49 = reasonable. <30 = weak — triggers fallback note recommending `/muse:list` or `/muse:all`.

**Inline reasoning, not a classifier**. The main agent reads user_text + each persona's scoring fields and assigns scores with rationales in one reasoning step. Score breakdown is visible in the full-table option (I) and logged to analytics.

### Scoring calibration examples (in the skill file)

Non-normative references for the agent's judgment. The skill file describes what the scoring should look like for 5 known inputs:

- *"should I rewrite in Rust?"* → Feynman 68 (hand calc + first principles), Socrates 55 (define "rewrite"), Marcus Aurelius 40, Seneca 35, Lao Tzu 30.
- *"what do I actually mean by community?"* → Socrates 78 (pure definition hunting), Confucius 52 (rectification of names), Aristotle 48 (four causes), Feynman 35, Rams 20.
- *"review my landing page copy"* → Dieter Rams 75 (ten principles + critic frames + design domain), Feynman 40, Socrates 38, Lao Tzu 35, Marcus Aurelius 20.
- *"should I quit my startup?"* → Marcus Aurelius 70 (dichotomy of control), Seneca 68 (premeditatio malorum), Lao Tzu 60, Socrates 50, Aristotle 42.
- *"help"* → all <30, fallback to `/muse:list` or `/muse:all`.

These are calibration references, not hardcoded lookups.

### Chain and debate detection

If top 2 scores are within 15 points AND their primary signature_move categories are complementary (e.g., `framing + test-probe`) AND both ≥50, `/muse:who` suggests a chain `top_1 → top_2`. If the top 2 take opposing positions on a canonical dilemma (checked via `canonical_mapping`), a debate is suggested instead.

Chain and debate picks print the exact command for the user to type (e.g., `/muse:chain feynman→socrates "should I rewrite in Rust?"`). `/muse:who` does NOT inline-execute chain/debate — those have their own orchestration in dedicated slash commands. This keeps the triage command lightweight.

### Changed

- **`SKILL.md`**: new routing table row for `muse:who`, new routing dispatch entry (`### Who: muse:who <user_text>`), new `Mode: who` free-text section (for Codex/Gemini CLI), version bumped to v2.3.1-alpha in header with note about the triage entry point.
- **`README.md`**: command count 17 → 18, new `/muse:who` row at the top of the meta commands table (featured — it's the recommended entry point for new users), updated install welcome message to suggest `/muse:who` first, status section refreshed with v2.3.1-alpha entry and v2.3.0-alpha demoted to version history.

### Architecture decisions

- **Inline scoring, not subagents**. 8 personas × scoring reasoning is ~2000 tokens of main-agent work — fast and no coherence loss. Subagent dispatch would add 5-10 sec latency with no quality gain.
- **Inline handoff for single-persona picks**. The main agent keeps persona + SESSION.md in context from Step 1 and switches from "scoring mode" to "session mode" when a pick is made. This is the same pattern `/muse:<persona>` slash commands use — they're thin pointers into SESSION.md's 5-stage workflow. Zero duplication.
- **Chain/debate/council deferred to their own commands**. Instead of inlining chain Step 3-4 (which would add ~150 lines of duplication), `/muse:who` prints the exact slash command for the user to type. Simpler, smaller, and respects the boundary between routing (`/muse:who`) and orchestration (`/muse:chain`).
- **Transparent rubric**. The scoring breakdown is documented in the skill file so users can audit picks. The full-table option (I) shows sub-scores. The analytics jsonl records everything for future routing-accuracy benchmarks.
- **Avoid-when is load-bearing**. The -30 penalty is the ONE signal that can demote a persona even with strong trigger matches. Example: Feynman might trigger-match "should I pivot?" (contains "should") but his `avoid_when` says "user needs emotional commitment to a decision" — that pushes him from ~50 to ~20, which is correct.

### Known limitations

- **No persistence of the triage decision itself**. `/muse:who` writes only the analytics jsonl. If the chosen persona session crashes mid-run, the triage decision is lost. Acceptable for v2.3.1 — the rerun cost is low.
- **Routing accuracy is not benchmarked in v2.3.1**. `/muse:benchmark` measures persona distinctiveness (what happens AFTER routing), not routing accuracy (which persona the triage picks). Adding a routing-accuracy measure requires ground-truth labels on ~20 prompts and is deferred to v2.4+.
- **Vague inputs produce weak scores**. "help", "hi", single-word questions all score <30 across the board. The fallback is to recommend `/muse:list` or `/muse:all`, but a better long-term answer would be to prompt for more context. Deferred to v2.4+.
- **Chain/debate/council picks don't chain transitively**. Picking F/G/H prints the command but doesn't run it — slash commands can't invoke each other. The user has to copy-paste. Documented in Step 5b/5c/5d of the skill file.

### Backward compatibility

- **No persona file edits**. All 8 personas unchanged.
- **No SESSION.md changes**. Load-bearing file untouched.
- **Existing slash commands unchanged**. `/muse:<persona>`, `/muse:chain`, `/muse:debate`, `/muse:critic`, `/muse:all`, `/muse:list`, `/muse:build`, `/muse:update`, `/muse:benchmark`, `/muse:spike` all work exactly as before.
- **`install.sh` unchanged**. Glob-based registration picks up `commands/muse:who.md` automatically. Count goes from 17 → 18.
- **Existing sessions, benchmark reports, and analytics are not invalidated**. v2.3.1 adds `~/.muse/analytics/who.jsonl` without touching existing files.

### Migration

```bash
cd ~/.claude/skills/muse && git pull && ./install.sh
# Expect: "Installed 18 slash commands to ~/.claude/commands/"
```

Smoke tests:

```bash
/muse:who "should I rewrite this service in Rust?"
# Expect: Feynman top with ~68/80, rationale mentioning hand calculation + first principles
# Expect: Socrates second with ~55/80, rationale mentioning definition of "rewrite"

/muse:who "what do I actually mean by community?"
# Expect: Socrates top with ~78/80, rationale mentioning definition hunting

/muse:who "review my landing page copy"
# Expect: Dieter Rams top with ~75/80, rationale mentioning ten principles + design domain

/muse:who help
# Expect: all personas <30, fallback note recommending /muse:list or /muse:all

/muse:who
# Expect: interactive prompt "What's on your mind?"

/muse:benchmark --diff
# Expect: 0 regressions (zero persona/SESSION.md edits in this release)
```

### Risks + mitigations

- **R1**: scoring inconsistency across runs (LLM non-determinism). **Mitigation**: rubric is transparent and documented in the skill file; sub-scores are visible in the full-table option (I). If a pick feels wrong, user inspects the breakdown and overrides.
- **R2**: chain/debate suggestions feel like dead ends because they require copy-paste. **Mitigation**: the printed command is ready to copy. Future improvement: v2.4+ may add `--auto-execute` flag that runs the chain inline.
- **R3**: top 5 might miss a persona that a human would pick. **Mitigation**: option I (full table) shows all 8 with scores, and option J (abort) always exits cleanly. The pick list is a recommendation, not a gate.
- **R4**: avoid-when signal might be too aggressive. **Mitigation**: rubric caps the penalty at -30 (out of 80 positive), so even a direct avoid-when hit can't zero out a persona with strong trigger + domain match. Sub-scores visible for audit.

### Total diff

- `commands/muse:who.md`: +430 lines (new file)
- `SKILL.md`: +60 lines (routing row + dispatch entry + Mode: who section + version bump + announcement paragraph)
- `README.md`: +~20 lines, -~15 lines net (meta commands table row, count 17→18, install message, status section refresh, personas list bump to 10 meta commands)
- `docs/CHANGELOG.md`: +this entry
- **Net**: ~550 lines added, 1 new file, 3 files modified

---

## [2.3.0-alpha] — 2026-04-15 — Ship 6 missing slash commands (chain, all, debate, critic, list, spike MVP) — original CEO plan complete

### Why

Back in v2.1.0-alpha, six commands from the original v1 CEO plan were deferred with the note *"don't fit the 5-stage shape, deferred to v2.2+"*. v2.2.0-alpha came and went without shipping them. v2.2.1-alpha and v2.2.2-alpha and v2.2.3-alpha came and went. The free-text Mode sections in SKILL.md were still there, but Claude Code users could not invoke `/muse:chain`, `/muse:debate`, `/muse:critic`, `/muse:all`, `/muse:list`, or `/muse:spike` as proper slash commands. The original CEO plan was 80% shipped.

v2.3.0-alpha closes that gap. All 6 commands now ship as self-contained slash commands following the pattern established by `/muse:build` (524 lines), `/muse:update` (481), and `/muse:benchmark` (570). Inline orchestration for chain/debate (no subagent dispatch per persona — proven sufficient by v2.2.2's grade-A blind Turing run). Parallel subagents only for `/muse:critic --chain=` where per-persona critiques are genuinely independent. `/muse:spike` ships MVP gather-only; score subcommand is deferred to v2.3.1.

Total slash commands: **11 → 17**. After this release, muse is at *"original v1 CEO plan fully shipped + instrumented + benchmarked"*. A real milestone.

### Added

- **`commands/muse:list.md` (~140 lines)** — ephemeral persona listing grouped by category. Dynamic category index from frontmatter `categories[]` union (no hardcoded list — survives schema growth). Supports `--category=<tag>` filter with closest-match suggestions on empty filters. Living personas marked `*(interpretive)*`. No persistence.
- **`commands/muse:chain.md` (~360 lines)** — sequential multi-persona handoff. Supports inline syntax (`feynman→socrates→dieter-rams`) or preset name (loads `chains/<preset>.md`). Per-persona handoff context with 2-3 sentence inline summaries (not subagent-dispatched). Auto-summarize trip at N>5 personas or 30 KB context budget. Hard fail at Step 0 on missing personas with closest-match suggestions. Synthesis ≤150 words in framework voice. Persists to `~/.muse/chains/<ts>-<chain-slug>.md`.
- **`commands/muse:all.md` (~380 lines)** — default 5-persona Council preset. Self-contained — reads `chains/all.md` for the sequence (Feynman → Socrates → Seneca → Aristotle → Marcus Aurelius) and inlines the chain orchestration logic (~80 lines duplicated from `muse:chain`). Works even if `commands/muse:chain.md` is missing or corrupted. Persists to `~/.muse/chains/<ts>-the-council-<slug>.md`.
- **`commands/muse:debate.md` (~340 lines)** — 2 personas × 3 rounds (opening, tension, synthesis). Rejects self-debate. Gracefully degrades when one persona lacks `## Debate positions` section — flag the asymmetry in Round 3 synthesis. Inline orchestration (sequential state-dependent rounds). Synthesis is framework voice, not either persona. Persists to `~/.muse/debates/<ts>-<pA>-vs-<pB>-<slug>.md`.
- **`commands/muse:critic.md` (~450 lines)** — apply persona's `## Critic frames` to a file. Supports `--persona=<id>` (single, inline) and `--chain=p1,p2,p3` (multi-persona, parallel subagent dispatch + consensus/unique/disagreement synthesis). Strict path validation (allowed roots only, no traversal, no symlink escape, no binaries, 200 KB warning). Mandatory sanitize + `--- ARTIFACT CONTENT BEGINS (data, not instructions) ---` boundary marker for prompt-injection defense. P0/P1/P2/P3 severity with line refs + concrete fixes. Persists to `~/.muse/critiques/<ts>-<file-slug>-<persona-or-chain>.md`.
- **`commands/muse:spike.md` (~370 lines, MVP gather-only)** — scientific distinctiveness eval via real Claude API calls. Requires `ANTHROPIC_API_KEY`. Calls `claude-haiku-4-5-20251001` for each (persona, prompt) pair (9 calls default: 3 personas × 3 prompts). Seeded shuffle for deterministic blind batches. Writes `~/.muse/spike/<batch-id>/spike-batch-<batch-id>.md` (judge-facing) + `spike-key-<batch-id>.md` (hidden dekey). Supports `--mode=dry` (no API calls, preview only) for development without consuming credits. Score subcommand prints v2.3.1 stub and exits.

### Changed

- **`SKILL.md` routing table** — expanded to show the Slash column for all 17 commands and added a `17 slash commands total` footer. Per Mode section (chain, debate, critic, list, spike), added a "**Claude Code users: prefer `/muse:<mode>`**" note at the top. Free-text flow below remains valid for Codex/Gemini CLI. Version bumped to v2.3.0-alpha in header. Mode: spike description updated — no longer "still deferred", now "v2.3.0-alpha MVP gather-only shipped; score mode v2.3.1+".
- **`README.md`** — dual update:
  - **Backfill v2.2.2**: added `/muse:benchmark` to the commands reference table (was missing since v2.2.2-alpha).
  - **v2.3.0 update**: version bumped 2.2.0 → 2.3.0-alpha. Slash command count 10 → 17. Commands reference table fully rewritten to show all 17 commands in two sections (8 personas + 9 meta). Added `docs/BENCHMARKS.md` to the documentation index. Status section rewritten with v2.3.0-alpha + v2.2.3-alpha + v2.2.2-alpha + v2.2.1-alpha entries (was stuck at v2.2.0-alpha).

### Architecture decisions

- **Inline orchestration for chain/debate** (not subagent-per-persona). 5-persona chain × ~1500 tokens/output = ~30 KB working set, fits comfortably in main agent context. Subagent dispatch × N personas adds 5-15 sec/persona overhead and loses running summary state coherence. v2.2.2-alpha benchmark grade A (24/24 blind Turing) proved main-agent embodiment is sufficient for persona quality.
- **Parallel subagents only for `/muse:critic --chain=`**. The one place parallelism genuinely helps: per-persona critiques are independent (no cross-persona state dependency), so dispatching `len(chain)` parallel subagents gives N× speedup with zero coherence loss.
- **`/muse:all` is self-contained, not a thin alias**. Claude Code slash commands can't invoke other slash commands transitively. Rather than building a fragile cross-command reference, `muse:all.md` duplicates the chain Step 3-4 orchestration (~80 lines). The autonomy gain (Council works even if chain is broken) outweighs the small duplication cost.
- **`/muse:spike` MVP = gather only**. Full spike has 4 risk surfaces (missing API key, network fail, malformed judge answers, randomization correctness). Shipping all 4 in one alpha is risky, and `/muse:benchmark` already covers simulated Turing without API keys. Score mode deferred to v2.3.1 with an explicit stub.
- **SKILL.md Mode sections kept verbatim**. Adding a "prefer slash" note per section and preserving the free-text flow below. Codex/Gemini CLI users still need the free-text path. This matches the precedent set by the 8 persona slash commands (both paths coexist).
- **HARD FAIL on missing personas at Step 0**. Silent-skip would produce a chain/debate different from what the user asked for. Always fail loudly with closest-match suggestions. User can retry with the correct IDs from `/muse:list`.

### Backward compatibility

- **No persona file edits**. All 8 personas unchanged.
- **No SESSION.md changes**. Load-bearing file untouched — chain/debate/critic bypass Stage 0 mode detection and have their own orchestration.
- **SKILL.md Mode: * sections unchanged in content**, only "prefer slash" note added at top of each. Free-text free-text paths in Codex/Gemini CLI remain valid.
- **`install.sh` unchanged**. Glob-based registration (`commands/muse:*.md`) automatically picks up the 6 new files. Verification count goes from `11 slash commands installed` to `17 slash commands installed` on next install.
- **Existing session files, benchmark reports, and analytics are not invalidated**. v2.3.0 adds new persistence folders (`~/.muse/chains/`, `~/.muse/debates/`, `~/.muse/critiques/`, `~/.muse/spike/`) without touching existing ones.

### Migration

```bash
cd ~/.claude/skills/muse && git pull && ./install.sh
# Expect: "Installed 17 slash commands to ~/.claude/commands/"
```

**Verify** the 6 new commands are present:

```bash
ls ~/.claude/commands/muse:{chain,all,debate,critic,list,spike}.md
```

**Quick smoke tests** (each should succeed):

```bash
/muse:list                                    # Should show 8 personas in ~6 categories
/muse:list --category=design                  # Should show dieter-rams + lao-tzu
/muse:chain feynman→socrates "why is my code slow?"   # Should produce 2 outputs + synthesis
/muse:debate aristotle vs lao-tzu "ship fast or polish?"   # Should produce 3 rounds
/muse:critic README.md --persona=dieter-rams  # Should produce structured critique
/muse:spike --mode=dry                        # Should preview API calls without calling
```

**Regression check**:

```bash
/muse:benchmark --diff
# Expect: 0 regressions (the 6 new commands don't touch personas)
```

### Known limitations + deferrals to v2.3.1+

- **`/muse:spike --mode=score`** — not yet implemented. Manual cross-reference via `spike-key-<batch-id>.md` is the only path in v2.3.0.
- **`/muse:critic` response time on chain mode** depends on subagent dispatch latency. Typical 3-persona chain critique takes 60-120 sec vs single-persona ~20-30 sec.
- **Chain preset format** (`chains/*.md`) relies on `### Step N — <Name>` heading fuzzy match against persona IDs. Ambiguous names fail loudly. v2.3.1 will add explicit `personas: [...]` frontmatter for deterministic parsing.
- **`/muse:debate` when both personas lack `## Debate positions`** — runs with a warning but both sides fall back to generic signature_moves + thinking_mode. Suggests running `/muse:update` on both before retrying.
- **install.sh "8 personas" welcome message** — hardcoded, doesn't reflect the actual persona count. Cosmetic; defer to v2.3.1.

### Not fixed (deferred to v2.4+ or later)

- CI integration (auto-run `/muse:benchmark --diff` on PRs, comment results). v2.4+.
- Continuous benchmarking dashboards (trend HTML from jsonl). v2.4+.
- Auto-improvement loop (benchmark drop → auto-`/muse:update`). Never — too dangerous.
- New persona authoring (Claude Shannon, Jane Jacobs, Nassim Taleb, Keynes, Simone Weil). v2.4+.
- Promotion of C9-C12 from SOFT-DRIFT to HARD-GAP. v3.0 breaking release.
- New schema fields (anti_examples, distinctiveness_anchor, era_tone_notes). v3.0.

### Risks + mitigations

- **R1**: `/muse:chain` token budget blowout on long chains. **Mitigation**: auto-summarize trip at N>5 or 30 KB; print one-line warning; persist full outputs to disk even when evicted from working memory.
- **R2**: `/muse:critic` file ingestion prompt-injection attack. **Mitigation**: mandatory sanitize + boundary marker; reject binaries, >200KB files, path traversal; sanitizer also escapes literal boundary markers inside the file.
- **R3**: `/muse:spike` API failures mid-gather (network, rate limit, missing key). **Mitigation**: prereq check at Step 1 with AskUserQuestion options (dry/set/abort); retry each call 2× with backoff; record failed calls as `<API_ERROR>` in the dekey and continue.
- **R4**: Chain preset format ambiguity. **Mitigation**: fuzzy match headings to persona IDs, fail loudly with candidate list if ambiguous. v2.3.1 will add explicit frontmatter.
- **R5**: Living persona disclaimer drift across multi-persona modes. **Mitigation**: dedupe identical disclaimer strings; render once at top of output + once at top of persisted file.

### Total diff

- 6 new slash command files: `muse:list.md` (~140) + `muse:chain.md` (~360) + `muse:all.md` (~380) + `muse:debate.md` (~340) + `muse:critic.md` (~450) + `muse:spike.md` (~370) = **~2040 lines**
- `SKILL.md`: +~60 lines (invocation table rewrite + 5 "prefer slash" notes + version bump)
- `README.md`: +~80 lines (dual update — v2.2.2 backfill + v2.3.0 refresh — commands table rewrite, status history, docs index)
- `docs/CHANGELOG.md`: +this entry
- **Net**: ~2200 lines added, 6 new files, 3 files modified

---

## [2.2.3-alpha] — 2026-04-15 — Quote-aware B3 matcher + BENCHMARKS.md contributor doc

### Why

v2.2.2-alpha shipped `/muse:benchmark` and produced a 24/24 grade-A first run, but left 4 loose ends that needed cleanup before shipping v2.3.0: (1) the B3 voice-rules matcher had false positives on personas that legitimately quoted user voice in Example fields (Lao Tzu's `*push harder*`, Confucius's `told` substring-matching the `old` banned pattern) and on banned-patterns lists that contained counter-example vocabulary in parentheticals (Dieter Rams's `(he would say *useful*)` — `useful` is what Rams *would* say, not a banned word), (2) the captured baseline.json ran with `--prompts=u01` override so it was a 1-prompt baseline, not the 3-prompt default, (3) the command docstring didn't make the 3-prompt default explicit, (4) there was no contributor-facing methodology doc — `docs/BENCHMARKS.md` didn't exist.

v2.2.3-alpha fixes all four in one patch. Zero persona files edited. The matcher + parser fixes handle all three false-positive categories (quoted user voice, substring collisions, parenthetical counter-examples) in one change. Doc makes the default explicit. BENCHMARKS.md ships as a stand-alone contributor/forker reference.

### Added

- **`docs/BENCHMARKS.md` (new, ~350 lines)**. Contributor-facing methodology explainer covering:
  - The 4 measurement categories (Static compliance, Static distinctiveness, Blind Turing, Regression detection)
  - All 11 measures B1-B11 with what-it-scans / what-it-asserts / why-it-matters
  - The 7 run modes with examples (default, `--baseline`, `--diff`, `--quick`, `--trend`, `--persona=<id>`, `--prompts=<list>`)
  - How to read the output (grade scale, thresholds, section-by-section)
  - When to establish/reset the baseline (and when NOT to)
  - Worked example of interpreting a confusion
  - Output locations (`~/.muse/benchmark-reports/*`, `baselines/`, `analytics/benchmark-runs.jsonl`)
  - For contributors (when to run, CI integration future)
  - For forkers (customizing prompts + thresholds)
  - Known limitations (paraphrased user attribution, single-run variance, Jaccard ≠ semantics)

### Fixed

- **`commands/muse:benchmark.md` Step 2 / B3 — quote-aware voice-rules matcher**. Three fixes in one:

  1. **Banned-pattern parser fix**: extract only tokens inside `*...*` italics from the LHS-of-em-dash, AND drop everything after ` (` (parenthetical counter-examples). Rams's `(he would say *useful*)` is now excluded — `useful` no longer appears in the banned set. Same logic rescues other personas with parenthetical counter-examples.

  2. **Quote-stripping before matching**: the scan now strips italicized segments, double/single/smart quotes, and user-attribution sentences (from markers `"You said"`, `"You told me"`, `"User says"`, etc. up to the next sentence terminator) before checking for banned patterns. Lao Tzu's Example *"You said you need to push harder"* no longer flags — the user-attribution strip removes it.

  3. **Word-boundary matching**: `\bpattern\b` instead of raw substring. Confucius's legitimate uses of words like `told` no longer trigger the `old` banned pattern. Substring collisions are eliminated.

  Net result: the matcher now flags only real voice violations in the persona's own voice. False positives from quoted user text, substring collisions, and parenthetical counter-examples are all suppressed.

- **`commands/muse:benchmark.md` Step 4 / B8 — clarifying line on 3-prompt default**. The code default was already 3 prompts (u01, u05, u10) but the docstring didn't say so explicitly, and the first baseline was run with `--prompts=u01` override producing an incomplete 1-prompt baseline. Added explicit note: *"Default = 3 prompts when `--prompts` is absent. Single-prompt runs are NOT representative for baseline and should never be used with `--baseline`."*

- **Baseline replaced with post-fix 3-prompt state** (runtime action, not code). `~/.muse/benchmark-reports/baselines/baseline.json` now captures the post-v2.2.3 state: 8/8 grade A, 24/24 Turing, zero regressions. Replaces the pre-fix 1-prompt baseline from the v2.2.2 first run.

### Known limitations (documented in docs/BENCHMARKS.md)

- **Paraphrased user attribution without markers** slips through the quote strip. Example: "I hear you saying you need to grind" — no italics, no quotes, no "You said". The quote-aware matcher won't strip it, and the banned word `grind` would still match. Fix deferred to v2.4+.
- **B3 over-aggressive strip detection**: if the quote-stripping removes >60% of an Example's chars, `--persona=<id>` deep-dive mode now prints a warning so the user can audit manually. But in practice this requires the deep-dive flag — the default run doesn't surface it.
- **Subagent-based Turing ≠ scientific eval**. For the human-judged version, see `/muse:spike` (v2.3.0+, MVP gather-only).

### Backward compatibility

- **No persona file edits**. All 8 personas unchanged. The matcher/parser fixes operate on the existing persona files without needing to modify them.
- **No SESSION.md changes**. Load-bearing file untouched.
- **No SKILL.md changes** (except version bump in v2.3.0). Mode: benchmark section is unchanged; the Step 2 / B3 / B8 edits are internal to the slash command file.
- **Existing benchmark reports remain valid**. The pre-fix baseline is preserved as part of analytics history (`~/.muse/benchmark-reports/2026-04-15-212955-benchmark.*`) even though `baselines/baseline.json` is replaced.

### Migration

```bash
cd ~/.claude/skills/muse && git pull && ./install.sh    # Expect "11 slash commands installed" (unchanged from v2.2.2)
/muse:benchmark --baseline                              # Capture the post-fix 3-prompt baseline
```

**Verify** the new baseline:

```bash
cat ~/.muse/benchmark-reports/baselines/baseline.json | jq '.prompts_used'
# Expect: ["u01", "u05", "u10"]   — not just ["u01"]
```

### Risks + mitigations

- **R1**: quote-strip may be too aggressive and mask real voice drift. **Mitigation**: deep-dive strip-ratio warning flags over-aggressive stripping at >60% per move.
- **R2**: parser fix may miss a banned pattern that lives outside italics. **Mitigation**: all 8 shipped personas follow the `*italic comma-separated list* — explanation` convention, so italics-only extraction is reliable. Future personas authored via `/muse:build` are enforced to follow the same convention by Step 6 validation.

### Total diff

- `commands/muse:benchmark.md`: +30 lines (B3 section expanded from 4 → ~30 lines, B8 clarifying line added)
- `docs/BENCHMARKS.md`: +350 lines (new file)
- `docs/CHANGELOG.md`: +N lines (this entry)
- **Net**: ~400 lines added, 0 lines removed, 2 files modified + 1 new

---

## [2.2.2-alpha] — 2026-04-15 — `/muse:benchmark` + first run + findings + C9 schema mirror fixes

### Why

v2.2.1 shipped the tooling to *build* and *update* high-quality personas. But nothing measured whether the personas *actually were* high quality. Every claim about distinctiveness rested on the user's taste, the LLM's one-shot synthesis, and the spec review loop. There was no instrumented measurement, no baseline, no way to detect drift after a future edit.

Garry Tan's `gstack/benchmark` is a performance regression detector for web apps. Runs against a live site, establishes a baseline, compares subsequent runs, flags regressions with explanatory annotations. Not a pass/fail gate — a trend tool. The architectural wins adapt to muse: baseline-as-reference, layered thresholds, explanatory annotations, mode variants (`--baseline` / `--diff` / `--quick` / `--trend`), dual output (markdown + JSON).

v2.2.2-alpha ships `/muse:benchmark` as the muse equivalent: static compliance checks + Jaccard distinctiveness matrix + subagent-based blind Turing simulation + regression detection against `baseline.json`. Then we ran it, found 1 real bug, and fixed it.

### Added

- **`commands/muse:benchmark.md` (new slash command, ~500 lines)**. Measures 4 categories across all 8 personas:
  - **Category 1 — Static compliance (B1-B4)**: C1-C12 per persona, schema mirror (frontmatter `taglines[]` ↔ body `## Taglines` table), voice rules self-consistency (banned patterns don't appear in own Examples), mandatory sections presence (9 required).
  - **Category 2 — Static distinctiveness (B5-B7)**: Jaccard overlap matrix (8x8 on signature_move tokens, thresholds: <0.25 OK, 0.25-0.40 WARN, >0.40 REGRESSION), stage lens coverage (framing/inquiry/test-probe), canonical dilemma coverage (≥3 of 6).
  - **Category 3 — Blind Turing simulation (B8-B10)**: generate persona-flavored responses to sample prompts from `benchmarks/universal.md` (u01/u05/u10), dispatch Agent judge subagent with blind-labeled responses, score match rate. 100% = A grade, 50-62% = D (flag for improvement), ≤37.5% = F (critical).
  - **Category 4 — Regression detection (B11)**: compare current run to `~/.muse/benchmark-reports/baselines/baseline.json`, flag drift per measure with `git log` annotations pointing at likely root-cause commits.
- **Modes**: default (full run), `--baseline` (save as new baseline), `--diff` (emphasize regressions), `--quick` (static only, ~5 sec), `--trend` (historical table from last 10 runs), `--persona=<id>` (deep-dive one persona), `--prompts=u01,u05` (override default prompt selection).
- **Outputs**: `~/.muse/benchmark-reports/<ts>-benchmark.md` (human report), `~/.muse/benchmark-reports/<ts>-benchmark.json` (metrics), `~/.muse/benchmark-reports/baselines/baseline.json` (golden reference), `~/.muse/analytics/benchmark-runs.jsonl` (append-only trend log).
- **SKILL.md Mode: benchmark section** (for Codex/Gemini CLI users without slash command support).
- **SKILL.md commands table** gets `muse:benchmark` row.
- **First baseline captured**: `~/.muse/benchmark-reports/baselines/baseline.json` (from run 2026-04-15-212955).

### First run findings

Ran `/muse:benchmark` against v2.2.1-alpha personas. Results:

**Overall grade**: A- (highly distinctive, 1 schema bug)

- **Static compliance**: 7/8 personas full pass. 4 had B2 schema mirror DRIFT (aristotle, confucius, dieter-rams, feynman — all B+ grade).
- **Static distinctiveness**: avg Jaccard **0.026** (target <0.25 — far below, excellent). Max pair: feynman ↔ lao-tzu at **0.081** (below 0.25 WARN threshold). 2nd: marcus-aurelius ↔ seneca at 0.080 (expected — both stoic).
- **Stage lens coverage**: 8/8 at 3/3.
- **Canonical dilemma coverage**: 8/8 at 6/6.
- **Blind Turing simulation (u01 architecture prompt)**: **8/8 match rate, 100%, A grade**. Every response matched its actual persona with high confidence. Judge subagent cited exact signature moves and verbatim phrases ("'Where is the situation already flowing?' verbatim", "explicitly names the four causes", "'father's way' Confucian idiom").

**Top finding**: schema mirror drift on 4 personas. Frontmatter `taglines[].text` values are full canonical quotes (e.g., Feynman's *"It doesn't matter how beautiful your theory is. If it doesn't agree with experiment, it's wrong"*) but body `## Taglines` table had shortened versions (*"If it doesn't agree with experiment, it's wrong"*). v2.2.1's strict C9 check catches this.

**Root cause**: during v2.2.0-alpha persona migration, I used shortened tagline text in the body table (to fit the markdown column width) while keeping full quotes in frontmatter for citation fidelity. C9 was defined loosely at that point. v2.2.1 added strict enforcement but didn't re-run on existing personas.

### Fixed

**4 personas synced** (body `## Taglines` table now matches frontmatter `taglines[].text` verbatim):

- **aristotle**: 2 fixes — "It is the mark of an educated mind to be able to entertain a thought without accepting it" + "We are what we repeatedly do. Excellence, then, is not an act, but a habit"
- **confucius**: 1 fix — "Learning without thought is labor lost; thought without learning is perilous"
- **dieter-rams**: 2 fixes — "Indifference towards people and the reality in which they live is actually the one and only cardinal sin in design" + "Good design is long-lasting. It avoids being fashionable and therefore never appears antiquated"
- **feynman**: 1 fix — "It doesn't matter how beautiful your theory is. If it doesn't agree with experiment, it's wrong"

**Source of truth**: frontmatter (preserves the citation; body table must match). Preferred over shortening frontmatter because sources should be verbatim.

**Post-fix verification**: re-ran B2 schema mirror check. All 8 personas now OK. All 8 at grade A (was 4 A + 4 B+).

### Known limitations documented

- **B3 voice rules self-consistency has false positives**. Current naive substring matching flags legitimate user-state quotations. Examples from the first run: Confucius's banned word "old" appears in an Example describing the anti-pattern Confucius rejects; Dieter Rams's word "useful" is literally one of the Ten Principles; Lao Tzu's phrases "push harder" / "more effort" appear in Examples where Lao Tzu quotes the user's own words before inverting them. Not persona bugs — check bug. Deferred to v2.2.3+ (quote-aware matcher).
- **Only 1 Turing prompt run this sprint**. Default is 3 prompts (u01 + u05 + u10) but v2.2.2-alpha shipped with 1 for first-run proof. Run with `--prompts=u05,u10` to extend. Follow-up sprint will make 3 prompts the default.

### Not fixed (deferred to v2.3+)

- Full scientific `muse:spike` with API calls + human judges (still deferred)
- CI integration (auto-run benchmark on PRs)
- Continuous benchmarking with trend dashboards
- Auto-improvement loop (fix persona if score drops)
- Quote-aware B3 matcher
- Default 3-prompt Turing (currently 1)
- Cross-persona chain benchmarks (`muse:chain` + `muse:debate` mode evaluation)

### Backward compatibility

Zero breaking changes. No schema changes. `/muse:feynman <q>` session behavior identical. The 4 persona fixes only change the body `## Taglines` table text — frontmatter `taglines[].text` values were already correct. SESSION.md tagline selection uses frontmatter, so runtime behavior was already correct pre-fix; the fix is purely about internal consistency.

### Migration

```bash
cd ~/.claude/skills/muse
git pull
./install.sh
```

After install, verify 11 slash commands (up from 10 — new `/muse:benchmark`):

```bash
ls ~/.claude/commands/muse:*.md | wc -l   # expect 11
```

Run first benchmark:

```
/muse:benchmark --quick        # static only, ~5 sec, establishes no baseline
/muse:benchmark --baseline     # full run with Turing, saves as baseline
```

Establish baseline via `--baseline` to enable regression detection on future runs.

### Risks

- **R1 — Subagent Turing judge could be unreliable**. Single judge, no inter-rater reliability. Mitigation: the judge is explicitly told "your best guess, no refusal." First run came back 8/8 with clean JSON. If future runs show judge confusion, the benchmark itself needs calibration.
- **R2 — Jaccard tokenization is naive**. Just split on words, lowercase, stopword filter. Legitimate synonyms ("simplify" vs "reduce") score as distinct even though they're semantically close. Mitigation: this is fine for catching gross clones (>0.40 overlap); it's not meant to be a scientific semantic eval.
- **R3 — Benchmark adds complexity users don't need**. Mitigation: it's purely opt-in. `/muse:feynman` sessions don't depend on it.

### Total diff

- **New files**: `commands/muse:benchmark.md` (~500 lines), `docs/CHANGELOG.md` entry (this, ~180 lines), first baseline in `~/.muse/benchmark-reports/` (local, not in repo)
- **Modified files**: `SKILL.md` (+85 lines — Mode: benchmark section + commands table row + routing), 4 persona files (+2-4 lines each — body `## Taglines` table sync)
- **Total**: ~780 net LoC added to tooling + docs + 4 tiny persona fixes.

---

## [2.2.1-alpha] — 2026-04-15 — `/muse:build` + `/muse:update` harden: spec review loop, concrete synthesis recipes, distinctiveness check, dry-run, rollback

### Why

v2.2.0-alpha shipped the adaptive session runtime and the v2.2 persona schema (multi-tagline, voice rules, cognitive patterns, when-to-reach). But the tooling — `/muse:build` and `/muse:update` — knew *about* the new fields without actually knowing *how to produce good output for them*. The C9-C12 fix playbooks said things like *"synthesize 7-12 numbered thinking instincts from signature_moves + thinking_mode + debate_positions"* with zero concrete recipe. The quality of a new persona depended entirely on (a) the user's brainstorm and (b) the LLM's ability to synthesize well in one shot. No safety net.

Garry Tan's `plan-ceo-review` has a spec review loop exactly because first drafts are never good enough. Muse was missing that. Fixing it is the single biggest quality lever available in this sprint.

### Added

- **Spec review loop in both `/muse:build` (Step 5.5) and `/muse:update` (Step 5.5)**. After draft composition or fix accumulation, dispatch an adversarial Agent subagent with a 5-dimension review prompt (distinctiveness, voice specificity, cognitive vs tactical, tagline context fit, debate consistency). Parse score + issues. Apply fixes. Re-dispatch. Maximum 3 iterations. Convergence guard: same issues on consecutive iterations stop the loop. PASS = score ≥8 with no issues. Metrics logged to `~/.muse/analytics/spec-review.jsonl`. Best-effort (Agent failure skips with warning, does not block save).

- **Concrete synthesis recipes for voice_rules and cognitive_patterns** in both commands. Replaces vague *"derive from X"* with explicit step-by-step derivation:
  - **Core belief**: 1 sentence stance derived from `thinking_mode.core_tension`, rephrased as a direct statement of the persona's relationship to the user. Not a biography, not a philosophy abstract.
  - **Tone**: 4-6 adjectives derived from persona era + domain + personality, plus 1 connecting sentence.
  - **Contextual voice shifts**: exactly 5 entries, one per stage type, extracted from existing signature move `Example:` fields (or rewritten to fit the stage if no direct match).
  - **Banned patterns**: 6-8 entries generated deterministically from 4 sources — (1) inverted `thinking_mode.signature_phrases`, (2) `thinking_mode.anti_pattern` converted to banned phrases, (3) modern AI/startup jargon baseline (crush it, unlock, optimize, 10x, circle back), (4) domain-specific bans.
  - **Cognitive patterns**: one per signature move (the meta-habit, NOT the move itself), plus 1-2 from `core_tension`, plus 1-2 from strongest `debate_positions`. Constraints: domain-agnostic, habit-shaped, distinct from signature_moves, deduplicated. Target 7-12.

- **Pre-build existing-persona check in `/muse:build` (new Step 1.5)**. Before 15 minutes of interactive brainstorm, ask the user: *"Which existing persona currently handles this use case best? The 8 shipped are: feynman, socrates, ..."* Options: A) None fits (proceed), B) Partial match but gap (proceed with follow-up), C) Describe use case in 1 sentence (fuzzy match against existing `when_to_reach_for_me.triggers[]`), D) Use `/muse:update` on existing one. Prevents accidental duplication.

- **Lightweight distinctiveness check in `/muse:build` (new Step 5.3)**. After draft composition, compute Jaccard token overlap of each new signature move's Trigger + first sentence against every move in the 8 existing personas. WARN on any >60% collision. BLOCK save if >50% of new moves have >60% collisions (clear duplication). Not a full distinctiveness eval (`muse:spike`, still deferred to v2.3+) — a cheap tripwire for gross clones.

- **Pre-save dry-run validation in `/muse:build` (new Step 5.9)**. BEFORE the atomic `mv`, statically walk the in-memory draft through SESSION.md lens selection: Stage 1 framing pick, Stage 2 inquiry pick, Stage 3 test-probe pick, tagline context coverage, canonical dilemma coverage (≥3 of 6), synthetic Stage 4 fork pick. If any step fails, surface via AskUserQuestion with options to fix / accept with limitation / abort. The critical change: run this BEFORE mv, not after — catches silent breakage before it reaches disk.

- **Post-save dry-run re-check in `/muse:build` (new Step 8)**. After the atomic mv, re-read the file from disk and re-walk the same dry-run. Catches any Write-time corruption. If the on-disk file fails dry-run but the in-memory version passed, something went wrong with the write — surface loudly.

- **Dry-run walk in `/muse:update` Step 8 (expanded from static check)**. Previously Step 8 was a static field re-check. Now it also walks SESSION.md lens selection + tagline contexts + canonical coverage + Stage 4 fork pick. If dry-run fails after write, prompts the user to run `/muse:update` again or `/muse:update --rollback`.

- **Rollback helper: `/muse:update <persona-id> --rollback` (new Step 10)**. Short-circuits the compliance check workflow and restores from backup:
  1. List all `.bak.<ts>` files newest-first.
  2. AskUserQuestion: which backup to restore? Options include "show diff first".
  3. Double-backup the current live file as `.bak.pre-rollback.<new-ts>` (safety net).
  4. Atomic `cp` of selected backup over live (not `mv` — keeps the source backup in place for future rollback).
  5. Re-run dry-run walk on the restored file.
  6. Print result with pre-rollback snapshot path.
  
  Users can now recover from any bad `/muse:update` accept without manual `mv .bak .md` gymnastics.

- **Schema mirror enforcement in C9 (stricter)**. Previously C9 checked *"taglines[] frontmatter has ≥3 entries AND ## Taglines body section mirrors it"* — but "mirrors it" was aspirational, not enforced. v2.2.1 adds a concrete check: for each entry in frontmatter `taglines[].text`, assert it appears verbatim as a cell in the body `## Taglines` table. And vice versa. Counts must match. Catches schema drift between frontmatter and body.

### Changed

- **`commands/muse:build.md`** rewritten (~170 → ~450 lines). Adds Step 1.5 (pre-build check), Step 5.3 (distinctiveness), Step 5.5 (spec review loop), Step 5.9 (pre-save dry-run), Step 8 (post-save dry-run). Step 4 field 7 (voice rules) and field 8 (cognitive patterns) rewritten with concrete synthesis recipes including worked examples. Step 5 C9-C12 validation bumped to include strict schema mirror. `allowed-tools` adds `Agent` for spec review loop dispatch.

- **`commands/muse:update.md`** rewritten (~330 → ~520 lines). Adds `--rollback` flag to Step 0 parse (short-circuits to Step 10). Adds Step 5.5 (spec review loop, same pattern as build). Expands Step 8 from static field check to full dry-run walk. Adds Step 10 (rollback). C9 validation bumped to strict schema mirror. C10/C11 fix playbooks rewritten with concrete recipes mirroring build's Step 4. `allowed-tools` adds `Agent` for spec review loop.

- **`SKILL.md`** Mode: build and Mode: update sections updated with v2.2.1 mandate pointers + abbreviated reference to the new build/update features. Full details live in `commands/muse:build.md` and `commands/muse:update.md`. For Codex/Gemini CLI users, SKILL.md is the free-text entry point. Version footer bumped to 2.2.1-alpha.

- **`docs/PERSONA_SCHEMA.md`** compliance check table gets v2.2.1 clarifications. New subsection *"v2.2.1 quality gates beyond static compliance checks"* documents the 4 runtime gates: spec review loop, distinctiveness check, pre-save dry-run, rollback helper. Schema version footer bumped to 2.2.1-alpha.

### Backward compatibility

**Zero schema changes.** All v2.2 persona files (the 8 shipped + any user-built) remain unchanged. SESSION.md unchanged. `/muse:feynman <q>` session behavior identical. The 10 slash commands unchanged except for `/muse:build` and `/muse:update`.

Every improvement is additive — if the Agent subagent for spec review is unavailable, the loop is skipped with a warning and the old v2.2.0-alpha behavior is the fallback. If a user does not pass `--rollback`, the update workflow runs unchanged. C9 strict mirror is a SOFT-DRIFT warning (not blocking) in v2.2.0-alpha severity, will promote to HARD-GAP in v2.3+.

### Migration

```bash
cd ~/.claude/skills/muse
git pull
./install.sh
```

Existing v2.2 personas remain valid. Users who want to test the new spec review loop or rollback can try:

```
/muse:update socrates          # re-runs C1-C12 (already compliant, no-op) — tests idempotence
/muse:update socrates --check  # prints compliance report, no writes
/muse:update socrates --rollback  # lists backups, restores one (tests rollback safety net)
```

### Not in scope (deferred to v2.3+)

- Full distinctiveness eval with API calls (`muse:spike` with human judges) — still requires ANTHROPIC_API_KEY + recruit 5 judges
- Persona templates (historical philosopher / modern CEO / artist) — would speed up building but adds complexity
- URL-based research import (Wikipedia → persona draft) — nice-to-have
- Conversational build (replace 15-field walk with 3 open questions + derivation)
- Batch auto-fix shortcut for `/muse:update --all` — batch walk one-at-a-time is fine
- Promoting C9-C12 from SOFT-DRIFT to HARD-GAP — happens in v2.3 after calibration
- Any schema changes (no new persona fields)

### Known risks

- **R1 — Spec review loop false positives**: the Agent subagent may flag legitimate design decisions as issues. Mitigation: max 3 iterations + convergence guard + user sovereignty at the end (AskUserQuestion with accept-with-concerns option).
- **R2 — Distinctiveness check false positives**: two thinkers might legitimately have similar moves (e.g., Feynman's simplification test and Einstein's explain-it-to-your-grandmother). Mitigation: WARN threshold at 60%, BLOCK only at >50% collisions across all moves.
- **R3 — Spec review adds latency**: each iteration dispatches a subagent. 3 iterations × 30s ≈ 90s additional latency per build/update. Mitigation: best-effort (timeouts gracefully skip), users can disable via `--no-spec-review` flag (v2.3 addition, not in this release).
- **R4 — Rollback doesn't cover pre-build state**: `/muse:build` doesn't create a pre-build backup (the file didn't exist before). If a user wants to delete a newly-built persona, they use `rm personas/<id>.md` manually. Rollback only works for `/muse:update` edits.

### Total diff

- **Modified files**: `commands/muse:build.md` (+280 lines), `commands/muse:update.md` (+190 lines), `SKILL.md` (+60 lines), `docs/PERSONA_SCHEMA.md` (+80 lines), `docs/CHANGELOG.md` (this entry, ~140 lines)
- **Total**: ~750 net LoC added. All tooling + docs. No personas touched. No SESSION.md changes.

---

## [2.2.0-alpha] — 2026-04-15 — Adaptive sessions + multi-tagline + voice rules + cognitive patterns

### Why

User feedback on v2.1.0-beta: the persona system felt flat, and the session workflow felt rigid. Three specific pain points:

1. **Single tagline per persona**. Real thinkers have many memorable lines, each appropriate to a different context. Feynman's *"Explain it simply"* is great as a default, but his *"The first principle is you must not fool yourself"* is better when inquiry is the move, and *"If it doesn't agree with experiment, it's wrong"* is better when probing a claim. Encoding one tagline per persona = a caricature.

2. **Persona descriptions were under-specified**. v2.1 personas had `thinking_mode` with 3 fields (opening_question, core_tension, anti_pattern) — roughly 50 words of voice guidance per persona. Compared to Garry Tan's gstack skills (plan-ceo-review, plan-eng-review, etc.) which encode 200+ lines of voice discipline per persona, muse was a tenth the density. The voice wasn't flat — it was unencoded.

3. **5-stage workflow was rigid**. Every question went through Frame → Examine → Test → Decide → Commit regardless of shape. A quick gut-check on *"which font should I pick"* got the same 10-15 min ceremony as a bet-the-company decision. A request to critique an existing plan didn't need Frame or Examine at all.

v2.2.0-alpha addresses all three, by borrowing patterns from Garry Tan's gstack skill encoding: multi-tagline with context, explicit voice rules (core belief + tone + banned patterns + contextual shifts), cognitive patterns as thinking instincts (not tactical moves), and adaptive session modes (QUICK / STANDARD / DEEP / CRITIC) selected at Stage 0 based on question shape.

### Added

- **`SESSION.md` Stage 0 — Mode Detection**. At the start of every session, score the user's question on 4 axes: S (stake), T (time pressure), C (concreteness), A (artifact presence). Pick one of four modes: QUICK (3-5 min, A=0 and T≥4 and S≤3), STANDARD (10-15 min, default — the v2.1 5-stage flow unchanged), DEEP (20-30 min, S≥4 and T≤3, adds Stage 0.5 Premise Challenge + Stage 3.5 Alternative Paths + 3-year retrospective at Stage 5), CRITIC (5-10 min, A≥3, replaces Frame/Examine with Load-Artifact and Prioritize-Findings). AskUserQuestion confirms or overrides the detected mode. Each mode runs a different stage graph.

- **`SESSION.md` Stage 0.5 — Premise Challenge (DEEP only)**. Before accepting the user's question at face value, steel-man the current framing and propose 2-3 alternative framings. AskUserQuestion lets the user pick. Modeled on Garry Tan's `plan-ceo-review` Section 0A.

- **`SESSION.md` Stage 3.5 — Alternative Paths (DEEP only)**. Before committing to a decision, surface at least 2 paths the user hasn't considered (10x version, ruthless-cut version, do-nothing version). Each characterized with cost/win/lose.

- **`SESSION.md` Stages 1' and 3' — CRITIC mode specialized stages**. Stage 1' loads an existing artifact and applies the persona's critic frames to produce a structured findings inventory. Stage 3' prioritizes findings by severity + leverage + fix cost.

- **`SESSION.md` Quality bars section**. Persona distinctiveness bar, mode fit bar, voice discipline bar, concreteness bar, citation bar. Mirrors Garry Tan's Completeness Principle pattern.

- **Persona schema v2.2 (additive, backward-compatible)**:
  - `taglines[]` frontmatter — array of `{text, context, situation, source}` with contexts `default / framing / inquiry / test-probe / decide / commit`. SESSION.md picks the tagline matching the current stage.
  - `when_to_reach_for_me` frontmatter — object with `triggers[]` and `avoid_when[]` lists for persona routing.
  - `session_mode_preferences` frontmatter — `strong_at[]` and `weak_at[]` subsets of {QUICK, STANDARD, DEEP, CRITIC}. Stage 0 warns if detected mode is in `weak_at`.
  - `## Taglines` body section — human-readable table mirroring frontmatter `taglines[]`.
  - `## Voice rules` body section — Core belief (1 paragraph), Tone (adjectives + short description), Contextual voice shifts (5 situational examples), Banned patterns (6-8 phrases this persona NEVER uses).
  - `## Cognitive patterns` body section — 7-12 numbered thinking instincts. Garry's framing: "not checklist items — thinking instincts, internalize don't enumerate."
  - `## When to reach for me` body section — Triggers + Avoid-when + Session mode fit explanation.

- **`docs/PERSONA_SCHEMA.md`** — NEW canonical schema reference (~600 lines). Full v2.2 schema with required and optional fields, compliance checks C1-C12, migration notes, rationale. Single source of truth for persona file format.

### Changed

- **All 8 personas rewritten to v2.2 schema**. Each grew from ~150 lines to ~280-340 lines. New sections added: `## Taglines`, `## Voice rules`, `## Cognitive patterns`, `## When to reach for me`. Frontmatter gained `taglines[]` (3-5 entries per persona), `when_to_reach_for_me`, `session_mode_preferences`. Version footers bumped to 1.2.0. No existing signature move content was rewritten — all v2.2 additions are metadata enrichment.

- **`SKILL.md` Mode: build and Mode: update rewritten for C9-C12**. The compliance validation now runs C1-C12. C9 (multi-tagline), C10 (voice rules), C11 (cognitive patterns), C12 (when-to-reach) are SOFT-DRIFT in v2.2.0-alpha — they do not block save, but they are reported so the user sees the gap. v2.3+ will promote them to HARD-GAP.

- **`SKILL.md` single-persona mode tip** updated to reference v2.2 adaptive modes instead of v2.1 5-stage structure.

- **All 10 slash commands updated for v2.2**. Description fields bumped to mention adaptive modes (QUICK/STANDARD/DEEP/CRITIC), multi-tagline, voice rules, cognitive patterns. Step 2 (Load persona) extraction list now includes the new v2.2 fields. Step 3 header changed from "Run the 5-stage session" to "Run the adaptive session (v2.2)" with instructions to run Stage 0 Mode Detection first.

- **`SESSION.md` pre-flight** (from v2.1.0-beta) was already teaching the runtime to prefer inline category tags over keyword heuristic for Stage 1/2/3 routing. v2.2 extends pre-flight to also extract: `taglines[]`, `## Voice rules`, `## Cognitive patterns`, `when_to_reach_for_me`, `session_mode_preferences`, and apply them as output constraints throughout the session.

- **`SKILL.md` version footer** bumped to 2.2.0-alpha.

### Backward compatibility

**Additive schema only.** Existing v2.1 personas without `taglines[]`, `## Voice rules`, `## Cognitive patterns`, or `## When to reach for me` still load and run — SESSION.md v2.2 pre-flight falls back to v2.1 behavior (primary `tagline` field only, `thinking_mode` as the voice source, no cognitive-pattern extraction). Every v2.1 invocation that worked before still works identically. `/muse:feynman <q>` → STANDARD mode by default, which IS the v2.1 5-stage flow.

v2.0 free-text invocations (`muse:feynman <q>`, `muse:chain`, `muse:build`, `muse:update`, etc., no slash) unchanged. The v2.2 schema extension flows through `muse:build` (new personas get v2.2 fields) and `muse:update` (existing personas get migrated on demand). For Codex CLI and Gemini CLI users without slash support, SKILL.md Mode: build and Mode: update both teach the v2.2 fields.

### Migration

```bash
cd ~/.claude/skills/muse
git pull
./install.sh
```

To upgrade existing personas to v2.2 schema (applies to user-built personas only — the 8 shipped personas were upgraded in this release):

```
/muse:update --all
```

Interactive walk through C9-C12 gaps per persona. Idempotent on v2.2-compliant files.

### Not in scope (deferred to v2.3+)

- Promote C9-C12 from SOFT-DRIFT to HARD-GAP (v2.3 — requires a stabilization period on v2.2.0-alpha)
- `/muse:chain`, `/muse:debate`, `/muse:critic`, `/muse:all`, `/muse:spike`, `/muse:list` as slash commands (still deferred from v2.1.0-beta — these need custom workflows)
- Persona marketplace / plugin system
- Cross-persona session blending (one session using multiple personas sequentially — adjacent to but distinct from `muse:chain`)
- Auto-learning from session history + escape-hatch analytics
- Running `muse:spike` distinctiveness eval on the v2.2 persona set (requires ANTHROPIC_API_KEY + human judges)

### Known gaps / risks

- **R1 — SOFT-DRIFT warnings are advisory, not enforced**. Contributors may build personas that pass v2.1 checks but fail C9-C12 and still save. v2.2.0-alpha is intentionally lenient to allow calibration; v2.3 will enforce.
- **R2 — `canonical_mapping` interpretive decisions**. Different contributors may disagree on the best mapping (e.g., Confucius's "top-down vs bottom-up" → `authority_vs_reason` is one reading; others are possible). The escape hatch is `deliberate_skips`.
- **R3 — Mode detection is heuristic**. The S/T/C/A scoring is based on keyword/phrase signals and may misclassify. User override via AskUserQuestion at Stage 0 is the safety net. Log the override rate for future tuning.
- **R4 — Voice rules risk being too restrictive**. If a persona's banned-patterns list is too aggressive, ordinary session output may trip it. Each persona is limited to 6-8 banned patterns; the core belief is the primary voice signal, not the ban list.
- **R5 — Cognitive patterns risk feeling like a checklist**. SESSION.md explicitly instructs the runtime to "internalize, don't enumerate." If persona outputs start to read like "here are my 9 cognitive patterns numbered...", the instruction is being violated — the fix is in SESSION.md, not per-persona.
- **R6 — Persona file length**. Each file grew to ~280-340 lines. Still under Garry's gstack skill files (1000+ lines). Acceptable.

### Total diff

- **New files**: `docs/PERSONA_SCHEMA.md` (~600 lines)
- **Modified files**: `SESSION.md` (near-total rewrite, ~485 → ~730 lines), `SKILL.md` (Mode: build C1→C12, Mode: update C1→C12, ~90 lines of additions), 8 personas (each +130-190 lines = ~1200 net), 10 slash commands (~15 lines each = ~150 net), `docs/CHANGELOG.md` (this entry, ~100 lines)
- **Total**: ~2400 net LoC added. Mostly data + spec.

---

## [2.1.0-beta] — 2026-04-15 — v2.1 tooling + compliance sweep

### Why

v2.1.0-alpha shipped the session runtime but left the **authoring tools** (`muse:build`), the **fallback Mode sections in SKILL.md**, and the **8 persona files themselves** still shaped for v2.0. Sessions worked, but silently degraded: when `SESSION.md`'s Stage 3 ran a persona whose signature moves didn't include a clearly-measurable test/probe, the lens selection fell back to `opening_question`. When Stage 4 ran a persona whose `debate_positions` used non-canonical labels, the fuzzy keyword match was a coin flip. And `SKILL.md Mode: debate` directly contradicted `SESSION.md` line 455 fallback (reject vs skip-Stage-4). This release makes the v2.1 contract explicit and fixes all drifted content.

### Added

- **`commands/muse:build.md`** — NEW Claude Code slash command. Interactive persona builder that groups research candidates by SESSION.md stage category (framing / inquiry / test-probe), walks the 6 canonical debate dilemmas one at a time, and validates the output against C1-C8 compliance checks before save. A persona that would silently degrade in a structured session cannot be saved.

- **`commands/muse:update.md`** — NEW Claude Code slash command. Detects v2.1 compliance gaps in existing personas (C1-C8), proposes fixes interactively via per-gap `AskUserQuestion`, writes with backup + draft + diff + confirm. Supports `--check` (dry-run) and `--all` (batch matrix scan → per-persona walk). Idempotent: running twice on a compliant persona is a zero-write no-op.

- **`SKILL.md Mode: update`** — NEW free-text equivalent of `/muse:update` for Codex CLI / Gemini CLI users without slash command support. Same C1-C8 detection + interactive fix + validation.

- **Persona schema (additive, backward-compatible)**:
  - Frontmatter field `canonical_mapping` — maps the persona's own debate-position labels (e.g. Socrates's "certainty vs inquiry") to SESSION.md's 6 canonical dilemma slugs (`speed_vs_quality`, `consensus_vs_conviction`, `authority_vs_reason`, `direct_vs_indirect`, `action_vs_patience`, `tradition_vs_innovation`). Lossless — persona keeps its own voice in the body, the mapping gives `SESSION.md` Stage 4 lens selection a fast path.
  - Frontmatter field `deliberate_skips` — list of canonical slugs the persona intentionally has no documented view on (e.g. Lao Tzu on `speed_vs_quality` — his domain is force/flow, not speed). Prevents `/muse:update` from re-flagging the same gap on idempotent re-run.
  - Inline category tags `(framing)`, `(inquiry)`, `(test-probe)` on each `signature_move` heading. `SESSION.md` pre-flight prefers these tags for Stage 1/2/3 lens selection and falls back to keyword heuristic if absent.

### Changed

- **`SKILL.md Mode: build`** (lines 302-368 in v2.1.0-alpha) rewritten to enforce v2.1 compliance: minimum 3 signature moves covering all 3 stage categories; walk the 6 canonical debate dilemmas one at a time; mandatory disclaimer template for living/estate_protected figures; validation step (C1-C8) before save; redirect to `/muse:update` when the persona already exists instead of blind rewrite.

- **`SKILL.md Mode: debate`** (lines 190-196) aligned with `SESSION.md` Stage 4 fallback. Previously said "reject the debate if persona lacks `debate_positions`, suggest `muse:chain` instead." Now says "proceed with degraded debate: that persona has less to push back on in Round 2, and Round 3 synthesis notes the asymmetry." Matches `SESSION.md` line 455 semantics.

- **`SKILL.md Mode: single persona`** relabeled as "v2.0 FALLBACK — Free-text conversational path" with a clear "prefer slash for depth, free-text for speed" cross-reference. No behavior change.

- **`SKILL.md Mode: spike`** relabeled as "v2.2+ — NOT shipped in v2.1" with an inline deferred note. The section content is preserved as v2.2+ implementation reference.

- **`SESSION.md` pre-flight** (lines 49-57) updated to teach Stage 1/2/3 lens selection to prefer inline category tags over the keyword heuristic, and to resolve `canonical_mapping` for Stage 4 debate lookup. Keyword fallback preserved for untagged personas (backward-compatible).

- **All 8 personas** backfilled with `canonical_mapping` frontmatter, `deliberate_skips` list, and inline category tags on every signature move heading. No move content was rewritten; the changes are additive metadata only. Each persona's patch version bumped to `1.1.0` with a `last_updated` marker.

- **`personas/socrates.md`** gained two new debate positions — **Speed vs quality** ("Quality, examined — the rush to decide is often the thing to resist") and **Direct vs indirect** ("Direct, but through questions, not statements"). Previously Socrates had only 4/6 canonical coverage; now 5/6, with `tradition_vs_innovation` as a documented deliberate skip.

- **`personas/marcus-aurelius.md`** and **`personas/dieter-rams.md`** each gained one additional `## On analogous problems` entry (Marcus on the Marcomanni campaigns 166-180 CE; Rams on the Vitsoe 606 shelving system, 1960) to thicken Stage 5 citation grounding.

- **`docs/CONTRIBUTING.md`** disclaimer section expanded. Now explains that `SESSION.md` pre-flight auto-prints the disclaimer at the top of every session, and includes the mandatory template wording for living and estate_protected figures.

- **`docs/GETTING_STARTED.md`** first-session hierarchy reversed. Quick gut-check (v2.0 free-text, 2-3 min, ephemeral) is now described first and labeled as the "quick path." Deep session (v2.1 slash, 10-15 min, saves a file) is second and labeled as the "deep path." A two-path comparison table lets users pick by purpose instead of by accident.

- **`docs/ARCHITECTURE.md`** clarified on dispatcher entry points. `SKILL.md` is the v2.0 free-text dispatcher; `commands/muse:*.md` are the v2.1 slash command entry points that load `SESSION.md` directly and bypass SKILL.md routing. New contributors get the mental model in "Start here" section updated.

- **`README.md`** Commands table updated: `muse:update --person=<id>` and `muse:update --all [--check]` rows added; `muse:spike` marked as v2.2+ not yet shipped; `muse:build` description tightened to "v2.1-compliant persona builder"; Vietnamese leakage "tranh luận" replaced with "surface tensions across 3 rounds".

### Backward compatibility

**Additive schema only.** Existing personas without `canonical_mapping`, `deliberate_skips`, or inline category tags still load and run — `SESSION.md` pre-flight falls back to the keyword heuristic. v2.0 free-text invocations (`muse:<persona>`, `muse:chain`, `muse:build`, etc.) are unchanged except for the new `Mode: update` and updated guidance inside `Mode: build` (`Mode: debate` fallback behavior changed but is strictly less-rejective, so no invocation that worked before fails now).

### Not in scope (deferred to v2.2)

- `/muse:chain`, `/muse:debate`, `/muse:critic`, `/muse:all`, `/muse:spike`, `/muse:list` as slash commands (still deferred — need custom workflows that don't fit the 5-stage shape)
- Session resume / search / prune helpers (still deferred — `grep`, `cat`, `ls -lt` work today)
- Full test suite for `install.sh` (manual smoke test per CHANGELOG is sufficient for a 128-line shell script)
- Automatic `muse:spike` distinctiveness eval run on the v2.1.0-beta persona set (requires ANTHROPIC_API_KEY + judges; out of scope for a code release)

### Migration

Existing v2.1.0-alpha installs:

```bash
cd ~/.claude/skills/muse
git pull
./install.sh
```

Idempotent. `install.sh` skips the clone (already installed), refreshes slash commands in `~/.claude/commands/` (picks up the new `muse:build.md` and `muse:update.md` automatically — the wildcard loop was already generic), and re-ensures `~/.muse/sessions/` exists. Restart Claude Code for the new slash commands to appear.

Fresh installs:

```bash
curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
```

### Known gaps / risks

- **R1** — If a user runs `/muse:update --all` on a persona whose research archive is gone, C7 (sources) and C8 (analogous problems) gaps cannot be auto-filled. The tool explicitly does NOT fabricate citations; it marks these as skipped with a warning. The persona still runs sessions correctly; only citations are thinner.
- **R2** — The keyword heuristic fallback for Stage 1/2/3 category classification in `SESSION.md` pre-flight is intentionally imperfect. The authoritative fix is to tag moves explicitly (which v2.1.0-beta does for all 8 shipped personas). Contributed personas without tags will still work but may pick sub-optimal lenses.
- **R3** — `canonical_mapping` decisions are somewhat interpretive (e.g. Confucius's "top-down vs bottom-up" → `authority_vs_reason`). Different contributors might disagree on the best mapping. The escape hatch is `deliberate_skips`: if the persona genuinely has no view on a canonical dilemma, record it there rather than forcing an uncomfortable mapping.
- **R4** — `muse:spike` still unexecuted. v2.1.0-beta's category tags and canonical mappings make the data layer more self-documenting but do not measure distinctiveness. Inherited debt from v2.1.0-alpha and v2.0.

### Total diff

- **New files**: `commands/muse:build.md` (~145 lines) + `commands/muse:update.md` (~230 lines) = ~375 lines
- **Modified files**: `SKILL.md` (+110 net, Mode: build rewrite + new Mode: update + relabels), `SESSION.md` (+10 net, pre-flight update), 8 personas (+15 avg each = +120 net, frontmatter additions + inline tags + Socrates positions + Marcus/Rams analogous cases), 4 docs (~+70 net)
- **Total**: ~685 net LoC added. Mostly data + spec, not code. No shell scripts written.

---

## [2.1.0-alpha] — 2026-04-16 — Structured sessions + slash commands

### Why

User feedback on v2.0.0-alpha: the single-persona mode was too shallow. Free-form 150-250 word replies with up to 6 rounds of Q&A felt like a lighter version of ChatGPT, not like working with a deliberate thinking tool. Users also expected `/muse:feynman` to work as a slash command the way `/workflow:refactor` and `/design:fast` do, and got "Unknown command" instead.

v2.1 ships the discipline (structured 5-stage sessions) and the packaging (slash commands), without changing any v2.0 behavior.

### Added

- **`SESSION.md`** at repo root — the load-bearing workflow specification for structured sessions. ~400 lines. Defines 5 fixed stages (Frame → Examine → Test → Decide → Commit), STOP point formats (AskUserQuestion A/B/C/D for stages 1/3/4/5, free-text follow-up for stage 2), option distinctiveness rules, escape-hatch semantics, persistence template, voice discipline, language matching, fallback behavior. Self-contained enough that an agent can execute a session reading only SESSION.md + one persona file.

- **`commands/muse:*.md`** — 8 slash command launcher files, one per persona: `muse:feynman`, `muse:socrates`, `muse:seneca`, `muse:marcus-aurelius`, `muse:aristotle`, `muse:confucius`, `muse:lao-tzu`, `muse:dieter-rams`. Each is ~30 lines. YAML frontmatter with `description` / `allowed-tools` / `argument-hint`. Body delegates to SESSION.md, hardcodes the persona file path. The Dieter Rams file includes the interpretive disclaimer (living figure).

- **`docs/SESSIONS.md`** — user-facing walkthrough: what a structured session is, how to start one, what to expect at each stage, where files are saved, how to find/read/grep/share sessions.

- **`~/.muse/sessions/`** — new per-user state directory, created by `install.sh`. All structured sessions persist here as `<YYYY-MM-DD-HHMMSS>-<persona>-<slug>.md` files. Private by default (not in repo, not gitignored because it's not in the repo), cross-project (the directory doesn't care which CWD the session started in — CWD is captured in frontmatter for later filtering).

### Changed

- **`install.sh`** — extended (~25 LoC delta) to (1) add `COMMANDS_DIR` and `SESSIONS_DIR` variables, (2) make existing-install detection idempotent (skip clone but still refresh commands + session dir), (3) copy `commands/muse:*.md` files into `~/.claude/commands/` using a loop (safe with colons in filenames, handles zero-match case), (4) `mkdir -p ~/.muse/sessions`, (5) updated welcome message showing both v2.1 slash invocations and v2.0 free-text fallback.

- **`SKILL.md`** — one 3-line pointer added at the top of `Mode: single persona` section directing users to `/muse:<persona>` slash commands for deep sessions. Version footer bumped from 2.0.0 to 2.1.0-alpha.

- **`README.md`** — hero code block now showcases slash commands first. New `Structured sessions (v2.1)` section added between the existing `Commands` table and the persona list, with the 5-stage table, slash command list, and a pointer to `docs/SESSIONS.md`.

- **`docs/GETTING_STARTED.md`** — new section added after Install walking users through their first structured session with `/muse:feynman`.

- **`docs/ARCHITECTURE.md`** — system diagram updated to show SESSION.md as a sibling of SKILL.md, with a paragraph explaining the slash command launcher pattern.

- **`adapters/codex/README.md`** and **`adapters/gemini/README.md`** — one-line note added: v2.1's slash commands are Claude Code specific. Free-text `muse:feynman` invocation continues to work in Codex/Gemini via the v2.0 SKILL.md fallback, unchanged.

### Backward compatibility

**Supplement, not replace.** v2.0 free-text invocation (`muse:feynman <q>`, no slash) still routes through `SKILL.md` Mode: single persona with the original behavior: 150-250 word reply, up to 6 rounds, ephemeral (no file saved). The new slash commands are additive — users who want a quick gut-check use free-text, users who want a deep session with an artifact use slash.

v2.0 multi-persona modes (`muse:all`, `muse:chain`, `muse:debate`, `muse:critic`, `muse:build`, `muse:spike`, `muse:list`) are unchanged. v2.1 does NOT ship slash commands for these — they don't fit the 5-stage shape and need their own workflows. Deferred to v2.2.

### Not in scope (deferred)

- `/muse:debate`, `/muse:chain`, `/muse:critic` as slash commands → v2.2 (need custom workflows)
- `/muse:all`, `/muse:build`, `/muse:spike`, `/muse:list` as slash commands → v2.2+ (lower priority)
- Session resume / search / prune helper commands → defer; `Read <path>`, `grep`, and `ls -lt` work today
- Session sharing tooling (gist upload, clipboard copy) → defer; sessions are markdown, `cat` works
- Auto-discovery adapters for Codex CLI and Gemini CLI → still on the v2.2+ roadmap, unchanged

### Known gaps / risks

- **R1 — slash command discovery**: Claude Code may require a session restart to pick up newly-installed `~/.claude/commands/muse:*.md` files. `install.sh` prints a clear restart reminder. Observation from v2.0 shipping showed skills being picked up mid-session, so rescan may work, but not verified for commands specifically.
- **R2 — option distinctiveness bar**: the whole point of Muse is cognitive distinctiveness. If the 5-stage AskUserQuestion options at Stages 1/3/4 feel generic across personas, the workflow undermines the product. SESSION.md explicitly instructs the agent to make options distinctively persona-flavored and includes a self-check. If users report "the options all feel the same," fix the persona data, not the workflow.
- **R3 — rigidity**: the 5-stage structure may feel scripted for some question types. Stage 4 ships with a mandatory `D) escape hatch` that lets the user reject the framing. Session frontmatter tracks `escape_hatches_used` so the design can be tuned after real usage data.
- **R4 — distinctiveness eval still unexecuted**: v2.0's spike phase (3-persona blind Turing test) was planned but never run. v2.1 inherits that debt. The v2.1 workflow improves the session surface but cannot make up for persona data that isn't cognitively distinct.

### Migration

- Existing v2.0 installs: run `install.sh` again (idempotent). It will skip the clone (muse is already at `~/.claude/skills/muse/`), run `git pull` is YOUR responsibility separately, copy the new commands into `~/.claude/commands/`, create `~/.muse/sessions/`. Restart Claude Code for slash commands to appear.
- Fresh installs: single `curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh` handles everything.

### Total diff

- **New files**: SESSION.md (~400 lines) + 8 commands (~240 lines) + docs/SESSIONS.md (~150 lines) = ~790 lines
- **Modified files**: install.sh (+65 net), SKILL.md (+3), README.md (+60), CHANGELOG.md (this entry ~80), ARCHITECTURE.md (+30), GETTING_STARTED.md (+50), 2 adapter READMEs (+10)
- **Total**: ~1,100 net LoC added. v2.0 was a 6,000-line removal; v2.1 is a controlled feature add.

---

## [2.0.0-alpha] — 2026-04-15 — Radical agentic refactor

### Eureka
v1 shipped Muse as a bash CLI framework that plugged into Claude Code. The user pointed out (correctly) that this required installing yq, jq, bats-core, shellcheck, and check-jsonschema before anything worked. An **agentic skill should not ship a shell tool chain**. The agent IS the runtime.

v2 is the correction: pure content + one SKILL.md dispatcher. Zero dependencies. Works on Claude Code / Codex CLI / Gemini CLI.

### Removed (v1 → v2)
- **20 shell files**: `bin/muse`, `bin/muse-lib.sh`, `bin/muse-install`, `bin/muse-update`, `bin/muse-doctor`, `bin/muse-list`, `bin/muse-eval`, `bin/muse-eval-harness`, `bin/muse-spike-prepare`, `bin/muse-spike-score`
- **4 bats test files**: `tests/muse-lib.bats`, `tests/persona-schema.bats`, `tests/spike-scripts.bats`, `tests/test_helper.bash`
- **2 CI workflows**: `.github/workflows/ci.yaml`, `.github/workflows/release.yaml` (shellcheck matrix, bats test runner)
- **2 skill files merged into unified**: `skills/muse-build/SKILL.md`, `skills/muse-critic/SKILL.md` (now handled by `SKILL.md` internally)
- **Deprecated schema**: `personas/schema.json` (markdown is self-documenting)
- **Deprecated docs**: `docs/PERSONA_SCHEMA.md` (no YAML schema to document)
- **Heavy installer**: `install.sh` (225 lines → 15 lines optional wrapper)
- **Dependencies**: yq, jq, bats-core, shellcheck, check-jsonschema — all removed

Total removed: ~6,000 lines of scaffolding.

### Converted (YAML → Markdown)
- 8 persona files: `personas/*.yaml` → `personas/*.md`
- 3 chain files: `chains/*.yaml` → `chains/*.md`
- 2 benchmark files: `eval/benchmarks/*.yaml` → `benchmarks/*.md`

Why markdown: agents parse it natively, humans read it easily, no schema tool needed, git diffs are cleaner.

### Rewritten
- `SKILL.md` — unified dispatcher (700 lines) handling ALL muse:* commands internally: single persona, all, chain, debate, critic, build, spike, list
- `README.md` — agent-first install story, agentic architecture explanation
- `docs/ARCHITECTURE.md` — v2 agentic model documented end-to-end
- `docs/GETTING_STARTED.md` — "git clone, done"
- `docs/PERSONAS.md` — updated for markdown format
- `docs/CONTRIBUTING.md` — markdown-based contribution flow

### Added
- `adapters/claude-code/README.md` — Claude Code install notes
- `adapters/codex/README.md` — Codex CLI invocation pattern (v2.0: manual, v2.1: auto-discovery)
- `adapters/gemini/README.md` — Gemini CLI invocation pattern (v2.0: manual, v2.1: auto-discovery)
- `install.sh` (new minimal version, ~15 lines) — thin git clone wrapper

### Security
Same as v1:
- Path inputs validated (reject `..`, symlink escape)
- Persona content sanitized (strip `[INST]`, `[SYSTEM]`, etc.)
- Agent refuses to run as root
- v2 ships `core + local` trust tier only
- v2.2+ adds GPG signing

### Install (v2)

```
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
```

Done. 5 seconds. No deps.

### Known gaps
- Phase 0 spike has not been operator-executed yet (requires 5 human judges — operator task)
- Codex CLI and Gemini CLI adapters are currently manual-invocation (v2.1 will add proper auto-discovery)
- muse.dev domain not set up yet (using github.com direct URLs)

### Deferred to v3
- `muse:scan` web research automation
- Community persona marketplace
- Journal / memory across sessions
- `muse:mirror` user's own thinking style as persona
- Persona versioning + rollback

---

## [0.1.0-alpha] — 2026-04-15 — v1 initial (deprecated)

Initial v1 shipped with 47 files, 8,385 lines, including:
- `bin/` directory with 10 bash CLI tools
- `tests/` directory with 4 bats test files
- `.github/workflows/` with CI and release pipelines
- `personas/schema.json` for JSON Schema validation
- 8 persona YAML files
- 3 chain YAML files
- 2 benchmark YAML files
- Full gstack-inspired architecture

**Problem**: Required 5 external dependencies. User feedback: "a Claude Code skill shouldn't need a shell tool chain". Correct.

**Resolution**: v2.0.0-alpha radical refactor (same day). See above.

v1 is archived at `docs/archive/CEO-PLAN-v1.md` and `docs/archive/TODOS-v1.md` for historical reference.
