// This file will contain various templates for your papers in CV. You do not need to cite in the main boby. I plan to add more styles in the future.
#import "typstcv.typ": primary_colour
// This can only works with Zotero JSON file. You can export your Zotero library as JSON file and then use this template to generate your publicatio in your CV.
#let chicago(contents) = {
    set text(10pt,font: "Helvetica", fill: primary_colour,weight: "light", )
  for i, id in contents {
          str(i+1)
    for author in id.author {
        if author.len() == 1 [
        #author.at("family"), #author.at("given").
        ] else {
            if author.at("family") == id.author.first().at("family") [
                #author.at("family"), #author.at("given")
            ] else if author.at("family") != id.author.last().at("family") [
                and #author.at("given"), #author.at("family").
            ] else [
                #author.at("given"), #author.at("family"),
            ]
        }
        }
    [" #id.title " #emph(id.container-title) ]
    if "volume" in id [#id.volume, ]
    if "issue" in id [no. #id.issue ]
    [(#id.issued.date-parts.at(0).first())]
    if "page" in id [ #id.page.] else[. ]
    if "DOI" in id and "URL" in id {
        [doi: ] 
        emph(link(id.DOI))
        [\ ]
        } else if "URL" in id {
        [url: ] 
        emph(link(id.URL))
        [\ ]
        } else if "DOI" in id {
        [doi: ] 
        emph(link(id.DOI))
        [\ ]
        }
    }
  }