# 13章 クラスタリング

## 13-1 クラスタリングとは
## confine search to .Library for speed
str(ip <- installed.packages())
ip

install.packages('ggplot2', quiet = TRUE)
library(ggplot2)

# carsデータセットのロード
data(cars)

# データの先頭
head(cars, 3)

# 速度(speed)と距離(dist)の散布図のプロット
p <- ggplot(data =cars, aes(x = speed, y = dist)) +
    geom_point()
print(p)

## 13-2 手法の概要
# コーディングなし

## 13-3 階層的クラスタリング
# install.packages('dplyr', quiet = TRUE)
# install.packages('ggplot2', quiet = TRUE)
# install.packages('cluster', quiet = TRUE)
# install.packages('fastcluster', quiet = TRUE)
# install.packages('microbenchmark', quiet = TRUE)
# install.packages('gplots', quiet = TRUE)
# install.packages('dendextend', quiet = TRUE)

### 13-3-1 簡単な実行例

# cars データセットに対するデンドログラム
# carsデータセットのロード
data("cars")

# データ間の距離の算出
dist.cars <- dist(cars)

# 階層的クラスティングの実行
hc.cars <- hclust(dist.cars)

# クラスタリングの可視化
plot(hc.cars)

# carsデータセットの散布図（クラスタ数を3として点の色と形がクラスタを表す）
library(dplyr)
library(ggplot2)

# クラスタへの分割（クラスタ数=3）
ct.cars <- cutree(hc.cars, k = 3)

# クラスタ番号の結合
cars.hc <- cars |> 
    mutate(cluster = factor(ct.cars, levels = 1:3))


# 点の色をクラスタ番号とする散布図のプロット
p <- ggplot(
    data = cars.hc, 
    aes(
        x = speed, 
        y = dist, 
        colour = cluster,
        shape = cluster
        )
    ) +
    geom_point()
print(p)


### 13-3-2 クラスタ数の決定方法
### ギャップ統計量

# install.packages('cluster', quiet = TRUE)
library(cluster)
library(dplyr)
library(ggplot2)

set.seed(71)

# 最大クラスタ数を10に設定
k.max <- 10

# Ward法を実行して各データのクラスタ番号を返す関数
get.clusid <-  function(x, k){
    
    # データ間の距離の算出
    dist.x <- dist(x)
    
    # Ward法による階層的クラスタリング
    hc.x <- hclust(dist.x, method = 'ward.D2')
    
    # 各データのクラスタ番号の算出
    ct.x <- cutree(hc.x, k = k)
    
    list(cluster = ct.x)
}

# ギャップ統計量の算出
gap.ward.cars <- clusGap(cars, FUNcluster = get.clusid, K.max = k.max)
gap.ward.cars

# ギャップ統計量のプロット
gap <- gap.ward.cars$Tab |> 
    as.data.frame() |> 
    mutate(k = seq(k.max))  # kを数値としてとりあつかう

p <- ggplot(data = gap, aes(x = k, y = gap)) +
    geom_line() +
    geom_point() +
    scale_x_continuous(breaks = 1:k.max)  # X軸のラベルを1から10に設定

print(p)

### 13-3-3 階層的クラスタリングの高速化
library(MASS)

# Bostonデータセットの確認
data("Boston")
Boston |> head(3)
Boston |> dim()

library(fastcluster)
library(microbenchmark)

# 変数のスケーリング
Boston.scaled <- Boston |> scale()

# データ間の距離の算出
dist.Boston <- Boston.scaled |> dist()

# statsのパッケージとfastclusterパッケージの実行速度の比較
microbenchmark(
    stats::hclust(dist.Boston, method = 'ward.D2'),
    fastcluster::hclust(dist.Boston, method = 'ward.D2')
)

### 13-3-4 階層的クラスタリングの可視化

# ヒートマップのプロット
Boston.mat <-  Boston |> as.matrix()
heatmap(Boston.mat)

# データの正規化
Boston.mat.scaled <- scale(Boston.mat)

# ヒートマップのプロット
heatmap(Boston.mat.scaled)

library(gplots)
heatmap.2(as.matrix(Boston), scale = 'column', labRow = '')

library(dendextend)

# Ward法によるcarsデータセットのクラスタリング
dend <- cars |> 
    scale() |> 
    dist() |> 
    hclust(method = 'ward.D2') |> 
    as.dendrogram()

# デンドログラムのプロット
dend |> plot()

# ラベルサイズの変更
dend |> 
    set('labels_cex', 0.7) |> 
    plot(main = 'ラベルのサイズを変更')

# リーフの点の種類、文字の大きさ、色、ラベルの大きさの変更
dend |> 
    set('leaves_pch', 19) |>      # 点の種類 
    set('leaves_cex', 0.5) |>     # 文字の大きさ
    set('leaves_col', 'blue') |>  # 色
    set('labels_cex', 0.7) |>     # ラベルの大きさ
    plot()

# クラスタごとの色の塗り分け
dend |> 
    set('labels_cex', 0.5) |> 
    hang.dendrogram(hang_height = 0.8) |> 
    set('branches_k_color', value = c('red', 'blue', 'green'), k = 3) |> 
    plot()

# クラスタを長方形で囲む
dend |> 
    set('labels_cex', 0.5) |> 
    hang.dendrogram(hang_height = 0.8) |> 
    set('branches_k_color', value = c('red', 'blue', 'green'), k = 3) |> 
    plot()
dend |> 
    rect.dendrogram(k = 3, border = 8, lty = 5, lwd = 1)

# ggplot2パッケー所を用いたデンドログラムのプロット
library(ggplot2)

# デンドログラムの設定
dend2 <- dend |> 
    set('labels_cex', 0.5) |> 
    hang.dendrogram(hang_height = 0.8) |> 
    set('branches_k_color', value = c('red', 'blue', 'green'), k = 3) |> 
    set('branches_lwd', 0.5) |> 
    set('branches_lty', 1) |> 
    set('nodes_pch', 19) |> 
    set('nodes_cex', 1) |> 
    set('nodes_col', 'black')

# ggplot2パッケージで描画可能なオブジェクトへの変換
ggd <- as.ggdend(dend2)

# ggplot2パッケージでの描画
ggplot(ggd, offset_labels = -0.1)

# 水平方向へのヒストグラムのプロット
ggplot(ggd, horiz = TRUE, theme = NULL)

# dendextendパッケージで設定したヒストグラムをheatmap.2関数でプロット
library(dendextend)
library(MASS)
data("Boston")

# Bostonデータセットの行列への変換
Boston.mat <- Boston |> as.matrix()

# 行方向のデンドログラムの設定
Rowv <- Boston.mat |> 
    scale() |> 
    dist() |> 
    hclust(method = 'ward.D2') |> 
    as.dendrogram() |> 
    set('branches_k_color', k = 3) |> 
    set('branches_lwd', 2) |> 
    ladderize()

# 列方向のデンドログラムの設定
Colv <- Boston.mat |> 
    t() |> 
    scale() |> 
    dist() |> 
    hclust(method = 'ward.D2') |> 
    as.dendrogram() |> 
    set('branches_k_color', k = 2) |> 
    set('branches_lwd', 2) |> 
    ladderize()

# ヒートマップのプロット
heatmap.2(Boston.mat, Rowv = Rowv, Colv = Colv, scale = 'column')


## 非階層的クラスタリング

### k平均法
set.seed(71)

# carsデータセットのロード
data("cars")

# k平均法の実行
km.cars <- kmeans(cars, centers = 3, nstart = 100)
km.cars

# carsデータセットの散布図（k平均法によるクラスタリング結果を点の色、形で表示）
library(dplyr)
library(ggplot2)

# クラスタ番号の結合
cars.km <- cars |> 
    mutate(cluster = factor(km.cars$cluster, levels = 1:3))

# 点の色をクラスタ番号とする散布図のプロット
p <- ggplot(
    data = cars.km, 
    aes(x = speed, y = dist, color = cluster, shape = cluster)
    ) +
    geom_point()

print(p)

# クラスター数の決め方
library(cluster)

set.seed(71)

# 最大クラスタ数
k.max <- 10

gap.kmeans.cars <- clusGap(cars, FUNcluster = kmeans, K.max = k.max)
gap.kmeans.cars

# ギャップ統計量のプロット
library(dplyr)
library(ggplot2)

gap <- gap.kmeans.cars$Tab |> 
    as.data.frame() |> 
    mutate(k = seq(k.max))

p <- ggplot(data = gap, aes(x = k, y = gap)) +
    geom_line() +
    geom_point() +
    scale_x_continuous(breaks = 1:k.max)  # X軸のラベルを1からk.maxに設定

print(p)

### 14-4-2 kドメイト法

library(cluster)

# kドメイト法の実行
pam.cars <- pam(cars, k = 3, keep.diss = TRUE, keep.data = TRUE)

# クラスタリングの結果の要約
summary(pam.cars)

# carsデータセットの散布図（kドメイト法によるクラスタリング結果を点の色で表示）
# carsデータセットにデータ番号とクラスタ番号を追加
cars.with.No.clus <- cars %>% 
    mutate(No = seq(nrow(.)), cluster = factor(pam.cars$cluster))

p <- ggplot(
    data = cars.with.No.clus, 
    aes(x = speed, y = dist, color = cluster)) +
    geom_text(aes(label = No))

print(p)

# シルエットプロットの描画
plot(pam.cars, which.plots = 2)

# シルエットプロットを描画するための情報
pam.cars$silinfo$widths |> head()

# シルエットプロットの情報とクラスタ番号、隣接クラスタを付加し、データ番号の昇順で並び替え
cars.with.widths <- pam.cars$silinfo$widths |> 
    as.data.frame() |> 
    mutate(
        cluster = factor(cluster, levels = 1:3),
        neighbor = factor(neighbor, levels = 1:3)
    ) %>% 
    arrange(as.numeric(rownames(.))) %>%
    cbind(cars, .)

# 先頭6行の表示
cars.with.widths |> head()

# carsデータセットの散布図（点の色がシルエット幅）
library(ggplot2)

p <- ggplot(
    data = cars.with.widths,
    aes(
        x = speed, 
        y = dist, 
        shape = cluster, 
        # fill = sil_width,
        color = sil_width
        )
    ) +
    geom_point() +
    scale_color_gradient(low = "blue", high = "red")

print(p)

### 13-4-3 ファジーC平均法

# ファジークラスタリングの実行
fanny.cars <- fanny(cars, k = 3)

# 先頭の6データのクラスタ所属確率
fanny.cars$membership |> head()

# 先頭の6データが所属するクラスタ
fanny.cars$clustering |> head()

