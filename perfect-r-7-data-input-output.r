{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "0ac16dfe",
   "metadata": {
    "papermill": {
     "duration": 0.009848,
     "end_time": "2024-04-02T14:13:39.796668",
     "exception": false,
     "start_time": "2024-04-02T14:13:39.786820",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 7 データ入出力\n",
    "## 7-1 Rにおけるデータ入出力\n",
    "### 7-1-1 コネクション"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "1c08398e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:13:39.819970Z",
     "iopub.status.busy": "2024-04-02T14:13:39.817185Z",
     "iopub.status.idle": "2024-04-02T14:13:39.972820Z",
     "shell.execute_reply": "2024-04-02T14:13:39.970323Z"
    },
    "papermill": {
     "duration": 0.170248,
     "end_time": "2024-04-02T14:13:39.975775",
     "exception": false,
     "start_time": "2024-04-02T14:13:39.805527",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "con <- file('ex.gz', 'w')\n",
    "cat('TLTLE,extra,line', '2,3,5', '11,13,17', file = 'ex2.data', sep = '\\n')\n",
    "close(con)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "155836bf",
   "metadata": {
    "papermill": {
     "duration": 0.008752,
     "end_time": "2024-04-02T14:13:39.993269",
     "exception": false,
     "start_time": "2024-04-02T14:13:39.984517",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 7-2 テキストファイルの入出力\n",
    "### 7-2-1 外部パッケージによるテキストファイル入出力"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "29fca7c0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:13:40.087410Z",
     "iopub.status.busy": "2024-04-02T14:13:40.016917Z",
     "iopub.status.idle": "2024-04-02T14:15:53.274771Z",
     "shell.execute_reply": "2024-04-02T14:15:53.272430Z"
    },
    "papermill": {
     "duration": 133.276933,
     "end_time": "2024-04-02T14:15:53.278928",
     "exception": false,
     "start_time": "2024-04-02T14:13:40.001995",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# data.tableパッケージのインストール\n",
    "install.packages('data.table', quiet = TRUE)\n",
    "\n",
    "# data.tableのfread関数\n",
    "library(data.table)\n",
    "# df <- fread('hoge.csv', data.table = FALSE)\n",
    "\n",
    "# readrパッケージのインストール\n",
    "install.packages('readr', quiet = TRUE)\n",
    "\n",
    "# readrの入力関数群\n",
    "library(readr)\n",
    "# df <- read_csv('hoge.csv') # カンマ区切りテキストの入力\n",
    "# df <- read_tsv('hoge.txt') # タブ区切りテキストの入力"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "f0f22ce1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:15:53.308747Z",
     "iopub.status.busy": "2024-04-02T14:15:53.306610Z",
     "iopub.status.idle": "2024-04-02T14:15:53.522692Z",
     "shell.execute_reply": "2024-04-02T14:15:53.520162Z"
    },
    "papermill": {
     "duration": 0.23255,
     "end_time": "2024-04-02T14:15:53.525971",
     "exception": false,
     "start_time": "2024-04-02T14:15:53.293421",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(readr)\n",
    "write_csv(iris, 'hoge.csv') # カンマ区切りテキストの出力\n",
    "write_tsv(iris, 'hoge.txt') # タブ区切りテキストへの出力"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6d320312",
   "metadata": {
    "papermill": {
     "duration": 0.009091,
     "end_time": "2024-04-02T14:15:53.544041",
     "exception": false,
     "start_time": "2024-04-02T14:15:53.534950",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 7-2-2 組み込み関数によるテキストファイルの入出力"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b4231eda",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:15:53.568439Z",
     "iopub.status.busy": "2024-04-02T14:15:53.566187Z",
     "iopub.status.idle": "2024-04-02T14:15:53.585280Z",
     "shell.execute_reply": "2024-04-02T14:15:53.582952Z"
    },
    "papermill": {
     "duration": 0.035344,
     "end_time": "2024-04-02T14:15:53.589149",
     "exception": false,
     "start_time": "2024-04-02T14:15:53.553805",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# データの入力\n",
    "# df <- read.csv('input.csv') # カンマ区切りテキストの入力\n",
    "# df <- read.delim('input.txt') # タブ区切りテキストの入力\n",
    "\n",
    "# データの出力\n",
    "# カンマ区切りテキストの場合、 sep引数にカンマを指定\n",
    "# write.table(iris, 'hoge.csv', sep = ',')\n",
    "# カンマ区切りテキストはwrite.table関数のラッパーであるwrite.csv関数でも読み込めるwrite.csv(iris, 'hoge.csv')\n",
    "# タブ区切りはテキストは sep引数にタブ記号\\tを指定\n",
    "# write.table(iris, 'hoge.txt', sep = '\\t')\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d8d3cfc2",
   "metadata": {
    "papermill": {
     "duration": 0.009146,
     "end_time": "2024-04-02T14:15:53.607403",
     "exception": false,
     "start_time": "2024-04-02T14:15:53.598257",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 7-2-3 テキストファイルの文字コードについて"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "ea53ee08",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:15:53.630989Z",
     "iopub.status.busy": "2024-04-02T14:15:53.628924Z",
     "iopub.status.idle": "2024-04-02T14:15:53.651775Z",
     "shell.execute_reply": "2024-04-02T14:15:53.649438Z"
    },
    "papermill": {
     "duration": 0.038914,
     "end_time": "2024-04-02T14:15:53.655922",
     "exception": false,
     "start_time": "2024-04-02T14:15:53.617008",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# df <- read.csv('test.csv') \n",
    "\n",
    "# df <- read.csv('hoge.csv', fileEncoding = 'CP932')\n",
    "library(readr)\n",
    "# df <- read_csv('hoge.csv', locale = locale(encoding = 'CP932'))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "24c2a330",
   "metadata": {
    "papermill": {
     "duration": 0.008945,
     "end_time": "2024-04-02T14:15:53.674820",
     "exception": false,
     "start_time": "2024-04-02T14:15:53.665875",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 7-3 Microsoft Excel ファイルの入出力\n",
    "### 7-3-1 Excelファイルの入出力"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "560a53e4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:15:53.697930Z",
     "iopub.status.busy": "2024-04-02T14:15:53.695755Z",
     "iopub.status.idle": "2024-04-02T14:16:47.440061Z",
     "shell.execute_reply": "2024-04-02T14:16:47.436480Z"
    },
    "papermill": {
     "duration": 53.760504,
     "end_time": "2024-04-02T14:16:47.444269",
     "exception": false,
     "start_time": "2024-04-02T14:15:53.683765",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "also installing the dependency ‘rJava’\n",
      "\n",
      "\n",
      "XLConnect 1.0.8 by Mirai Solutions GmbH [aut],\n",
      "  Martin Studer [cre],\n",
      "  The Apache Software Foundation [ctb, cph] (Apache POI),\n",
      "  Graph Builder [ctb, cph] (Curvesapi Java library),\n",
      "  Brett Woolridge [ctb, cph] (SparseBitSet Java library)\n",
      "\n",
      "https://mirai-solutions.ch\n",
      "https://github.com/miraisolutions/xlconnect\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# XLConnectパッケージのインストール\n",
    "install.packages('XLConnect', quiet = TRUE)\n",
    "\n",
    "library(XLConnect)\n",
    "# sample.xlsxファイルを読み込む\n",
    "# wb1 <- loadWorkbook('sample.xlsx')\n",
    "# ファイルを新規作成して出力\n",
    "# hoge.xlsxファイルを新規作成\n",
    "wb2 <- loadWorkbook('hoge.xlsx', create = TRUE)\n",
    "# irisdataという名前のシートにirisデータを出力\n",
    "wb2['irisdata'] <- iris\n",
    "# 保存\n",
    "saveWorkbook(wb2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "f37c7117",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:16:47.477753Z",
     "iopub.status.busy": "2024-04-02T14:16:47.473872Z",
     "iopub.status.idle": "2024-04-02T14:18:52.627688Z",
     "shell.execute_reply": "2024-04-02T14:18:52.625605Z"
    },
    "papermill": {
     "duration": 125.173263,
     "end_time": "2024-04-02T14:18:52.630601",
     "exception": false,
     "start_time": "2024-04-02T14:16:47.457338",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘openxlsx’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:XLConnect’:\n",
      "\n",
      "    getTables, loadWorkbook, mergeCells, saveWorkbook\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# openxlsxパッケージのインストール\n",
    "install.packages('openxlsx', quiet = TRUE)\n",
    "\n",
    "library(openxlsx)\n",
    "# sample.xlsxの1番目のシートを読み込む\n",
    "# wb <- read.xlsx('sample.xlsx', sheet=1)\n",
    "# irisデータを出力\n",
    " write.xlsx(iris, 'iris.xlsx')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fa252405",
   "metadata": {
    "papermill": {
     "duration": 0.011486,
     "end_time": "2024-04-02T14:18:52.654419",
     "exception": false,
     "start_time": "2024-04-02T14:18:52.642933",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 7-3-2 Excelファイルの入力に特化したパッケージ"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "b8b29d90",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:18:52.679011Z",
     "iopub.status.busy": "2024-04-02T14:18:52.676692Z",
     "iopub.status.idle": "2024-04-02T14:19:33.299657Z",
     "shell.execute_reply": "2024-04-02T14:19:33.297117Z"
    },
    "papermill": {
     "duration": 40.638875,
     "end_time": "2024-04-02T14:19:33.303021",
     "exception": false,
     "start_time": "2024-04-02T14:18:52.664146",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# readxlパッケージのインストール\n",
    "install.packages('readxl', quiet = TRUE)\n",
    "\n",
    "library(readxl)\n",
    "# sample.xlsx1番目のシートを読み込む\n",
    "# result <- read_excel('sample.xlsx', sheet = 1)\n",
    "# 全シートを読み込む。 結果はリストで帰ることに注意。\n",
    "# results <- lapply(excel_sheets('sample.xlsx'), read_excel, path = 'sample.xlsx')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3e6cefee",
   "metadata": {
    "papermill": {
     "duration": 0.009348,
     "end_time": "2024-04-02T14:19:33.322865",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.313517",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 7-4 SAS/SPSS/STATAから出力されたファイルの読み込み"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "3aceef5a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:19:33.346867Z",
     "iopub.status.busy": "2024-04-02T14:19:33.344774Z",
     "iopub.status.idle": "2024-04-02T14:19:33.362617Z",
     "shell.execute_reply": "2024-04-02T14:19:33.360273Z"
    },
    "papermill": {
     "duration": 0.033716,
     "end_time": "2024-04-02T14:19:33.366156",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.332440",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コード省略"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e9c86b76",
   "metadata": {
    "papermill": {
     "duration": 0.009903,
     "end_time": "2024-04-02T14:19:33.385893",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.375990",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 7-5 データベースの入出力\n",
    "### 7-5-1 MySQL"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "a985397c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:19:33.411835Z",
     "iopub.status.busy": "2024-04-02T14:19:33.409585Z",
     "iopub.status.idle": "2024-04-02T14:19:33.428644Z",
     "shell.execute_reply": "2024-04-02T14:19:33.426199Z"
    },
    "papermill": {
     "duration": 0.036926,
     "end_time": "2024-04-02T14:19:33.432880",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.395954",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コード省略"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "263f5ac5",
   "metadata": {
    "papermill": {
     "duration": 0.010539,
     "end_time": "2024-04-02T14:19:33.453490",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.442951",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 7-5-2 PostgreSQL"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "c6ba3e5b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:19:33.478642Z",
     "iopub.status.busy": "2024-04-02T14:19:33.476222Z",
     "iopub.status.idle": "2024-04-02T14:19:33.781126Z",
     "shell.execute_reply": "2024-04-02T14:19:33.778888Z"
    },
    "papermill": {
     "duration": 0.322052,
     "end_time": "2024-04-02T14:19:33.785264",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.463212",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コード省略"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d22b5ada",
   "metadata": {
    "papermill": {
     "duration": 0.009751,
     "end_time": "2024-04-02T14:19:33.804925",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.795174",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 7-6 標準入出力"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "ef9c52ef",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:19:33.829288Z",
     "iopub.status.busy": "2024-04-02T14:19:33.827290Z",
     "iopub.status.idle": "2024-04-02T14:19:33.846049Z",
     "shell.execute_reply": "2024-04-02T14:19:33.843629Z"
    },
    "papermill": {
     "duration": 0.035339,
     "end_time": "2024-04-02T14:19:33.849994",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.814655",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コード省略"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "83ac87cf",
   "metadata": {
    "papermill": {
     "duration": 0.009593,
     "end_time": "2024-04-02T14:19:33.869244",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.859651",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 7-7 Webデータの取得\n",
    "### 7-7-1 XMLパッケージによるデータの取得"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "cb5d1f2f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:19:33.893161Z",
     "iopub.status.busy": "2024-04-02T14:19:33.891186Z",
     "iopub.status.idle": "2024-04-02T14:20:08.070183Z",
     "shell.execute_reply": "2024-04-02T14:20:08.067863Z"
    },
    "papermill": {
     "duration": 34.203424,
     "end_time": "2024-04-02T14:20:08.082371",
     "exception": false,
     "start_time": "2024-04-02T14:19:33.878947",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>時間</th><th scope=col>発表者</th><th scope=col>タイトル</th><th scope=col>資料</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>15:20 - 15:50</td><td>@paithiov909</td><td>Rを使って短歌の「詩的度」を測る    </td><td>資料</td></tr>\n",
       "\t<tr><td>15:50 - 16:20</td><td>@Atsushi776 </td><td>NeovimでR言語をやってこうとしてる話</td><td>資料</td></tr>\n",
       "\t<tr><td>16:20 - 16:50</td><td>@yutakanzawa</td><td>ggplot2のアノテーション技法        </td><td>資料</td></tr>\n",
       "\t<tr><td>16:50 - 17:05</td><td>全員        </td><td>休憩                               </td><td>    </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4 × 4\n",
       "\\begin{tabular}{llll}\n",
       " 時間 & 発表者 & タイトル & 資料\\\\\n",
       " <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 15:20 - 15:50 & @paithiov909 & Rを使って短歌の「詩的度」を測る     & 資料\\\\\n",
       "\t 15:50 - 16:20 & @Atsushi776  & NeovimでR言語をやってこうとしてる話 & 資料\\\\\n",
       "\t 16:20 - 16:50 & @yutakanzawa & ggplot2のアノテーション技法         & 資料\\\\\n",
       "\t 16:50 - 17:05 & 全員         & 休憩                                &     \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4 × 4\n",
       "\n",
       "| 時間 &lt;chr&gt; | 発表者 &lt;chr&gt; | タイトル &lt;chr&gt; | 資料 &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| 15:20 - 15:50 | @paithiov909 | Rを使って短歌の「詩的度」を測る     | 資料 |\n",
       "| 15:50 - 16:20 | @Atsushi776  | NeovimでR言語をやってこうとしてる話 | 資料 |\n",
       "| 16:20 - 16:50 | @yutakanzawa | ggplot2のアノテーション技法         | 資料 |\n",
       "| 16:50 - 17:05 | 全員         | 休憩                                | <!----> |\n",
       "\n"
      ],
      "text/plain": [
       "  時間          発表者       タイトル                            資料\n",
       "1 15:20 - 15:50 @paithiov909 Rを使って短歌の「詩的度」を測る     資料\n",
       "2 15:50 - 16:20 @Atsushi776  NeovimでR言語をやってこうとしてる話 資料\n",
       "3 16:20 - 16:50 @yutakanzawa ggplot2のアノテーション技法         資料\n",
       "4 16:50 - 17:05 全員         休憩                                    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# XMLパッケージのインストール\n",
    " install.packages('XML', quiet = TRUE)\n",
    "\n",
    "library(XML)\n",
    "# Webページをパース\n",
    "trg <- htmlParse(readLines('https://tokyor.connpass.com/event/309175/'))\n",
    "# XPathでtableタグ以下のデータを取得\n",
    "tmp <- getNodeSet(trg, '//table')\n",
    "# 3つ目の発表一覧を取得\n",
    "readHTMLTable(tmp[[3]])"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b73fcba9",
   "metadata": {
    "papermill": {
     "duration": 0.010566,
     "end_time": "2024-04-02T14:20:08.103120",
     "exception": false,
     "start_time": "2024-04-02T14:20:08.092554",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 7-7-2 rvestパッケージによるWebスクレイピング"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "daed5d8e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:20:08.128611Z",
     "iopub.status.busy": "2024-04-02T14:20:08.126242Z",
     "iopub.status.idle": "2024-04-02T14:20:23.424471Z",
     "shell.execute_reply": "2024-04-02T14:20:23.421606Z"
    },
    "papermill": {
     "duration": 15.314624,
     "end_time": "2024-04-02T14:20:23.427696",
     "exception": false,
     "start_time": "2024-04-02T14:20:08.113072",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘rvest’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:readr’:\n",
      "\n",
      "    guess_encoding\n",
      "\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 4 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>時間</th><th scope=col>発表者</th><th scope=col>タイトル</th><th scope=col>資料</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>15:20 - 15:50</td><td>@paithiov909</td><td>Rを使って短歌の「詩的度」を測る    </td><td>資料</td></tr>\n",
       "\t<tr><td>15:50 - 16:20</td><td>@Atsushi776 </td><td>NeovimでR言語をやってこうとしてる話</td><td>資料</td></tr>\n",
       "\t<tr><td>16:20 - 16:50</td><td>@yutakanzawa</td><td>ggplot2のアノテーション技法        </td><td>資料</td></tr>\n",
       "\t<tr><td>16:50 - 17:05</td><td>全員        </td><td>休憩                               </td><td>    </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 4 × 4\n",
       "\\begin{tabular}{llll}\n",
       " 時間 & 発表者 & タイトル & 資料\\\\\n",
       " <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 15:20 - 15:50 & @paithiov909 & Rを使って短歌の「詩的度」を測る     & 資料\\\\\n",
       "\t 15:50 - 16:20 & @Atsushi776  & NeovimでR言語をやってこうとしてる話 & 資料\\\\\n",
       "\t 16:20 - 16:50 & @yutakanzawa & ggplot2のアノテーション技法         & 資料\\\\\n",
       "\t 16:50 - 17:05 & 全員         & 休憩                                &     \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 4 × 4\n",
       "\n",
       "| 時間 &lt;chr&gt; | 発表者 &lt;chr&gt; | タイトル &lt;chr&gt; | 資料 &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| 15:20 - 15:50 | @paithiov909 | Rを使って短歌の「詩的度」を測る     | 資料 |\n",
       "| 15:50 - 16:20 | @Atsushi776  | NeovimでR言語をやってこうとしてる話 | 資料 |\n",
       "| 16:20 - 16:50 | @yutakanzawa | ggplot2のアノテーション技法         | 資料 |\n",
       "| 16:50 - 17:05 | 全員         | 休憩                                | <!----> |\n",
       "\n"
      ],
      "text/plain": [
       "  時間          発表者       タイトル                            資料\n",
       "1 15:20 - 15:50 @paithiov909 Rを使って短歌の「詩的度」を測る     資料\n",
       "2 15:50 - 16:20 @Atsushi776  NeovimでR言語をやってこうとしてる話 資料\n",
       "3 16:20 - 16:50 @yutakanzawa ggplot2のアノテーション技法         資料\n",
       "4 16:50 - 17:05 全員         休憩                                    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# httrパッケージのインストール\n",
    "install.packages('rvest', quiet = TRUE)\n",
    "\n",
    "library(rvest)\n",
    "# webページをパース\n",
    "trg <- read_html('https://tokyor.connpass.com/event/309175/')\n",
    "# tabelタグ以下のデータを取得\n",
    "tables <- html_table(trg)\n",
    "# 3つ目の発表一覧を取得\n",
    "tables[[3]]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e89f5a58",
   "metadata": {
    "papermill": {
     "duration": 0.010455,
     "end_time": "2024-04-02T14:20:23.448538",
     "exception": false,
     "start_time": "2024-04-02T14:20:23.438083",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 7-7-3 Web APIを介したデータ取得"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "fb2d3adc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:20:23.474716Z",
     "iopub.status.busy": "2024-04-02T14:20:23.472549Z",
     "iopub.status.idle": "2024-04-02T14:20:23.513493Z",
     "shell.execute_reply": "2024-04-02T14:20:23.511037Z"
    },
    "papermill": {
     "duration": 0.057703,
     "end_time": "2024-04-02T14:20:23.516825",
     "exception": false,
     "start_time": "2024-04-02T14:20:23.459122",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コード省略"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "72dcfe9c",
   "metadata": {
    "papermill": {
     "duration": 0.010957,
     "end_time": "2024-04-02T14:20:23.538349",
     "exception": false,
     "start_time": "2024-04-02T14:20:23.527392",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 7-8 ストリームデータの取得"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "b6099b3f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:20:23.565710Z",
     "iopub.status.busy": "2024-04-02T14:20:23.562816Z",
     "iopub.status.idle": "2024-04-02T14:20:23.581683Z",
     "shell.execute_reply": "2024-04-02T14:20:23.579194Z"
    },
    "papermill": {
     "duration": 0.035279,
     "end_time": "2024-04-02T14:20:23.584553",
     "exception": false,
     "start_time": "2024-04-02T14:20:23.549274",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コード省略"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e98cd1d8",
   "metadata": {
    "papermill": {
     "duration": 0.0102,
     "end_time": "2024-04-02T14:20:23.605065",
     "exception": false,
     "start_time": "2024-04-02T14:20:23.594865",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 7-9 RDSファイルを介したオブジェクトの入出力"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "4277e3d0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:20:23.631709Z",
     "iopub.status.busy": "2024-04-02T14:20:23.629617Z",
     "iopub.status.idle": "2024-04-02T14:20:23.646504Z",
     "shell.execute_reply": "2024-04-02T14:20:23.644127Z"
    },
    "papermill": {
     "duration": 0.033776,
     "end_time": "2024-04-02T14:20:23.649775",
     "exception": false,
     "start_time": "2024-04-02T14:20:23.615999",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コード省略"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "765cdaa3",
   "metadata": {
    "papermill": {
     "duration": 0.01059,
     "end_time": "2024-04-02T14:20:23.670886",
     "exception": false,
     "start_time": "2024-04-02T14:20:23.660296",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 7-10 その他の入出力関数とパッケージ"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "544f7130",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-02T14:20:23.697056Z",
     "iopub.status.busy": "2024-04-02T14:20:23.694922Z",
     "iopub.status.idle": "2024-04-02T14:20:23.713911Z",
     "shell.execute_reply": "2024-04-02T14:20:23.711229Z"
    },
    "papermill": {
     "duration": 0.036284,
     "end_time": "2024-04-02T14:20:23.717853",
     "exception": false,
     "start_time": "2024-04-02T14:20:23.681569",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コード省略"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [],
   "dockerImageVersionId": 30618,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 408.175594,
   "end_time": "2024-04-02T14:20:23.855199",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-04-02T14:13:35.679605",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
