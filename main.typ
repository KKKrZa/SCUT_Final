#import "template.typ": *

#show: exam.with(
  name: "测试试卷",
  school: "华南理工大学",
  course: "工科数学分析（二）",
  semester: "2023-2024学年第一学期",
  duration: "120",
)

#section-title("一、选择题：共5题，每题2分，共10分.")

#question(points: 10)[
  下列微分方程中，属于二阶线性常微分方程的是
  #choice[$y'' + x^3 y$]
  #choice[$(x^2 + y^2)$]
  #choice[$(y'')^2 + 1$]
  #choice[$y'' + 2 l$]
]

#question[
  题目内容
  #choice[选项A]
  #choice[选项B]
  #choice[选项C]
  #choice[选项D]
]

#question[
  题目内容
  #choice[这是一个很长的选项A]
  #choice[这是一个很长的选项B]
  #choice[这是一个很长的选项C]
  #choice[这是一个很长的选项D]
]
