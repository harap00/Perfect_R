# 9章 古典的なデータ可視化

## 9-1 可視化の基本
defaultPar <- par(no.readonly = TRUE)

### 9-1-1 プロット
plot(airquality)

## 9-2 グラフィックスパラメーター
### 9-2-1 グラフィックスパラメータの設定
dev.off()

### 9-2-2 描画領域に関するグラフィックスパラメータ
### 9-2-3 色や形状に関するグラフィックスパラメータ

## plot関数

# ベクトルをプロットする
vector <- rnorm(50)
plot(vector, main = 'ベクトル')

# データフレームをプロットする
x <- runif(50)
y <- 2 * x + rnorm(x, sd = 0.3)
df <- data.frame(Predictor = x, Response = y)
plot(df, main = 'データフレーム')

# 関数をプロットする
fun <- function(x){
  x^3 -3 * x + 1
}
plot(fun, xlim = c(-3, 3), main = '関数')

# 線形モデルオブジェクトをプロットする
#グラフが4つ表示されるので 2×2 のパネルを用意しておく
par(mfrow = c(2L, 2L), mar = c(4.1, 3.1, 2.1, 1.1))
model <- lm(Response ~ Predictor, data = df)
plot(model)

## 9-4 図、グラフの作成
### 散布図

# 2次元散布図をプロットする
x <- rnorm(50)
y <- rnorm(50)
plot(x, y, main = '2次元散布図')

# 1次元散布図をプロットする
par(mfrow = c(1L, 1L), mar = c(5.1, 7.1, 4.1, 2.1), las = 1L)
stripchart(iris[, -5], main = '1次元散布図（iris)', xlab = 'サイズ[cm]')

# 9-4-2 棒グラフ
# 余白トラベルのフォントサイズを調節する
par(mar = c(7.1, 4.1, 2.1,2.1), cex.axis = 0.8, las =2L)
# 棒グラフをプロットする
barplot(
  USArrests$Murder,
  names.arg = rownames(USArrests),
  ylab = '逮捕者数［/10万人］',
  main = '州ごとの殺人による逮捕者数',
)

# 積み上げ棒グラフをプロットする
# データの形式を調整する
# barplot関数はベクトルまたは行列形式のデータでなければならない
data <- t(as.matrix(USArrests))
# 表示する項目が多いので減らす
data <- data[, 1:5]

# 余白とレベルのフォントサイズを調整する
par(mar = c(6.1, 4.1, 4.1, 2.1), las = 2L, xpd = TRUE)
# 棒を積み上げる
barplot(
  data,
  beside = FALSE, # 棒を積み上げる
  names.arg = colnames(data),    # x軸の項目ラベル
  ylab = '逮捕者数［/10万人］',  # y軸のラベル
  main = '州ごとの逮捕者数',     # グラフタイトル
  legend.text = rownames(data),  # 凡例
  args.legend = list(            # 凡例の調整
    y = max(colSums(data)),
    yjust = 0,
    bty = 'n',
    horiz = TRUE
  )
)

# 棒を横に並べる
barplot(
  data,
  beside = TRUE, # 棒を積み上げる
  names.arg = colnames(data),    # x軸の項目ラベル
  ylab = '逮捕者数［/10万人］',  # y軸のラベル
  main = '州ごとの逮捕者数',     # グラフタイトル
  legend.text = rownames(data),  # 凡例
  args.legend = list(            # 凡例の調整
    y = max(data),
    yjust = 0,
    bty = 'n',
    horiz = TRUE
  )
)

# 余白を調整する
par(mar = c(5.1, 6.1, 4.1, 2.1), las = 1L, xpd = TRUE)

# 棒グラフを横向きでプロットする
barplot(
  data,
  horiz = TRUE, # 横向きにする
  xlab = '逮捕者数[/10万人]',   # x軸のラベル
  main = '州ごとの逮捕者数',　  # グラフタイトル
  legend.text = rownames(data), # 凡例
  args.legend = list(           # 凡例の調整
    y = ncol(data) + 1,
    yjust = 0,
    bty = 'n',
    horiz = TRUE
  )
)


### 9-4-3 折れ線グラフ
x <- cumsum(rnorm(50)) # ランダムウォーク
plot(x, type = 'l', main = 'ランダムウォーク')

# Nileはtsクラスのデータ
class(Nile)
# 特に指定しなくとも折れ線グラフになる
plot(Nile, type = 'l', main = 'ナイル川流量')

### 9-4-4 ドットプロット
# ドットプロットを描画する
dotchart(VADeaths, main = 'バージニア州における世代別死亡率（1940年)')


### 9-4-5 箱ひげ図
boxplot(
  Sepal.Length ~ Species, 
  data = iris,
  xlab = '種',
  ylab = 'がく片の長さ[cm]',
  main = 'アヤメの種ごとのがく片の長さ'
)


### 9-4-6 円グラフ
# 学部ごとの人数を集計する
count <- apply(UCBAdmissions, 3L, sum)
# 円グラフをプロットする
pie(
  count,
  main = 'UC Berkeleyの学部別大学院進学希望者',
  col = gray.colors(length(count)) # グレイスケールで表示
)

# 12時から時計回りに円グラフを作成する
pie(
  count,
  clockwise = TRUE,
  main = 'UC Berkeleyの学部別大学院進学希望者',
  col = gray.colors(length(count)) # グレイスケールで表示
)


# 集計データを百分率に変換する
ratio <- count / sum(count) * 100
# 棒グラフ（帯グラフ）をプロットする
par(mar = c(5.1, 2.1, 4.1, 6.1))
barplot(
  as.matrix(ratio),
  horiz = TRUE,
  main = 'UC Berkley の学部別大学院進学希望者',
  xlab = '割合（%）',
  xpd = TRUE,
  legend.text = names(ratio),
  args.legend = list(
    x = 105,
    xjust = 0
  )
)


### 9-4-7 モザイクプロット
# モザイクプロットを描画する
mosaicplot(UCBAdmissions)


### 9-4-8 ヒストグラム
# 乱数を再現させるために乱数シードを固定
set.seed(12345)
# ヒストグラムを描画する
par(mar = c(6.1, 4.1, 4.1, 2.1), las = 2L, xpd = TRUE)
x <- rnorm(100)
hist(x, main = '正規乱数のヒストグラム')


# 相対頻度でヒストグラムを作成する
par(mar = c(6.1, 4.1, 4.1, 2.1), las = 2L, xpd = TRUE)
hist(x, freq = FALSE, main = '正規乱数のヒストグラム')

# 相対頻度でヒストグラムを作成する
par(mar = c(6.1, 4.1, 4.1, 2.1), las = 2L, xpd = TRUE)
breaks <- seq(-3, 3, by = 0.4)
hist(x, breaks = breaks, ylab = 'Frequency', main = '正規乱数のヒストグラム')

### 9-4-9 ヒートマップ
# デンドログラム付きのヒートマップを作成する
par(defaultPar)
heatmap(
  VADeaths,
  cexRow = 1, cexCol = 1,
  margins = c(7, 7),
  main = 'バージニア州死亡率'
)

# デンドログラムなしのヒートマップを作成する
par(mar = c(5.1, 6.1, 4.1, 2.1), las = 1L, xpd = TRUE)
image(volcano, col = terrain.colors(10), main = 'マウント・イーデンの標高')

### 9-4-10 等高線プロット
# Contur関数による等高線プロット
contour(volcano, main = 'マウント・イーデンの標高')

# Filled.contour関数による等高線プロット
par(defaultPar)
filled.contour(
    volcano, 
    color.palette = terrain.colors, 
    main = 'マウント・イーデンの標高'
)

### 9-4-11 ３次元プロット

# ３次元プロットを行う
x <- seq(-3, 3, length.out = 100)
y <- x
z <- outer(x, y, 
           function(x, y){cos(-(x^2 + y^2 - x * y)) * exp(-(x^2 + y^2) /2)}
           )
par(mar = rep(2, 4), mfcol = c(3,3))
# 見る角度を変えながらプロットする
for (theta in c(-90, -45, 0)){
    for (phi in c(45, 0, -45)){
        persp(x, y, z, theta = theta, phi = phi)
    }
}


## 9-5 高水準描画関数と低水準描画関数
### 9-5-1 低水準描画関数
### 9-5-2 新規描画領域の作成
# 新規描画領域を作成する
plot.new()

### 9-5-3 描画領域の範囲指定
# x軸の範囲を 0 から 5、y軸の範囲を 0 から 1 に指定する
par(defaultPar)
plot.new()
plot.window(c(0, 5), c(0, 1))
axis(1L)
axis(2L)
title('範囲指定')

# x軸を対数スケールで描画領域の範囲指定をする
plot.new()
plot.window(c(0.01, 100), c(0, 1), log = 'x')
axis(1L)
axis(2L)
title('対数軸')

# アスペクト比 1 で描画料異kの範囲指定をする
plot.new()
plot.window(c(0, 5), c(0, 1), asp = 1)
axis(1L)
axis(2L)
title('アスペクト比指定')

### 9-5-4 描画領域枠の作成
# 2x2 の描画領域を用意する
par(mfrow = c(2, 2), mar = rep(1, 4), oma = rep(1, 4))
plot.new()

# 枠を描画する
box(which = 'plot', lty = 'solid', lwd = 1)
box(which = 'figure', lty = 'dotted', lwd = 1)
box(which = 'inner', lty = 'dashed', lwd = 2)
box(which = 'outer', lty = 'longdash', lwd = 2)

### 9-5-5 軸
# 2x1 の描画領域を用意する
plot.new()
par(
    mfrow = c(2, 1), 
    mar = c(0.6, 4.1, 0.6, 2.1), 
    oma = c(4.1, 0, 0, 0)
)

# 上パネルのプロット
plot(sin, xlim = c(0, 2 * pi), axes = FALSE, xlab = '', ylab = '')
# y軸を描く
axis(2, at = c(-1, 0, 1), las = 1)

# 下パネルのプロット
plot(cos, xlim = c(0, 2 * pi), axes = FALSE, xlab = '', ylab = '')
# y軸を描く
axis(2, at = c(-1, 0, 1), las = 1)

# 2プロットに共通のx軸を描画する
axis(
    1,
    at = seq(0, 2, by = 0.5) * pi,
    labels = c(
        0,
        expression(paste(frac(1, 2), pi)),
        expression(pi),
        expression(paste(frac(3, 2), pi)),
        expression(pastAe(2, pi))
    ),
    outer = TRUE,
    padj = 0.5
)

### 9-5-6 タイトル
# タイトルをtitle関数を用いて表示する
par(mfrow = c(1, 1), mar = c(5.1, 4.1, 3.1, 1.1), cex = 0.7)
plot(rnorm(50), xlab = '', ylab = '')
title('メインタイトル', 'サブタイトル', 'x軸ラベル', 'y軸ラベル')

### 9-5-7 点

# 描画領域を作成する
par(mar = rep(0.1, 4))
plot.new()
box()

# 出力データを作成する
x <- runif(50)
y <- runif(50)

# 点を描画する
points(x, y)
rug(x, side = 3)
rug(y, side = 4)

### 9-5-8 線
# 描画領域を作成する
par(mar = c(2.1, 2.1, 0.1, 0.1))
plot.new()
axis(1)
axis(2)

# lines関数で線を描画する
lines(c(0, 0.5, 0.5, 1), c(1, 0.5, 0, 1))

# 描画領域を作成する
par(mar = c(2.1, 2.1, 0.1, 0.1))
plot.new()
axis(1)
axis(2)

# segments関数で線を描画する
segments(0.1,0.1, 0.9, 0.7)


# 描画領域を作成する
par(mar = c(2.1, 2.1, 0.1, 0.1))
plot.new()
axis(1)
axis(2)
# arrows関数で夜市類sを描画する
arrows(0.1, 0,1, 0.9, 0.7)
arrows(0.5, 0.1, 0.4, 0.9, code = 3, angle = 60)

# 散布図を作成する
x <- runif(30, 0, 10)
y <- 2 * x - 1 + rnorm(x)
plot(x, y, main = '線形回帰')

# 回帰曲線を重ね合わせる
model <- lm(y ~ x)
abline(model, lwd = 2)


# 描画領域を作成する
par(mar = c(3.1, 3.1, 1.1, 1.1))
plot.new()
plot.window(c(0, 10), c(1e-2, 1e+2), log = 'y', yaxp = c(1e-2, 1e+2, 3))
axis(1)
axis(2)

# グリッドを描画する
grid(6, 4, col = 'black', lwd = 2)


### 9-5-9 多角形（矩形）
# 描画領域を作成する
par(mar = rep(0.1, 4))
plot.new()

# 矩形を描画する
rect(0, 0, 0.8, 0.2)
rect(0.2, 0.4, 1, 1, density = 10)


# 描画領域を作成する
par(mfrow = c(1, 2), mar = c(0.1, 0.1, 4.1, 0.1))

# polygon関数で多角形を描画する
plot.new()
title('polygon')
x <- c(0.0, 0.2, 0.8, 1.0, NA, 0.0, 0.2, 0.8, 1.0)
y <- c(0.5, 0.0, 0.5, 0.0, NA, 1.0, 0.5, 1.0, 0.5)
polygon(x, y, col = c('black', 'gray'), border = c('black', NA))

# polypath関数で多角形を描画する
plot.new()
title('polypath')
x <- c(
    0.0, 0.0, 1.0, 1.0, NA,
    0.2, 0.2, 0.8, 0.8, NA,
    0.0, 0.0, 1.0, 1.0, NA,
    0.2, 0.2, 0.8, 0.8
)
y <- c(
    0.0, 0.4, 0.4, 0.0, NA,
    0.1, 0.3, 0.3, 0.1, NA,
    0.6, 1.0, 1.0, 0.6, NA,
    0.9, 0.7, 0.7, 0.9
)
polypath(x, y, col = 'gray')


### 9-5-10 円
# 描画領域を作成する
par(mar = c(2.1, 2.1, 0.1, 0.1), mfrow = c(1, 1))
plot.new()
plot.window(c(0, 10), c(0, 10), asp = 1)
axis(1)
axis(2)

# 円を描画する
r <- 3
theta <- seq(0, 2 * pi, by = 0.01)
x <- r * cos(theta) + 2
y <- r * sin(theta) + 2
polygon(x, y)

# 楕円を描画する 
x0 <- 4 * cos(theta)
y0 <- 2 * sin(theta)
phi <- 30 * pi / 180
x <- x0 * cos(phi) - y0 * sin(phi) + 5
y <- x0 * sin(phi) + y0 * cos(phi) + 3
polygon(x, y)

# 円弧を描画する
theta <- seq(0, 0.5 * pi, by = 0.01)
x <- 9 * cos(theta)
y <- 9 * sin(theta)
lines(x, y, lty = 'dashed')

# plotrixパッケージをインストールする
install.packages('plotrix', quiet = TRUE)

# plotrixパッケージをロードする
library('plotrix')

# 描画領域を作成する
par(mar = c(2.1, 2.1, 0.1, 0.1))
plot.new()
plot.window(c(0, 10), c(0, 10), asp = 1)
axis(1)
axis(2)

# 円を描画する
draw.circle(2, 2, radius = 3)
# 楕円を描画する
draw.ellipse(5, 3, a = 4, b = 2, angle = 30)
# 円弧を描画する
draw.arc(0, 0, radius = 9, deg1 = 0, deg2 = 90, lty = 'dashed')


### 9-5-11 文字列
# 描画領域を作成する
par(mar = rep(4.1, 4))
plot.new()
box()

# text関数で文字列を描画する
text(0.5, 0.5, '中')
text(0.5, 0.5, c('下', '左', '上', '右'), pos = 1:4)
text(0.5, 
     0.5, 
     paste0('かなり', c('下', '左', '上', '右')), 
     pos = 1:4, 
     offset = 5
)

# mtext関数で文字列を描画する
mtext(paste0('外側', c('下', '左', '上', '右')), side = 1:4)
mtext(paste0('外側かなり', c('下', '左', '上', '右')), side = 1:4, line = 3)


### 9-5-12 凡例
# 描画領域を作成する
par(mar = c(4.1, 4.1, 0.1, 0.1))
plot.new()
box()
axis(1)
axis(2)

# 凡例を描画する
legend('topleft', '左上')
legend('topright', '右上', inset = 0.1)
legend(
    0.2, 
    0.6, 
    c('点', '線', '両方'), 
    pch = c(1, NA, 2), 
    lty = c(NA, 1, 2), 
    x.intersp = 4
)
legend(
    0.8, 
    0.2, 
    c('点', '線', '両方'), 
    pch = c(1, NA, 2), 
    lty = c(NA, 1, 2), 
    xjust = 0.5,
    yjust = 0.5
)


## 9-6 ラスタ画像
# 描画領域を作成する
par(mar = rep(0.1, 4))
plot.new()

# ラスタ画像を描画する
colors <- matrix(c('#FF0000', '#0000FF', '#00FF00', '#FFFF00'), 2, 2)
image <- as.raster(colors)
rasterImage(image, 0, 0, 0.2, 0.2, interpolate = FALSE)
rasterImage(image, 0.2, 0.2, 1, 1, angle = -20, interpolate = TRUE)

## 9-7 グラフィックスデバイス
# 現在のグラフィックスデバイスを取得する
dev.cur()

# 新しいグラフィックスデバイスを開く
png('new-1.png')
dev.cur()

# さらに新しいグラフィックスデバイスを開く
png('new-2.png')
dev.cur()

# さらに新しいグラフィックスデバイスを開く
png('new-3.png')
dev.cur()

# グラフィックスデバイスの一覧を表示する
dev.list()

# 2番目のグラフィックスデバイスを現在のグラフィックスデバイスに設定する
dev.set(2)

# 前のグラフィックスデバイスを取得する
dev.prev()

# 次のグラフィックスデバイスを取得する
dev.next()

# グラフィックスデバイスをすべて閉じる
graphics.off()


# 停止レベルを１上げる
dev.hold()

# 重い描画処理を行う
plot.new()
for (i in 1:100) points(runif(1), runif(1))

# 停止レベルを１下げる（描画処理を行う）
dev.flush()

# コピー対照の描画処理を行う
plot(1:10, pch = 1:10)

# 描画結果を画像ファイルにコピーする
dev.print(device = png, filename = 'copy.png', width = 600, height = 600)


