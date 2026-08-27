#import "modernpro-cv.typ": *
#import "@preview/fontawesome:0.6.2": fa-icon

// Render with: typst compile --input photo-style=flat|material|glass|harmonious|classic ...
// All people, institutions, publications, and claims in this example are fictional.
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
    text: [maya\@northbridge.example],
    link: "mailto:maya@northbridge.example",
  ),
  (
    icon: fa-icon("globe", solid: true, top-edge: "baseline"),
    text: [maya.example.org],
    link: "https://maya.example.org",
  ),
  (
    icon: fa-icon("orcid", top-edge: "baseline"),
    text: [ORCID~0000-0000-0000-0000],
    link: "https://orcid.org/0000-0000-0000-0000",
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
      #text(11pt, fill: tokens.monogram, weight: "bold")[MC]
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
    name: [Dr. Maya Chen],
    role: [Lecturer in Computational Social Science],
    address: [Edinburgh, United Kingdom],
    contacts: if variant == "classic" { classic-contacts } else { contacts },
    photo: harmonious-photo,
  )
} else {
  (
    name: [Dr. Maya Chen],
    role: [Lecturer in Computational Social Science],
    address: [Edinburgh, United Kingdom],
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
  options: (date: "2026-07-10"),
)

#section("Research Profile")
#summary[
  Computational social scientist studying how public institutions evaluate and
  govern data-intensive systems. My work combines audit studies, causal
  inference, and participatory design to make automated decisions more
  transparent and accountable.
]
#section-gap

#section("Academic Appointments")
#experience(
  title: "Lecturer in Computational Social Science",
  institution: [Northbridge University, School of Social and Political Science],
  location: "Edinburgh, UK",
  date: "2023-present",
  details: [
    - Lead the Civic AI Lab and supervise research on algorithmic accountability.
  ],
)
#experience(
  title: "Research Fellow in Digital Society",
  institution: [University of Wessex, Centre for Digital Society],
  location: "Bristol, UK",
  date: "2020-2023",
)
#section-gap

#section("Education")
#education(
  institution: [University of Wessex],
  major: [PhD in Information Studies],
  date: "2016-2020",
  location: "Bristol, UK",
  description: [Thesis: Auditing automated decisions in local public services.],
)
#education(
  institution: [Westford Institute of Technology],
  major: [MSc in Data Science, with distinction],
  date: "2014-2015",
  location: "Manchester, UK",
)
#section-gap

#section("Selected Publications")
#entry(
  title: [Governing high-stakes models through public audit],
  right: "2025",
  meta: [M. Chen and A. Rahman, Journal of Responsible Data 8(2)],
)
#entry(
  title: [When explanations change institutional decisions],
  right: "2023",
  meta: [M. Chen, L. Okafor, and J. Bell, Digital Government Review 12(4)],
)
#section-gap

#section("Research Funding")
#entry(
  title: [Trustworthy Civic AI],
  right: "2024-2027",
  meta: [Northland Research Council New Investigator Award; Principal Investigator],
  location: [GBP 318,000],
)
#section-gap

#section("Teaching and Service")
#detail-line(
  title: "Teaching",
  content: [Course lead for Computational Research Methods; MSc dissertation supervision.],
)
#detail-line(
  title: "Service",
  content: [Programme committee, Conference on Public Interest Technology; departmental ethics panel.],
)
#section-gap

#section("References")
#reference-list(references: (
  (
    name: "Professor Alice Morgan",
    position: "Chair in Digital Society",
    department: "School of Information",
    institution: "University of Wessex",
    address: "Bristol, United Kingdom",
    email: "alice.morgan@wessex.example",
  ),
  (
    name: "Professor Daniel Okafor",
    position: "Director, Civic Data Institute",
    department: "Department of Public Policy",
    institution: "Northbridge University",
    address: "Edinburgh, United Kingdom",
    email: "daniel.okafor@northbridge.example",
  ),
))
