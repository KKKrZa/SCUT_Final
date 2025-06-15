#import "utils/counter.typ": q-counter, sq-counter, current-type, reset-c, reset-sq
#import "type/choice.typ": render-choice, choice, reset-choice, finish-choice
#import "type/blank.typ": render-blank, reset-blank, finish-blank
#import "type/general.typ": reset-general, finish-general

/// 显示主题目
#let question(
  type: "choice",  // 默认为选择题
  points: none,
  points-position: right,
  body
) = {
  
  // 先完成上一题的渲染
  context {
    let prev-type = current-type.get()
    if prev-type == "choice" {
      finish-choice()
    } else if prev-type == "blank" {
      finish-blank()
    } else {
      finish-general()
    }
  }
  
  // 更新当前题目类型
  current-type.update(type)
  
  // 重置相应的状态
  if type == "choice" {
    reset-choice()
  } else if type == "blank" {
    reset-blank-state()
  } else {
    reset-general-state()
  }
  
  // 重置子题计数器
  reset-sq()
  
  // 主题计数器加1
  q-counter.step()
  
  context {
    let current-number = q-counter.get().first()
    let points-display = if points != none {
      text(size: 10pt)[（#points 分）]
    } else { none }
    
    // 根据题目类型添加不同的后缀
    let suffix = if type == "choice" {
      "(     )"
    } else {
      ""
    }
    
    block(
      width: 100%,
      [
        #if points-display != none {
          place(right, points-display)
        }
        #text(size: 10.5pt)[#current-number. ] #body#suffix
      ]
    )
  }
}

/// 显示子题目
#let subquestion(
  points: none,
  points-position: right,
  body
) = {
  subq-counter.step()
  
  context {
    let current-number = subq-counter.get().first()
    let sub-numbering = numbering("(1)", current-number)
    let points-display = if points != none {
      text(size: 9pt)[（#points 分）]
    } else { none }
    
    v(0.5em)
    
    pad(
      left: 1em,
      block(
        width: 100% - 1em,
        [
          #if points-display != none {
            place(right, points-display)
          }
          #text(weight: "bold")[#sub-numbering ] #body
        ]
      )
    )
    
    v(0.3em)
  }
}

/// 文档结束时调用，渲染最后一题
#let finish-exam() = {
  context {
    let last-type = current-type.get()
    if last-type == "choice" {
      finish-choice()
    } else if last-type == "blank" {
      finish-blank()
    } else {
      finish-general()
    }
  }
}