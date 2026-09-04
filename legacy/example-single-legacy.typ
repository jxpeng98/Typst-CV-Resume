#import "modernpro-cv-legacy.typ": *

// select the font type: "macfont" or "openfont"
#let fonttype = "macfont"
#show: mainbody => cv-single-legacy(
  continue_header: "false",
  name: [#lorem(2)], //name:"" or name:[]
  address: [#lorem(4)],
  lastupdated: "true",
  pagecount: "true",
  date: "20ZZ.01.01",
  contacts: (
    (text: "00000"),
    (text: "site.candidate.invalid", link: "https://site.candidate.invalid"),
    (text: "profile.candidate.invalid", link: "https://profile.candidate.invalid"),
    (text: "name@candidate.invalid", link: "mailto:name@candidate.invalid"),
  ),
  bibfile: [bib.json],
  mainbody,
)

//About
#section("About")
#descript[#lorem(50)]
#sectionsep
#section("Education")
#education[#lorem(4)][#lorem(2)][xxxx-xxxx][Exampleland][Core Modules: #lorem(10)]\
#education[#lorem(4)][#lorem(2)][xxxx-xxxx][Exampleland][]
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
#sectionsep
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
#jobtitle[#lorem(4)][#lorem(2)][xxxx-xxxx][Exampleland]
#jobdetail[#lorem(30)]
#sectionsep
// Projects
#section("Projects")
#project[#lorem(2)][Imaginarymonth 20ZZ][#lorem(40)]
#subsectionsep
#project[#lorem(2)][][
  - #lorem(15)
  - #lorem(15)
]
#subsectionsep
#project[#lorem(2)][][#lorem(40)]
#sectionsep
// Publication
#section("Publications")
#publication(path("bib.bib"), "chicago-author-date")
