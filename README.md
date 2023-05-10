# Typst-CV-Resume

This Typst CV template is inspired by Latex template [Deedy-Resume](https://github.com/deedy/Deedy-Resume).
You can use it for both of industry and academia.

In original Typst, we cannot create a reference list withou citation. So I modified the code for this purpose. Currently, I only create the Chicago style citation and reference list. If you want to use other citation styles, you need to modify the code.

I have create a function to import your publication list.
**remember: you need to use `json` file exported from Zotero with BetterBibTeX. I did not test other ways.**

Then you can call the function by using `#chicago(json("bib.json"))`.
## Update
I have update the `macfont` version with the some location changes. The `openfont` version is still the same.

## Use

This project includes **three** files:

- `example.typ`: the main file
- `typstcv.typ`: the template file
- `bib.json`: the bibliography file

You can use `example.typ` as a template to create your own CV. You can also download `typstcv.typ` as a template. Then create a new file with the following code:

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
    #chicago(json("bib.json"))
    // #apa(json("bib.json"))
],
)
```

</details>


**Remember: If you want to change the font, you should change the font setting `#let fonttype = "macfont"` to `openfont` and modify the font that you prefer for each section.**

## Example

I only test the template on macOS. If you want to use it on other platforms, you should use template in the `openfont` folder. Then, modify the font in `typstcv.typ` to the font installed on your PC.

**MacFont**
![WzzFAb](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/04/WzzFAb.png)
**PT Sans**
![S4rnjN](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/04/S4rnjN.png)


I also create a single column version, You can find it from the [`typstcv_single.typ`](CV/typstcv_single.typ) and [`example_single.typ`](CV/example_single.typ):
![RWRbMA](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/05/RWRbMA.png)
## Todo

- [x] Combine the macfont and openfont into one file.
- [ ] Create one column version.
