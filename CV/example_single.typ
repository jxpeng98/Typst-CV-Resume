#import "typstcv_single.typ": *
// TODO: add more bibstyle and try to use yaml and xml to replace json
//
// select the font type: "macfont" or "openfont"
#let fonttype = "macfont"
#show: mainbody => main(
continue_header: "false",
name: [#lorem(2)], //name:"" or name:[]
address: [#lorem(4)],
lastupdated: "true",
pagecount: "true",
date:"2023.4.7",
contacts: (
(text:"08856",link:""),
(text:"example.com",link:"https://www.example.com"),
(text:"github.com",link:"https://www.github.com"),
(text:"123@example.com",link:"mailto:123@example.com"),
  ),
bibfile: [bib.json],
mainbody
)

    //About
    #section("About")
    #descript[#lorem(50)]
    #sectionsep
    #section("Education")
    #education[#lorem(4)][#lorem(2)][xxxx-xxxx][UK][Core Modules: #lorem(10)]\
    #education[#lorem(4)][#lorem(2)][xxxx-xxxx][UK][]
    #sectionsep
    #section("Skills")
    #descript("Programming Languages")
    #info[Python, C++, Java, JavaScript, HTML, CSS, SQL, LaTeX]
    #subsectionsep
    #descript("Frameworks")
    #info[React, Node.js, Express, Flask, Django, Bootstrap, jQuery]
    #subsectionsep
    #descript("Tools")
    #info[Git, GitHub, Docker, AWS, Heroku, MongoDB, MySQL, PostgreSQL, Redis, Linux]
    #sectionsep
    // Award
    #section("Awards")
    #awarddetail[2018][Scholarship][University]
    #awarddetail[2017][Grant][Organisation]
    #awarddetail[2016][Scholarship][University]
    #sectionsep
    //Experience
    #section("Experience")
    #jobtitle[#lorem(4)][#lorem(2)][xxxx-xxxx][UK]
    #jobdetail[
      - #lorem(10)
      - #lorem(10)
      - #lorem(10)
      - #lorem(10)]
    #subsectionsep
    #jobtitle[#lorem(4)][#lorem(2)][xxxx-xxxx][UK]
    #jobdetail[#lorem(30)]
    #sectionsep
    // Projects
    #section("Projects")
    #project[#lorem(2)][Jan 2023][#lorem(40)]
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
    #chicago(json("bib.json"))
    // #apa(json("bib.json"))


