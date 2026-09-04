#import "modernpro-cv.typ": *
#import "@preview/fontawesome:0.6.2": fa-icon

// Render with: typst compile --input photo-style=flat|material|glass|harmonious|classic ...
// Every person, place, institution, publication, identifier, and claim below
// is an explicit placeholder from the invented setting of Exampleland.
#let variant = sys.inputs.at("photo-style", default: "flat")
#assert(
  ("flat", "material", "glass", "harmonious", "classic").contains(variant),
  message: "photo-style must be flat, material, glass, harmonious, or classic",
)

#let palette = (
  accent: rgb("#1e3a5f"),
  surface: rgb("#edf2f7"),
  outline: rgb("#d5e0eb"),
  glass-a: rgb("#f8fbff"),
  glass-b: rgb("#e7f0fa"),
)

#let variants = (
  flat: (
    panel-fill: none,
    panel-stroke: none,
    panel-radius: 0mm,
    photo-fill: palette.surface,
    photo-stroke: none,
    photo-radius: 1mm,
    monogram: palette.accent,
  ),
  material: (
    panel-fill: palette.surface,
    panel-stroke: none,
    panel-radius: 3mm,
    photo-fill: white,
    photo-stroke: 0.4pt + palette.outline,
    photo-radius: 2mm,
    monogram: palette.accent,
  ),
  glass: (
    panel-fill: gradient.linear(
      palette.glass-a,
      palette.glass-b,
      angle: 125deg,
    ),
    panel-stroke: 0.5pt + palette.outline,
    panel-radius: 4mm,
    photo-fill: gradient.linear(
      rgb("#d8e8f6"),
      rgb("#eee8f6"),
      angle: 135deg,
    ),
    photo-stroke: 0.5pt + white,
    photo-radius: 3mm,
    monogram: palette.accent,
  ),
)

#let contacts = (
  (
    icon: fa-icon("envelope", solid: true, top-edge: "baseline"),
    text: [nova\@candidate.invalid],
    link: "mailto:nova@candidate.invalid",
  ),
  (
    icon: fa-icon("globe", solid: true, top-edge: "baseline"),
    text: [nova.candidate.invalid],
    link: "https://nova.candidate.invalid",
  ),
  (
    icon: fa-icon("id-badge", solid: true, top-edge: "baseline"),
    text: [Fictional ID~0000-0000],
    link: "https://registry.example.invalid/0000-0000",
  ),
)

#let classic-contacts = contacts.map(contact => (
  text: contact.text,
  link: contact.link,
))

#let harmonious-photo = box(
  width: default-cv-style.photo-width,
  height: default-cv-style.photo-height,
  fill: palette.surface,
  stroke: default-cv-style.rule-stroke + default-cv-style.rule,
  clip: true,
)[
  #image(
    "assets/example-avatar-academic-robot.png",
    width: 100%,
    height: 100%,
    fit: "cover",
    alt: "Cartoon academic robot avatar",
  )
]

#let profile-module(variant) = {
  let tokens = variants.at(variant)
  let portrait = box(
    width: 17mm,
    height: 21mm,
    fill: tokens.photo-fill,
    stroke: tokens.photo-stroke,
    radius: tokens.photo-radius,
    clip: true,
  )[
    #if variant == "flat" {
      place(left + top, rect(width: 1.2mm, height: 21mm, fill: palette.accent))
    }
    #align(center + horizon)[
      #text(11pt, fill: tokens.monogram, weight: "bold")[NP]
    ]
  ]

  box(
    width: 76mm,
    height: 24mm,
    inset: 2mm,
    fill: tokens.panel-fill,
    stroke: tokens.panel-stroke,
    radius: tokens.panel-radius,
    clip: true,
  )[
    #align(horizon, grid(
      columns: (1fr, auto),
      column-gutter: 2.5mm,
      align: horizon,
      contact-stack(contacts),
      portrait,
    ))
  ]
}

#let editorial = ("harmonious", "classic").contains(variant)
#let example-profile = if editorial {
  (
    name: [Dr. Nova Placeholder],
    role: [Lecturer in Speculative Systems],
    address: [Sample City, Exampleland],
    contacts: if variant == "classic" { classic-contacts } else { contacts },
    photo: harmonious-photo,
  )
} else {
  (
    name: [Dr. Nova Placeholder],
    role: [Lecturer in Speculative Systems],
    address: [Sample City, Exampleland],
    contacts: (),
    photo: profile-module(variant),
  )
}

#show: cv.with(
  profile: example-profile,
  theme: if editorial {
    none
  } else {
    (photo-width: 76mm, photo-height: 24mm)
  },
  layout: if editorial {
    (contact-layout: "rail")
  } else {
    none
  },
  options: (date: "20ZZ-01-01"),
)

#section("Research Profile")
#summary[
  Researcher in a wholly invented setting studying how imaginary institutions
  evaluate simulated decision engines. The programme combines synthetic audits,
  counterfactual trials, and staged workshops; it describes no real person,
  place, institution, or project.
]
#section-gap

#section("Academic Appointments")
#experience(
  title: "Lecturer in Speculative Systems",
  institution: [Exampleland University, School of Imaginary Studies],
  location: "Sample City, Exampleland",
  date: "20XY-present",
  details: [
    - Lead the Placeholder Systems Lab and supervise entirely simulated studies.
  ],
)
#experience(
  title: "Research Fellow in Imaginary Governance",
  institution: [Placeholder Institute, Centre for Simulated Society],
  location: "Demo Harbour, Exampleland",
  date: "20XW-20XY",
)
#section-gap

#section("Education")
#education(
  institution: [Exampleland University],
  major: [PhD in Speculative Systems],
  date: "20XS-20XW",
  location: "Sample City, Exampleland",
  description: [Thesis: Auditing imaginary decisions in fictional civic services.],
)
#education(
  institution: [Placeholder Institute of Technology],
  major: [MSc in Model Studies, with fictional distinction],
  date: "20XQ-20XR",
  location: "Demo Harbour, Exampleland",
)
#section-gap

#section("Selected Publications")
#entry(
  title: [Governing imaginary models through simulated review],
  right: "20YY",
  meta: [N. Placeholder and A. Example, Journal of Imaginary Systems 8(2)],
)
#entry(
  title: [When sample explanations change fictional decisions],
  right: "20YX",
  meta: [N. Placeholder, R. Sample, and T. Demo, Simulated Governance Review 12(4)],
)
#section-gap

#section("Research Funding")
#entry(
  title: [Imaginary Civic Systems],
  right: "20YY-20ZZ",
  meta: [Exampleland Fictional Research Council; Lead Investigator],
  location: [318,000 example credits],
)
#section-gap

#section("Teaching and Service")
#detail-line(
  title: "Teaching",
  content: [Course lead for Speculative Research Methods; sample-project supervision.],
)
#detail-line(
  title: "Service",
  content: [Programme committee, Fictional Systems Symposium; placeholder review panel.],
)
#section-gap

#section("References")
#reference-list(references: (
  (
    name: "Professor Robin Sample",
    position: "Chair in Imaginary Systems",
    department: "School of Placeholder Studies",
    institution: "Exampleland University",
    address: "Sample City, Exampleland",
    email: "robin.sample@referee.invalid",
  ),
  (
    name: "Professor Taylor Demo",
    position: "Director, Simulated Policy Institute",
    department: "Department of Fictional Policy",
    institution: "Placeholder Institute",
    address: "Demo Harbour, Exampleland",
    email: "taylor.demo@referee.invalid",
  ),
))
