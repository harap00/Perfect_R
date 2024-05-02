# 第14章 分類・回帰

## 14-1 分類・回帰とは
# コードなし

## 14-2 分類・回帰に用いられる手法
# コードなし

## 14-3 分類・回帰の流れ
if (!require('ggplot2', character.only = TRUE)){
  install.packages('ggplot2', quiet = TRUE)
}

if (!require('pROC', character.only = TRUE)){
  install.packages('pROC', quiet = TRUE)
}

### 14-3-1 全体の流れ
# コードなし

### 14-3-2 分類の評価指標
library(ggplot2)

# 偽陽性率（fpr）と真陽性率（tpr）の算出
fpr.tpr <- data.frame(
  fpr = c(
    0, 0, 0, 1, 1, 2, 3, 3, 3, 3, 4, 5, 5, 6,
    7, 8, 8, 8, 9, 10, 10, 11, 12, 12, 13, 14
    ) / 14,
  tpr = c(
    0, 1, 2, 2, 3, 3, 3, 4, 5, 6, 6, 6, 7, 7,
    7, 7, 8, 9, 9, 9, 10, 10, 10, 11, 11, 11
    ) / 11
)

# ROC曲線の例
p <- ggplot(data = fpr.tpr, aes(x = fpr, y = tpr)) + 
  geom_line() +
  geom_point() +
  geom_abline(slope = 1, intercept = 0) +
  xlab('偽陽性率') +
  ylab('真陽性率')

print(p)

# pROCパッケージを用いてプロットしたROC曲線
library(pROC)

# データフレームの作成
prob.label <- data.frame(
  prob = c(
    0.98, 0.95, 0.9, 0.87, 0.85, 0.8, 0.75, 0.71, 0.63, 0.55, 0.51, 0.47, 0.43,
    0.38, 0.35, 0.31, 0.28, 0.24, 0.22, 0.19, 0.15, 0.12, 0.08, 0.04, 0.01
  ),
  label = factor(
    c(
      1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0
    ),
    levels = c(1, 0)
  )
)

# ROC曲線のプロット
roc.curve <- roc(
  response = prob.label$label, 
  predictor = prob.label$prob,
  levels = c(0, 1)
  )

plot(roc.curve, legacy.axes = TRUE)

auc(roc.curve)


### 14-3-3 回帰の評価指標
# コードなし

## 14-4 単回帰分析
if (!require('ggplot2', character.only = TRUE)){
  install.packages('ggplot2', quiet = TRUE)
}

### 14-4-4 単回帰分析の実行

# carsデータセットのロード
data('cars')

# データの先頭
head(cars, n = 3)

cars
# 単回帰分析の実行
lm.cars <- lm(formula = dist ~ speed, data = cars)
lm.cars

# carsデータセットに対する単回帰分析

# 回帰直線の係数
coeff <- lm.cars$coefficients

# 回帰直線の傾き
slope <- coeff[2]

# 回帰直線の切片
intercept <- coeff[1]

p <- ggplot(data = cars, aes(x = speed, y = dist)) +
  geom_point() +
  geom_abline(intercept = intercept, slope = slope)

print(p)

# 回帰分析結果の要約
summary(lm.cars)


### 14-4-2 回帰診断
# 残差プロット
layout(matrix(1:4, 2, 2))
plot(lm.cars)


### 14-4-3 ggplot2パッケージを用いた回帰分布の実行
data(cars)

p <- ggplot(data = cars, aes(x = speed, y = dist)) +
  stat_smooth(method = 'lm') +
  geom_point()

print(p)

# x軸とy軸を対数に取ったケース
p <- ggplot(data = cars, aes(x = speed, y = dist)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()

print(p)

# speedとdistの対数の単回帰分析
lm.log.cars <- lm(log(dist) ~ log(speed), data = cars)
lm.log.cars

summary(lm.log.cars)

# 対数変換後の単回帰分析
p <- ggplot(data = cars, aes(x = speed, y = dist)) +
  stat_smooth(method = 'lm') +
  geom_point() +
  scale_x_log10() +
  scale_y_log10() +
  ggtitle('対数変換後の単回帰分析')

print(p)


## 重回帰分析

# ライブラリのインストールと読み込み
install_packages <- c(
  'coefplot',
  'GGally',
  'dplyr',
  'corrplot',
  'ggplot2',
  'tidyr',
  'caret'
)

for (package in install_packages) {
    if (!require(package, character.only = TRUE)) {
        install.packages(package, quiet = TRUE)
    }
    library(package, character.only = TRUE)
}

### 14-5-1 重回帰分析の実行

library(MASS)

# Bostonデータセットのロード
data("Boston")

# 重回帰分析の実行
lm.Boston <- lm(medv ~ ., data = Boston)

# 回帰結果の要約
summary(lm.Boston)

### 回帰係数プロット
coef(summary(lm.Boston))

# 回帰係数のプロット
library(coefplot)
coefplot(lm.Boston)

### 14-5-3 変数選択
lm.Boston.step <-  step(lm.Boston)

# 変数選択後の回帰結果の要約
summary(lm.Boston.step)

### 14-5-4 重回帰分析の前処理

# 多変量関連図のプロット
pairs(Boston)

# ggpairs関数による多変量関連図
library(GGally)
print(ggpairs(Boston), left = 0.45, bottom = 0.3)


# 相関係数の算出
library(dplyr)
cor.Boston <-  Boston %>% cor()
cor.Boston

# corrplot関数による相関係数のプロット
dev.off()
library(corrplot)
corrplot(Boston %>% cor(), addCoef.col = TRUE)


# geom_tile関数を用いた相関係数のヒートマップ

# 相関係数行列の縦持ち形式への変換
cor.Boston.l <- cor.Boston %>% 
    as.data.frame() %>%
    mutate(item1 = row.names(.)) %>% 
    gather(item2, corr, -item1)

cor.Boston.l %>% head(3)

# geom_tile関数を用いた相関係数行列のヒートマップのプロット
p <- ggplot(
    data = cor.Boston.l,
    aes(
        x = item1,
        y = item2, 
        fill = corr
        )
    ) +
    geom_tile() +
    scale_fill_gradient(
        low = 'white',
        high = 'red'
    ) 

print(p)

# 分散拡大要因の算出
vif <- 1 / (1 - (Boston %>% dplyr::select(- medv) %>% cor)^ 2) 

# 縦長形式への変換
vif.l <- vif %>% 
    as.data.frame() %>% 
    mutate(item1 = rownames(.)) %>% 
    gather(item2, vif, - item1)

# 分散拡大要因のヒートマップのプロット
p <-  ggplot(data = vif.l, aes(x = item1, y = item2, fill = vif)) +
    geom_tile() +
    geom_text(label = sprintf('%.2f', vif)) +
    scale_fill_gradient(low = 'white', high = 'red')

print(p)


# 変数間の線形関係の確認
findLinearCombos(Boston)

# 相関の高い変数の特定（デフォルトは相関係数のしきい値は0.9）
findCorrelation(cor.Boston)

# 相関奇数のしきい値を0.6に変更
findCorrelation(cor.Boston, cutoff = 0.6)


## 10-6 ロバスト回帰
### 14-6-1 外れ値を含むデータの回帰分析

library(MASS)

# phonesデータセット
phones

# 年ごとの電話の件数のプロット
p <- ggplot(
    phones %>% as.data.frame(),
    aes(x = year, y = calls)
    ) +
    geom_point()

print(p)


# phonesデータセットの回帰直線をプロット
p <- ggplot(
    phones  %>%  as.data.frame(),
    aes(x =year, y= calls)
    ) + 
    stat_smooth(method = 'lm') +
    geom_point()

print(p)


# phonesデータセットに対する単回帰分析の実行
lm.phones <- lm(calls ~ year, data = phones %>% as.data.frame())

summary(lm.phones)

# 回帰診断
layout(matrix(1:4, 2, 2))
plot(lm.phones)

### 14-6-2 ロバスト回帰の概要
# コードなし

### 14-6-3 ロバスト回帰の実行
library(MASS)
library(ggplot2)
library(dplyr)

# ロバスト回帰（HuberのM推定量）
rlm.phones <- rlm(calls ~ year, data = phones %>% as.data.frame(), maxit = 100)
rlm.phones

# 直線回帰の可視化
p <- ggplot(data = phones %>% as.data.frame(), aes(x = year, y = calls)) +
    stat_smooth(method = function(formula, data, weights = weight)
        rlm(formula, data, weights = weight, maxit = 100)) +
    geom_point()

print(p)    

# 直線回帰の可視化(再) 
p <- ggplot(data = phones %>% as.data.frame(), aes(x = year, y = calls)) +
    stat_smooth(method = 'rlm', ) +
    geom_point()

print(p)    


## 14-7 ロジスティック回帰分析
if (!require('kernlab', character.only = TRUE )){
    install.packages('kernlab', quiet = TRUE)
}

library(kernlab)

# spamデータセットのロード
data(spam)
head(spam, 3)

# 目的変数の変換
spam.conved <- spam %>% mutate(type = 2 - as.integer(type))
head(spam.conved, n = 3)

# ロジスティック回帰分析
glm.spam <- glm(type ~ ., data = spam.conved, family = binomial)

# 回帰結果の要約
summary(glm.spam)

# 回帰係数のプロット
library(coefplot)
coefplot(glm.spam)

# 変数選択
glm.spam.step <- step(glm.spam, trace = 0)

# 変数選択直後の回帰結果の要約
summary(glm.spam.step)


## 14-8 決定木

# ライブラリのインストールと読み込み
install_packages <- c(
    'rpart',
    'C50',
    'pROC',
    'rattle',
    'party',
    'ISLR'
)

for (package in install_packages) {
    if (!require(package, character.only = TRUE)) {
        install.packages(package, quiet = TRUE)
    }
    library(package, character.only = TRUE)
}

### 14-8-1 決定木の実行
library(C50)

# churnデータセットのロード ※ C50からデータセットが削除されたため
churn <- read.csv(
    "https://query.data.world/s/f5sr4ilnjblkqm2dr6ythloea5aiq5?dws=00000", 
    header=TRUE, 
    stringsAsFactors=TRUE
    )

churnTrain <- churn[1:3333, ]
churnTest <- churn[3334:5000, ]

# 決定木を用いた学習
model.rp <- rpart(churn ~ ., data = churnTrain, control = list(maxdepth = 3))
model.rp

# 決定木のプロット
dev.off()
par(pin = c(5, 5), mar = c(2, 2, 2, 2), cex = 0.7)
plot(model.rp)
text(model.rp)

# テストデータに対する予測
pred <- predict(model.rp, churnTest, type = 'class')

# 混同行列
conf.mat <- table(pred, churnTest$churn)
conf.mat

### 14-8-2 決定木の精度予測
library(pROC)

# クラス確率の予測
prob <- predict(model.rp, churnTest)

# ROC曲線のプロット
roc.curve <- roc(
    response = churnTest$churn, 
    predictor = prob[, 'Yes'], 
    levels = c('No', 'Yes')
    )

dev.off()
plot(roc.curve, legacy.axes = TRUE)

# AUCの算出
text(
    x = 0.3, 
    y = 0.2, 
    labels = auc(roc.curve) %>% 
        sprintf('%.3f', .) %>% 
        paste0('AUC: ', .), 
    cex = 2.0
)

### 14-8-3 その他のプロット用パッケージ
library(rattle)

# 決定木のプロット
fancyRpartPlot(model.rp, sub = '', cex = 0.5)

### 14-8-4 条件付き推測木
library(party)
library(C50)

# churnデータセットのロード ※ C50からデータセットが削除されたため
churn <- read.csv(
    "https://query.data.world/s/f5sr4ilnjblkqm2dr6ythloea5aiq5?dws=00000", 
    header=TRUE, 
    stringsAsFactors=TRUE
)

churnTrain <- churn[1:3333, ]
churnTest <- churn[3334:5000, ]

# 条件付き推測木の構築
model.ctree <- ctree(
    churn ~ ., 
    data = churnTrain, 
    controls = ctree_control(maxdepth = 3)
    )

# 条件付き推測木のプロット
dev.off()
plot(model.ctree, cex = 0.5)


## 14-9 サポートベクターマシン

# ライブラリのインストールと読み込み
install_packages <- c(
    'kernlab'
)

for (package in install_packages) {
    if (!require(package, character.only = TRUE)) {
        install.packages(package, quiet = TRUE)
    }
    library(package, character.only = TRUE)
}

set.seed(71)

# churnデータセットのロード ※ C50からデータセットが削除されたため
churn <- read.csv(
    "https://query.data.world/s/f5sr4ilnjblkqm2dr6ythloea5aiq5?dws=00000", 
    header=TRUE, 
    stringsAsFactors=TRUE
)

churnTrain <- churn[1:3333, ]
churnTest <- churn[3334:5000, ]

# サポートベクターマシンを用いた学習
model.ksvm <- ksvm(churn ~ ., data = churnTrain, prob.model = TRUE)
model.ksvm

# テストデータに対する予測
pred <- predict(model.ksvm, churnTest)

# 混同行列
conf.mat <- table(pred, churnTest$churn)
conf.mat

### 14-9-2 サポートベクタマシンの予測の検証

# クラス確率の予測
prob <- predict(model.ksvm, churnTest, type = 'prob')

# ROC曲線のプロット
roc.curve <- roc(
    response = churnTest$churn, 
    predictor = prob[, 'Yes'],
    levels = c('No', 'Yes')
    )

plot(roc.curve, legacy.axes = TRUE)

# AUCの算出
text(
    x = 0.3, 
    y = 0.2, 
    labels = auc(roc.curve) %>% 
        sprintf('%.3f', .) %>% 
        paste0('AUC: ', .), 
    cex = 2.0
)


## 14-10 ランダムフォレスト

# ライブラリのインストールと読み込み
install_packages <- c(
    'randomForest',
    'C50',
    'pROC',
    'dplyr',
    'ranger',
    'Rborist',
    'ggplot2'
)

for (package in install_packages) {
    if (!require(package, character.only = TRUE)) {
        install.packages(package, quiet = TRUE)
    }
    library(package, character.only = TRUE)
}

### 14-10-1 ランダムフォレストを実行するパッケージの外観
# コードなし

### 14-10-2 randomForestパッケージを用いたランダムフォレストの実行
library(C50)

# churnデータセットのロード ※ C50からデータセットが削除されたため
churn <- read.csv(
    "https://query.data.world/s/f5sr4ilnjblkqm2dr6ythloea5aiq5?dws=00000", 
    header=TRUE, 
    stringsAsFactors=TRUE
)

churnTrain <- churn[1:3333, ]
churnTest <- churn[3334:5000, ]

# ランダムフォレストを用いた学習
model.rf <- randomForest(churn ~ ., data = churnTrain)
model.rf

# テストデータに対する予測
pred <- predict(model.rf, churnTest)

# 混同行列
conf.mat <- table(pred, churnTest$churn)
conf.mat

### 14-10-3 ランダムフォレストの予測の検証

# クラス確率の予測
prob <- predict(model.rf, churnTest, type = 'prob')

# ROC曲線のプロット
roc.curve <- roc(
    response = churnTest$churn, 
    predictor = prob[, 'Yes'], 
    levels = c('No', 'Yes')
    )

plot(roc.curve, legacy.axes = TRUE)

# AUCの算出
text(
    x = 0.3, 
    y = 0.2, 
    labels = auc(roc.curve) %>% 
        sprintf('%.3f', .) %>% 
        paste0('AUC: ', .), 
    cex = 2.0
)

### 14-10-4 変数の重要度の算出・プロット

# churnデータセットの読み込み
churn <- read.csv(
    "https://query.data.world/s/f5sr4ilnjblkqm2dr6ythloea5aiq5?dws=00000", 
    header=TRUE, 
    stringsAsFactors=TRUE
)

churnTrain <- churn[1:3333, ]
churnTest <- churn[3334:5000, ]

# ランダムフォレストを用いた学習
model.rf <- randomForest(churn ~ ., data = churnTrain)

# 変数の重要度の算出・プロット
vi <- varImpPlot(model.rf)

# 変数の重要度
vi %>%
    as.data.frame() %>%
    mutate(var = rownames(.)) %>% 
    dplyr::select(var, MeanDecreaseGini) %>%
    arrange(desc(MeanDecreaseGini))

# 目的変数に対するtotaldayminutesの寄与の確認
layout(matrix(1:2, 2))
partialPlot(model.rf, churnTrain, totaldayminutes, 'Yes')
partialPlot(model.rf, churnTrain, totaldayminutes, 'No')

### 14-10-5 そのほかのランダムフォレストパッケージ
set.seed(71)

# rangerによる予測モデルの構築
model.ranger <- ranger(
    churn ~ ., 
    data = churnTrain,
    mtry = max(floor((ncol(churnTrain) - 1) / 3), 1),
    num.trees = 500,
    write.forest = TRUE
    )

# テストデータに対する予測
pred.ranger <- predict(model.ranger, churnTest)

# 混同行列の算出
table(pred.ranger$predictions, churnTest$churn)

# ランダムシードの設定
set.seed(71)

# rangerによる予測モデルの構築（importance引数を"impurity"に設定）
model.ranger <- ranger(
    churn ~ ., 
    data = churnTrain,
    mtry = max(floor((ncol(churnTrain) - 1) / 3), 1),
    num.trees = 500,
    write.forest = TRUE,
    importance = 'impurity'
)

# 変数の重要度の算出
vi <- model.ranger %>% 
    importance() %>% 
    data.frame(var = names(.), importance = .) %>% 
    arrange(desc(importance))

vi

# 変数の重要度のプロット
p <- ggplot(data = vi, aes(x = var, y = importance)) +
    geom_bar(stat = 'identity') +
    theme(axis.text = element_text(angle = 90, hjust = 1))

print(p)

# ライブラリのインストールと読み込み
install_packages <- c(
    'microbenchmark'
)

for (package in install_packages) {
    if (!require(package, character.only = TRUE)) {
        install.packages(package, quiet = TRUE)
    }
    library(package, character.only = TRUE)
}

install.packages('Dummies')

# ランダムシードの設定
set.seed(71)

# 訓練データの変数説明（目的変数を除去してカテゴリをダミー変数に変換）
x.train <- churnTrain %>% 
    dplyr::select(- churn) %>% 
    model.matrix(~ ., data = .)

# 訓練データの目的変数
y.train <- churnTrain$churn

# Rboristによる予測モデルの構築
model.Rb <- Rborist(x.train, y.train, ntree = 10000, predProb = 0.32)

# テストデータの説明変数（目的変数を除去してカテゴリをダミー変数に変換）
x.test <- churnTest %>% model.matrix(~ ., data = .)

# テストデータの目的変数
y.test <- churnTest$churn

# テストデータに対する予測
pred <- predict(model.Rb, x.test)

# 予測値の抽出
lvs <- levels(churnTest$churn)
pred.Rb <- lvs[pred$yPred] %>% factor(., levels = lvs)

# 混同行列の算出
table(pred.Rb, y.test)

### 14-10-6 ランダムフォレストパッケージの引数の対応関係
# コードなし

## 勾配ブースティング

### 14-11-1 ブースティングを実行するパッケージ

# ライブラリのインストールと読み込み
install_packages <- c(
    'gbm',
    'C50',
    'pROC',
    'dplyr',
    'xgboost',
    'devtools',
    'Matrix'
)

for (package in install_packages) {
    if (!require(package, character.only = TRUE)) {
        install.packages(package, quiet = TRUE)
    }
    library(package, character.only = TRUE)
}

### 14-11-2 ブースティングの概要
# コードなし

###14-11-3 gbmパッケージによる購買ブースティングの実行
set.seed(71)

# 訓練データの目的変数を1,0に変換
churnTrain$churn <- - as.numeric(churnTrain$churn) + 2

# 構築する木の個数の設定
n.trees <- 5000

# 勾配ブースティングの実行
model.gbm <- gbm(churn ~ ., data = churnTrain, n.trees = n.trees)

model.gbm

# 最適な木の個数の推定
n.trees.pred <- gbm.perf(model.gbm)
n.trees.pred

# 勾配ブースティングによるテストデータに対する予測のROC曲線
# テストデータの目的変数を1,0に変換
churnTest$churn <- - as.numeric(churnTest$churn) + 2

# テストデータに対する予測（クラス確率の出力）
prob <- predict(model.gbm, churnTest, n.trees = n.trees.pred, type = 'response')
prob %>% head()

# ROC曲線のプロット
dev.off()
roc.curve <- roc(response = churnTest$churn, predictor = prob)
plot(roc.curve, legacy.axes = TRUE)

# AUCの算出
text(
    x = 0.3, 
    y = 0.2, 
    labels = auc(roc.curve) %>% 
        sprintf('%.3f', .) %>% 
        paste0('AUC: ', .), 
    cex = 2.0
)

### 14-11-4 xgboostパッケージによる勾配ブースティングの実行
set.seed(71)

# churnデータセットの読み込み
churn <- read.csv(
    "https://query.data.world/s/f5sr4ilnjblkqm2dr6ythloea5aiq5?dws=00000", 
    header=TRUE, 
    stringsAsFactors=TRUE
)

churnTrain <- churn[1:3333, ]
churnTest <- churn[3334:5000, ]

# 疎行列への変換
churnTrain.smm <- sparse.model.matrix(churn ~ ., data = churnTrain)
churnTest.smm <- sparse.model.matrix(churn ~ ., data = churnTest)

# 目的変数の数値への変換
label.train <- - as.integer(churnTrain$churn) + 2
label.test <- - as.integer(churnTest$churn) + 2

# xgboostの実行（木の個数nrounds=10、学習率eta=0.1、木の分割の閾値gamma=0.3、木の最大深さmax.depth=5、スレッド数nthread=1）
model.xgb <- xgboost(
    data = churnTrain.smm,
    label = label.train,
    nrounds = 250,
    eta = 0.1,
    gamma = 0.3,
    max.depth = 5,
    params = list(objective = 'binary:logistic', nthread = 1)
)

# テストデータに対する予測
pred <- predict(model.xgb, churnTest.smm)
pred.class <- (pred > 0.5) %>% as.integer()

# 混同行列の算出
conf.mat <- table(pred.class, label.test)
conf.mat

# クラス確率の予測
prob <- predict(model.xgb, churnTest.smm)

# ROC曲線のプロット
dev.off()
roc.curve <- roc(
    response = churnTest$churn, 
    predictor = prob
    )
plot(roc.curve, legacy.axes = TRUE)

# AUCの算出
text(
    x = 0.3, 
    y = 0.2, 
    labels = auc(roc.curve) %>% 
        sprintf('%.3f', .) %>% 
        paste0('AUC: ', .), 
    cex = 2.0
)

### 14-11-6 gbmパッケージとxgboostパッケージのパラメータの対応
# コードなし

## 14-12 caretパッケージによる分類・回帰の実行
### 14-12-1 ハイパーパラメータのグリッドサーチ
# churnデータセットの読み込み
churn <- read.csv(
    "https://query.data.world/s/f5sr4ilnjblkqm2dr6ythloea5aiq5?dws=00000", 
    header=TRUE, 
    stringsAsFactors=TRUE
)

churnTrain <- churn[1:3333, ]
churnTest <- churn[3334:5000, ]

set.seed(123)

# 探索するハイパーパラメータの空間
tuneGrid <- expand.grid(.C = c(0.5, 1), .sigma = c(0.005, 0.01))

# ハイパーパラメータのグリッドサーチ
model.svm <- train(
    churn ~ ., 
    data = churnTrain, 
    method = 'svmRadial', 
    tuneGrid = tuneGrid
    )

model.svm


### 14-12-2 クロスバリデーション
set.seed(123)

# 10分割クロスバリデーションの設定
trControl <- trainControl(method = 'cv', number = 10, allowParallel = FALSE)

# 10分割クロスバリデーションの実行
model.svm <- train(
    churn ~ ., 
    data = churnTrain, 
    method = 'svmRadial', 
    trControl = trControl
    )

model.svm

### 14-12-3 ハイパーパラメータのグリッドサーチ＋クロスバリデーション
set.seed(123)

# 探索するハイパーパラメータの空間
tuneGrid <- expand.grid(.C = c(0.5, 1), .sigma = c(0.005, 0.01))

# 10分割クロスバリデーションの設定
trControl <- trainControl(method = 'CV', number = 10)

# ハイパーパラメータのグリッドサーチと10分割クロスバリデーションを組み合わせた処理
model.svm <- train(
    churn ~ .,
    data = churnTrain,
    method = 'svmRadial',
    tuneGrid = tuneGrid,
    trControl = trControl
)

model.svm

# テストデータに対する予測
pred <- predict(model.svm, churnTest)

# 混同行列の算出
conf.mat <- table(pred, label.test)
conf.mat


## 14-13 mlrパッケージによる分類・回帰の実行
# ライブラリのインストールと読み込み
install_packages <- c(
    'mlr'
)

for (package in install_packages) {
    if (!require(package, character.only = TRUE)) {
        install.packages(package, quiet = TRUE)
    }
    library(package, character.only = TRUE)
}

### 14-13-1 ハイパーパラメータのグリッドサーチ＋クロスバリデーション
# churnデータセットの読み込み
churn <- read.csv(
    "https://query.data.world/s/f5sr4ilnjblkqm2dr6ythloea5aiq5?dws=00000", 
    header=TRUE, 
    stringsAsFactors=TRUE
)

churnTrain <- churn[1:3333, ]
churnTest <- churn[3334:5000, ]

set.seed(71)

# 学習機の生成
svm.leaner <- makeLearner('classif.ksvm')

# タスクの生成
task <- makeClassifTask(id = 'gridsearch', data = churnTrain, target = 'churn')

# リサンプリング方法の指定
rdesc <- makeResampleDesc(method = 'CV', iters = 10)

# 探索するハイパーパラメータの空間
par.set <- makeParamSet(
    makeDiscreteParam('C', values = c(0.5, 1.0)),
    makeDiscreteParam('sigma', values = c(0.005, 0.01))
)

# ハイパーパラメータのチューニング方法の指定
ctrl <- makeTuneControlGrid()

# ハイパーパラメータのグリッドサーチ
model.svm <- tuneParams(
    svm.leaner, 
    task = task, 
    resampling = rdesc, 
    par.set = par.set, 
    control = ctrl
    )

best_model <- model.svm$learner
predict(best_model, newdata = churnTest)
