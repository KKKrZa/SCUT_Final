#import "src/page.typ": setup-page
#import "src/header.typ": header

#let exam(
  name: "",
  school: "华南理工大学", 
  course: "",
  semester: "",
  duration: "",
  body,
) = {
  set document(
    title: name,
    author: school,
  )
  show: setup-page(course)
  set par(justify: true, leading: 0.8em)

  header(
    course,
    school,
    semester,
    "A",
    "闭卷",
    6,
    100,
    "所有答案请直接答在试卷上",
    duration
  )
  body
}

#let question(number, content) = [
  #text(weight: "bold")[#number. ] #content
  #v(1em)
]

#let section-title(title) = [
  #v(1em)
  #text(weight: "bold", size: 14pt)[#title]
  #v(0.8em)
]