#let main(
  continue_header: "",
  name: "",
  address: "",
  lastupdated: "",
  pagecount: "",
  date: "",
  contacts: (),
  bibfile: (),
  mainbody,
) = {
  let date_colour = rgb("#666666")
  let primary_colour = rgb("#2b2b2b")
  let headings_colour = rgb("#6A6A6A")
  let subheadings_colour = rgb("#333333")

  // Set font type for all text
  let fonttype = "macfont"

  let font_head = {
    if fonttype == "macfont" {
      "Helvetica Neue"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }

  let font_section = {
    if fonttype == "macfont" {
      "Helvetica"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }

  let font_subsection = {
    if fonttype == "macfont" {
      "Helvetica"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }
  let font_term = {
    if fonttype == "macfont" {
      "Heiti TC"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }
  let font_descript = {
    if fonttype == "macfont" {
      "Heiti SC"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }

  let font_jobdetail = {
    if fonttype == "macfont" {
      "Helvetica"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }

  let font_info = {
    if fonttype == "macfont" {
      "Helvetica"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }

  let font_keyword = {
    if fonttype == "macfont" {
      "Helvetica"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }

  let font_bib = {
    if fonttype == "macfont" {
      "Helvetica"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }

  let font_award = {
    if fonttype == "macfont" {
      "Helvetica"
    } else if fonttype == "openfont" {
      "PT Sans"
    } else {
      "Times New Roman"
    }
  }

  let recepient(date, department, institution, address, postcode) = {
    align(
      left,
      {
        text(
          10pt,
          font: font_info,
          fill: subheadings_colour,
          weight: "bold",
        )[#department]
        h(1fr)
        text(10pt, font: font_info, fill: primary_colour, weight: "light")[#date\ ]
        text(
          10pt,
          font: font_info,
          fill: subheadings_colour,
          weight: "bold",
        )[#institution\ ]
        text(
          10pt,
          font: font_info,
          fill: headings_colour,
          weight: "light",
        )[#address\ ]
        text(
          10pt,
          font: font_info,
          fill: headings_colour,
          weight: "light",
        )[#postcode ]
      },
    )
  }
  // Section Headings (Education, Experience, etc)
  let section(title) = {
    text(
      12pt,
      font: font_section,
      fill: headings_colour,
      weight: "light",
    )[#upper[#title]\ ]
  }

  // Subsection Headings (institution, Company, etc)
  let subsection(content) = {
    text(
      11pt,
      font: font_subsection,
      fill: subheadings_colour,
      weight: "bold",
    )[#upper[#content] ]
  }

  let education(institution, major, period, location, detail) = {
    text(
      11pt,
      font: font_section,
      fill: subheadings_colour,
      weight: "bold",
    )[#upper[#institution] ]
    h(1fr)
    text(
      11pt,
      font: font_term,
      fill: headings_colour,
      weight: "medium",
    )[#period \ ]
    text(
      11pt,
      font: font_descript,
      fill: subheadings_colour,
      weight: "semibold",
    )[#major ]
    h(1fr)
    text(
      11pt,
      font: font_term,
      fill: headings_colour,
      weight: "medium",
    )[#location \ ]
    if detail != [] or detail != "" {
      text(11pt, font: font_info, fill: primary_colour, weight: "light")[#detail]
    }
  }

  // Time period and location
  let term(period, location) = {
    if location == [] or location == "" {
      text(
        9pt,
        font: font_term,
        fill: headings_colour,
        weight: "medium",
      )[#period ]
    } else {
      text(
        9pt,
        font: font_term,
        fill: headings_colour,
        weight: "medium",
      )[#period | #location ]
    }
  }

  // Projects
  let project(title, period, info) = {
    text(
      11pt,
      font: font_descript,
      fill: subheadings_colour,
      weight: "semibold",
    )[#title ]
    if period != [] or period != "" {
      h(1fr)
      text(
        11pt,
        font: font_term,
        fill: headings_colour,
        weight: "medium",
      )[#period \ ]
    } else {
      [\ ]
    }
    if info != [] or info != "" {
      text(11pt, font: font_info, fill: primary_colour, weight: "light")[#info ]
    }
  }
  // Description of a job, degree, etc
  let descript(content) = {
    text(
      11pt,
      font: font_descript,
      fill: subheadings_colour,
      weight: "semibold",
    )[#content ]
  }

  // Job title
  let jobtitle(firm, title, period, location) = {
    text(
      11pt,
      font: font_section,
      fill: subheadings_colour,
      weight: "bold",
    )[#upper[#firm] ]
    h(1fr)
    text(
      11pt,
      font: font_term,
      fill: headings_colour,
      weight: "medium",
    )[#period \ ]
    text(
      11pt,
      font: font_descript,
      fill: subheadings_colour,
      weight: "semibold",
    )[#title]
    h(1fr)
    text(
      11pt,
      font: font_term,
      fill: headings_colour,
      weight: "medium",
    )[#location]
  }

  //job details
  let jobdetail(content) = {
    text(
      11pt,
      font: font_jobdetail,
      fill: primary_colour,
      weight: "light",
      baseline: 0em,
    )[#set enum(tight: false, spacing: 0em, indent: 0em, body-indent: 0em)
      #content]
  }
  // Details
  let info(content) = {
    text(
      11pt,
      font: font_info,
      fill: primary_colour,
      weight: "light",
    )[#content\ ]
  }
  let sectionsep = {
    line(length: 100%, stroke: 0.1pt + primary_colour)
  }
  let subsectionsep = {
    [#v(0.5pt)]
  }

  let awarddetail(award, organise, time) = {
    text(
      11pt,
      font: font_award,
      fill: primary_colour,
      weight: "light",
    )[#award, #organise #h(1fr) #time\ ]
  }

  let reference(name, department, firm, address, email) = {
    align(
      left,
      {
        text(
          11pt,
          font: font_section,
          fill: subheadings_colour,
          weight: "semibold",
        )[#name\ ]
        text(
          10pt,
          font: font_term,
          fill: headings_colour,
          weight: "medium",
        )[#department\ ]
        text(
          10pt,
          font: font_term,
          fill: headings_colour,
          weight: "medium",
        )[#firm\ ]
        text(
          10pt,
          font: font_term,
          fill: headings_colour,
          weight: "medium",
        )[#address\ ]
        text(10pt, font: font_term, fill: headings_colour, weight: "medium")[#email]
      },
    )
  }
  let teaching(position, institution, detail) = {
    text(
      11pt,
      font: font_section,
      fill: subheadings_colour,
      weight: "bold",
    )[#upper[#institution]]
    text(
      11pt,
      font: font_descript,
      fill: subheadings_colour,
      weight: "semibold",
    )[ | #position \ ]
    if detail != [] or detail != "" {
      text(11pt, font: font_info, fill: primary_colour, weight: "light")[#detail]
    }
  }

  let reference2(name, department, firm, email) = {
    text(
      10pt,
      font: font_descript,
      fill: subheadings_colour,
      weight: "semibold",
    )[#name | #email\ ]
    text(
      10pt,
      font: font_term,
      fill: headings_colour,
      weight: "medium",
    )[#department, #firm\ ]
  }

  let biblist(contents) = {
    for ids in contents [
      #id.title (#id.year)
    ]
  }

  let keyword(content) = {
    text(
      9pt,
      font: font_info,
      fill: headings_colour,
      weight: "light",
    )[#content\ ]
  }
  // last update
  let lastupdate(lastupdated, date)= {
    if lastupdated == "true" {
      set text(8pt, font: font_info, fill: primary_colour, weight: "light")
      [Last updated: #date]
    }
  }

  // Publications
  let publication(path, styletype) = {
    set text(11pt, font: font_info, fill: primary_colour, weight: "light")
    bibliography(path, title: none, full: true, style: styletype)
  }

  // show contact details
  let display(contacts) = {
    set text(
      9pt,
      font: "Heiti TC",
      fill: headings_colour,
      weight: "medium",
      top-edge: "baseline",
      bottom-edge: "baseline",
      baseline: 2pt,
    )
    contacts.map(contact =>{
      if contact.link == none [
        contact.text
      ] else {
        link(contact.link)[#{ contact.text }]
      }
    }).join(" | ")
  }

  set page(footer: [
    #lastupdate(lastupdated, date)
    #h(1fr)
    #if pagecount == "true" {
      text(
        9pt,
        font: "Helvetica",
        fill: primary_colour,
        weight: "light",
      )[#counter(page).display("1 / 1", both: true)]
    }
  ])

  if continue_header == "true" {
    set page(
      margin: (left: 2cm, right: 2cm, top: 2.5cm, bottom: 1.5cm),
      header: {
        // Head Name Section
        text(
          20pt,
          font: "Helvetica Neue",
          fill: primary_colour,
          weight: "light",
          top-edge: "baseline",
          bottom-edge: "baseline",
          baseline: 11pt,
        )[#align(center, [#name])]
        v(2pt)
        // text(9pt,font:"Heiti TC",fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline")[#align(center,[#address])]
        align(center)[#display(contacts)]
        line(length: 100%, stroke: 0.5pt + primary_colour)
      },
      header-ascent: 1em,
    )
    mainbody
  } else {
    set page(margin: (left: 1.8cm, right: 1.8cm, top: 1cm, bottom: 1cm))
    text(
      20pt,
      font: "Helvetica Neue",
      fill: primary_colour,
      weight: "light",
      top-edge: "baseline",
      bottom-edge: "baseline",
      baseline: 11pt,
    )[#align(center, [#name])]
    v(2pt)
    // text(9pt,font:"Heiti TC",fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline")[#align(center,[#address])]
    align(center)[#display(contacts)]
    line(length: 100%, stroke: 0.5pt + primary_colour)
    mainbody
  }
  //Main Body
}
