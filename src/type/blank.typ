/// 填空题空白处
#let render-blank(width: 3cm) = {
  box(
    width: width,
    stroke: (bottom: 0.5pt),
    height: 10.5pt
  )
}

/// 重置填空题状态（预留）
#let reset-blank() = {}

/// 完成填空题渲染（预留）
#let finish-blank() = {}