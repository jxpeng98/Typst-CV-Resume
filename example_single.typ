#import "modernpro-cv.typ": *

// Canonical academic CV: single-column, print-friendly, and ATS-friendly.
// The only required argument is `profile`.
// All people, institutions, publications, and claims in this example are fictional.
#show: cv.with(
  profile: (
    name: [Dr. Maya Chen],
    role: [Lecturer in Computational Social Science],
    address: [Edinburgh, United Kingdom],
    contacts: (
      (text: [maya\@northbridge.example], link: "mailto:maya@northbridge.example"),
      (text: [maya.example.org], link: "https://maya.example.org"),
      (text: [ORCID~0000-0000-0000-0000], link: "https://orcid.org/0000-0000-0000-0000"),
    ),
  ),
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
