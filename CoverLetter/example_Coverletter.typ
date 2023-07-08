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

