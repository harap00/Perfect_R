# 16章 頻出パターンの抽出

## 16-1 頻出パターンとは
# コードなし

## 16-2 頻出するパターンの概要
### 16-2-1 パターンの種別
# コードなし

### 16-2-2 パターンを評価する指標
# コードなし

## 16-3 頻出アソシエーションルール・頻出アイテムセットの抽出
# パッケージのインストール関数
inst_package <- function(packages){
  for (package in packages){
    if(!require(package, character.only = TRUE)){
      install.packages(package, quiet = TRUE)
    }
    library(package, character.only = TRUE)
  }
}

# パッケージのインストール
packages <- c(
  'arules',
  'dplyr',
  'ggplot2',
  'arulesViz',
  'arulesSequences'
)

inst_package(packages = packages)

### 16-3-1 アプリオリ
data("Epub")

# トランザクションデータの要約
summary(Epub)

# 単一アイテムの指示度の算出
itemfreq <- Epub %>% 
  itemFrequency() %>% 
  data.frame(item = names(.), support = .) %>% 
  arrange(desc(support))

itemfreq %>% head()

# 単一アイテムの指示度の区分点
itemfreq %>% 
  select(support) %>% 
  unlist() %>% 
  quantile(probs = seq(0, 1, by = 0.1))

# 単一アイテムの指示度のヒストグラム
p <- ggplot(data = itemfreq, aes(x = support, y = ..count..)) +
  geom_histogram()

print(p)

# トランザクションデータの先頭
inspect(Epub[1:5])

# Epubデータセットの先頭5トランザクションの確認
inspect(Epub[1:5], setStart = '<<', setEnd = '>>', itemSep = ' + ')

# アソシエーションルールの抽出
rules.Epub <- apriori(Epub, parameter = list(support = 0.001, confidence = 0.2))

# 抽出したルールの確認
rules.Epub

# 確信度の上位3ルールを調べる
rules.Epub %>% sort(by = 'confidence') %>% head(3) %>% inspect()

# ルールの出現回数
n.rule <- 0.001080806 * rules.Epub@info$ntransactions
n.rule

# ルールの条件部の出現回数
n.left <- n.rule / 0.8947368
n.left

# ルールの結論部の出現回数
n.right <- n.rule * rules.Epub@info$ntransactions / (402.0947 * n.left)
n.right

# 指示度と確信度の分散図のプロット
plot(rules.Epub)

# アソシエーションルールの可視化
plot(rules.Epub, method = 'grouped')

# アイテム間の関係の可視化
plot(rules.Epub, method = 'graph', control = list(type = 'itemsets'))

# 頻出アイテムセットの抽出
items.Epub <- apriori(Epub, parameter = list(support = 0.001, target = 'frequent itemset'))

# 指示度の上位6セットを調べる
items.Epub %>% sort(by = 'support') %>% head() %>% inspect()

# 最小アイテム数2の頻出アイテムセットの抽出
items.Epub <- apriori(
  Epub, 
  parameter = list(support = 0.001, minlen = 2, target = 'frequent itemset')
  )

# 指示度の上位6セットを調べる
items.Epub %>% sort(by = 'support') %>% head() %>% inspect()

### 16-3-2 Eclat

# 頻出アイテムセットの抽出
itemset.Epub <- eclat(Epub, parameter = list(support = 0.001))

# 抽出したルールの確認
itemset.Epub

# 確信度の上位3ルールを調べる
itemset.Epub %>% sort(by = 'support') %>% head(3) %>% inspect()

### 16-3-3 設定可能なパラメータ

# アソシエーションルールの抽出
rules.Epub <- apriori(
  Epub, 
  parameter = list(
    support = 0.001, 
    confidence = 0.2, 
    arem = 'diff', 
    aval = TRUE
    )
  )

# 抽出したルールの確認
rules.Epub

# 確信度の上位3ルールを調べる
rules.Epub %>% 
  sort(by = 'confidence') %>% 
  head(3) %>% 
  inspect()

# 頻出アイテムセットの抽出
itemset.Epub <- eclat(
  Epub, 
  parameter = list(
    support = 0.001, 
    tidLists = TRUE
  )
)

# 抽出したアイテムセットの確認
itemset.Epub

# アイテムセット * トランザクションの行列
itemset.Epub@tidLists

# 先頭6個のアイテムセット
itemset.Epub@tidLists@itemInfo %>% head() 

# 先頭6個のトランザクション情報
itemset.Epub@tidLists@transactionInfo %>% head() 

# 1番目のアイテムセットが出現するトランザクションの確認
itemset.Epub@tidLists@data[1, ] %>% which()

# アソシエーションルールの抽出（結論部が'doc_6e7'のルールのみ）
rules.Epub <- apriori(
    Epub, 
    parameter = list(support = 0.001, confidence = 0.2),
    appearance = list(rhs = 'doc_6e7', default = 'lhs')
    )

# 抽出したルールの確認
rules.Epub

# ルールを調べる
rules.Epub %>% sort(by = 'confidence') %>% inspect()

### 16-3-4 ファイルからのトランザクションデータのロード

# retailデータセットのダウンロード
download.file('http://fimi.ua.ac.be/data/retail.dat', 'retail.dat')

library(arules)

# retailデータセットのロード
retail <- read.transactions('retail.dat')

# トランザクションデータの要約
summary(retail)

# retailデータセットに対するアプリオリの実行
rules.retail <- apriori(
    retail, 
    parameter = list(support = 0.01, confidence = 0.2, minlen =2)
    )

rules.retail

# 信頼度が上位6ルールを調べる
rules.retail %>% sort(by = 'confidence') %>% head() %>% inspect()

## 系列パターンの抽出

### 16-4-1 系列パターンとは
# コードなし

### 16-4-2 SPADE
library(arulesSequences)

# zakiデータセットのロード
zaki <- read_baskets(
    con = system.file('misc', 'zaki.txt', package = 'arulesSequences'),
    info = c('sequenceID', 'eventID', 'SIZE')
)

as(zaki, 'data.frame')

# CSPADEの実行
csp.zaki <- cspade(
    zaki,
    parameter = list(support = 0.3),
    control = list(verbose = TRUE)
    )

csp.zaki

# 抽出した系列パターンの要約
summary(csp.zaki)

# 抽出したパターンの確認
as(csp.zaki, 'data.frame')

# 系列パターンのアソシエーションルールの抽出
csp.zaki %>% ruleInduction() %>% inspect()

## 6-4-3 実践例：クリックデータからの系列パターンの抽出

# データのダウンロード
download.file('http://www.philippe-fournier-viger.com/spmf/datasets/BMS1.dat', 'BMS1.dat')

# BMS1データセットをダウンロード先からロード
bms1.dat <- read.table(
    'BMS1.dat',
    col.names = c('sequenceID', 'event')
    )

# データの先頭
bms1.dat %>% head()

# 系列IDごとにトランザクションID、アイテム数、アイテムを表示
bms1.seq <-
    bms1.dat %>% 
    group_by(sequenceID) %>% 
    mutate(eventID = seq(n()), SIZE = 1) %>% 
    select(sequenceID, eventID, SIZE, event)

bms1.seq %>% head()

# データの出力
write.table(
    bms1.seq,
    'bms1_seq.tsv',
    row.names = FALSE,
    col.names = FALSE
)

# BMS1データセットのロード
bms1 <- read_baskets(
    con = 'bms1_seq.tsv', 
    info = c('sequenceID', 'eventID', 'SIZE')
    )

bms1

# CSPADEの実行
csp.bms1 <- cspade(
    bms1,
    parameter = list(support = 0.005),
    control = list(verbose = TRUE)
)

csp.bms1

summary(csp.bms1)

# 抽出したパターンの確認
csp.bms1 %>% sort(by = 'support') %>% head() %>% inspect()

# 長さが2以上の系列パターンの抽出
csp.bms1 %>% 
    subset(size(x) > 1) %>% 
    sort(by = 'support') %>% 
    head() %>% 
    as('data.frame')
