// #import "@local/modernpro-cv:1.0.0": *

#import "modernpro-cv.typ": *
#import "@preview/fontawesome:0.6.0": *

#show: cv-single.with(
  font-type: "PT Serif",
  continue-header: "false",
  margin: (left: 1.75cm, right: 1.75cm, top: 2cm, bottom: 2cm),
  name: [#lorem(2)], //name:"" or name:[]
  address: [UK],
  lastupdated: "true",
  pagecount: "true",
  date: "2024-07-03",
  contacts: (
    (text: [#fa-icon("location-dot") UK]),
    (text: [#fa-icon("mobile") 123-456-789], link: "tel:123-456-789"),
    (text: [#fa-icon("link") example.com], link: "https://www.example.com"),
    (text: [#fa-icon("github") github], link: "https://github.com/"),
    (text: [#fa-icon("envelope") example\@example.com], link: "mailto:example@example.com"),
  ),
)

#let sections = (
  section-block("about", title: "About")[
    #descript[#lorem(50)]
  ],
  section-block("education", title: "Education", separator: false)[
    #education(
      institution: [#lorem(4)],
      major: [#lorem(2)],
      date: "xxxx-xxxx",
      location: "UK",
      description: [
        - #lorem(10),
        - #lorem(10),
        - #lorem(10),
      ],
    )

    #education(
      institution: [#lorem(4)],
      major: [#lorem(2)],
      date: "xxxx-xxxx",
      location: "UK",
    )
  ],
  section-block("skills", title: "Skills")[
    #oneline-title-item(
      title: "Programming Languages",
      content: [Python, C++, Java, JavaScript, HTML, CSS, SQL, LaTeX],
    )
    #oneline-title-item(
      title: "Frameworks",
      content: [React, Node.js, Express, Flask, Django, Bootstrap, jQuery],
    )
    #oneline-title-item(
      title: "Tools",
      content: [
        Git,
        GitHub,
        Docker,
        AWS,
        Heroku,
        MongoDB,
        MySQL,
        PostgreSQL,
        Redis,
        Linux,
      ],
    )
  ],
  section-block("awards", title: "Awards")[
    #award(award: "Scholarship", date: "2018", institution: "University")
    #award(award: "Prize", date: "2018", institution: "University")
  ],
  section-block("experience", title: "Experience")[
    #job(
      position: "Software Engineer",
      institution: [#lorem(4)],
      location: "UK",
      date: "xxxx-xxxx",
      description: [
        - #lorem(10),
        - #lorem(10),
        - #lorem(10),
      ],
    )
    #subsectionsep
    #job(
      position: "Software Engineer",
      institution: [#lorem(4)],
      location: "UK",
      date: "xxxx-xxxx",
    )
  ],
  section-block("projects", title: "Projects", separator: false)[
    #twoline-item(
      entry1: "Project 1",
      entry2: "Jan 2023",
      description: [#lorem(40)],
    )
  ],
  section-block("publications", title: "Publications", separator: false)[
    + @singh1981asymptotic
    + @singh1981asymptotic
  ],
  section-block("references", title: "References", separator: false)[
    #references(references: (
      (
        name: "Dr. John Doe",
        position: "Professor",
        department: "Computer Science",
        institution: "University",
        address: "123 Street, City, Country",
        email: "john.doe@university.edu",
      ),
      (
        name: "Dr. John Doe",
        department: "Computer Science",
        institution: "University",
        address: "123 Street, City, Country",
        email: "john.doe@university.edu",
      ),
      (
        name: "Dr. John Doe",
        position: "Professor",
        department: "Computer Science",
        institution: "University",
        address: "123 Street, City, Country",
        email: "john.doe@university.edu",
      ),
    ))
  ],
)

#let section-order = (
  "about",
  "experience",
  "projects",
  "education",
  "skills",
  "awards",
  "publications",
  "references",
)

#render-sections(sections: sections, order: section-order)

// Keep this at the end
#show bibliography: none
#bibliography("bib.bib", style: "chicago-author-date")
