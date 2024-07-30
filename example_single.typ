// #import "@local/modernpro-cv:1.0.0": *

#import "modernpro-cv.typ": *

#show: cv-single.with(
  font-type: "PT Serif",
  continue-header: "false",
  name: [#lorem(2)], //name:"" or name:[]
  address: [],
  lastupdated: "true",
  pagecount: "true",
  date: "2024-07-03",
  contacts: (
    (text: "08856", link: ""),
    (text: "example.com", link: "https://www.example.com"),
    (text: "github.com", link: "https://www.github.com"),
    (text: "123@example.com", link: "mailto:123@example.com"),
  )
)

// about
#section[about]
#descript[#lorem(50)]
#sectionsep
#section("Education")
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

#section("Skills")
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
  content: [Git, GitHub, Docker, AWS, Heroku, MongoDB, MySQL, PostgreSQL, Redis, Linux],
)
#sectionsep
// Award
#section("Awards")
#award(award: "Scholarship", date: "2018", institution: "University")
#award(award: "Prize", date: "2018", institution: "University")
#sectionsep
//Experience
#section("Experience")
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
#sectionsep
// Projects
#section("Projects")
#twoline-item(
  entry1: "Project 1",
  entry2: "Jan 2023",
  description: [#lorem(40)],
)

// project[#lorem(2)][Jan 2023][#lorem(40)]
// subsectionsep
// project[#lorem(2)][][
//   - #lorem(15)
//   - #lorem(15)
// ]
// subsectionsep
// project[#lorem(2)][][#lorem(40)]
// sectionsep
// Publication
#section("Publications")

+ @quenouille1949approximate
+ @quenouille1949approximate

// Reference
#section("References")
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

// Keep this at the end
#show bibliography: none
#bibliography("bib.bib", style: "chicago-author-date")