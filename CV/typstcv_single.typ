#let date_colour= rgb("#666666")
#let primary_colour= rgb("#2b2b2b")
#let headings_colour= rgb("#6A6A6A")
#let subheadings_colour= rgb("#333333")

#let recepient(date, department, university,address, postcode) = {
    align(left,{
        text(10pt,font: "Helvetica", fill: subheadings_colour,weight: "bold", )[#department]
        h(1fr)
        text(10pt,font: "Helvetica", fill: primary_colour,weight: "light", )[#date\ ]
        text(10pt,font: "Helvetica", fill: subheadings_colour,weight: "bold", )[#university\ ]
        text(10pt,font: "Helvetica", fill: headings_colour,weight: "light", )[#address\ ]
        text(10pt,font: "Helvetica", fill: headings_colour,weight: "light", )[#postcode ]
    }
    )
}
// Section Headings (Education, Experience, etc)
#let section(title) = {
    text(12pt,font: "Helvetica", fill: headings_colour,weight: "light", )[#upper[#title]\ ]
}

// Subsection Headings (University, Company, etc)
#let subsection(content) = {
    text(11pt,font: "Helvetica", fill: subheadings_colour,weight: "bold", )[#upper[#content] ]
}

#let education(university, major, period, location, detail) = {
    text(11pt,font: "Helvetica", fill: subheadings_colour,weight: "bold", )[#upper[#university] ]
    h(1fr) 
    text(11pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#period \ ]
    text(11pt, font: "Heiti SC", fill: subheadings_colour,weight: "semibold",)[#major ]
    h(1fr)
    text(11pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#location \ ]
    if detail != [] or detail != "" {
        text(11pt,font: "Helvetica", fill: primary_colour,weight: "light", )[#detail]
    }
    }
// Time period and location
#let term(period, location) = {
    if location == [] or location == "" {
        text(9pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#period ]
    } else {
        text(9pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#period | #location  ]
    }
}
// Projects
#let project(title, period, info) = {
    text(11pt, font: "Heiti SC", fill: subheadings_colour,weight: "semibold",)[#title ]
    if period != [] or period != "" {
        h(1fr)
        text(11pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#period \ ]
    } else {
        [\ ]
    }
    if info != [] or info != "" {
        text(11pt,font: "Helvetica", fill: primary_colour,weight: "light", )[#info ]
    }
}
// Description of a job, degree, etc
#let descript(content) = {
    text(11pt, font: "Heiti SC", fill: subheadings_colour,weight: "semibold",)[#content ]
    }
// Job title
#let jobtitle(firm, title, period, location) = {
    text(11pt,font: "Helvetica", fill: subheadings_colour,weight: "bold", )[#upper[#firm] ]
    h(1fr) 
    text(11pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#period \ ]
    text(11pt, font: "Heiti SC", fill: subheadings_colour,weight: "semibold",)[#title]
    h(1fr)
    text(11pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#location]
    }
//job details
#let jobdetail(content) = {
    text(11pt,font: "Helvetica", fill: primary_colour,weight: "light", baseline: 0em )[#set enum(tight:false,spacing:0em,indent: 0em, body-indent: 0em)
    #content ]
}
// Details
#let info(content) = {
    text(11pt,font: "Helvetica", fill: primary_colour,weight: "light", )[#content\ ]
}
#let sectionsep = {
    line(length: 100%, stroke:0.1pt + primary_colour)
}
#let subsectionsep = {
    [#v(0.5pt)]
}

#let awarddetail(award,organise,time) = {
    text(11pt,font: "Helvetica", fill: primary_colour,weight: "light")[#award, #organise #h(1fr) #time\ ]
}
#let reference(name, department, firm, address, email) = {
    align(left,{text(11pt, font: "Heiti SC", fill: subheadings_colour,weight: "semibold",)[#name\ ]
    text(10pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#department\ ]
    text(10pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#firm\ ]
    text(10pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#address\ ]
    text(10pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#email]})
    
}
#let teaching(position, university, detail) = {
    text(11pt,font: "Helvetica", fill: subheadings_colour,weight: "bold", )[#upper[#university]] 
    text(11pt, font: "Heiti SC", fill: subheadings_colour,weight: "semibold",)[ | #position \ ]   
    if detail != [] or detail != "" {
        text(11pt,font: "Helvetica", fill: primary_colour,weight: "light", )[#detail]
    }
}

#let reference2(name, department, firm, email) = {
    text(10pt, font: "Heiti SC", fill: subheadings_colour,weight: "semibold",)[#name | #email\ ]
    text(10pt,font: "Heiti TC", fill: headings_colour, weight: "medium", )[#department, #firm\ ]
    }
#let biblist(contents) = {
    for ids in contents [
        #id.title (#id.year)
    ]
}
#let keyword(content) = {
        text(9pt, font: "Helvetica", fill: headings_colour,weight: "light",)[#content\ ]
}
// last update
#let lastupdate(lastupdated, date)= {
    if lastupdated == "true" {
        set text(8pt,font: "Helvetica", fill: primary_colour,weight: "light",)
        [Last updated: #date]
        }
    }
#let main(
    continue_header: "",
    name: "",
    address: "",
    lastupdated: "",
    pagecount: "",
    date:"",
    contacts: (),
    bibfile: (),
    mainbody,
) = {
// show contact details
let display(contacts) = {
    set text(9pt,font:"Heiti TC",fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline",baseline: 2pt)
    contacts.map(contact =>{
        if contact.link == none [
            contact.text
        ] else {
            link(contact.link)[#{contact.text}]
    }
    }
    ).join(" | ")
}
 
set page(
    footer: [
    #lastupdate(lastupdated, date)
    #h(1fr)
    #if pagecount == "true" {
        text(9pt,font: "Helvetica", fill: primary_colour,weight: "light",)[#counter(page).display("1 / 1", both: true,)]
    }
    ],
)

if continue_header == "true" {
    set page(
        margin: (
        left: 2cm, 
        right: 2cm, 
        top: 2.5cm, 
        bottom: 1.5cm,
        ),
        header:{
            // Head Name Section
        text(20pt,font:"Helvetica Neue",fill:primary_colour, weight:"light",top-edge:"baseline",bottom-edge:"baseline",baseline: 11pt)[#align(center,[#name])]
        v(2pt)
        // text(9pt,font:"Heiti TC",fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline")[#align(center,[#address])]
        align(center)[#display(contacts)]
        line(length: 100%, stroke:0.5pt + primary_colour)   
        },
        header-ascent: 1em,
        )
    mainbody
} else {
    set page(
        margin: (
        left: 1.8cm, 
        right: 1.8cm, 
        top: 1cm, 
        bottom: 1cm,
        ),
    )
    text(20pt,font:"Helvetica Neue",fill:primary_colour, weight:"light",top-edge:"baseline",bottom-edge:"baseline",baseline: 11pt)[#align(center,[#name])]
    v(2pt)
    // text(9pt,font:"Heiti TC",fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline")[#align(center,[#address])]
    align(center)[#display(contacts)]
    line(length: 100%, stroke:0.5pt + primary_colour)
    mainbody
}
//Main Body 
}


// Chicago style
// Ball, Ray, Joseph Gerakos, Juhani T. Linnainmaa, and Valeri Nikolaev. "Earnings, retained earnings, and book-to-market in the cross section of expected returns." Journal of Financial Economics 135, no. 1 (2020): 231-254.
// Sumiyana, Sumiyana. "Different characteristics of the aggregate of accounting earnings between developed and developing countries: Evidence for predicting future GDP." Journal of international studies 13, no. 1 (2020): 58-80.
#let chicago(contents) = {
    set text(10pt,font: "Helvetica", fill: primary_colour,weight: "light", )
  for (i, id) in contents.enumerate() {
    grid(
        columns: (auto,auto),
        column-gutter: 0.4em, 
         {"[" 
         str(i+1)
         "]"},{
    for author in id.author {
        if author.len() == 1 [
        #author.at("family"), #author.at("given").
        ] else {
            if author.at("family") == id.author.first().at("family") [
                #author.at("family"), #author.at("given")
            ] else if author.at("family") == id.author.last().at("family") [
                and #author.at("given"), #author.at("family").
            ] else [
                #author.at("given"), #author.at("family"),
            ]
        }
        }
    [\" #id.title.\" #emph(id.container-title) ]
    if "volume" in id [#id.volume, ]
    if "issue" in id [no. #id.issue ]
    [(#id.issued.date-parts.at(0).first())]
    if "page" in id [: #id.page.] else[. ]
    if "DOI" in id and "URL" in id {
        [doi: ] 
        emph(link(id.DOI))
        [\ ]
        } else if "URL" in id {
        [url: ] 
        emph(link(id.URL))
        [\ ]
        } else if "DOI" in id {
        [doi: ] 
        emph(link(id.DOI))
        [\ ]
        }
         }
    )
    }
  }
// APA style
// Ball, R., Gerakos, J., Linnainmaa, J. T., & Nikolaev, V. (2020). Earnings, retained earnings, and book-to-market in the cross section of expected returns. Journal of Financial Economics, 135(1), 231-254.
// Sumiyana, S. (2020). Different characteristics of the aggregate of accounting earnings between developed and developing countries: Evidence for predicting future GDP. Journal of international studies, 13(1), 58-80.
#let apa(contents) = {
    set text(10pt,font: "Helvetica", fill: primary_colour,weight: "light", )
  for (i, id) in contents.enumerate() {
    grid(
        columns: (auto,auto),
        column-gutter: 0.4em, 
        row-gutter: 0em, 
         {"[" 
         str(i+1)
         "]"},{
    for author in id.author {
        if author.len() == 1 [
        #author.at("family"), #author.at("given").first().
        ] else {
            if author.at("family") == id.author.first().at("family") [
                #author.at("family"), #author.at("given").first().,
            ] else if author.at("family") == id.author.last().at("family") [
                & #author.at("family"), #author.at("given").first(). 
            ] else [
                 #author.at("family"), #author.at("given").first().,
            ]
        }
        }
            [(#id.issued.date-parts.at(0).first()). ]
    [ #id.title. #emph(id.container-title)]
    if "volume" in id [, #id.volume]
    if "issue" in id [(#id.issue)]
    if "page" in id [, #id.page.] else[. ]
    if "DOI" in id and "URL" in id {
        [ doi: ] 
        emph(link(id.DOI))
        [\ ]
        } else if "URL" in id {
        [url: ] 
        emph(link(id.URL))
        [\ ]
        } else if "DOI" in id {
        [doi: ] 
        emph(link(id.DOI))
        [\ ]
        }
         }
    )
    }
}