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


#let recipientgenerate(starttitle, jobtitle, date, department, university, address, postcode) = {
    align(left,{
        if department != [] {
        text(10pt,font: font_info, fill: subheadings_colour,weight: "bold", )[#department]
        }
        h(1fr)
        if date != "" {
        text(10pt,font: font_info, fill: primary_colour,weight: "light", )[#date\ ]
        } else {
        text(10pt,font: font_info, fill: primary_colour,weight: "light", )[ #datetime.today(offset: auto).display("[day] [month repr:long] [year]")\ ]
        }
        
        if university != [] {
        text(10pt,font: font_info, fill: subheadings_colour,weight: "bold", )[#university\ ]
        }

        if address != [] {
        text(10pt,font: font_info, fill: headings_colour,weight: "light", )[#address\ ]
        }
        if postcode != [] {
        text(10pt,font: font_info, fill: headings_colour,weight: "light", )[#postcode ]
        }
    })

    align(left, text(12pt,font: "Helvetica", fill: primary_colour,weight: "medium", )[#upper([Job Application for #jobtitle])])
    v(0.1em)
    set text(11pt,font: "Helvetica", fill: primary_colour, weight: "regular", )

    [#starttitle]

}

#let main(
    name: "",
    address: "",
    contacts: (),
    recipient: (
        starttitle: "",
        jobtitle: "",
        date: "",
        department: "",
        university: "",
        address: "",
        postcode: ""
    ),
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
        left: 2cm, 
        right: 2cm, 
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
)

// Add recipient details
recipientgenerate(recipient.starttitle, recipient.jobtitle, recipient.date, recipient.department, recipient.university, recipient.address, recipient.postcode)

set par(justify: true,first-line-indent: 2em,) 

set text(11pt,font: "Helvetica", fill: primary_colour, weight: "regular", )

mainbody

set text(11pt,font: font_info, fill: primary_colour, weight: "regular", )
[Sincerely,\ ]

[*#name*]
}