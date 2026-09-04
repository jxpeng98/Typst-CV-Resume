#import "modernpro-cv-legacy.typ": *

// Remember to set the fonttype in `modernpro-cv-legacy.typ`

#show: mainbody => coverletter-legacy(
  name: [#lorem(2)], //name:"" or name:[]
  address: [#lorem(4)],
  contacts: (
    (text: "00000", link: ""),
    (text: "site.candidate.invalid", link: "https://site.candidate.invalid"),
    (text: "profile.candidate.invalid", link: "https://profile.candidate.invalid"),
    (text: "name@candidate.invalid", link: "mailto:name@candidate.invalid"),
  ),
  recipient: (
    starttitle: "Dear",
    jobtitle: "Hiring Manager",
    date: "",
    department: [#lorem(2)],
    university: [#lorem(2)],
    address: [#lorem(4)],
    postcode: [#lorem(1)],
  ),
  mainbody,
)

#lorem(300)

#lorem(100)
