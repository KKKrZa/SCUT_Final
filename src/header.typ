#let header(
  course,
  school,
  semester,
  model,
  form,
  total,
  points,
  demand,
  duration
) = [
  #text(size: 14pt)[*诚信应考，考试作弊将带来严重后果！*]
  #pad(
    left: 2.5cm,
    align(center)[
      #text(size: 22pt)[*#(school)本科生期末考试*]
      #v(-0.8em)
      #text(size: 14pt)[*《#(course)》#(model)卷*]

      #text(size: 12pt)[*#(semester)*]
    ]
  )
  #v(3em)
  #let notice_items = (
    "开考前请将密封线内各项信息填写清楚",
    demand,
    "考试形式：" + form,
    "本试卷共" + str(total) + "大题，满分" + str(points) + "分，考试时间" + str(duration) + "分钟"
  )

  #align(left)[
    #set par(leading: 0.9em)
    #for (i, item) in notice_items.enumerate() [
      #if i == 0 [
        *注意事项：1. #item；*\
      ] else [
        #h(55pt) *#(i + 1). #item；* \
      ]
    ]
  ]
  #v(1.5em)
  #pad(
    left: 2.5cm,
    align(center)[
      #table(
        columns: (5em, ..range(total).map(_ => 3em), 5em),
        rows: (1.5em, 3em),
        stroke: 0.5pt,
        align: center + horizon,
        [*题 号*], 
        ..range(1, total + 1).map(i => [*#numbering("一", i)*]),
        [*总分*],
        [*得 分*], 
        ..range(total + 1).map(_ => []),
      )
    ]
  )
  #v(-0.8em)
  #align(right)[评阅教师请在试卷袋上评阅栏签名]
]