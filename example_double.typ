#import "modernpro-cv.typ": *
#import "@preview/fontawesome:0.6.2": fa-icon

// Compact two-column variant. Prefer cv-single for a full academic CV or ATS use.
// Remove the Font Awesome import and each `icon` field for a text-only header.
// All people, institutions, publications, and claims in this example are fictional.
#show: cv.with(
  columns: 2,
  profile: (
    name: [Dr. Maya Chen],
    role: [Lecturer in Computational Social Science],
    address: [Edinburgh, United Kingdom],
    contacts: (
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
    ),
  ),
  options: (date: "2026-07-10"),
  left: [
    #section("Research Focus")
    #summary[
      Algorithmic accountability, digital government, and the evaluation of
      automated decisions in public institutions.
    ]
    #section-gap

    #section("Methods")
    #detail-line(
      title: "Quantitative",
      content: [causal inference, audit studies, survey experiments],
    )
    #detail-line(
      title: "Qualitative",
      content: [participatory design, interviews, policy analysis],
    )
    #detail-line(
      title: "Tools",
      content: [Python, R, SQL, Typst],
    )
    #section-gap

    #section("Awards")
    #award(
      award: "Early Career Research Prize",
      institution: "Northbridge University",
      date: "2024",
    )
    #award(
      award: "Doctoral Research Fellowship",
      institution: "University of Wessex",
      date: "2016-2020",
    )
    #section-gap

    #section("Teaching and Service")
    #detail-line(
      title: "Teaching",
      content: [Computational Research Methods; MSc dissertation supervision],
    )
    #detail-line(
      title: "Service",
      content: [public interest technology programme committee; departmental ethics panel],
    )
  ],
  right: [
    #section("Academic Appointments")
    #experience(
      title: "Lecturer in Computational Social Science",
      institution: [Northbridge University],
      location: "Edinburgh, UK",
      date: "2023-present",
      details: [
        - Lead the Civic AI Lab and supervise research on algorithmic accountability.
      ],
    )
    #experience(
      title: "Research Fellow in Digital Society",
      institution: [University of Wessex],
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
      meta: [Northland Research Council; Principal Investigator],
      location: [GBP 318,000],
    )
    #section-gap

    #section("Selected Talks")
    #entry(
      title: [Auditing automated decisions in local government],
      right: "2025",
      meta: [Centre for Data and Democracy Annual Lecture, London],
    )
    #entry(
      title: [What public-sector model cards leave out],
      right: "2024",
      meta: [European Digital Governance Workshop, Rotterdam],
    )
  ],
)
