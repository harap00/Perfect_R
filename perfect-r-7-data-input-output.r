{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "3bf98476",
   "metadata": {
    "papermill": {
     "duration": 0.006117,
     "end_time": "2024-04-01T15:19:12.178064",
     "exception": false,
     "start_time": "2024-04-01T15:19:12.171947",
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
   "id": "d2de8d5b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:19:12.194515Z",
     "iopub.status.busy": "2024-04-01T15:19:12.192106Z",
     "iopub.status.idle": "2024-04-01T15:19:12.323157Z",
     "shell.execute_reply": "2024-04-01T15:19:12.321347Z"
    },
    "papermill": {
     "duration": 0.141622,
     "end_time": "2024-04-01T15:19:12.325584",
     "exception": false,
     "start_time": "2024-04-01T15:19:12.183962",
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
   "id": "fa89ad7f",
   "metadata": {
    "papermill": {
     "duration": 0.005359,
     "end_time": "2024-04-01T15:19:12.336417",
     "exception": false,
     "start_time": "2024-04-01T15:19:12.331058",
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
   "id": "ee01da70",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:19:12.380016Z",
     "iopub.status.busy": "2024-04-01T15:19:12.349260Z",
     "iopub.status.idle": "2024-04-01T15:20:57.042450Z",
     "shell.execute_reply": "2024-04-01T15:20:57.040628Z"
    },
    "papermill": {
     "duration": 104.704369,
     "end_time": "2024-04-01T15:20:57.046109",
     "exception": false,
     "start_time": "2024-04-01T15:19:12.341740",
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
   "id": "cf5e3f38",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:20:57.065363Z",
     "iopub.status.busy": "2024-04-01T15:20:57.063809Z",
     "iopub.status.idle": "2024-04-01T15:20:57.230999Z",
     "shell.execute_reply": "2024-04-01T15:20:57.228945Z"
    },
    "papermill": {
     "duration": 0.178949,
     "end_time": "2024-04-01T15:20:57.233736",
     "exception": false,
     "start_time": "2024-04-01T15:20:57.054787",
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
   "id": "03f272d0",
   "metadata": {
    "papermill": {
     "duration": 0.005499,
     "end_time": "2024-04-01T15:20:57.244719",
     "exception": false,
     "start_time": "2024-04-01T15:20:57.239220",
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
   "id": "52d9575d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:20:57.259363Z",
     "iopub.status.busy": "2024-04-01T15:20:57.257717Z",
     "iopub.status.idle": "2024-04-01T15:20:57.271089Z",
     "shell.execute_reply": "2024-04-01T15:20:57.269222Z"
    },
    "papermill": {
     "duration": 0.023774,
     "end_time": "2024-04-01T15:20:57.273868",
     "exception": false,
     "start_time": "2024-04-01T15:20:57.250094",
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
   "id": "8aa1ff63",
   "metadata": {
    "papermill": {
     "duration": 0.00546,
     "end_time": "2024-04-01T15:20:57.285278",
     "exception": false,
     "start_time": "2024-04-01T15:20:57.279818",
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
   "id": "e7971192",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:20:57.299888Z",
     "iopub.status.busy": "2024-04-01T15:20:57.298239Z",
     "iopub.status.idle": "2024-04-01T15:20:57.315582Z",
     "shell.execute_reply": "2024-04-01T15:20:57.313605Z"
    },
    "papermill": {
     "duration": 0.027954,
     "end_time": "2024-04-01T15:20:57.318712",
     "exception": false,
     "start_time": "2024-04-01T15:20:57.290758",
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
   "id": "b8bb0e02",
   "metadata": {
    "papermill": {
     "duration": 0.006874,
     "end_time": "2024-04-01T15:20:57.330957",
     "exception": false,
     "start_time": "2024-04-01T15:20:57.324083",
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
   "id": "51bff03c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:20:57.348111Z",
     "iopub.status.busy": "2024-04-01T15:20:57.346377Z",
     "iopub.status.idle": "2024-04-01T15:21:41.289557Z",
     "shell.execute_reply": "2024-04-01T15:21:41.286486Z"
    },
    "papermill": {
     "duration": 43.956309,
     "end_time": "2024-04-01T15:21:41.293531",
     "exception": false,
     "start_time": "2024-04-01T15:20:57.337222",
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
   "id": "c0964fa4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:21:41.311774Z",
     "iopub.status.busy": "2024-04-01T15:21:41.309439Z",
     "iopub.status.idle": "2024-04-01T15:23:18.653672Z",
     "shell.execute_reply": "2024-04-01T15:23:18.651773Z"
    },
    "papermill": {
     "duration": 97.356533,
     "end_time": "2024-04-01T15:23:18.658080",
     "exception": false,
     "start_time": "2024-04-01T15:21:41.301547",
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
   "id": "5ebe2694",
   "metadata": {
    "papermill": {
     "duration": 0.005717,
     "end_time": "2024-04-01T15:23:18.675522",
     "exception": false,
     "start_time": "2024-04-01T15:23:18.669805",
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
   "id": "beb0b398",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:23:18.690916Z",
     "iopub.status.busy": "2024-04-01T15:23:18.688987Z",
     "iopub.status.idle": "2024-04-01T15:23:49.962673Z",
     "shell.execute_reply": "2024-04-01T15:23:49.960797Z"
    },
    "papermill": {
     "duration": 31.283813,
     "end_time": "2024-04-01T15:23:49.965051",
     "exception": false,
     "start_time": "2024-04-01T15:23:18.681238",
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
   "id": "466db6d6",
   "metadata": {
    "papermill": {
     "duration": 0.005786,
     "end_time": "2024-04-01T15:23:49.976826",
     "exception": false,
     "start_time": "2024-04-01T15:23:49.971040",
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
   "id": "dffd3860",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:23:49.991683Z",
     "iopub.status.busy": "2024-04-01T15:23:49.990121Z",
     "iopub.status.idle": "2024-04-01T15:23:50.002757Z",
     "shell.execute_reply": "2024-04-01T15:23:50.001039Z"
    },
    "papermill": {
     "duration": 0.022571,
     "end_time": "2024-04-01T15:23:50.005058",
     "exception": false,
     "start_time": "2024-04-01T15:23:49.982487",
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
   "id": "ac98372e",
   "metadata": {
    "papermill": {
     "duration": 0.005545,
     "end_time": "2024-04-01T15:23:50.016355",
     "exception": false,
     "start_time": "2024-04-01T15:23:50.010810",
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
   "id": "96063b7e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:23:50.030964Z",
     "iopub.status.busy": "2024-04-01T15:23:50.029409Z",
     "iopub.status.idle": "2024-04-01T15:23:50.041362Z",
     "shell.execute_reply": "2024-04-01T15:23:50.039704Z"
    },
    "papermill": {
     "duration": 0.02174,
     "end_time": "2024-04-01T15:23:50.043684",
     "exception": false,
     "start_time": "2024-04-01T15:23:50.021944",
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
   "id": "bbfecfac",
   "metadata": {
    "papermill": {
     "duration": 0.005603,
     "end_time": "2024-04-01T15:23:50.055131",
     "exception": false,
     "start_time": "2024-04-01T15:23:50.049528",
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
   "id": "4e90915d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:23:50.245387Z",
     "iopub.status.busy": "2024-04-01T15:23:50.068239Z",
     "iopub.status.idle": "2024-04-01T15:23:50.263486Z",
     "shell.execute_reply": "2024-04-01T15:23:50.260654Z"
    },
    "papermill": {
     "duration": 0.206135,
     "end_time": "2024-04-01T15:23:50.266854",
     "exception": false,
     "start_time": "2024-04-01T15:23:50.060719",
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
   "id": "1035ae24",
   "metadata": {
    "papermill": {
     "duration": 0.008892,
     "end_time": "2024-04-01T15:23:50.284696",
     "exception": false,
     "start_time": "2024-04-01T15:23:50.275804",
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
   "id": "8fd23dda",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:23:50.305260Z",
     "iopub.status.busy": "2024-04-01T15:23:50.303806Z",
     "iopub.status.idle": "2024-04-01T15:23:50.315569Z",
     "shell.execute_reply": "2024-04-01T15:23:50.313852Z"
    },
    "papermill": {
     "duration": 0.024757,
     "end_time": "2024-04-01T15:23:50.318023",
     "exception": false,
     "start_time": "2024-04-01T15:23:50.293266",
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
   "id": "0bb1ed9d",
   "metadata": {
    "papermill": {
     "duration": 0.008512,
     "end_time": "2024-04-01T15:23:50.335402",
     "exception": false,
     "start_time": "2024-04-01T15:23:50.326890",
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
   "id": "b9cb560c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:23:50.352533Z",
     "iopub.status.busy": "2024-04-01T15:23:50.349519Z",
     "iopub.status.idle": "2024-04-01T15:24:16.527650Z",
     "shell.execute_reply": "2024-04-01T15:24:16.525965Z"
    },
    "papermill": {
     "duration": 26.189138,
     "end_time": "2024-04-01T15:24:16.530362",
     "exception": false,
     "start_time": "2024-04-01T15:23:50.341224",
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
   "id": "9c1ebcc7",
   "metadata": {
    "papermill": {
     "duration": 0.006034,
     "end_time": "2024-04-01T15:24:16.542930",
     "exception": false,
     "start_time": "2024-04-01T15:24:16.536896",
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
   "id": "4ee9e232",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-01T15:24:16.559598Z",
     "iopub.status.busy": "2024-04-01T15:24:16.557950Z",
     "iopub.status.idle": "2024-04-01T15:24:29.128093Z",
     "shell.execute_reply": "2024-04-01T15:24:29.125676Z"
    },
    "papermill": {
     "duration": 12.582262,
     "end_time": "2024-04-01T15:24:29.131787",
     "exception": false,
     "start_time": "2024-04-01T15:24:16.549525",
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
   "id": "e286c4c5",
   "metadata": {
    "papermill": {
     "duration": 0.006588,
     "end_time": "2024-04-01T15:24:29.146679",
     "exception": false,
     "start_time": "2024-04-01T15:24:29.140091",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "以下省略"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "c25e9ca2",
   "metadata": {
    "papermill": {
     "duration": 0.006454,
     "end_time": "2024-04-01T15:24:29.159524",
     "exception": false,
     "start_time": "2024-04-01T15:24:29.153070",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
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
   "duration": 320.728626,
   "end_time": "2024-04-01T15:24:29.303827",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-04-01T15:19:08.575201",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
