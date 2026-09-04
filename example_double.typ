#import "modernpro-cv.typ": *
#import "@preview/fontawesome:0.6.2": fa-icon

// Compact two-column variant. Prefer cv-single for a full academic CV or ATS use.
// Remove the Font Awesome import and each `icon` field for a text-only header.
// Every person, place, institution, publication, identifier, and claim below
// is an explicit placeholder from the invented setting of Exampleland.
#show: cv.with(
  columns: 2,
  profile: (
    name: [Dr. Nova Placeholder],
    role: [Lecturer in Speculative Systems],
    address: [Sample City, Exampleland],
    contacts: (
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
    ),
  ),
  options: (date: "20ZZ-01-01"),
  left: [
    #section("Research Focus")
    #summary[
      Simulated accountability, imaginary governance, and the evaluation of
      hypothetical decision engines in Exampleland.
    ]
    #section-gap

    #section("Methods")
    #detail-line(
      title: "Quantitative",
      content: [synthetic trials, mock audits, generated surveys],
    )
    #detail-line(
      title: "Qualitative",
      content: [staged workshops, fictional interviews, sample-policy analysis],
    )
    #detail-line(
      title: "Tools",
      content: [Tool Alpha, Tool Beta, Tool Gamma, Tool Delta],
    )
    #section-gap

    #section("Awards")
    #award(
      award: "Early Career Fictional Prize",
      institution: "Exampleland University",
      date: "20YY",
    )
    #award(
      award: "Placeholder Doctoral Fellowship",
      institution: "Placeholder Institute",
      date: "20XS-20XW",
    )
    #section-gap

    #section("Teaching and Service")
    #detail-line(
      title: "Teaching",
      content: [Speculative Research Methods; sample-project supervision],
    )
    #detail-line(
      title: "Service",
      content: [fictional systems programme committee; placeholder review panel],
    )
  ],
  right: [
    #section("Academic Appointments")
    #experience(
      title: "Lecturer in Speculative Systems",
      institution: [Exampleland University],
      location: "Sample City, Exampleland",
      date: "20XY-present",
      details: [
        - Lead the Placeholder Systems Lab and supervise entirely simulated studies.
      ],
    )
    #experience(
      title: "Research Fellow in Imaginary Governance",
      institution: [Placeholder Institute],
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

    #section("Selected Talks")
    #entry(
      title: [Auditing imaginary decisions in Sample City],
      right: "20YY",
      meta: [Centre for Simulated Democracy Annual Lecture, Placeholder Bay],
    )
    #entry(
      title: [What fictional model cards leave out],
      right: "20YX",
      meta: [Exampleland Workshop on Imaginary Governance, Demo Harbour],
    )
  ],
)
