#import "modernpro-cv-legacy.typ": *
// Remember to set the fonttype in `typstcv.typ`

#cv-double-legacy(
  name: [#lorem(2)], //name:"" or name:[]
  address: [#lorem(4)],
  lastupdated: "true",
  date: "20ZZ.01.01",
  contacts: (
    (text: "00000", link: ""),
    (text: "site.candidate.invalid", link: "https://site.candidate.invalid"),
    (text: "profile.candidate.invalid", link: "https://profile.candidate.invalid"),
    (text: "name@candidate.invalid", link: "mailto:name@candidate.invalid"),
  ),
  [ // Left
    //About
    #section("About")
    #descript[#lorem(50)]
    #sectionsep
    #section("Education")
    #subsection[#lorem(4)\ ]
    #term[xxxx-xxxx][Exampleland]
    #subsectionsep
    #subsection[#lorem(4)\ ]
    #term[xxxx-xxxx][Exampleland]
    #sectionsep
    #section("Skills")
    #descript("Fictional Languages")
    #info[Language Alpha, Language Beta, Language Gamma, Language Delta]
    #subsectionsep
    #descript("Frameworks")
    #info[Framework Alpha, Framework Beta, Framework Gamma]
    #subsectionsep
    #descript("Tools")
    #info[Tool Alpha, Tool Beta, Tool Gamma, Tool Delta]
    #sectionsep
    // Award
    #section("Awards")
    #awarddetail[20YY][Fictional Scholarship][Exampleland University]
    #awarddetail[20YX][Sample Grant][Placeholder Organisation]
    #awarddetail[20YW][Fictional Scholarship][Exampleland University]
    #sectionsep ],
  [ // Right
    //Experience
    #section("Experience")
    #jobtitle[#lorem(4)][#lorem(2)][xxxx-xxxx][Exampleland]
    #jobdetail[
      - #lorem(10)
      - #lorem(10)
      - #lorem(10)
      - #lorem(10)
    ]
    #subsectionsep
    #jobtitle[#lorem(4)][#lorem(2)][xxxx-xxxx][\ ]
    #jobdetail[#lorem(30)]
    #subsectionsep
    // Projects
    #section("Projects")
    #descript[#lorem(2)]
    #info[#lorem(40)]
    #subsectionsep
    #descript[#lorem(2)]
    #info[#lorem(40)]
    #subsectionsep
    #descript[#lorem(2)]
    #info[#lorem(40)]
    #sectionsep
    // Publication
    #section("Publications")
    #publication(path("bib.bib"), "chicago-author-date") ],
)
