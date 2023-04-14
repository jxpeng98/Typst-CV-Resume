// This file will contain various templates for your papers in CV. You do not need to cite in the main boby. I plan to add more styles in the future.
#let date_colour= rgb("#666666")
#let primary_colour= rgb("#2b2b2b")
#let headings_colour= rgb("#6A6A6A")
#let subheadings_colour= rgb("#333333")

// Section Headings (Education, Experience, etc)
#let section(title) = {
    text(16pt,font: "PT Sans", fill: headings_colour, weight: "light", )[#upper[#title]\ ]
}

// Subsection Headings (University, Company, etc)
#let subsection(content) = {
    text(12pt,font: "PT Sans", fill: subheadings_colour,weight: "bold", )[#upper[#content]\ ]
}

// Time period and location
#let term(period, location) = {
    text(12pt,font: "PT Sans", fill: headings_colour, weight: "medium", )[#period | #location \ ]
}

// Description of a job, degree, etc
#let descript(content) = {
    text(12pt, font: "PT Sans", fill: subheadings_colour,weight: "medium",)[#content\ ]
    }

// Details
#let info(content) = {
    text(10pt,font: "PT Sans", fill: primary_colour,weight: "extralight", )[#content\ ]
}

#let sectionsep = { [#v(5pt)] }
#let subsectionsep = { [#v(2pt)]}

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

#let biblist(contents) = {
    for ids in contents [
        #id.title (#id.year)
    ]
}

// last update
#let lastupdate(lastupdated, date)= {
    if lastupdated == "true" {
        set text(10pt,font: "Helvetica", fill: primary_colour,weight: "light",)
        block(
            width: 100%,
            height: 1.5em,
            align(right,{[Last updated: #date]}),
        )
    }
}
#let main(
    name: "",
    address: "",
    lastupdated: "",
    date:"",
    contacts: (),
    bibfile: (),
    left,
    right,
) = {
set page(
    margin: (
        left: 1.25cm, 
        right: 1.25cm, 
        top: 0.7cm, 
        bottom: 1.5cm,
    ),
    footer: [
    #lastupdate(lastupdated, date)
    ],
)

// show contact details
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

// This can only works with Zotero JSON file. You can export your Zotero library as JSON file and then use this template to generate your publicatio in your CV.
#let chicago(contents) = {
    set text(10pt,font: "PT Sans", fill: primary_colour,weight: "light", )
  for i, id in contents {
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
    [" #id.title " #emph(id.container-title) ]
    if "volume" in id [#id.volume, ]
    if "issue" in id [no. #id.issue ]
    [(#id.issued.date-parts.at(0).first())]
    if "page" in id [ #id.page.] else[. ]
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
  for i, id in contents {
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