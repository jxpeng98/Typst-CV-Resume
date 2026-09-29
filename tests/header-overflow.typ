// Run: typst compile --root . tests/header-overflow.typ /tmp/cv-header.pdf
// Optional --input keys: count, mode (stacked/inline/photo/rail), icons (false/true/fontawesome),
// long (true/false), preset, width, height (minimum header height in mm), columns.
#import "../modernpro-cv.typ": cv, contact-display
#let count = int(sys.inputs.at("count", default: "8"))
#let mode = sys.inputs.at("mode", default: "stacked")
#let minimum = float(sys.inputs.at("height", default: "17")) * 1mm
#set page(width: float(sys.inputs.at("width", default: "210")) * 1mm)
#let long = sys.inputs.at("long", default: "false") == "true"
#let contact-text(i) = if long {
  (
    "verylongacademicdepartmentaddress.with.extra.components@research.example.invalid",
    "https://research.example.invalid/people/extraordinarilylongresearchgroupidentifier/publications",
    "abcdefghij" * 12,
  ).at(calc.rem(i, 3))
} else { "Contact " + str(i) + ": candidate.invalid" }
// Real Font Awesome coverage is opt-in; it requires the Font Awesome 7 fonts.
#let icon-kind = sys.inputs.at("icons", default: "false")
#let contact-icon(i, ..edges) = {
  // Mix default and legacy metrics to catch font-dependent line-height drift.
  let options = if calc.rem(i, 2) == 0 { (:) } else { (top-edge: "baseline") }
  options += edges.named()
  if icon-kind == "fontawesome" {
    import "@preview/fontawesome:0.6.2": fa-icon
    fa-icon(("envelope", "globe", "id-badge", "linkedin", "phone", "location-dot").at(calc.rem(i, 6)), solid: true, ..options)
  } else {
    text(..options)[•]
  }
}
#let contacts = range(count).map(i => (
  icon: if icon-kind != "false" { [#box(width: 0pt, height: 0pt)[#metadata(i)<icon-start>]#contact-icon(i)] },
  text: [#box(width: 0pt, height: 0pt)[#metadata(i)<contact-start>]#contact-text(i)#box(width: 0pt, height: 0pt)[#metadata(i)<contact-end>]],
  link: "https://candidate.invalid/" + str(i),
))
#let body = [
  #metadata(none)<body-start>
  Body begins here.
  #context {
    // An unbroken token must occupy multiple lines, not paint outside its box.
    for icon in (none, [•]) {
      let contact = (icon: icon, text: "abcdefghij" * 12)
      let wrapped = measure(block(width: 40mm, contact-display((contact,))))
      assert(wrapped.height > 3 * 8.8pt, message: "long contact does not wrap")
    }
    let start = query(<contact-start>).map(it => it.location().position())
    let end = query(<contact-end>).map(it => it.location().position())
    let body = query(<body-start>).first().location().position()
    let name = query(<name-start>).first().location().position()
    if count > 0 and ("stacked", "rail").contains(mode) and end.last().y - start.first().y > minimum {
      assert(name.y <= start.first().y + 18pt, message: "tall header pushes the name down")
    }
    let icons = query(<icon-start>).map(it => it.location().position())
    // Compare actual glyph centers with the first text line, not baselines:
    // different icon shapes/fonts need different baselines to look aligned.
    let label-top = measure(text(8.8pt, top-edge: "cap-height", bottom-edge: "baseline")[M]).height
    let label-bottom = measure(text(8.8pt, top-edge: "baseline", bottom-edge: "descender")[M]).height
    for (i, (icon, contact)) in icons.zip(start).enumerate() {
      let ink-top = measure(text(7.6pt, contact-icon(i, top-edge: "bounds", bottom-edge: "baseline"))).height
      let ink-bottom = measure(text(7.6pt, contact-icon(i, top-edge: "baseline", bottom-edge: "bounds"))).height
      let icon-center = icon.y + (ink-bottom - ink-top) / 2
      let line-center = contact.y + (label-bottom - label-top) / 2
      assert(calc.abs(icon-center - line-center) < 0.01pt, message: "icon is not centered on the first contact line")
    }
    assert.eq(start.len(), count)
    assert.eq(end.len(), count)
    assert.eq(body.page, 1)
    assert(body.y >= 2cm + minimum)
    for i in range(count) {
      assert.eq(start.at(i).page, 1)
      assert.eq(end.at(i).page, 1)
      assert(start.at(i).y >= 2cm - 0.01pt)
      assert(end.at(i).y + 8pt < body.y)
      assert(start.at(i).x >= 2.2cm - 0.01pt)
      assert(end.at(i).x <= page.width - 2.2cm + 0.01pt)
      if i > 0 {
        let previous = start.at(i - 1)
        let current = start.at(i)
        assert(
          current.y >= previous.y + 8pt or (
            calc.abs(current.y - previous.y) < 0.01pt and current.x > previous.x
          ),
          message: "contact items overlap",
        )
      }
    }
  }
]
#cv(
  profile: (
    name: [#box(width: 0pt, height: 0pt)[#metadata(none)<name-start>]Dr. Nova Placeholder#box(width: 0pt, height: 0pt)[#metadata(none)<name-end>]],
    role: [Lecturer in Speculative Systems],
    address: [Sample City, Exampleland],
    contacts: contacts,
    photo: if ("photo", "rail").contains(mode) { rect(width: 16mm, height: 20mm) },
  ),
  preset: sys.inputs.at("preset", default: "default"),
  layout: (contact-layout: if mode == "photo" { "inline" } else { mode }, header-height: minimum),
  options: (last-updated: false, page-count: false),
  columns: int(sys.inputs.at("columns", default: "1")),
  left: body,
  right: [Second column.],
  body,
)
