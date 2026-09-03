"""Build the submission PDF when a TeX engine is unavailable on Windows."""
from reportlab.lib.colors import HexColor, white
from reportlab.lib.pagesizes import landscape
from reportlab.pdfgen import canvas
from reportlab.pdfbase.pdfmetrics import stringWidth

OUT = "presentation.pdf"
PAGE = landscape((540, 960))
W, H = PAGE
NAVY, TEAL, GOLD, MIST, GREY = map(HexColor, ("#17324D", "#0B7A75", "#E6A23C", "#F2F6F8", "#506474"))

slides = [
    ("Agentic Delegation and the Language Frontier", ["A model, GitHub evidence, and a Lean audit", "Quispe & Xu (2026) - arXiv:2605.25438v2", "Course replication: ai-03-quispe", "github.com/davidolano03/ai-03-quispe"]),
    ("First check: the requested citation was stale", ["PROMPTED: Coding Beyond Your Training: Claude Code and the Technological Frontier of Software Developers", "VERIFIED v2: Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub", "Alexander Quispe & Kevin Xu", "Takeaway: title, authors, version date, and sample size were checked first."]),
    ("Question and contribution", ["Can an agentic coding tool move developers beyond their prior language frontier?", "1. Delegation model of extensive-margin entry", "2. GitHub evidence around voluntary Claude Code adoption", "3. Predictions for specialists and lower-ability developers", "4. Formal audit of all five propositions"]),
    ("The agent's economic role", ["Before: 1{V0_l >= 0}", "With agent: 1{max(V0_l, VA_l) >= 0}", "New activation: V0_l < 0 <= VA_l", "agent threshold  |==== activation band ====|  solo threshold", "Takeaway: delegation lowers the threshold for attempting an unfamiliar language."]),
    ("Five propositions, one logical chain", ["P1  Better of solo/delegated value weakly expands the frontier.", "P2  Expansion equals probability mass in the activation band.", "P3  Repeated activation creates a cumulative gap with diminishing increments.", "P4  Effects rise with unfamiliar candidates and activation probability.", "P5  Lower repository-entry costs expand breadth; strictness needs positive mass."]),
    ("Data and identification", ["5,346 developers: 2,813 early adopters; 2,533 not-yet-treated controls", "149,688 developer-months, Jan. 2024-Apr. 2026", "3.2m commits and 57m changed files", "First Claude-coauthored commit marks adoption", "Callaway-Sant'Anna doubly robust staggered DiD; one-month anticipation", "Caution: adoption remains voluntary."]),
    ("Main event-study magnitudes", ["Outcome                 Adoption       t+1       t+2", "Languages                 +2.528    +1.227    +0.693", "New languages              +1.193    +0.126    -0.018", "Language entropy            +0.382    +0.189    +0.102", "Pre-period means: 0.90 languages; 0.31 new languages", "A sharp spike leaves persistent breadth; new entry quickly fades."]),
    ("Is this only Claude writing the code?", ["Exclude first-Claude language: +1.58 languages; +0.807 new languages", "Remove every Claude-coauthored commit: +1.663; +0.724", "Roughly two-thirds of diversification remains", "Per-commit diversification concentrates at adoption", "Persistence partly reflects higher activity volume", "Takeaway: broader than mechanical counting, but not randomized."]),
    ("Where I distrusted the paper: Proposition 3", ["G(t) = 1 - (1-p2)^(t+1) when p1 = 0", "Delta G(t) = p2(1-p2)^(t+1)", "Paper permits p2 = 1; then G(t) = 1 for every t", "Strict growth and strict concavity therefore fail at the endpoint", "Strictness also fails when the unfamiliar-language set is empty", "VERDICT: require a nonempty set and 0 < p2 < 1."]),
    ("From the paper to Lean", ["Original: G(t) = sum_l [(1-p1_l)^(t+1) - (1-p2_l)^(t+1)]", "Lean proof uses Finset.sum_lt_sum plus an explicit witness language.", "hNonempty supplies the witness; hClosedFrontier supplies p1=0 and 0<p2<1.", "All five exact-type proof endpoints compile.", "No sorry, admit, new axiom, opaque, or native_decide."]),
    ("Assumptions made explicit", ["1. Foothold: augmentation requires prior familiarity; delegation drives entry.", "2. Verification technology: comparative statics require signed cost effects.", "3. Comparable candidates: unfamiliar languages share an activation probability.", "Lean checks the implication structure, not empirical truth of assumptions."]),
    ("Comparison: two ways to model AI", ["QUISPE-XU", "AI = information, delegation, verification", "Margin = domain/language entry; risk = project selection", "AOUAD-LYKOURIS-ZHONG", "AI = substitutable productive input", "Margin = task allocation/human capital; risk = deskilling", "Modeling choice determines which economic mechanism becomes central."]),
    ("Three critiques", ["1. The entry threshold may capture a generic productivity shock, not uniquely delegation.", "2. Voluntary adoption cannot separate causal expansion from project selection.", "3. Strict propositions need endpoint conditions: positive mass, nonempty sets, and interior hazards.", "The descriptive pattern is strong; mechanism and causality are less settled."]),
    ("Conclusion", ["Agentic AI appears to broaden what developers attempt.", "Large, partly persistent expansion in language breadth", "Coherent extensive-margin delegation mechanism", "Robustness checks reduce but do not eliminate selection concerns", "Formalization validates weak results and repairs the strict dynamic claim", "github.com/davidolano03/ai-03-quispe"]),
]

def wrapped(c, text, font, size, max_width):
    words, lines, line = text.split(), [], ""
    for word in words:
        trial = (line + " " + word).strip()
        if stringWidth(trial, font, size) <= max_width:
            line = trial
        else:
            if line: lines.append(line)
            line = word
    if line: lines.append(line)
    return lines

c = canvas.Canvas(OUT, pagesize=PAGE)
for idx, (title, items) in enumerate(slides, 1):
    c.setFillColor(white); c.rect(0, 0, W, H, fill=1, stroke=0)
    c.setFillColor(NAVY); c.rect(0, H-78, W, 78, fill=1, stroke=0)
    c.setFillColor(white); c.setFont("Helvetica-Bold", 25 if idx > 1 else 29)
    c.drawString(42, H-50, title)
    y = H-125
    if idx == 1:
        c.setFillColor(TEAL); c.rect(42, H-230, 9, 95, fill=1, stroke=0)
        y = H-155
    for j, item in enumerate(items):
        if item.startswith("Takeaway:") or item.startswith("VERDICT:"):
            c.setFillColor(MIST); c.roundRect(42, y-46, W-84, 62, 8, fill=1, stroke=0)
            c.setFillColor(NAVY); font, size = "Helvetica-Bold", 15
        elif item in ("PROMPTED:", "VERIFIED v2:", "QUISPE-XU", "AOUAD-LYKOURIS-ZHONG"):
            c.setFillColor(TEAL); font, size = "Helvetica-Bold", 17
        else:
            c.setFillColor(NAVY if j == 0 else GREY); font = "Helvetica-Bold" if j == 0 else "Helvetica"; size = 18 if idx == 1 else 16
        lines = wrapped(c, item, font, size, W-105)
        for line in lines:
            c.setFont(font, size); c.drawString(62 if idx > 1 else 70, y, line); y -= size + 7
        y -= 14
    if idx == 9:
        c.setStrokeColor(GOLD); c.setLineWidth(2)
        c.roundRect(W-300, 78, 240, 78, 8, fill=0, stroke=1)
        c.setFillColor(GREY); c.setFont("Helvetica-Bold", 12)
        c.drawCentredString(W-180, 124, "AUTHENTIC HAND-DERIVATION PHOTO")
        c.setFont("Helvetica", 11)
        c.drawCentredString(W-180, 101, "Add hand/derivation.jpg before submission")
    c.setFillColor(TEAL); c.rect(0, 0, W, 7, fill=1, stroke=0)
    c.setFillColor(GREY); c.setFont("Helvetica", 9); c.drawRightString(W-24, 17, f"{idx}/{len(slides)}")
    c.showPage()
c.save()
print(f"Wrote {OUT} with {len(slides)} pages")
