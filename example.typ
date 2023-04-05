#import "typstcv.typ": *
// TODO: add the bibliography block

#main(
name: [#lorem(2)], //name:"" or name:[]
address: [#lorem(4)],
contacts: (
(text:"08856",link:""),
(text:"example.com",link:"https://www.example.com"),
(text:"github.com",link:"https://www.github.com"),
(text:"123@example.com",link:"mailto:123@example.com"),
  ),
bibfile: "biblio.bib",
[
    //About
    #section("About")
    #descript[#lorem(50)]
    #sectionsep
    #section("Education")
    #subsection[#lorem(4)]
    #term[xxxx-xxxx][UK]
    #subsectionsep
    #subsection[#lorem(4)]
    #term[xxxx-xxxx][UK]
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
],
[
    //Experience
    #section("Experience")
    #subsection[#lorem(4)]
    #term[xxxx-xxxx][UK]
    #descript[#lorem(4)]
    #info[#lorem(20)]
    #subsectionsep
    #subsection[#lorem(4)]
    #term[xxxx-xxxx][UK]
    #descript[#lorem(4)]
    #info[#lorem(20)]
    #subsectionsep
    #subsection[#lorem(4)]
    #term[xxxx-xxxx][UK]
    #descript[#lorem(4)]
    #info[#lorem(20)]
    #sectionsep
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
    // Award
    #section("Awards")
    #awarddetail[2018][Scholarship][University]
    #awarddetail[2017][Grant][Organisation]
    #awarddetail[2016][Scholarship][University]
    #sectionsep
    // // Publication
    // #section("Publications")
    // #bibliography()
],
)

