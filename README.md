# Typst-CV-Resume

This Typst CV template is inspired by the Latex template [Deedy-Resume](https://github.com/deedy/Deedy-Resume).
You can use it for both industry and academia.

## Todo

- [X] Combine the macfont and openfont into one file.
- [X] Create one column version.`(typstcv_single.typ)` is the single column version.

## Update

- Add the official bibliography support, you can change to your own preferred style. Remember to export your publication in `bib.bib` and put the bib file in the same directory with your file.
- I have updated the `macfont` version with some location changes. The `openfont` version is still the same.

## Use

### Double Column CV

This project includes **three** files:

- `example.typ`: the main file
- `typstcv.typ`: the template file
- `bib.bib`: the bibliography file

You can use `example.typ` as a main entry for your CV. Then download `typstcv.typ` as a template.

Or you can download the `typstcv.typ` as a template, and create a new file with the following code:

<details>
    <summary>Click me</summary>

```
#import "typstcv.typ": *
// Remember to set the fonttype in `typstcv.typ` 

#main(
name: [#lorem(2)], //name:"" or name:[]
address: [#lorem(4)],
lastupdated: "true",
date:"2023.4.7",
contacts: (
(text:"08856",link:""),
(text:"example.com",link:"https://www.example.com"),
(text:"github.com",link:"https://www.github.com"),
(text:"123@example.com",link:"mailto:123@example.com"),
  ),
bibfile: [bib.json],
[
    //About
    #section("About")
    #descript[#lorem(50)]
    #sectionsep
    #section("Education")
    #subsection[#lorem(4)\ ]
    #term[xxxx-xxxx][UK]
    #subsectionsep
    #subsection[#lorem(4)\ ]
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
    #sectionsep
    // Award
    #section("Awards")
    #awarddetail[2018][Scholarship][University]
    #awarddetail[2017][Grant][Organisation]
    #awarddetail[2016][Scholarship][University]
    #sectionsep
],
[
    //Experience
    #section("Experience")
    #jobtitle[#lorem(4)][#lorem(2)]
    #term[xxxx-xxxx][UK]
    #jobdetail[
      - #lorem(10)
      - #lorem(10)
      - #lorem(10)
      - #lorem(10)]
    #subsectionsep
    #jobtitle[#lorem(4)][#lorem(2)]
    #term[xxxx-xxxx][]
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
    #publication(
      "bib.bib",
      "chicago-author-date")
],
)
```

</details>

Preview:

![WzzFAb](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/04/WzzFAb.png)

### Single Column CV

The single column version is in the `typstcv_single.typ`. You can use it as the same way as the double column version.

<details>
    <summary>Click me</summary>

```
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
    #publication(
      "bib.bib",    
      "chicago-author-date")


```

</details>

![](https://minioapi.pjx.ac.cn/img1/2024/02/738f1665f4d8499c15601491870da3d6.png)

### Cover Letter

Download `typstcoverletter.typ` as a template. Then create a new file with the following code:

<details>
    <summary>Click me</summary>

```
#import "typstcoverletter.typ": *
// Remember to set the fonttype in `typstcv.typ` 


#show: mainbody => main(
name: [#lorem(2)], //name:"" or name:[]
address: [#lorem(4)],
contacts: (
(text:"08856",link:""),
(text:"example.com",link:"https://www.example.com"),
(text:"github.com",link:"https://www.github.com"),
(text:"123@example.com",link:"mailto:123@example.com"),
  ),
mainbody,
)

#recepient[
  #datetime.today(offset: auto).display("[day] [month repr:long] [year]") // display today in the format "day month year" or you can show the date directly
  ][
    Department
    ][
      Institution
      ][
        City, Country
        ][
          Postcode
          ]
#align(left, text(12pt,font: "Helvetica", fill: primary_colour,weight: "medium", )[#upper([Job Application for Research Fellow])])
#v(0.1em)
#set text(11pt,font: "Helvetica", fill: primary_colour, weight: "regular", )
Dear Application Committee,
#set par(justify: true,first-line-indent: 2em,) 

#lorem(300)

#lorem(100)

```

</details>

Preview:

![](https://minioapi.pjx.ac.cn/img1/2024/02/c98c13130d7156ae444f100c5f8b653d.png)

### Font

**Remember: If you want to change the font, you should change the font setting `#let fonttype = "macfont"` to `openfont` and modify the font that you prefer for each section.**

I only test the template on macOS. If you want to use it on other platforms, you should use template in the `openfont` folder. Then, modify the font in `typstcv.typ` to the font installed on your PC.

**MacFont**
![WzzFAb](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/04/WzzFAb.png)
**PT Sans**
![S4rnjN](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/04/S4rnjN.png)
