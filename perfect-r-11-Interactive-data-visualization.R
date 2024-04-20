# 11章 インタラクティブなデータ可視化

## 11-1 Rにおけるインタラクティブなデータ可視化について
# コードなし

## 11-2 htmlwidgetsパッケージについて
# コードなし

## 11-3 dygraphsパッケージで時系列データの折れ線をプロットする
install.packages('dygraphs', quiet = TRUE)

library('dygraphs')
data_weight <- read.csv(
  'https://raw.githubusercontent.com/dichika/mydata/master/ore_wt.csv', 
  as.is = TRUE
)
# data.weightは以下のような内容である
#       time weight
# 2015-02-23   63.0
library('xts')
data_weight <- xts(x = data_weight$weight, order.by = as.Date(data_weight$time))
dygraph(data = data_weight, main = 'weight data', xlab = 'date', ylab = 'weight')

# データの範囲指定
dygraph(data = data_weight) |> dyAxis(name = 'y', valueRange = c(60, 66))

# アノテーションの付与と色付け
dygraph(data = data_weight) |> 
    dyAnnotation(x = '2015-06-01', text = '飲み会', width = 60) |> 
    dyShading(from = '2015-04-29', to = '2015-05-05', color = 'lightgrey', axis = 'x')

# 2軸プロット
data_steps <- read.csv(
    'https://raw.githubusercontent.com/dichika/mydata/master/ore.csv', 
    as.is = TRUE
)
data_steps <- ?xts(x = data_steps$steps, order.by = as.Date(data_steps$time))
data_merged <- merge(data_weight, data_steps)
colnames(data_merged) <- c('weight', 'steps')

# 2軸プロットを描く
dygraph(data = data_merged) |> 
    dySeries(axis = 'y2', name = 'steps') |> 
    dyAxis(name = 'y2', valueRange = c(2000, 30000))

## 11-4 DiagrammeRパッケージでグラフ構造を可視化する

# DiagrammeRパッケージのインストール
install.packages('DiagrammeR', quiet = TRUE)

library('DiagrammeR')
grViz('
      digraph sake_flow{
        玄米 -> 白米 -> 蒸米 -> もろみ -> 新酒 -> 市販の一般の清酒
      }
      ')

grViz('
      digraph sake_flow{
        玄米 -> 白米 -> 蒸米 -> 麹 -> 酒母
        水 -> {酒母 もろみ}
        酵母 -> {酒母 もろみ}
        醸造アルコールなど -> もろみ
        蒸米 -> 酒母 -> もろみ -> 新酒 -> 市販の一般の清酒
      }
      ')

grViz('
    digraph sake_flow{
    玄米 [color = "black", style = "filled", fillcolor = "red"]
    // 玄米は線の色を黒で、赤で塗りつぶす
    node[color = "blue"]
    水;麹;酵母 // この３つのノードのみ線の色を青に
    node[color = "grey" shape = "box"]
    // 他のノードは四角形で線の色を灰色に
    
    玄米 -> 白米 -> 蒸米 -> 麹 -> 酒母
    水 -> {酒母 もろみ}
    酵母 -> {酒母 もろみ}
    醸造アルコールなど -> もろみ[label = "入れない場合もある" style = "dotted"]
    蒸米 -> 酒母 -> もろみ
    もろみ -> 新酒[label = "貯蔵\n上槽"]
    新酒 -> 市販の一般の清酒[label = "貯蔵\n割水"]
    }
')

## 11-5 DTパッケージでインタラクティブな表を作成する

# DTパッケージのインストール
install.packages('DT', dependencies = TRUE)

data_sake <- read.csv(
    'https://raw.githubusercontent.com/dichika/mydata/master/sake.csv', 
    as.is = TRUE, 
    fileEncoding = 'UTF-8'
)
library('DT')
datatable(data = data_sake)

datatable(data = data_sake, rownames = FALSE)
datatable(
    data = data_sake, 
    colnames = c('酒蔵名', '銘柄', '住所', '緯度', '経度')
)

datatable(data = data_sake, colnames = c('酒蔵名' = 2, '住所' = 4))
datatable(data = data_sake, caption = '酒蔵住所一覧')

data_sake2 <- data_sake
data_sake2$sake <- as.factor(data_sake2$sake)
datatable(data = data_sake2, filter = 'top')

datatable(data = data_sake, colnames = c('<a href="https://www.japansake.or.jp/sake/know/what/02.html">日本酒</a>'=2), escape=FALSE, rownames = FALSE)

datatable(data = data_sake, options = list(searching = FALSE), class = 'row-border cell-border hover')


## 11-6 leafletパッケージで地図上に可視化する
install.packages('leaflet', dependencies = TRUE)

# 円マーカーの付与
library('leaflet') 
leaflet(data = data_sake) |> addTiles()

leaflet(data = data_sake) |> 
    addCircleMarkers(
        lat = ~lat,
        lng = ~lng,
        radius = 10
    ) |> 
addTiles()

# マーカーを線でつなぐ
leaflet(data = data_sake) |> 
    addCircleMarkers(
        lat = ~lat,
        lng = ~lng,
        radius = 10
    ) |> 
    addPolylines(
        lat = ~lat,
        lng = ~lng,
    ) |> 
    addTiles()

# ポップアップの追加
leaflet(data = data_sake) |> 
    addCircleMarkers(
        lat = ~lat,
        lng = ~lng,
        radius = 10
    ) |> 
    addPolylines(
        lat = ~lat,
        lng = ~lng,
    ) |>
    addPopups(
        lat = ~lat,
        lng = ~lng,
        popup = ~name,
        options = popupOptions(minWidth = 10)
    ) |> 
    addTiles()
