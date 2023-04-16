#let date_colour= rgb("#666666")
#let primary_colour= rgb("#2b2b2b")
#let headings_colour= rgb("#6A6A6A")
#let subheadings_colour= rgb("#333333")
// Set font type for all text
#let fonttype = ""

#let font_head = {
    if fonttype == "macfont" {
        "Helvetica Neue"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}

#let font_section = {
    if fonttype == "macfont" {
     "Helvetica"
    } else if fonttype == "openfont" {
     "PT Sans"
    } else {
        "Times New Roman"
    }
}

#let font_subsection = {
    if fonttype == "macfont" {
        "Helvetica"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}
#let font_term = {
    if fonttype == "macfont" {
        "Heiti TC"
    } else if fonttype == "openfont" {
        "PT Sans"
    }  else {
        "Times New Roman"
    }
}
#let font_descript = {
    if fonttype == "macfont" {
        "Heiti SC"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}

#let font_jobdetail = {
    if fonttype == "macfont" {
        "Helvetica"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}

#let font_info = {
    if fonttype == "macfont" {
        "Helvetica"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}

#let font_keyword = {
    if fonttype == "macfont" {
        "Helvetica"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}

#let font_bib = {
    if fonttype == "macfont" {
        "Helvetica"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}

#let font_award = {
    if fonttype == "macfont" {
        "Helvetica"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}

// Section Headings (Education, Experience, etc)
#let section(title) = {
    text(16pt,font: font_section, fill: headings_colour, weight: "light", )[#upper[#title]\ ]
}

// Subsection Headings (University, Company, etc)
#let subsection(content) = {
    text(12pt,font: font_subsection, fill: subheadings_colour,weight: "bold", )[#upper[#content] ]
}

// Time period and location
#let term(period, location) = {
    if location == [] or location == "" {
        text(10pt,font: font_term, fill: headings_colour, weight: "medium", )[#period\ ]
    } else {
        text(10pt,font: font_term, fill: headings_colour, weight: "medium", )[#period | #location \ ]
    }
}
// Description of a job, degree, etc
#let descript(content) = {
    text(12pt, font: font_descript, fill: subheadings_colour,weight: "semibold",)[#content\ ]
    }
// Job title
#let jobtitle(firm, title) = {
    text(12pt,font: font_subsection, fill: subheadings_colour,weight: "bold", )[#upper[#firm] ] 
    text(12pt, font: font_descript, fill: subheadings_colour,weight: "semibold",)[| #title\ ]
    }
//job details
#let jobdetail(content) = {
    text(10pt,font: font_info, fill: primary_colour,weight: "light", baseline: 0em )[#set enum(tight:false,spacing:0em,indent: 0em, body-indent: 0em)
    #content ]
}
// Details
#let info(content) = {
    text(11pt,font: font_info, fill: primary_colour,weight: "light", )[#content\ ]
}
#let sectionsep = {
    [#v(5pt)]
}
#let subsectionsep = {
    [#v(2pt)]
}

#let awarddetail(time,award,organise) = {
    set text(10pt,font: font_award, fill: primary_colour,weight: "light",top-edge: "baseline",bottom-edge: "baseline",baseline: 0pt)
    grid(
        columns: (auto,auto,auto),
        gutter: 1em,
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
#let keyword(content) = {
        text(12pt, font: font_keyword, fill: headings_colour,weight: "light",)[#content\ ]
}
// last update
#let lastupdate(lastupdated, date)= {
    if lastupdated == "true" {
        set text(10pt,font: font_info, fill: primary_colour,weight: "light",)
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
// show contact details
let display(contacts) = {
    set text(11pt,font:font_term,fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline",baseline: 2pt)
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
    margin: (
        left: 1.25cm, 
        right: 1.25cm, 
        top: 3.2cm, 
        bottom: 1.5cm,
    ),
    header:{
    // Head Name Section
    text(25pt,font: font_head,fill:primary_colour, weight:"light",top-edge:"baseline",bottom-edge:"baseline",baseline: 12pt)[#align(center,[#name])]
    text(11pt,font:font_descript,fill:headings_colour, weight: "medium",top-edge:"baseline",bottom-edge:"baseline")[#align(center,[#address])]
    align(center)[#display(contacts)]
    line(length: 100%, stroke:0.5pt + primary_colour)   
    },
    header-ascent: 1em,
    footer: [
    #lastupdate(lastupdated, date)
    ],
)
//Main Body 
grid(
    columns: (1fr,2fr),
    column-gutter: 2em,
    left,
    right,
  )
}


// Chicago style
// Ball, Ray, Joseph Gerakos, Juhani T. Linnainmaa, and Valeri Nikolaev. "Earnings, retained earnings, and book-to-market in the cross section of expected returns." Journal of Financial Economics 135, no. 1 (2020): 231-254.
// Sumiyana, Sumiyana. "Different characteristics of the aggregate of accounting earnings between developed and developing countries: Evidence for predicting future GDP." Journal of international studies 13, no. 1 (2020): 58-80.
#let chicago(contents) = {
    set text(10pt,font: font_bib, fill: primary_colour,weight: "light", )
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
    set text(10pt,font: font_bib, fill: primary_colour,weight: "light", )
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