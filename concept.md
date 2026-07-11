# Spirit Sprint — Self-Service Web Flow

Konzept-Grundlage: `AS_ASS_2_CIB_Example.pdf` (Aisu.Studio, Dez. 2024), 26 Seiten,
Beispielprojekt „Comic Invasion Berlin".

Das Original ist ein **Facilitator-Deck**: ein Set von Miro/Keynote-Folien, das nur
mit einer moderierenden Person im Raum funktioniert. Ziel dieses Dokuments ist,
das gleiche Framework als **eigenständiges Web-Tool** zu denken, das ein Team
ohne Moderator:in durchlaufen kann.

---

## 1. Schwachstellen im bestehenden Konzept

### 1.1 Unsichtbare Abhängigkeiten zwischen Übungen
Mehrere Schritte verbrauchen den Output eines früheren Schritts, aber nichts im
Deck erzwingt oder visualisiert das:
- Personality Sliders → die 2 gewählten Achsen werden zu den Achsen der
  Positioning-Map (Regel steht nur als Kleingedrucktes: „After setting the
  personality choose two axes for the next exercise.")
- Values (5 Kategorien) → Value Measures nutzt exakt dieselben 5 Kategorien
  als Zeilen — das wird nirgends explizit gemacht.
- 2-Jahres-Ziel, Risks & Bottlenecks, Milestones → sollen alle auf denselben
  5-Jahres-Strahl (Roadmap), aber die Zusammenführung ist Handarbeit.

Ohne Moderator:in wird diese Kettenlogik leicht übersehen.

### 1.2 Kein Konvergenz-Mechanismus nach offenen Brainstorms
Soul-Assoziationen und Values sind reine Sammel-Übungen (Sticky Notes ohne
Auswahl-Schritt). Es gibt keine im Deck definierte Methode, wie ein Team von
„20 Klebezetteln" auf die 4–5 Aussagen kommt, die später in Value Measures und
Trinity gebraucht werden. Diese Konvergenz passiert nur, weil eine erfahrene
Moderation sie in Echtzeit erzwingt.

### 1.3 Platzhalter statt Anleitung
„Key Activities" (Folie 14) besteht komplett aus „xxxxx"-Platzhaltern, die
Roadmap-Milestones sind generische Boxen ohne Beispiel. Für ein Selbstlauf-Tool
ist das nicht nutzbar — jede Übung braucht eine echte Beispielantwort und einen
konkreten Prompt.

### 1.4 Härteste Übung ist am wenigsten angeleitet
Der Sprung von drei Modulen (Soul/Skills/Strategy, je 3–4 Übungen) zu einem
einzigen Spirit-Satz („We're the most colorful comic festival in town") ist
kreativ die anspruchsvollste Aufgabe im ganzen Sprint — und bekommt nur ein
Beispiel, keine Methode. Trinity/Inverted Trinity sind reine „Text"-Platzhalter
ohne Erklärung, wofür die Anti-Soul/Anti-Purpose/Anti-Ambition-Spalte gut ist.

### 1.5 Kein Liefergegenstand
Der Sprint endet auf einer Folie im Deck. Es gibt kein definiertes,
eigenständiges Artefakt, das ein Team danach hat und teilen/aufhängen/verlinken
kann — obwohl der Zweck laut Deck explizit „ein Vehikel für Alignment im Haus"
ist.

### 1.6 Nur synchron gedacht
Sticky-Note-Board, Slider, Positioning-Map — alles setzt einen gemeinsamen Raum
oder ein gemeinsames Miro-Board mit Live-Moderation voraus. Für verteilte Teams
fehlen: asynchrones Beitragen, Abstimmen, Zeitfenster pro Übung.

### 1.7 Tote Konzepte im Overview
Die Venn-Grafik (Folie 3/26) zeigt Schnittmengen wie „Touchpoints", „Customers,
Personas, Users", „Obligations & Requirements", „Futures" — keine davon taucht
je wieder als eigene Übung im Rest des Decks auf. Im Self-Service-Produkt
müssen diese entweder zu echten Schritten werden oder aus dem Overview
verschwinden.

---

## 2. Self-Service Flow — Konzept

### 2.1 Grundprinzip
Jede Übung wird ein eigener Screen mit: Instruktionstext + echtem Beispiel,
Zeitrichtwert, und — wo im Original eine Abhängigkeit besteht — **automatisch
vorausgefüllten Daten aus dem Vorschritt**, nicht manuell übertragen.

### 2.2 Module & Screens

**00 · Übersicht** — begehbare Venn-Karte statt Deckfolie. Jeder Kreis zeigt
Fortschritt (n/m Übungen) und was zum Freischalten fehlt.

**Soul**
- Feelings & Associations — Board, dann Dot-Voting → Keeper
- Values (5 Spalten: Culture/Tech/Business/Planet/Organisation) — Board +
  Dot-Voting → Keeper (fix 1.2)
- Personality Sliders — 4 Achsen, 2 auswählen
- Positioning — 2×2-Feld, Achsen **automatisch** aus Personality-Auswahl
  (fix 1.1)

**Skills**
- 2-Jahres-Ziel
- Key Activities — mit echten Beispielprompts statt „xxxxx" (fix 1.3)
- Economic Landscape (Consumers/Producers/Partners/Players)

**Strategy**
- Value Measures — Zeilen = automatisch die Keeper-Values aus Soul (fix 1.1)
- Risks & Bottlenecks — Board + Voting
- 5-Year Roadmap — Ziel, Risiken, Milestones landen automatisch auf dem Strahl

**Spirit** (nur erreichbar, wenn genug Keeper gesammelt wurden)
- Trinity Collector — **ein gemeinsamer Pool** aller Keeper aus allen
  Vorschritten; das Team zieht sie in drei Spalten (Soul/Purpose/Ambition)
  statt leere Textfelder zu füllen (fix 1.4)
- Inverted Trinity — optional, mit Erklärtext wozu (Kontrastschärfung)
- Spirit Card Export — ein eigenständiges, teilbares Ergebnis: Link, PDF, PNG
  (fix 1.5)

### 2.3 Asynchron & Team (fix 1.6)
- Autosave statt „Absenden"
- Kommentare/Reaktionen auf jeder Karte
- Optionaler Timer pro Übung, aber kein Zwang zur Live-Session
- Facilitator-Modus (schnell, für Präsenz-Workshops) vs.
  Self-Service-Modus (mit allen Anleitungen/Beispielen) als Umschalter

### 2.4 Overview-Bereinigung (fix 1.7)
Die Venn-Schnittmengen aus Folie 3 werden entweder gestrichen oder zu echten
Mini-Übungen ausgebaut (z. B. „Touchpoints" als kurze Liste vor Economic
Landscape). Für die erste Version: streichen, um keine falschen Versprechen
im Overview zu zeigen.

---

## 3. Design-System

Übernommen 1:1 aus `AisuStudio/aisukurimu` (`src/styles/global.css`),
kopiert nach `design/aisukurimu-tokens.css` in diesem Repo:

| Rolle | Token | Wert |
|---|---|---|
| Seitenhintergrund | `--ak-vanilla` | `#eae8e0` |
| Karten/Panels | `--ak-cappuccino` | `#d9d7ce` |
| Akzent/CTA/aktiv | `--ak-grape` | `#5100ff` |
| Highlight/„du bist hier"/Keeper | `--ak-lemon` | `#d8ff01` |
| Primäre Schrift/Ink | `--ak-blueberry` | `#1f1934` |
| Sekundär/Meta | `--ak-hazelnut` | `#9e9c95` |

Bemerkenswert: Das Original-PDF nutzt bereits genau diese Grammatik — graue
abgerundete Boxen für Platzhalter, ein sattes Gelb für die jeweils wichtigste
Aussage pro Folie („Spirit", „Here we are", „Get longterm funding"). Die
Lemon-Rolle im Self-Service-Flow (Keeper/aktueller Schritt/„du bist hier")
ist also keine neue Erfindung, sondern die konsequente Fortführung dessen,
was das Deck optisch schon tut.

Typografie: `iA Writer Mono S` für Headings/Labels/Stepper,
`Public Sans` für Fließtext — wie in aisukurimu.

Ein klickbarer Konzept-Prototyp liegt unter `prototype/index.html`
(Radio-Button-Tabs, kein Build nötig, im Browser direkt öffnen).
