# モダンなデータ可視化
## ggplot2パッケージによる可視化
install.packages('Rtools', quiet = TRUE)

# ggplot2のインストール
# 依存関係にあるものも含めて必要なパッケージをインストール
install.packages('ggplot2', quiet = TRUE)

# パッケージ読み込み
library(ggplot2)

### 10-1-1 qplot関数

## 10-2 グラフ描画
### 10-2-1 散布図
data(diamonds)
summary(diamonds)

# 文字化けの解消
theme_set(theme_gray(base_family = ''))

# 散布図
#   x: カラット（連続値）
#   y: 価格[USドル]（連続値）

qplot(
  carat,
  price,
  data = diamonds,
  main = 'ダイヤモンドのカラットと価格の関係',
  xlab = 'カラット',
  ylab = '価格[$]'
)


### 10-2-2 棒グラフ
# 棒グラフ
#   x: カットの評価（離散値）
#   y: 個数[個]（連続値）

qplot(
  cut, 
  data = diamonds,
  geom = 'bar',
  main = 'カットの評価と個数の関係',
  xlab = '評価',
  ylab = '個数[個]'
)


# 箱ひげ図
#  x: クラリティの評価（離散値）
#  y: 個数[個]（連続値）

qplot(
  clarity,
  price,
  data = diamonds,
  geom = 'boxplot',
  main = 'クラリティの評価と個数の関係',
  xlab = '評価',
  ylab = '個数[個]'
)

### 10-2-4 ヒストグラム
# ヒストグラム
#  x: 価格[USドル]（連続値）
#  y: 個数[個]（連続値）

qplot(
  price,
  data = diamonds,
  geom = 'density',
  main = 'ダイヤモンドの価格と個数の関係',
  xlab = '価格[$]',
  ylab = '確率'
)


### 10-2-6 折れ線グラフ
# イギリスの四半期毎ガス消費量（時系列型）
data(UKgas)
print(UKgas)
# 時系列型（time series）を通常のベクトルに変換
x <- as.vector(time(UKgas))
y <- as.vector(UKgas)

# 折れ線グラフ
qplot(
  x,
  y,
  geom = 'line',
  main = 'イギリスの4半期毎ガス消費量',
  xlab = '年',
  ylab = '消費量'
)


### 10-2-7 qplot関数のグラフ種類
# コードなし

## 10-3 ggplot関数

###10-3-2 折れ線グラフ
# geom_line関数
ukgas <- data.frame(
  x <- as.vector(time(UKgas)),
  y <- as.vector(UKgas)
)

# 折れ線グラフの作成
g <- ggplot(ukgas, aes(x = x, y = y)) +
  geom_line()
# グラフの描画
print(g)

# 保存
ggsave(file = 'ukgas.png', plot = g, dpi = 100, width = 8.0, height = 8.0)


### 10-3-3 散布図
# アヤメの品種データ
data(iris)
summary(iris)

# 散布図の作成
#   colour: Sepal.Width で色分け
#   shape: Species で色分け
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point(aes(colour = Sepal.Width, shape = Species))

# グラフの描画
print(g)


### 10-3-4 棒グラフ
# 棒グラフの作成（積み上げ）
ggplot(diamonds, aes(cut)) +
  geom_bar(aes(fill = clarity))
# グラフの描画
print(g)

# 棒グラフの作成（要素別）
#  fill: clarityで色分け
g <- ggplot(diamonds, aes(cut)) +
  geom_bar(position = 'dodge', aes(fill = clarity))

# グラフの描画
print(g)

### 10-3-5 その他のグラフ
# コードなし

## 10-4 ggplot2のグラフ調整用関数
### 10-4-1 回帰曲線の追加
# 散布図 + 回帰直線の作成
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point() +
  geom_smooth(method = lm, se = TRUE)

# グラフの描画
print(g)

# 散布図 + 回帰直線の作成
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point() +
    geom_abline(intercept = -0.3631, slope = 0.4158)

# グラフの描画
print(g)


# 散布図 + 水平線・垂直線の作成
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point() +
    geom_hline(yintercept = 0.75) +
    geom_vline(xintercept = 2.5)

# グラフの描画
print(g)

### 10-4-2 背景の変更
# グレーの背景、枠線なし、白のグリッドライン。デフォルト
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(colour = Sepal.Width, shape = Species)) +
    theme_gray()

# グラフの描画
print(g)

# 白の背景、細い黒の枠線、グレーのグリッドライン
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(colour = Sepal.Width, shape = Species)) +
    theme_bw()

# グラフの描画
print(g)

# 白の背景、黒の枠線、グレーのグリッドライン
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(colour = Sepal.Width, shape = Species)) +
    theme_linedraw()

# グラフの描画
print(g)

# 白の背景、薄い黒の枠線、薄いグレーのグリッドライン
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(colour = Sepal.Width, shape = Species)) +
    theme_light()

# グラフの描画
print(g)

# 枠線なしの theme_minimal()
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(colour = Sepal.Width, shape = Species)) +
    theme_minimal()

# グラフの描画
print(g)


# 背景なし、L字の黒の枠線、グリッドラインなし
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(colour = Sepal.Width, shape = Species)) +
    theme_classic()

# グラフの描画
print(g)


### 10-4-3 タイトルとラベルの設定
# タイトルとラベルの設定
#   日本語を使う場合 base_family に次の値を設定
#       Windows: 'Meiryo'
#       Mac: 'Osaka'
#       Linux: システムにインストール済みの日本語フォント

g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(color = Sepal.Width, shape = Species)) +
    theme_bw(base_family = '') +
    ggtitle('タイトル') +
    xlab('X 軸') +
    ylab('Y 軸') +
    labs(colours = '色') +
    labs(shape = '形')

# グラフの描画
print(g)


### 10-4-4 凡例の位置の変更

# 右側、デフォルト
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(color = Sepal.Width, shape = Species)) +
    theme_bw() +
    theme(legend.position = 'right')

# グラフの描画
print(g)

# 凡例なし
g <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
    geom_point(aes(color = Sepal.Width, shape = Species)) +
    theme_bw() +
    theme(legend.position = 'none')

# グラフの描画
print(g)


### 10-4-5 軸の変換
# 軸の変換
# 依存関係にあるものも含めて必要なパッケージをインストール

# install.packages('scales', quiet = TRUE)
library(scales)

# x, y軸を対数軸（log10）に変換
g <- ggplot(data = diamonds) +
    geom_point(aes(carat, price)) +
    theme_bw() +
    scale_x_log10() +
    scale_y_log10()

# グラフの描画
print(g)


# x,y軸を平方根で変換
g <- ggplot(data = diamonds) +
    geom_point(aes(carat, price)) +
    theme_bw() +
    scale_x_sqrt() +
    scale_y_sqrt()

# グラフの描画
print(g)


# x, y軸を正負反転
g <- ggplot(data = diamonds) +
    geom_point(aes(carat, price)) +
    theme_bw() +
    scale_x_reverse() +
    scale_y_reverse()

# グラフの描画
print(g)


### 10-4-6 目盛りの変更
# 目盛りの変更
#   x軸: 1 => 'a', 2 => 'b', ... という目盛りに変更
#
# 上限の変更
#   y軸: 0 ~ 10000 の範囲に変更

g <- ggplot(data = diamonds) +
    geom_point(aes(carat, price)) +
    theme_bw() +
    scale_x_continuous(
        breaks = seq(1, 5, by = 1),
        labels = c('a', 'b', 'c', 'd', 'e')
    ) +
    ylim(0, 10000)

# グラフの描画
print(g)


# y軸についてカンマ区切りに変更
g <- ggplot(data = diamonds) +
    geom_point(aes(carat, price)) +
    theme_bw() +
    scale_y_continuous(labels = comma)

# グラフの描画
print(g)


### 10-4-7 数値の表示
# データの加工
ukgas <-  data.frame(
    x = as.vector(time(UKgas))[1: 10],
    y = as.vector(UKgas)[1: 10]
)

# グラフの作成
g <- ggplot(ukgas, aes(x = x, y = y)) +
    geom_bar(stat = 'identity') +
    geom_text(aes(label = y), vjust = -0.2)

# グラフの描画
print(g)


## 10-5 latticeパッケージによる可視化

# latticeのインストール
# 依存関係にあるものも含めて必要なパッケージをインストール

install.packages('lattice', quiet = TRUE)
library(lattice)


### 10-5-1 散布図
# 2次元散布図
xyplot(
    Sepal.Length ~ Sepal.Width,
    data = iris,
    groups = Species,
    auto.key = list(points = FALSE, rectangles = TRUE, space = 'right')
)

# 3次元散布図
cloud(
    Sepal.Length ~ Sepal.Width * Petal.Length,
    data = iris,
    groups = Species,
    auto.key = list(points = FALSE, rectangles = TRUE, space = 'right ')
)


### 10-5-2 等高線（controurplot）
# 等高線
#   row（1～87), column(1 ~ 61): 座標
#   volcano[row, column]: 標高
data("volcano")

contourplot(
    volcano,
    main = list(label = 'volcano'),
    xlab = list(label = 'x軸'),
    ylab = list(label = 'y軸')
)

### 10-5-3 ヒートマップ
# ヒートマップ
levelplot(
    volcano,
    main = list(label = 'volcano'),
    xlab = list(label = 'x軸'),
    ylab = list(label = 'y軸')
)

windowsFonts()

### 10-5-4 3次元ワイヤーフレーム（wireframe）
wireframe(
    volcano,
    shade = TRUE,
    aspect = c(0.5, 0.5),
    light.source = c(10, 0, 10)
)


### 10-5-5 ドットプロット
dotplot(
    carat ~ cut,
    data = diamonds,
    auto.key = list(points = FALSE, rectangles = TRUE, space = 'right')
)


### 10-5-6 平行座標プロット
parallelplot(
    ~ iris[1:4] | Species,
    data = iris
)
