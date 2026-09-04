#import "modernpro-cv.typ": *

// Canonical academic CV: single-column, print-friendly, and ATS-friendly.
// The only required argument is `profile`.
// Every person, place, institution, publication, identifier, and claim below
// is an explicit placeholder from the invented setting of Exampleland.
#show: cv.with(
  profile: (
    name: [Dr. Nova Placeholder],
    role: [Lecturer in Speculative Systems],
    address: [Sample City, Exampleland],
    contacts: (
      (text: [nova\@candidate.invalid], link: "mailto:nova@candidate.invalid"),
      (text: [nova.candidate.invalid], link: "https://nova.candidate.invalid"),
      (text: [Fictional ID~0000-0000], link: "https://registry.example.invalid/0000-0000"),
    ),
  ),
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
