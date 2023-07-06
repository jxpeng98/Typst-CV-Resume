#let date_colour= rgb("#666666")
#let primary_colour= rgb("#2b2b2b")
#let headings_colour= rgb("#6A6A6A")
#let subheadings_colour= rgb("#333333")
// Set font type for all text
#let fonttype = "macfont"

#let font_head = {
    if fonttype == "macfont" {
        "Helvetica Neue"
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
    } else {
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
#let font_info = {
    if fonttype == "macfont" {
        "Helvetica"
    } else if fonttype == "openfont" {
        "PT Sans"
    } else {
        "Times New Roman"
    }
}

#let sectionsep = {
    [#v(5pt)]
}
#let subsectionsep = {
    [#v(2pt)]
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
#let main(
    name: "",
    address: "",
    lastupdated: "",
    date:"",
    contacts: (),
    mainbody,
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
mainbody

[Sincerely,\ ]

[*#name*]
}