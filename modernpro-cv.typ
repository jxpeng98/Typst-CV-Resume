///////////////////////////////
// modernpro-cv.typ
// A cover letter template with modern Sans font for job applications and other formal letters.
// Copyright (c) 2024
// Author:  Jiaxin Peng
// License: MIT
// Version: 0.0.1
// Date:    2024-04-29
// Email:   jiaxin.peng@outlook.com
///////////////////////////////

// Define the colour scheme
#let date_colour = rgb("#666666")
#let primary_colour = rgb("#2b2b2b")
#let headings_colour = rgb("#000000")
#let subheadings_colour = rgb("#333333")

#let sectionsep = {
  [#v(0.5pt)]
}

#let subsectionsep = {
  [#v(0.5pt)]
}

// Section Headings (Education, Experience, etc)
#let section(title) = {
  text(12pt, fill: headings_colour, weight: "bold")[
    #upper[#title]
    #v(-8pt)
    #line(length: 100%)
    #v(-5pt)]
}

// Subsection Headings (institution, Company, etc)
#let subsection(content) = {
  text(
    11pt,
    fill: subheadings_colour,
    weight: "bold",
  )[#upper[#content] ]
}

// Education part
#let education(
  institution: "",
  major: "",
  period: "",
  location: "",
  description: "",
) = {
  text(11pt, fill: subheadings_colour, weight: "bold")[#upper[#institution], #location]
  h(1fr)
  text(11pt, style: "italic", fill: headings_colour, weight: "regular")[#period \ ]
  text(11pt, style: "italic", fill: subheadings_colour, weight: "medium")[#major \ ]
  if description != [] or description != "" {
    text(11pt, fill: primary_colour, weight: "regular")[#description]
  }
}

// Projects
#let project(title, period, info) = {
  text(
    11pt,
    fill: subheadings_colour,
    weight: "semibold",
  )[#title ]
  if period != [] or period != "" {
    h(1fr)
    text(
      11pt,
      fill: headings_colour,
      weight: "medium",
    )[#period \ ]
  } else {
    [\ ]
  }
  if info != [] or info != "" {
    text(11pt, fill: primary_colour, weight: "light")[#info ]
  }
}

// Description of a job, degree, etc
#let descript(content) = {
  text(
    11pt,
    fill: subheadings_colour,
    weight: "regular",
  )[#content ]
}

// Job title
#let job(
  position: "",
  institution: "",
  location: "",
  date: "",
  description: "",
) = {
  text(
    11pt,
    fill: subheadings_colour,
    weight: "semibold",
  )[#upper[#position] ]
  h(1fr)
  text(
    11pt,
    style: "italic",
    fill: headings_colour,
    weight: "regular",
  )[#location \ ]
  text(
    11pt,
    style: "italic",
    fill: subheadings_colour,
    weight: "medium",
  )[#institution]
  h(1fr)
  text(
    11pt,
    style: "italic",
    fill: headings_colour,
    weight: "regular",
  )[#date]
  if description != [] or description != "" {
    text(11pt, fill: primary_colour, weight: "regular")[#description]
  }
}

// Details
#let info(content) = {
  text(
    11pt,
    fill: primary_colour,
    weight: "light",
  )[#content\ ]
}

#let oneline-item(
  title: "",
  content: "",
) = {
  text(
    11pt,
    fill: subheadings_colour,
    weight: "bold",
  )[#title: ]
  text(
    11pt,
    fill: primary_colour,
    weight: "light",
  )[#content \ ]
}

#let twoline-item(
  entry1: none,
  entry2: none,
  entry3: none,
  entry4: none,
  description: none,
) = {
  text(
    11pt,
    fill: subheadings_colour,
    weight: "semibold",
  )[#upper[#entry1]]
  if entry2 != none {
    h(1fr)
    text(
      11pt,
      style: "italic",
      fill: headings_colour,
      weight: "regular",
    )[#entry2 \ ]
  }
  if entry3 != [] or entry3 != ""!= none {
    text(
      11pt,
      style: "italic",
      fill: subheadings_colour,
      weight: "medium",
    )[#entry3]
  }
  if entry4 != none {
    h(1fr)
    text(
      11pt,
      style: "italic",
      fill: headings_colour,
      weight: "regular",
    )[#entry4]
  }
  if description != [] or description != "" {
    text(11pt, fill: primary_colour, weight: "regular")[#description]
  }
}


#let award(
  award: "",
  institution: "",
  date: "",
) = {
  text(
    11pt,
    fill: primary_colour,
    weight: "regular",
  )[#award, #emph(institution) #h(1fr) #emph(date)\ ]
}

#let teaching(position, institution, detail) = {
  text(
    11pt,
    fill: subheadings_colour,
    weight: "bold",
  )[#upper[#institution]]
  text(
    11pt,
    fill: subheadings_colour,
    weight: "semibold",
  )[ | #position \ ]
  if detail != [] or detail != "" {
    text(11pt, fill: primary_colour, weight: "light")[#detail]
  }
}

#let reference(name, department, firm, address, email) = {
  align(
    left,
    {
      text(
        11pt,
        fill: subheadings_colour,
        weight: "semibold",
      )[#name\ ]
      text(
        10pt,
        fill: headings_colour,
        weight: "medium",
      )[#department\ ]
      text(
        10pt,
        fill: headings_colour,
        weight: "medium",
      )[#firm\ ]
      text(
        10pt,
        fill: headings_colour,
        weight: "medium",
      )[#address\ ]
      text(10pt, fill: headings_colour, weight: "medium")[#email]
    },
  )
}
// Publications
#let publication(path, styletype) = {
  set text(11pt, fill: primary_colour, weight: "light")
  bibliography(path, title: none, full: true, style: styletype)
}

#let main(
  font-type: "",
  continue_header: "",
  name: "",
  address: "",
  lastupdated: "",
  pagecount: "",
  date: none,
  contacts: (),
  bibfile: (),
  mainbody,
) = {
  set text(font: font-type)

  if date == none {
    let date = [#datetime.today().display()]
  }

  // last update
  let lastupdate(lastupdated, date) = {
    if lastupdated == "true" {
      set text(8pt, style: "italic", fill: primary_colour, weight: "light")
      [Last updated: #date]
    }
  }

  // show contact details
  let display(contacts) = {
    set text(
      10pt,
      fill: headings_colour,
      weight: "regular",
      top-edge: "baseline",
      bottom-edge: "baseline",
      baseline: 2pt,
    )
    contacts
      .map(contact => {
          if contact.link == none [
            contact.text
          ] else {
            link(contact.link)[#{
                contact.text
              }]
          }
        })
      .join(" | ")
  }

  set page(footer: [
    #lastupdate(lastupdated, date)
    #h(1fr)
    #text(9pt, style: "italic", fill: primary_colour, weight: "light")[#name]
    #h(1fr)
    #if pagecount == "true" {
      text(
        9pt,
        style: "italic",
        fill: primary_colour,
        weight: "light",
      )[Page #counter(page).display("1 / 1", both: true)]
    }
  ])

  if continue_header == "true" {
    set page(
      margin: (left: 2cm, right: 2cm, top: 2.5cm, bottom: 1.5cm),
      header: {
        text(
          20pt,
          fill: primary_colour,
          weight: "bold",
          top-edge: "baseline",
          bottom-edge: "baseline",
          baseline: 11pt,
        )[#align(center, [#name])]
        v(2pt)
        align(center)[#display(contacts)]
        // line(length: 100%, stroke: 0.5pt + primary_colour)
      },
      header-ascent: 1em,
    )
    mainbody
  } else {
    set page(margin: (left: 1.8cm, right: 1.8cm, top: 1cm, bottom: 1cm))
    text(
      20pt,
      fill: primary_colour,
      weight: "bold",
      top-edge: "baseline",
      bottom-edge: "baseline",
      baseline: 11pt,
    )[#align(center, [#name])]
    v(2pt)
    align(center)[#display(contacts)]
    // line(length: 100%, stroke: 0.5pt + primary_colour)
    mainbody
  }
  //Main Body
}
