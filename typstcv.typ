#let date_colour= rgb("#666666")
#let primary_colour= rgb("#2b2b2b")
#let headings_colour= rgb("#6A6A6A")
#let subheadings_colour= rgb("#333333")


// Section Headings (Education, Experience, etc)
#let section(title) = {
    text(16pt,font: "Helvetica", fill: headings_colour, weight: "light", )[#upper[#title]\ ]
}

// Subsection Headings (University, Company, etc)
#let subsection(content) = {
    text(11pt,font: "Helvetica", fill: subheadings_colour,weight: "bold", )[#upper[#content]\ ]
}

// Time period and location
#let term(period, location) = {
    text(10pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#period | #location \ ]
}

// Description of a job, degree, etc
#let descript(content) = {
    text(10pt, font: "Heiti SC", fill: subheadings_colour,weight: "semibold",)[#content\ ]
    }

// Details
#let info(content) = {
    text(10pt,font: "Helvetica", fill: primary_colour,weight: "light", )[#content\ ]
}
#let sectionsep = {
    [#v(5pt)]
}
#let subsectionsep = {
    [#v(2pt)]
}

#let awarddetail(time,award,organise) = {
    set text(10pt,font: "Helvetica", fill: primary_colour,weight: "light",top-edge: "baseline",bottom-edge: "baseline",baseline: 0pt)
    grid(
        columns: (1fr,1fr,1fr),
        gutter: 0em,
        time,
        award,
        organise,
    )
}

#let main(
    name: "",
    address: "",
    contacts: (),
    bibfile: "",
    left,
    right,
) = {
set page(
    margin: (
    left: 1.25cm, 
    right: 1.25cm, 
    top: 0.7cm, 
    bottom: 1.5cm
  )
)

let display(contacts) = {
    set text(11pt,font:"Heiti TC",fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline",baseline: 2pt)
    contacts.map(contact =>{
        if contact.link == none [
            contact.text
        ] else {
            link(contact.link)[#{contact.text}]
    }
    }
    ).join(" | ")
    }
// let ref = {

//     [#bibliography(bibfile)]
// }
// Head Name Section
    text(25pt,font:"Helvetica",fill:primary_colour, weight:"light",top-edge:"baseline",bottom-edge:"baseline",baseline: 12pt)[#align(center,[#name])]
    text(12pt,font:"Heiti TC",fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline")[#align(center,[#address])]
    align(center)[#display(contacts)]
    [#line(length: 100%, stroke:0.5pt + primary_colour)]    

//Main Body 
grid(
    columns: (1fr,2fr),
    column-gutter: 2em,
    left,
    right,
  )
}