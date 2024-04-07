{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "cb992273",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "papermill": {
     "duration": 0.021098,
     "end_time": "2024-04-07T13:32:25.837165",
     "exception": false,
     "start_time": "2024-04-07T13:32:25.816067",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 8-1 Rにおけるデータハンドリングについて"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "45b854e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:32:25.883340Z",
     "iopub.status.busy": "2024-04-07T13:32:25.880895Z",
     "iopub.status.idle": "2024-04-07T13:32:26.015641Z",
     "shell.execute_reply": "2024-04-07T13:32:26.013573Z"
    },
    "papermill": {
     "duration": 0.161389,
     "end_time": "2024-04-07T13:32:26.019574",
     "exception": false,
     "start_time": "2024-04-07T13:32:25.858185",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# コードなし"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e3702ae5",
   "metadata": {
    "papermill": {
     "duration": 0.019171,
     "end_time": "2024-04-07T13:32:26.058148",
     "exception": false,
     "start_time": "2024-04-07T13:32:26.038977",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 8-2 dplyr/tidyrパッケージを用いたデータハンドリング"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "45104bea",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:32:26.143247Z",
     "iopub.status.busy": "2024-04-07T13:32:26.099530Z",
     "iopub.status.idle": "2024-04-07T13:33:00.669605Z",
     "shell.execute_reply": "2024-04-07T13:33:00.665552Z"
    },
    "papermill": {
     "duration": 34.596733,
     "end_time": "2024-04-07T13:33:00.674101",
     "exception": false,
     "start_time": "2024-04-07T13:32:26.077368",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in install.packages(\"dplyr\", quiet = TRUE):\n",
      "“installation of package ‘dplyr’ had non-zero exit status”\n"
     ]
    }
   ],
   "source": [
    "# パッケージのインストール\n",
    "# dplyrパッケージのインストール\n",
    "install.packages('dplyr', quiet = TRUE)\n",
    "# tidyrパッケージのインストール\n",
    "install.packages('tidyr', quiet = TRUE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "08235e7b",
   "metadata": {
    "papermill": {
     "duration": 0.027377,
     "end_time": "2024-04-07T13:33:00.731337",
     "exception": false,
     "start_time": "2024-04-07T13:33:00.703960",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-2-1 行の抽出（filter関数）"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "58054ed8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:00.775652Z",
     "iopub.status.busy": "2024-04-07T13:33:00.773910Z",
     "iopub.status.idle": "2024-04-07T13:33:00.878111Z",
     "shell.execute_reply": "2024-04-07T13:33:00.875515Z"
    },
    "papermill": {
     "duration": 0.130692,
     "end_time": "2024-04-07T13:33:00.881566",
     "exception": false,
     "start_time": "2024-04-07T13:33:00.750874",
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
      "Attaching package: ‘dplyr’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & 3.5 & 1.4 & 0.2 & setosa\\\\\n",
       "\t2 & 4.9 & 3.0 & 1.4 & 0.2 & setosa\\\\\n",
       "\t3 & 4.7 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t4 & 4.6 & 3.1 & 1.5 & 0.2 & setosa\\\\\n",
       "\t5 & 5.0 & 3.6 & 1.4 & 0.2 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 5.1 | 3.5 | 1.4 | 0.2 | setosa |\n",
       "| 2 | 4.9 | 3.0 | 1.4 | 0.2 | setosa |\n",
       "| 3 | 4.7 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 4 | 4.6 | 3.1 | 1.5 | 0.2 | setosa |\n",
       "| 5 | 5.0 | 3.6 | 1.4 | 0.2 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species\n",
       "1 5.1          3.5         1.4          0.2         setosa \n",
       "2 4.9          3.0         1.4          0.2         setosa \n",
       "3 4.7          3.2         1.3          0.2         setosa \n",
       "4 4.6          3.1         1.5          0.2         setosa \n",
       "5 5.0          3.6         1.4          0.2         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & 3.5 & 1.4 & 0.2 & setosa\\\\\n",
       "\t2 & 4.9 & 3.0 & 1.4 & 0.2 & setosa\\\\\n",
       "\t3 & 4.7 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t4 & 4.6 & 3.1 & 1.5 & 0.2 & setosa\\\\\n",
       "\t5 & 5.0 & 3.6 & 1.4 & 0.2 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 5.1 | 3.5 | 1.4 | 0.2 | setosa |\n",
       "| 2 | 4.9 | 3.0 | 1.4 | 0.2 | setosa |\n",
       "| 3 | 4.7 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 4 | 4.6 | 3.1 | 1.5 | 0.2 | setosa |\n",
       "| 5 | 5.0 | 3.6 | 1.4 | 0.2 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species\n",
       "1 5.1          3.5         1.4          0.2         setosa \n",
       "2 4.9          3.0         1.4          0.2         setosa \n",
       "3 4.7          3.2         1.3          0.2         setosa \n",
       "4 4.6          3.1         1.5          0.2         setosa \n",
       "5 5.0          3.6         1.4          0.2         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & 3.5 & 1.4 & 0.2 & setosa\\\\\n",
       "\t2 & 4.9 & 3.0 & 1.4 & 0.2 & setosa\\\\\n",
       "\t3 & 4.7 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t4 & 4.6 & 3.1 & 1.5 & 0.2 & setosa\\\\\n",
       "\t5 & 5.0 & 3.6 & 1.4 & 0.2 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 5.1 | 3.5 | 1.4 | 0.2 | setosa |\n",
       "| 2 | 4.9 | 3.0 | 1.4 | 0.2 | setosa |\n",
       "| 3 | 4.7 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 4 | 4.6 | 3.1 | 1.5 | 0.2 | setosa |\n",
       "| 5 | 5.0 | 3.6 | 1.4 | 0.2 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species\n",
       "1 5.1          3.5         1.4          0.2         setosa \n",
       "2 4.9          3.0         1.4          0.2         setosa \n",
       "3 4.7          3.2         1.3          0.2         setosa \n",
       "4 4.6          3.1         1.5          0.2         setosa \n",
       "5 5.0          3.6         1.4          0.2         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "# dplyrパッケージの場合\n",
    "filter(iris, Species == 'setosa') %>% head(5)\n",
    "# 組み込み関数の場合\n",
    "subset(iris, Species == 'setosa') %>% head(5)\n",
    "iris[iris$Species == 'setosa',] %>% head(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9ecdb5e5",
   "metadata": {
    "papermill": {
     "duration": 0.021089,
     "end_time": "2024-04-07T13:33:00.923317",
     "exception": false,
     "start_time": "2024-04-07T13:33:00.902228",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-2-2 列の抽出（select関数）"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "f4ea9035",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:00.972165Z",
     "iopub.status.busy": "2024-04-07T13:33:00.970371Z",
     "iopub.status.idle": "2024-04-07T13:33:01.094669Z",
     "shell.execute_reply": "2024-04-07T13:33:01.092092Z"
    },
    "papermill": {
     "duration": 0.153636,
     "end_time": "2024-04-07T13:33:01.098500",
     "exception": false,
     "start_time": "2024-04-07T13:33:00.944864",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & Sepal.Length & Species\\\\\n",
       "  & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & setosa\\\\\n",
       "\t2 & 4.9 & setosa\\\\\n",
       "\t3 & 4.7 & setosa\\\\\n",
       "\t4 & 4.6 & setosa\\\\\n",
       "\t5 & 5.0 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 2\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 5.1 | setosa |\n",
       "| 2 | 4.9 | setosa |\n",
       "| 3 | 4.7 | setosa |\n",
       "| 4 | 4.6 | setosa |\n",
       "| 5 | 5.0 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Species\n",
       "1 5.1          setosa \n",
       "2 4.9          setosa \n",
       "3 4.7          setosa \n",
       "4 4.6          setosa \n",
       "5 5.0          setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & Sepal.Length & Species\\\\\n",
       "  & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & setosa\\\\\n",
       "\t2 & 4.9 & setosa\\\\\n",
       "\t3 & 4.7 & setosa\\\\\n",
       "\t4 & 4.6 & setosa\\\\\n",
       "\t5 & 5.0 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 2\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 5.1 | setosa |\n",
       "| 2 | 4.9 | setosa |\n",
       "| 3 | 4.7 | setosa |\n",
       "| 4 | 4.6 | setosa |\n",
       "| 5 | 5.0 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Species\n",
       "1 5.1          setosa \n",
       "2 4.9          setosa \n",
       "3 4.7          setosa \n",
       "4 4.6          setosa \n",
       "5 5.0          setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & Sepal.Length & Species\\\\\n",
       "  & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & setosa\\\\\n",
       "\t2 & 4.9 & setosa\\\\\n",
       "\t3 & 4.7 & setosa\\\\\n",
       "\t4 & 4.6 & setosa\\\\\n",
       "\t5 & 5.0 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 2\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 5.1 | setosa |\n",
       "| 2 | 4.9 | setosa |\n",
       "| 3 | 4.7 | setosa |\n",
       "| 4 | 4.6 | setosa |\n",
       "| 5 | 5.0 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Species\n",
       "1 5.1          setosa \n",
       "2 4.9          setosa \n",
       "3 4.7          setosa \n",
       "4 4.6          setosa \n",
       "5 5.0          setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    " library(dplyr)\n",
    "# dplyrパッケージの場合\n",
    "select(iris, Sepal.Length, Species) %>% head(5)\n",
    "# 組み込み関数の場合\n",
    "subset(iris, select = c(Sepal.Length, Species)) %>% head(5)\n",
    "iris[, c('Sepal.Length', 'Species')] %>% head(5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "dd7e3110",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:01.147047Z",
     "iopub.status.busy": "2024-04-07T13:33:01.145313Z",
     "iopub.status.idle": "2024-04-07T13:33:01.181535Z",
     "shell.execute_reply": "2024-04-07T13:33:01.179016Z"
    },
    "papermill": {
     "duration": 0.06446,
     "end_time": "2024-04-07T13:33:01.184873",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.120413",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Spl</th><th scope=col>Sp</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & Spl & Sp\\\\\n",
       "  & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & setosa\\\\\n",
       "\t2 & 4.9 & setosa\\\\\n",
       "\t3 & 4.7 & setosa\\\\\n",
       "\t4 & 4.6 & setosa\\\\\n",
       "\t5 & 5.0 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 2\n",
       "\n",
       "| <!--/--> | Spl &lt;dbl&gt; | Sp &lt;fct&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 5.1 | setosa |\n",
       "| 2 | 4.9 | setosa |\n",
       "| 3 | 4.7 | setosa |\n",
       "| 4 | 4.6 | setosa |\n",
       "| 5 | 5.0 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Spl Sp    \n",
       "1 5.1 setosa\n",
       "2 4.9 setosa\n",
       "3 4.7 setosa\n",
       "4 4.6 setosa\n",
       "5 5.0 setosa"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 列名を変更する\n",
    "library(dplyr)\n",
    "select(iris, Spl = Sepal.Length, Sp = Species) %>% head(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "87e1098c",
   "metadata": {
    "papermill": {
     "duration": 0.021479,
     "end_time": "2024-04-07T13:33:01.227801",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.206322",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-2-3 列の作成（mutate関数）"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "aec87295",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:01.276453Z",
     "iopub.status.busy": "2024-04-07T13:33:01.274357Z",
     "iopub.status.idle": "2024-04-07T13:33:01.311003Z",
     "shell.execute_reply": "2024-04-07T13:33:01.308375Z"
    },
    "papermill": {
     "duration": 0.06441,
     "end_time": "2024-04-07T13:33:01.313649",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.249239",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & 3.5 & 1.4 & 0.2 & setosa & 7.9\\\\\n",
       "\t2 & 4.9 & 3.0 & 1.4 & 0.2 & setosa & 7.9\\\\\n",
       "\t3 & 4.7 & 3.2 & 1.3 & 0.2 & setosa & 7.9\\\\\n",
       "\t4 & 4.6 & 3.1 & 1.5 & 0.2 & setosa & 7.9\\\\\n",
       "\t5 & 5.0 & 3.6 & 1.4 & 0.2 & setosa & 7.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 6\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1 | 5.1 | 3.5 | 1.4 | 0.2 | setosa | 7.9 |\n",
       "| 2 | 4.9 | 3.0 | 1.4 | 0.2 | setosa | 7.9 |\n",
       "| 3 | 4.7 | 3.2 | 1.3 | 0.2 | setosa | 7.9 |\n",
       "| 4 | 4.6 | 3.1 | 1.5 | 0.2 | setosa | 7.9 |\n",
       "| 5 | 5.0 | 3.6 | 1.4 | 0.2 | setosa | 7.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Length_max\n",
       "1 5.1          3.5         1.4          0.2         setosa  7.9             \n",
       "2 4.9          3.0         1.4          0.2         setosa  7.9             \n",
       "3 4.7          3.2         1.3          0.2         setosa  7.9             \n",
       "4 4.6          3.1         1.5          0.2         setosa  7.9             \n",
       "5 5.0          3.6         1.4          0.2         setosa  7.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "mutate(iris, Sepal.Length_max = max(Sepal.Length)) %>% head(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "58eea520",
   "metadata": {
    "papermill": {
     "duration": 0.023015,
     "end_time": "2024-04-07T13:33:01.358772",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.335757",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-2-4 並べ替え（arrange関数）"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "f0241907",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:01.406267Z",
     "iopub.status.busy": "2024-04-07T13:33:01.404361Z",
     "iopub.status.idle": "2024-04-07T13:33:01.490839Z",
     "shell.execute_reply": "2024-04-07T13:33:01.488844Z"
    },
    "papermill": {
     "duration": 0.112974,
     "end_time": "2024-04-07T13:33:01.493526",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.380552",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>4.3</td><td>3.0</td><td>1.1</td><td>0.1</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.4</td><td>2.9</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.4</td><td>3.0</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.4</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>4.5</td><td>2.3</td><td>1.3</td><td>0.3</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 4.3 & 3.0 & 1.1 & 0.1 & setosa\\\\\n",
       "\t2 & 4.4 & 2.9 & 1.4 & 0.2 & setosa\\\\\n",
       "\t3 & 4.4 & 3.0 & 1.3 & 0.2 & setosa\\\\\n",
       "\t4 & 4.4 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t5 & 4.5 & 2.3 & 1.3 & 0.3 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 4.3 | 3.0 | 1.1 | 0.1 | setosa |\n",
       "| 2 | 4.4 | 2.9 | 1.4 | 0.2 | setosa |\n",
       "| 3 | 4.4 | 3.0 | 1.3 | 0.2 | setosa |\n",
       "| 4 | 4.4 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 5 | 4.5 | 2.3 | 1.3 | 0.3 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species\n",
       "1 4.3          3.0         1.1          0.1         setosa \n",
       "2 4.4          2.9         1.4          0.2         setosa \n",
       "3 4.4          3.0         1.3          0.2         setosa \n",
       "4 4.4          3.2         1.3          0.2         setosa \n",
       "5 4.5          2.3         1.3          0.3         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>7.9</td><td>3.8</td><td>6.4</td><td>2.0</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>7.7</td><td>3.8</td><td>6.7</td><td>2.2</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>7.7</td><td>2.6</td><td>6.9</td><td>2.3</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>7.7</td><td>2.8</td><td>6.7</td><td>2.0</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>7.7</td><td>3.0</td><td>6.1</td><td>2.3</td><td>virginica</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 7.9 & 3.8 & 6.4 & 2.0 & virginica\\\\\n",
       "\t2 & 7.7 & 3.8 & 6.7 & 2.2 & virginica\\\\\n",
       "\t3 & 7.7 & 2.6 & 6.9 & 2.3 & virginica\\\\\n",
       "\t4 & 7.7 & 2.8 & 6.7 & 2.0 & virginica\\\\\n",
       "\t5 & 7.7 & 3.0 & 6.1 & 2.3 & virginica\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 7.9 | 3.8 | 6.4 | 2.0 | virginica |\n",
       "| 2 | 7.7 | 3.8 | 6.7 | 2.2 | virginica |\n",
       "| 3 | 7.7 | 2.6 | 6.9 | 2.3 | virginica |\n",
       "| 4 | 7.7 | 2.8 | 6.7 | 2.0 | virginica |\n",
       "| 5 | 7.7 | 3.0 | 6.1 | 2.3 | virginica |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species  \n",
       "1 7.9          3.8         6.4          2.0         virginica\n",
       "2 7.7          3.8         6.7          2.2         virginica\n",
       "3 7.7          2.6         6.9          2.3         virginica\n",
       "4 7.7          2.8         6.7          2.0         virginica\n",
       "5 7.7          3.0         6.1          2.3         virginica"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>14</th><td>4.3</td><td>3.0</td><td>1.1</td><td>0.1</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>4.4</td><td>2.9</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>39</th><td>4.4</td><td>3.0</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>43</th><td>4.4</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>42</th><td>4.5</td><td>2.3</td><td>1.3</td><td>0.3</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t14 & 4.3 & 3.0 & 1.1 & 0.1 & setosa\\\\\n",
       "\t9 & 4.4 & 2.9 & 1.4 & 0.2 & setosa\\\\\n",
       "\t39 & 4.4 & 3.0 & 1.3 & 0.2 & setosa\\\\\n",
       "\t43 & 4.4 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t42 & 4.5 & 2.3 & 1.3 & 0.3 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 14 | 4.3 | 3.0 | 1.1 | 0.1 | setosa |\n",
       "| 9 | 4.4 | 2.9 | 1.4 | 0.2 | setosa |\n",
       "| 39 | 4.4 | 3.0 | 1.3 | 0.2 | setosa |\n",
       "| 43 | 4.4 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 42 | 4.5 | 2.3 | 1.3 | 0.3 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "   Sepal.Length Sepal.Width Petal.Length Petal.Width Species\n",
       "14 4.3          3.0         1.1          0.1         setosa \n",
       "9  4.4          2.9         1.4          0.2         setosa \n",
       "39 4.4          3.0         1.3          0.2         setosa \n",
       "43 4.4          3.2         1.3          0.2         setosa \n",
       "42 4.5          2.3         1.3          0.3         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>132</th><td>7.9</td><td>3.8</td><td>6.4</td><td>2.0</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>118</th><td>7.7</td><td>3.8</td><td>6.7</td><td>2.2</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>119</th><td>7.7</td><td>2.6</td><td>6.9</td><td>2.3</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>123</th><td>7.7</td><td>2.8</td><td>6.7</td><td>2.0</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>136</th><td>7.7</td><td>3.0</td><td>6.1</td><td>2.3</td><td>virginica</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t132 & 7.9 & 3.8 & 6.4 & 2.0 & virginica\\\\\n",
       "\t118 & 7.7 & 3.8 & 6.7 & 2.2 & virginica\\\\\n",
       "\t119 & 7.7 & 2.6 & 6.9 & 2.3 & virginica\\\\\n",
       "\t123 & 7.7 & 2.8 & 6.7 & 2.0 & virginica\\\\\n",
       "\t136 & 7.7 & 3.0 & 6.1 & 2.3 & virginica\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 132 | 7.9 | 3.8 | 6.4 | 2.0 | virginica |\n",
       "| 118 | 7.7 | 3.8 | 6.7 | 2.2 | virginica |\n",
       "| 119 | 7.7 | 2.6 | 6.9 | 2.3 | virginica |\n",
       "| 123 | 7.7 | 2.8 | 6.7 | 2.0 | virginica |\n",
       "| 136 | 7.7 | 3.0 | 6.1 | 2.3 | virginica |\n",
       "\n"
      ],
      "text/plain": [
       "    Sepal.Length Sepal.Width Petal.Length Petal.Width Species  \n",
       "132 7.9          3.8         6.4          2.0         virginica\n",
       "118 7.7          3.8         6.7          2.2         virginica\n",
       "119 7.7          2.6         6.9          2.3         virginica\n",
       "123 7.7          2.8         6.7          2.0         virginica\n",
       "136 7.7          3.0         6.1          2.3         virginica"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "# dplyrパッケージの場合\n",
    "arrange(iris, Sepal.Length) %>% head(5)　# 昇順\n",
    "arrange(iris, desc(Sepal.Length)) %>% head(5)　# 降順\n",
    "\n",
    "# 組み込み関数の場合\n",
    "iris[order(iris$Sepal.Length), ] %>% head(5) # 昇順\n",
    "\n",
    "iris[order(iris$Sepal.Length, decreasing = TRUE), ] %>% head(5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "ee5a2257",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:01.543561Z",
     "iopub.status.busy": "2024-04-07T13:33:01.541856Z",
     "iopub.status.idle": "2024-04-07T13:33:01.603776Z",
     "shell.execute_reply": "2024-04-07T13:33:01.601151Z"
    },
    "papermill": {
     "duration": 0.090924,
     "end_time": "2024-04-07T13:33:01.607475",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.516551",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>14</th><td>4.3</td><td>3.0</td><td>1.1</td><td>0.1</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>4.4</td><td>2.9</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>39</th><td>4.4</td><td>3.0</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>43</th><td>4.4</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>42</th><td>4.5</td><td>2.3</td><td>1.3</td><td>0.3</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t14 & 4.3 & 3.0 & 1.1 & 0.1 & setosa\\\\\n",
       "\t9 & 4.4 & 2.9 & 1.4 & 0.2 & setosa\\\\\n",
       "\t39 & 4.4 & 3.0 & 1.3 & 0.2 & setosa\\\\\n",
       "\t43 & 4.4 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t42 & 4.5 & 2.3 & 1.3 & 0.3 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 14 | 4.3 | 3.0 | 1.1 | 0.1 | setosa |\n",
       "| 9 | 4.4 | 2.9 | 1.4 | 0.2 | setosa |\n",
       "| 39 | 4.4 | 3.0 | 1.3 | 0.2 | setosa |\n",
       "| 43 | 4.4 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 42 | 4.5 | 2.3 | 1.3 | 0.3 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "   Sepal.Length Sepal.Width Petal.Length Petal.Width Species\n",
       "14 4.3          3.0         1.1          0.1         setosa \n",
       "9  4.4          2.9         1.4          0.2         setosa \n",
       "39 4.4          3.0         1.3          0.2         setosa \n",
       "43 4.4          3.2         1.3          0.2         setosa \n",
       "42 4.5          2.3         1.3          0.3         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>132</th><td>7.9</td><td>3.8</td><td>6.4</td><td>2.0</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>118</th><td>7.7</td><td>3.8</td><td>6.7</td><td>2.2</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>119</th><td>7.7</td><td>2.6</td><td>6.9</td><td>2.3</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>123</th><td>7.7</td><td>2.8</td><td>6.7</td><td>2.0</td><td>virginica</td></tr>\n",
       "\t<tr><th scope=row>136</th><td>7.7</td><td>3.0</td><td>6.1</td><td>2.3</td><td>virginica</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t132 & 7.9 & 3.8 & 6.4 & 2.0 & virginica\\\\\n",
       "\t118 & 7.7 & 3.8 & 6.7 & 2.2 & virginica\\\\\n",
       "\t119 & 7.7 & 2.6 & 6.9 & 2.3 & virginica\\\\\n",
       "\t123 & 7.7 & 2.8 & 6.7 & 2.0 & virginica\\\\\n",
       "\t136 & 7.7 & 3.0 & 6.1 & 2.3 & virginica\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 132 | 7.9 | 3.8 | 6.4 | 2.0 | virginica |\n",
       "| 118 | 7.7 | 3.8 | 6.7 | 2.2 | virginica |\n",
       "| 119 | 7.7 | 2.6 | 6.9 | 2.3 | virginica |\n",
       "| 123 | 7.7 | 2.8 | 6.7 | 2.0 | virginica |\n",
       "| 136 | 7.7 | 3.0 | 6.1 | 2.3 | virginica |\n",
       "\n"
      ],
      "text/plain": [
       "    Sepal.Length Sepal.Width Petal.Length Petal.Width Species  \n",
       "132 7.9          3.8         6.4          2.0         virginica\n",
       "118 7.7          3.8         6.7          2.2         virginica\n",
       "119 7.7          2.6         6.9          2.3         virginica\n",
       "123 7.7          2.8         6.7          2.0         virginica\n",
       "136 7.7          3.0         6.1          2.3         virginica"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "iris[order(iris$Sepal.Length), ]  %>% head(5) # 昇順\n",
    "iris[order(iris$Sepal.Length, decreasing=TRUE), ] %>% head(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ab495313",
   "metadata": {
    "papermill": {
     "duration": 0.023664,
     "end_time": "2024-04-07T13:33:01.655881",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.632217",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-2-5 列名の変更（rename関数）"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "417e95ae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:01.706804Z",
     "iopub.status.busy": "2024-04-07T13:33:01.705096Z",
     "iopub.status.idle": "2024-04-07T13:33:01.750087Z",
     "shell.execute_reply": "2024-04-07T13:33:01.747945Z"
    },
    "papermill": {
     "duration": 0.074618,
     "end_time": "2024-04-07T13:33:01.753794",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.679176",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>SpL</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & SpL & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & 3.5 & 1.4 & 0.2 & setosa\\\\\n",
       "\t2 & 4.9 & 3.0 & 1.4 & 0.2 & setosa\\\\\n",
       "\t3 & 4.7 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t4 & 4.6 & 3.1 & 1.5 & 0.2 & setosa\\\\\n",
       "\t5 & 5.0 & 3.6 & 1.4 & 0.2 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 5\n",
       "\n",
       "| <!--/--> | SpL &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 5.1 | 3.5 | 1.4 | 0.2 | setosa |\n",
       "| 2 | 4.9 | 3.0 | 1.4 | 0.2 | setosa |\n",
       "| 3 | 4.7 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 4 | 4.6 | 3.1 | 1.5 | 0.2 | setosa |\n",
       "| 5 | 5.0 | 3.6 | 1.4 | 0.2 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  SpL Sepal.Width Petal.Length Petal.Width Species\n",
       "1 5.1 3.5         1.4          0.2         setosa \n",
       "2 4.9 3.0         1.4          0.2         setosa \n",
       "3 4.7 3.2         1.3          0.2         setosa \n",
       "4 4.6 3.1         1.5          0.2         setosa \n",
       "5 5.0 3.6         1.4          0.2         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "# dplyrパッケージの場合\n",
    "rename(iris, SpL=Sepal.Length) %>% head(5)\n",
    "# 組み込み関数の場合\n",
    "colnames(iris)[colnames(iris)=='Sepal.Length'] <- 'SpL'\n",
    "# irisデータを再ロードしてここまでの変更をリセットする\n",
    "data(iris)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3f38cdde",
   "metadata": {
    "papermill": {
     "duration": 0.023792,
     "end_time": "2024-04-07T13:33:01.801236",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.777444",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-2-6 データの結合（bind_cols関数 / bind_rows関数 / ○○‗join関数）"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "c2d194e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:01.853984Z",
     "iopub.status.busy": "2024-04-07T13:33:01.851508Z",
     "iopub.status.idle": "2024-04-07T13:33:01.902914Z",
     "shell.execute_reply": "2024-04-07T13:33:01.900397Z"
    },
    "papermill": {
     "duration": 0.080902,
     "end_time": "2024-04-07T13:33:01.906224",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.825322",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num_x</th><th scope=col>chr_x</th><th scope=col>num_y</th><th scope=col>chr_y</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>4</td><td>fourth</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>5</td><td>fifth </td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>6</td><td>sixth </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 4\n",
       "\\begin{tabular}{llll}\n",
       " num\\_x & chr\\_x & num\\_y & chr\\_y\\\\\n",
       " <dbl> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & 4 & fourth\\\\\n",
       "\t 2 & second & 5 & fifth \\\\\n",
       "\t 3 & third  & 6 & sixth \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 4\n",
       "\n",
       "| num_x &lt;dbl&gt; | chr_x &lt;chr&gt; | num_y &lt;dbl&gt; | chr_y &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | first  | 4 | fourth |\n",
       "| 2 | second | 5 | fifth  |\n",
       "| 3 | third  | 6 | sixth  |\n",
       "\n"
      ],
      "text/plain": [
       "  num_x chr_x  num_y chr_y \n",
       "1 1     first  4     fourth\n",
       "2 2     second 5     fifth \n",
       "3 3     third  6     sixth "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num_x</th><th scope=col>chr_x</th><th scope=col>num_y</th><th scope=col>chr_y</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>4</td><td>fourth</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>5</td><td>fifth </td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>6</td><td>sixth </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 4\n",
       "\\begin{tabular}{llll}\n",
       " num\\_x & chr\\_x & num\\_y & chr\\_y\\\\\n",
       " <dbl> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & 4 & fourth\\\\\n",
       "\t 2 & second & 5 & fifth \\\\\n",
       "\t 3 & third  & 6 & sixth \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 4\n",
       "\n",
       "| num_x &lt;dbl&gt; | chr_x &lt;chr&gt; | num_y &lt;dbl&gt; | chr_y &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | first  | 4 | fourth |\n",
       "| 2 | second | 5 | fifth  |\n",
       "| 3 | third  | 6 | sixth  |\n",
       "\n"
      ],
      "text/plain": [
       "  num_x chr_x  num_y chr_y \n",
       "1 1     first  4     fourth\n",
       "2 2     second 5     fifth \n",
       "3 3     third  6     sixth "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "x <- data.frame(num_x = c(1, 2, 3), chr_x = c('first', 'second', 'third'))\n",
    "y <- data.frame(num_y = c(4, 5, 6), chr_y = c('fourth', 'fifth', 'sixth'))\n",
    "bind_cols(x, y) # dplyrパッケージの場合\n",
    "cbind(x, y) # 組み込み関数の場合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "8cb949f7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:01.960091Z",
     "iopub.status.busy": "2024-04-07T13:33:01.958272Z",
     "iopub.status.idle": "2024-04-07T13:33:02.005024Z",
     "shell.execute_reply": "2024-04-07T13:33:02.002980Z"
    },
    "papermill": {
     "duration": 0.076769,
     "end_time": "2024-04-07T13:33:02.007615",
     "exception": false,
     "start_time": "2024-04-07T13:33:01.930846",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td></tr>\n",
       "\t<tr><td>2</td><td>second</td></tr>\n",
       "\t<tr><td>3</td><td>third </td></tr>\n",
       "\t<tr><td>4</td><td>fourth</td></tr>\n",
       "\t<tr><td>5</td><td>fifth </td></tr>\n",
       "\t<tr><td>6</td><td>sixth </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{ll}\n",
       " num & chr\\\\\n",
       " <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first \\\\\n",
       "\t 2 & second\\\\\n",
       "\t 3 & third \\\\\n",
       "\t 4 & fourth\\\\\n",
       "\t 5 & fifth \\\\\n",
       "\t 6 & sixth \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; |\n",
       "|---|---|\n",
       "| 1 | first  |\n",
       "| 2 | second |\n",
       "| 3 | third  |\n",
       "| 4 | fourth |\n",
       "| 5 | fifth  |\n",
       "| 6 | sixth  |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr   \n",
       "1 1   first \n",
       "2 2   second\n",
       "3 3   third \n",
       "4 4   fourth\n",
       "5 5   fifth \n",
       "6 6   sixth "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td></tr>\n",
       "\t<tr><td>2</td><td>second</td></tr>\n",
       "\t<tr><td>3</td><td>third </td></tr>\n",
       "\t<tr><td>4</td><td>fourth</td></tr>\n",
       "\t<tr><td>5</td><td>fifth </td></tr>\n",
       "\t<tr><td>6</td><td>sixth </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{ll}\n",
       " num & chr\\\\\n",
       " <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first \\\\\n",
       "\t 2 & second\\\\\n",
       "\t 3 & third \\\\\n",
       "\t 4 & fourth\\\\\n",
       "\t 5 & fifth \\\\\n",
       "\t 6 & sixth \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; |\n",
       "|---|---|\n",
       "| 1 | first  |\n",
       "| 2 | second |\n",
       "| 3 | third  |\n",
       "| 4 | fourth |\n",
       "| 5 | fifth  |\n",
       "| 6 | sixth  |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr   \n",
       "1 1   first \n",
       "2 2   second\n",
       "3 3   third \n",
       "4 4   fourth\n",
       "5 5   fifth \n",
       "6 6   sixth "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "x <- data.frame(num = c(1, 2, 3), chr = c('first', 'second', 'third'))\n",
    "y <- data.frame(num = c(4, 5, 6), chr = c('fourth', 'fifth', 'sixth'))\n",
    "bind_rows(x, y) # dplyrパッケージの場合\n",
    "rbind(x, y) # 組み込み関数の場合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "79a5e997",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.061152Z",
     "iopub.status.busy": "2024-04-07T13:33:02.059479Z",
     "iopub.status.idle": "2024-04-07T13:33:02.079521Z",
     "shell.execute_reply": "2024-04-07T13:33:02.077615Z"
    },
    "papermill": {
     "duration": 0.049903,
     "end_time": "2024-04-07T13:33:02.082130",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.032227",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(dplyr)\n",
    "\n",
    "x <- data.frame(num = c(1, 2, 3, 4), chr = c('first', 'second', 'third', 'fourth'))\n",
    "y <- data.frame(num = c(1, 2, 3, 5), chr_jis = c('１', '２', '３', '５'))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "9e269cf8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.137107Z",
     "iopub.status.busy": "2024-04-07T13:33:02.135447Z",
     "iopub.status.idle": "2024-04-07T13:33:02.202638Z",
     "shell.execute_reply": "2024-04-07T13:33:02.200091Z"
    },
    "papermill": {
     "duration": 0.098393,
     "end_time": "2024-04-07T13:33:02.205696",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.107303",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th><th scope=col>chr_jis</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>１</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>２</td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>３</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 3\n",
       "\\begin{tabular}{lll}\n",
       " num & chr & chr\\_jis\\\\\n",
       " <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & １\\\\\n",
       "\t 2 & second & ２\\\\\n",
       "\t 3 & third  & ３\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 3\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; | chr_jis &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | first  | １ |\n",
       "| 2 | second | ２ |\n",
       "| 3 | third  | ３ |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr    chr_jis\n",
       "1 1   first  １     \n",
       "2 2   second ２     \n",
       "3 3   third  ３     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th><th scope=col>chr_jis</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>１</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>２</td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>３</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 3\n",
       "\\begin{tabular}{lll}\n",
       " num & chr & chr\\_jis\\\\\n",
       " <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & １\\\\\n",
       "\t 2 & second & ２\\\\\n",
       "\t 3 & third  & ３\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 3\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; | chr_jis &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | first  | １ |\n",
       "| 2 | second | ２ |\n",
       "| 3 | third  | ３ |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr    chr_jis\n",
       "1 1   first  １     \n",
       "2 2   second ２     \n",
       "3 3   third  ３     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 内部結合\n",
    "inner_join(x, y, by = join_by(num)) # dplyrパッケージの場合\n",
    "merge(x, y) # 組み込み関数の場合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "9bfe9dda",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.260461Z",
     "iopub.status.busy": "2024-04-07T13:33:02.258736Z",
     "iopub.status.idle": "2024-04-07T13:33:02.285886Z",
     "shell.execute_reply": "2024-04-07T13:33:02.283964Z"
    },
    "papermill": {
     "duration": 0.057436,
     "end_time": "2024-04-07T13:33:02.288733",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.231297",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td></tr>\n",
       "\t<tr><td>2</td><td>second</td></tr>\n",
       "\t<tr><td>3</td><td>third </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " num & chr\\\\\n",
       " <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first \\\\\n",
       "\t 2 & second\\\\\n",
       "\t 3 & third \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 2\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; |\n",
       "|---|---|\n",
       "| 1 | first  |\n",
       "| 2 | second |\n",
       "| 3 | third  |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr   \n",
       "1 1   first \n",
       "2 2   second\n",
       "3 3   third "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 内部結合で片側のデータのみを残す場合\n",
    "semi_join(x, y, by = join_by(num)) # dplyrパッケージのみ"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "94652824",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.381122Z",
     "iopub.status.busy": "2024-04-07T13:33:02.379433Z",
     "iopub.status.idle": "2024-04-07T13:33:02.428382Z",
     "shell.execute_reply": "2024-04-07T13:33:02.425761Z"
    },
    "papermill": {
     "duration": 0.08003,
     "end_time": "2024-04-07T13:33:02.431805",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.351775",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th><th scope=col>chr_jis</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>１</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>２</td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>３</td></tr>\n",
       "\t<tr><td>4</td><td>fourth</td><td>NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4 × 3\n",
       "\\begin{tabular}{lll}\n",
       " num & chr & chr\\_jis\\\\\n",
       " <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & １\\\\\n",
       "\t 2 & second & ２\\\\\n",
       "\t 3 & third  & ３\\\\\n",
       "\t 4 & fourth & NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4 × 3\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; | chr_jis &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | first  | １ |\n",
       "| 2 | second | ２ |\n",
       "| 3 | third  | ３ |\n",
       "| 4 | fourth | NA |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr    chr_jis\n",
       "1 1   first  １     \n",
       "2 2   second ２     \n",
       "3 3   third  ３     \n",
       "4 4   fourth NA     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th><th scope=col>chr_jis</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>１</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>２</td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>３</td></tr>\n",
       "\t<tr><td>4</td><td>fourth</td><td>NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4 × 3\n",
       "\\begin{tabular}{lll}\n",
       " num & chr & chr\\_jis\\\\\n",
       " <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & １\\\\\n",
       "\t 2 & second & ２\\\\\n",
       "\t 3 & third  & ３\\\\\n",
       "\t 4 & fourth & NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4 × 3\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; | chr_jis &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | first  | １ |\n",
       "| 2 | second | ２ |\n",
       "| 3 | third  | ３ |\n",
       "| 4 | fourth | NA |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr    chr_jis\n",
       "1 1   first  １     \n",
       "2 2   second ２     \n",
       "3 3   third  ３     \n",
       "4 4   fourth NA     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 左外部結合\n",
    "left_join(x, y, by = join_by(num)) # dplyrパッケージ\n",
    "merge(x, y, all.x = TRUE) # 組み込み関数の場合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "9a637e7c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.490233Z",
     "iopub.status.busy": "2024-04-07T13:33:02.488430Z",
     "iopub.status.idle": "2024-04-07T13:33:02.537084Z",
     "shell.execute_reply": "2024-04-07T13:33:02.534440Z"
    },
    "papermill": {
     "duration": 0.081491,
     "end_time": "2024-04-07T13:33:02.540501",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.459010",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th><th scope=col>chr_jis</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>１</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>２</td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>３</td></tr>\n",
       "\t<tr><td>5</td><td>NA    </td><td>５</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4 × 3\n",
       "\\begin{tabular}{lll}\n",
       " num & chr & chr\\_jis\\\\\n",
       " <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & １\\\\\n",
       "\t 2 & second & ２\\\\\n",
       "\t 3 & third  & ３\\\\\n",
       "\t 5 & NA     & ５\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4 × 3\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; | chr_jis &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | first  | １ |\n",
       "| 2 | second | ２ |\n",
       "| 3 | third  | ３ |\n",
       "| 5 | NA     | ５ |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr    chr_jis\n",
       "1 1   first  １     \n",
       "2 2   second ２     \n",
       "3 3   third  ３     \n",
       "4 5   NA     ５     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th><th scope=col>chr_jis</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>１</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>２</td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>３</td></tr>\n",
       "\t<tr><td>5</td><td>NA    </td><td>５</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4 × 3\n",
       "\\begin{tabular}{lll}\n",
       " num & chr & chr\\_jis\\\\\n",
       " <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & １\\\\\n",
       "\t 2 & second & ２\\\\\n",
       "\t 3 & third  & ３\\\\\n",
       "\t 5 & NA     & ５\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4 × 3\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; | chr_jis &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | first  | １ |\n",
       "| 2 | second | ２ |\n",
       "| 3 | third  | ３ |\n",
       "| 5 | NA     | ５ |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr    chr_jis\n",
       "1 1   first  １     \n",
       "2 2   second ２     \n",
       "3 3   third  ３     \n",
       "4 5   NA     ５     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 右外部結合\n",
    "right_join(x, y, by = join_by(num)) # dplyrパッケージ\n",
    "merge(x, y, all.y = TRUE) # 組み込み関数の場合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "f6cce458",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.600249Z",
     "iopub.status.busy": "2024-04-07T13:33:02.597312Z",
     "iopub.status.idle": "2024-04-07T13:33:02.645782Z",
     "shell.execute_reply": "2024-04-07T13:33:02.643174Z"
    },
    "papermill": {
     "duration": 0.082359,
     "end_time": "2024-04-07T13:33:02.649411",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.567052",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th><th scope=col>chr_jis</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>１</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>２</td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>３</td></tr>\n",
       "\t<tr><td>4</td><td>fourth</td><td>NA</td></tr>\n",
       "\t<tr><td>5</td><td>NA    </td><td>５</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 3\n",
       "\\begin{tabular}{lll}\n",
       " num & chr & chr\\_jis\\\\\n",
       " <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & １\\\\\n",
       "\t 2 & second & ２\\\\\n",
       "\t 3 & third  & ３\\\\\n",
       "\t 4 & fourth & NA\\\\\n",
       "\t 5 & NA     & ５\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 3\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; | chr_jis &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | first  | １ |\n",
       "| 2 | second | ２ |\n",
       "| 3 | third  | ３ |\n",
       "| 4 | fourth | NA |\n",
       "| 5 | NA     | ５ |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr    chr_jis\n",
       "1 1   first  １     \n",
       "2 2   second ２     \n",
       "3 3   third  ３     \n",
       "4 4   fourth NA     \n",
       "5 5   NA     ５     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th><th scope=col>chr_jis</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>first </td><td>１</td></tr>\n",
       "\t<tr><td>2</td><td>second</td><td>２</td></tr>\n",
       "\t<tr><td>3</td><td>third </td><td>３</td></tr>\n",
       "\t<tr><td>4</td><td>fourth</td><td>NA</td></tr>\n",
       "\t<tr><td>5</td><td>NA    </td><td>５</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 3\n",
       "\\begin{tabular}{lll}\n",
       " num & chr & chr\\_jis\\\\\n",
       " <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1 & first  & １\\\\\n",
       "\t 2 & second & ２\\\\\n",
       "\t 3 & third  & ３\\\\\n",
       "\t 4 & fourth & NA\\\\\n",
       "\t 5 & NA     & ５\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 3\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; | chr_jis &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | first  | １ |\n",
       "| 2 | second | ２ |\n",
       "| 3 | third  | ３ |\n",
       "| 4 | fourth | NA |\n",
       "| 5 | NA     | ５ |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr    chr_jis\n",
       "1 1   first  １     \n",
       "2 2   second ２     \n",
       "3 3   third  ３     \n",
       "4 4   fourth NA     \n",
       "5 5   NA     ５     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 完全外部結合\n",
    "full_join(x, y, by = join_by(num)) # dplyrパッケージの場合\n",
    "merge(x, y, all = TRUE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "a60952d9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.721741Z",
     "iopub.status.busy": "2024-04-07T13:33:02.720140Z",
     "iopub.status.idle": "2024-04-07T13:33:02.748883Z",
     "shell.execute_reply": "2024-04-07T13:33:02.746381Z"
    },
    "papermill": {
     "duration": 0.075539,
     "end_time": "2024-04-07T13:33:02.752196",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.676657",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>num</th><th scope=col>chr</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>4</td><td>fourth</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " num & chr\\\\\n",
       " <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 4 & fourth\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 2\n",
       "\n",
       "| num &lt;dbl&gt; | chr &lt;chr&gt; |\n",
       "|---|---|\n",
       "| 4 | fourth |\n",
       "\n"
      ],
      "text/plain": [
       "  num chr   \n",
       "1 4   fourth"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 非等価結合\n",
    "anti_join(x, y, by = join_by(num)) # dplyrパッケージのみ"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b7aae687",
   "metadata": {
    "papermill": {
     "duration": 0.02813,
     "end_time": "2024-04-07T13:33:02.809071",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.780941",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-2-7 グループ単位の操作・集計（group_by関数）"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "6632166e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.868392Z",
     "iopub.status.busy": "2024-04-07T13:33:02.866710Z",
     "iopub.status.idle": "2024-04-07T13:33:02.915604Z",
     "shell.execute_reply": "2024-04-07T13:33:02.912985Z"
    },
    "papermill": {
     "duration": 0.082292,
     "end_time": "2024-04-07T13:33:02.919055",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.836763",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 3 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.8</td><td>4.0</td><td>1.2</td><td>0.2</td><td>setosa    </td></tr>\n",
       "\t<tr><td>7.0</td><td>3.2</td><td>4.7</td><td>1.4</td><td>versicolor</td></tr>\n",
       "\t<tr><td>7.9</td><td>3.8</td><td>6.4</td><td>2.0</td><td>virginica </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 3 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t 5.8 & 4.0 & 1.2 & 0.2 & setosa    \\\\\n",
       "\t 7.0 & 3.2 & 4.7 & 1.4 & versicolor\\\\\n",
       "\t 7.9 & 3.8 & 6.4 & 2.0 & virginica \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 3 × 5\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 5.8 | 4.0 | 1.2 | 0.2 | setosa     |\n",
       "| 7.0 | 3.2 | 4.7 | 1.4 | versicolor |\n",
       "| 7.9 | 3.8 | 6.4 | 2.0 | virginica  |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species   \n",
       "1 5.8          4.0         1.2          0.2         setosa    \n",
       "2 7.0          3.2         4.7          1.4         versicolor\n",
       "3 7.9          3.8         6.4          2.0         virginica "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "# 行の抽出：指定したグループ単位（Species）で最大のSepal.Lengthを含む行を抽出\n",
    "filter(group_by(iris, Species), Sepal.Length == max(Sepal.Length))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "56950a37",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:02.981487Z",
     "iopub.status.busy": "2024-04-07T13:33:02.979652Z",
     "iopub.status.idle": "2024-04-07T13:33:03.057808Z",
     "shell.execute_reply": "2024-04-07T13:33:03.055298Z"
    },
    "papermill": {
     "duration": 0.113808,
     "end_time": "2024-04-07T13:33:03.061084",
     "exception": false,
     "start_time": "2024-04-07T13:33:02.947276",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 5 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td></tr>\n",
       "\t<tr><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td><td>5.8</td></tr>\n",
       "\t<tr><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td><td>5.8</td></tr>\n",
       "\t<tr><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 5 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa & 5.8\\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa & 5.8\\\\\n",
       "\t 4.7 & 3.2 & 1.3 & 0.2 & setosa & 5.8\\\\\n",
       "\t 4.6 & 3.1 & 1.5 & 0.2 & setosa & 5.8\\\\\n",
       "\t 5.0 & 3.6 & 1.4 & 0.2 & setosa & 5.8\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 5 × 6\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa | 5.8 |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa | 5.8 |\n",
       "| 4.7 | 3.2 | 1.3 | 0.2 | setosa | 5.8 |\n",
       "| 4.6 | 3.1 | 1.5 | 0.2 | setosa | 5.8 |\n",
       "| 5.0 | 3.6 | 1.4 | 0.2 | setosa | 5.8 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Length_max\n",
       "1 5.1          3.5         1.4          0.2         setosa  5.8             \n",
       "2 4.9          3.0         1.4          0.2         setosa  5.8             \n",
       "3 4.7          3.2         1.3          0.2         setosa  5.8             \n",
       "4 4.6          3.1         1.5          0.2         setosa  5.8             \n",
       "5 5.0          3.6         1.4          0.2         setosa  5.8             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 5 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>6.7</td><td>3.0</td><td>5.2</td><td>2.3</td><td>virginica</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.3</td><td>2.5</td><td>5.0</td><td>1.9</td><td>virginica</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.5</td><td>3.0</td><td>5.2</td><td>2.0</td><td>virginica</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.2</td><td>3.4</td><td>5.4</td><td>2.3</td><td>virginica</td><td>7.9</td></tr>\n",
       "\t<tr><td>5.9</td><td>3.0</td><td>5.1</td><td>1.8</td><td>virginica</td><td>7.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 5 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 6.7 & 3.0 & 5.2 & 2.3 & virginica & 7.9\\\\\n",
       "\t 6.3 & 2.5 & 5.0 & 1.9 & virginica & 7.9\\\\\n",
       "\t 6.5 & 3.0 & 5.2 & 2.0 & virginica & 7.9\\\\\n",
       "\t 6.2 & 3.4 & 5.4 & 2.3 & virginica & 7.9\\\\\n",
       "\t 5.9 & 3.0 & 5.1 & 1.8 & virginica & 7.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 5 × 6\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 6.7 | 3.0 | 5.2 | 2.3 | virginica | 7.9 |\n",
       "| 6.3 | 2.5 | 5.0 | 1.9 | virginica | 7.9 |\n",
       "| 6.5 | 3.0 | 5.2 | 2.0 | virginica | 7.9 |\n",
       "| 6.2 | 3.4 | 5.4 | 2.3 | virginica | 7.9 |\n",
       "| 5.9 | 3.0 | 5.1 | 1.8 | virginica | 7.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species   Sepal.Length_max\n",
       "1 6.7          3.0         5.2          2.3         virginica 7.9             \n",
       "2 6.3          2.5         5.0          1.9         virginica 7.9             \n",
       "3 6.5          3.0         5.2          2.0         virginica 7.9             \n",
       "4 6.2          3.4         5.4          2.3         virginica 7.9             \n",
       "5 5.9          3.0         5.1          1.8         virginica 7.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 列の作成：指定したグループ単位（Species）で最大のSepal.Lengthを結合\n",
    "mutate(group_by(iris, Species), Sepal.Length_max = max(Sepal.Length)) %>% head(5)\n",
    "mutate(group_by(iris, Species), Sepal.Length_max = max(Sepal.Length)) %>% tail(5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "0b735781",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:03.122509Z",
     "iopub.status.busy": "2024-04-07T13:33:03.120667Z",
     "iopub.status.idle": "2024-04-07T13:33:03.156337Z",
     "shell.execute_reply": "2024-04-07T13:33:03.153723Z"
    },
    "papermill": {
     "duration": 0.070189,
     "end_time": "2024-04-07T13:33:03.159612",
     "exception": false,
     "start_time": "2024-04-07T13:33:03.089423",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Species</th><th scope=col>Sepal.Length_min</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>setosa    </td><td>4.3</td></tr>\n",
       "\t<tr><td>versicolor</td><td>4.9</td></tr>\n",
       "\t<tr><td>virginica </td><td>4.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Species & Sepal.Length\\_min\\\\\n",
       " <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t setosa     & 4.3\\\\\n",
       "\t versicolor & 4.9\\\\\n",
       "\t virginica  & 4.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 2\n",
       "\n",
       "| Species &lt;fct&gt; | Sepal.Length_min &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| setosa     | 4.3 |\n",
       "| versicolor | 4.9 |\n",
       "| virginica  | 4.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Species    Sepal.Length_min\n",
       "1 setosa     4.3             \n",
       "2 versicolor 4.9             \n",
       "3 virginica  4.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 集計：指定したグループ単位（Species）で最小のSepal.Lengthを集計\n",
    "summarise(group_by(iris, Species), Sepal.Length_min = min(Sepal.Length))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "8afef27a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:03.220456Z",
     "iopub.status.busy": "2024-04-07T13:33:03.218747Z",
     "iopub.status.idle": "2024-04-07T13:33:03.315478Z",
     "shell.execute_reply": "2024-04-07T13:33:03.313020Z"
    },
    "papermill": {
     "duration": 0.130384,
     "end_time": "2024-04-07T13:33:03.318169",
     "exception": false,
     "start_time": "2024-04-07T13:33:03.187785",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 150 × 6\u001b[39m\n",
      "\u001b[90m# Groups:   Species [3]\u001b[39m\n",
      "   Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Length_max\n",
      "          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<fct>\u001b[39m\u001b[23m              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m          5.1         3.5          1.4         0.2 setosa               5.8\n",
      "\u001b[90m 2\u001b[39m          4.9         3            1.4         0.2 setosa               5.8\n",
      "\u001b[90m 3\u001b[39m          4.7         3.2          1.3         0.2 setosa               5.8\n",
      "\u001b[90m 4\u001b[39m          4.6         3.1          1.5         0.2 setosa               5.8\n",
      "\u001b[90m 5\u001b[39m          5           3.6          1.4         0.2 setosa               5.8\n",
      "\u001b[90m 6\u001b[39m          5.4         3.9          1.7         0.4 setosa               5.8\n",
      "\u001b[90m 7\u001b[39m          4.6         3.4          1.4         0.3 setosa               5.8\n",
      "\u001b[90m 8\u001b[39m          5           3.4          1.5         0.2 setosa               5.8\n",
      "\u001b[90m 9\u001b[39m          4.4         2.9          1.4         0.2 setosa               5.8\n",
      "\u001b[90m10\u001b[39m          4.9         3.1          1.5         0.1 setosa               5.8\n",
      "\u001b[90m# ℹ 140 more rows\u001b[39m\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "res <- mutate(group_by(iris, Species), Sepal.Length_max = max(Sepal.Length))\n",
    "print(res)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "29fbb722",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-05T04:19:49.381415Z",
     "iopub.status.busy": "2024-04-05T04:19:49.379639Z",
     "iopub.status.idle": "2024-04-05T04:19:49.394600Z"
    },
    "papermill": {
     "duration": 0.029085,
     "end_time": "2024-04-07T13:33:03.376079",
     "exception": false,
     "start_time": "2024-04-07T13:33:03.346994",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 8-2-8 データの縦横変換"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "0c0d1dee",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:03.439046Z",
     "iopub.status.busy": "2024-04-07T13:33:03.437272Z",
     "iopub.status.idle": "2024-04-07T13:33:03.527210Z",
     "shell.execute_reply": "2024-04-07T13:33:03.524997Z"
    },
    "papermill": {
     "duration": 0.125114,
     "end_time": "2024-04-07T13:33:03.530280",
     "exception": false,
     "start_time": "2024-04-07T13:33:03.405166",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "        time          x         y         z\n",
      "1 2009-01-01 -1.2249903 -3.838680 -3.761335\n",
      "2 2009-01-02  0.7926126 -3.241736 -2.008309\n"
     ]
    }
   ],
   "source": [
    "library(tidyr)\n",
    "stocks <- data.frame(\n",
    "    time = as.Date('2009-01-01') + 0:1,\n",
    "    x = rnorm(2, 0, 1),\n",
    "    y = rnorm(2, 0, 2),\n",
    "    z = rnorm(2, 0, 4)\n",
    "    )\n",
    "print(stocks)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "26cf4e00",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:03.591431Z",
     "iopub.status.busy": "2024-04-07T13:33:03.589635Z",
     "iopub.status.idle": "2024-04-07T13:33:03.636197Z",
     "shell.execute_reply": "2024-04-07T13:33:03.633870Z"
    },
    "papermill": {
     "duration": 0.080138,
     "end_time": "2024-04-07T13:33:03.639012",
     "exception": false,
     "start_time": "2024-04-07T13:33:03.558874",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "        time variable      value\n",
      "1 2009-01-01        x -1.2249903\n",
      "2 2009-01-02        x  0.7926126\n",
      "3 2009-01-01        y -3.8386802\n",
      "4 2009-01-02        y -3.2417360\n",
      "5 2009-01-01        z -3.7613353\n",
      "6 2009-01-02        z -2.0083093\n",
      "        time          x         y         z\n",
      "1 2009-01-01 -1.2249903 -3.838680 -3.761335\n",
      "2 2009-01-02  0.7926126 -3.241736 -2.008309\n"
     ]
    }
   ],
   "source": [
    "# wide系詩歌kらlong形式に変換\n",
    "# 対象データ、key、value、変換対象の列（マイナスを付与した場合その列以外のすべて）の順に指定\n",
    "stocks_long <- gather(stocks, variable, value, -time)\n",
    "# データの確認\n",
    "print(stocks_long)\n",
    "\n",
    "# long形式からwide形式に変換\n",
    "# 対象データ、key、valueの順に指定\n",
    "stocks_wide <- spread(stocks_long, variable, value)\n",
    "# データの確認\n",
    "print(stocks_wide)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "65581160",
   "metadata": {
    "papermill": {
     "duration": 0.029242,
     "end_time": "2024-04-07T13:33:03.698330",
     "exception": false,
     "start_time": "2024-04-07T13:33:03.669088",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-2-9 そのほかのdplyrパッケージで知っておきたい処理"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "548c63d4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:03.761036Z",
     "iopub.status.busy": "2024-04-07T13:33:03.759233Z",
     "iopub.status.idle": "2024-04-07T13:33:03.861878Z",
     "shell.execute_reply": "2024-04-07T13:33:03.859889Z"
    },
    "papermill": {
     "duration": 0.137442,
     "end_time": "2024-04-07T13:33:03.864515",
     "exception": false,
     "start_time": "2024-04-07T13:33:03.727073",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 5 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th><th scope=col>Sepal.Width_max</th><th scope=col>Petal.Length_max</th><th scope=col>Petal.Width_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "\t<tr><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "\t<tr><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "\t<tr><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 5 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max & Sepal.Width\\_max & Petal.Length\\_max & Petal.Width\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\t 4.7 & 3.2 & 1.3 & 0.2 & setosa & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\t 4.6 & 3.1 & 1.5 & 0.2 & setosa & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\t 5.0 & 3.6 & 1.4 & 0.2 & setosa & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 5 × 9\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; | Sepal.Width_max &lt;dbl&gt; | Petal.Length_max &lt;dbl&gt; | Petal.Width_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "| 4.7 | 3.2 | 1.3 | 0.2 | setosa | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "| 4.6 | 3.1 | 1.5 | 0.2 | setosa | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "| 5.0 | 3.6 | 1.4 | 0.2 | setosa | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Length_max\n",
       "1 5.1          3.5         1.4          0.2         setosa  5.8             \n",
       "2 4.9          3.0         1.4          0.2         setosa  5.8             \n",
       "3 4.7          3.2         1.3          0.2         setosa  5.8             \n",
       "4 4.6          3.1         1.5          0.2         setosa  5.8             \n",
       "5 5.0          3.6         1.4          0.2         setosa  5.8             \n",
       "  Sepal.Width_max Petal.Length_max Petal.Width_max\n",
       "1 4.4             1.9              0.6            \n",
       "2 4.4             1.9              0.6            \n",
       "3 4.4             1.9              0.6            \n",
       "4 4.4             1.9              0.6            \n",
       "5 4.4             1.9              0.6            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 5 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th><th scope=col>Sepal.Width_max</th><th scope=col>Petal.Length_max</th><th scope=col>Petal.Width_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>6.7</td><td>3.0</td><td>5.2</td><td>2.3</td><td>virginica</td><td>7.9</td><td>3.8</td><td>6.9</td><td>2.5</td></tr>\n",
       "\t<tr><td>6.3</td><td>2.5</td><td>5.0</td><td>1.9</td><td>virginica</td><td>7.9</td><td>3.8</td><td>6.9</td><td>2.5</td></tr>\n",
       "\t<tr><td>6.5</td><td>3.0</td><td>5.2</td><td>2.0</td><td>virginica</td><td>7.9</td><td>3.8</td><td>6.9</td><td>2.5</td></tr>\n",
       "\t<tr><td>6.2</td><td>3.4</td><td>5.4</td><td>2.3</td><td>virginica</td><td>7.9</td><td>3.8</td><td>6.9</td><td>2.5</td></tr>\n",
       "\t<tr><td>5.9</td><td>3.0</td><td>5.1</td><td>1.8</td><td>virginica</td><td>7.9</td><td>3.8</td><td>6.9</td><td>2.5</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 5 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max & Sepal.Width\\_max & Petal.Length\\_max & Petal.Width\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 6.7 & 3.0 & 5.2 & 2.3 & virginica & 7.9 & 3.8 & 6.9 & 2.5\\\\\n",
       "\t 6.3 & 2.5 & 5.0 & 1.9 & virginica & 7.9 & 3.8 & 6.9 & 2.5\\\\\n",
       "\t 6.5 & 3.0 & 5.2 & 2.0 & virginica & 7.9 & 3.8 & 6.9 & 2.5\\\\\n",
       "\t 6.2 & 3.4 & 5.4 & 2.3 & virginica & 7.9 & 3.8 & 6.9 & 2.5\\\\\n",
       "\t 5.9 & 3.0 & 5.1 & 1.8 & virginica & 7.9 & 3.8 & 6.9 & 2.5\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 5 × 9\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; | Sepal.Width_max &lt;dbl&gt; | Petal.Length_max &lt;dbl&gt; | Petal.Width_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 6.7 | 3.0 | 5.2 | 2.3 | virginica | 7.9 | 3.8 | 6.9 | 2.5 |\n",
       "| 6.3 | 2.5 | 5.0 | 1.9 | virginica | 7.9 | 3.8 | 6.9 | 2.5 |\n",
       "| 6.5 | 3.0 | 5.2 | 2.0 | virginica | 7.9 | 3.8 | 6.9 | 2.5 |\n",
       "| 6.2 | 3.4 | 5.4 | 2.3 | virginica | 7.9 | 3.8 | 6.9 | 2.5 |\n",
       "| 5.9 | 3.0 | 5.1 | 1.8 | virginica | 7.9 | 3.8 | 6.9 | 2.5 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species   Sepal.Length_max\n",
       "1 6.7          3.0         5.2          2.3         virginica 7.9             \n",
       "2 6.3          2.5         5.0          1.9         virginica 7.9             \n",
       "3 6.5          3.0         5.2          2.0         virginica 7.9             \n",
       "4 6.2          3.4         5.4          2.3         virginica 7.9             \n",
       "5 5.9          3.0         5.1          1.8         virginica 7.9             \n",
       "  Sepal.Width_max Petal.Length_max Petal.Width_max\n",
       "1 3.8             6.9              2.5            \n",
       "2 3.8             6.9              2.5            \n",
       "3 3.8             6.9              2.5            \n",
       "4 3.8             6.9              2.5            \n",
       "5 3.8             6.9              2.5            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "# グループ単位で複数列の最大値を取得して結合\n",
    "mutate(group_by(iris, Species), \n",
    "      Sepal.Length_max = max(Sepal.Length),\n",
    "      Sepal.Width_max = max(Sepal.Width),\n",
    "      Petal.Length_max = max(Petal.Length),\n",
    "      Petal.Width_max = max(Petal.Width)\n",
    ") %>% head(5)\n",
    "\n",
    "mutate(group_by(iris, Species), \n",
    "      Sepal.Length_max = max(Sepal.Length),\n",
    "      Sepal.Width_max = max(Sepal.Width),\n",
    "      Petal.Length_max = max(Petal.Length),\n",
    "      Petal.Width_max = max(Petal.Width)\n",
    ") %>% tail(5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "4cc41112",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:03.929726Z",
     "iopub.status.busy": "2024-04-07T13:33:03.927894Z",
     "iopub.status.idle": "2024-04-07T13:33:03.966972Z",
     "shell.execute_reply": "2024-04-07T13:33:03.964591Z"
    },
    "papermill": {
     "duration": 0.075449,
     "end_time": "2024-04-07T13:33:03.970074",
     "exception": false,
     "start_time": "2024-04-07T13:33:03.894625",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Species</th><th scope=col>Sepal.Length_max</th><th scope=col>Sepal.Width_max</th><th scope=col>Petal.Length_max</th><th scope=col>Petal.Width_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>setosa    </td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "\t<tr><td>versicolor</td><td>7.0</td><td>3.4</td><td>5.1</td><td>1.8</td></tr>\n",
       "\t<tr><td>virginica </td><td>7.9</td><td>3.8</td><td>6.9</td><td>2.5</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Species & Sepal.Length\\_max & Sepal.Width\\_max & Petal.Length\\_max & Petal.Width\\_max\\\\\n",
       " <fct> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t setosa     & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\t versicolor & 7.0 & 3.4 & 5.1 & 1.8\\\\\n",
       "\t virginica  & 7.9 & 3.8 & 6.9 & 2.5\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 5\n",
       "\n",
       "| Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; | Sepal.Width_max &lt;dbl&gt; | Petal.Length_max &lt;dbl&gt; | Petal.Width_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| setosa     | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "| versicolor | 7.0 | 3.4 | 5.1 | 1.8 |\n",
       "| virginica  | 7.9 | 3.8 | 6.9 | 2.5 |\n",
       "\n"
      ],
      "text/plain": [
       "  Species    Sepal.Length_max Sepal.Width_max Petal.Length_max Petal.Width_max\n",
       "1 setosa     5.8              4.4             1.9              0.6            \n",
       "2 versicolor 7.0              3.4             5.1              1.8            \n",
       "3 virginica  7.9              3.8             6.9              2.5            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# グループ単位で複数列の最大値を取得して集約\n",
    "summarise(group_by(iris, Species), \n",
    "      Sepal.Length_max = max(Sepal.Length),\n",
    "      Sepal.Width_max = max(Sepal.Width),\n",
    "      Petal.Length_max = max(Petal.Length),\n",
    "      Petal.Width_max = max(Petal.Width)\n",
    ")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "bfb3d6d5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:04.034296Z",
     "iopub.status.busy": "2024-04-07T13:33:04.032407Z",
     "iopub.status.idle": "2024-04-07T13:33:04.073809Z",
     "shell.execute_reply": "2024-04-07T13:33:04.071902Z"
    },
    "papermill": {
     "duration": 0.076024,
     "end_time": "2024-04-07T13:33:04.076531",
     "exception": false,
     "start_time": "2024-04-07T13:33:04.000507",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Species</th><th scope=col>Sepal.Length_max</th><th scope=col>Sepal.Width_max</th><th scope=col>Petal.Length_max</th><th scope=col>Petal.Width_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>setosa    </td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "\t<tr><td>versicolor</td><td>7.0</td><td>3.4</td><td>5.1</td><td>1.8</td></tr>\n",
       "\t<tr><td>virginica </td><td>7.9</td><td>3.8</td><td>6.9</td><td>2.5</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Species & Sepal.Length\\_max & Sepal.Width\\_max & Petal.Length\\_max & Petal.Width\\_max\\\\\n",
       " <fct> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t setosa     & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\t versicolor & 7.0 & 3.4 & 5.1 & 1.8\\\\\n",
       "\t virginica  & 7.9 & 3.8 & 6.9 & 2.5\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 5\n",
       "\n",
       "| Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; | Sepal.Width_max &lt;dbl&gt; | Petal.Length_max &lt;dbl&gt; | Petal.Width_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| setosa     | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "| versicolor | 7.0 | 3.4 | 5.1 | 1.8 |\n",
       "| virginica  | 7.9 | 3.8 | 6.9 | 2.5 |\n",
       "\n"
      ],
      "text/plain": [
       "  Species    Sepal.Length_max Sepal.Width_max Petal.Length_max Petal.Width_max\n",
       "1 setosa     5.8              4.4             1.9              0.6            \n",
       "2 versicolor 7.0              3.4             5.1              1.8            \n",
       "3 virginica  7.9              3.8             6.9              2.5            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# グループ単位で複数列の最大値を取得\n",
    "summarise( group_by(iris, Species), across(starts_with(c(\"Sepal\", \"Petal\")), max, .names = \"{.col}_max\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "edef4935",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:04.141776Z",
     "iopub.status.busy": "2024-04-07T13:33:04.140021Z",
     "iopub.status.idle": "2024-04-07T13:33:05.151716Z",
     "shell.execute_reply": "2024-04-07T13:33:05.149564Z"
    },
    "papermill": {
     "duration": 1.047829,
     "end_time": "2024-04-07T13:33:05.155359",
     "exception": false,
     "start_time": "2024-04-07T13:33:04.107530",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.4     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse, warn.conflicts = FALSE)\n",
    "library(conflicted)\n",
    "\n",
    "# filter関数、lag関数についてdplyrを優先する\n",
    "conflict_prefer(\"filter\", \"dplyr\", quiet = TRUE)\n",
    "conflict_prefer(\"lag\", \"dplyr\", quiet = TRUE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "903ca6e1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:05.221511Z",
     "iopub.status.busy": "2024-04-07T13:33:05.218889Z",
     "iopub.status.idle": "2024-04-07T13:33:05.272308Z",
     "shell.execute_reply": "2024-04-07T13:33:05.269614Z"
    },
    "papermill": {
     "duration": 0.090005,
     "end_time": "2024-04-07T13:33:05.275451",
     "exception": false,
     "start_time": "2024-04-07T13:33:05.185446",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 3 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th><th scope=col>Sepal.Width_max</th><th scope=col>Petal.Length_max</th><th scope=col>Petal.Width_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "\t<tr><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td><td>5.8</td><td>4.4</td><td>1.9</td><td>0.6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 3 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max & Sepal.Width\\_max & Petal.Length\\_max & Petal.Width\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\t 4.7 & 3.2 & 1.3 & 0.2 & setosa & 5.8 & 4.4 & 1.9 & 0.6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 3 × 9\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; | Sepal.Width_max &lt;dbl&gt; | Petal.Length_max &lt;dbl&gt; | Petal.Width_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "| 4.7 | 3.2 | 1.3 | 0.2 | setosa | 5.8 | 4.4 | 1.9 | 0.6 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Length_max\n",
       "1 5.1          3.5         1.4          0.2         setosa  5.8             \n",
       "2 4.9          3.0         1.4          0.2         setosa  5.8             \n",
       "3 4.7          3.2         1.3          0.2         setosa  5.8             \n",
       "  Sepal.Width_max Petal.Length_max Petal.Width_max\n",
       "1 4.4             1.9              0.6            \n",
       "2 4.4             1.9              0.6            \n",
       "3 4.4             1.9              0.6            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# %>%を用いた記法\n",
    "iris %>%\n",
    "    group_by(Species) %>%\n",
    "    mutate(across(starts_with(c('Sepal', 'Petal')), max, .names = '{.col}_max')) %>%\n",
    "    head(3)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "7273d1e9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:05.340976Z",
     "iopub.status.busy": "2024-04-07T13:33:05.339056Z",
     "iopub.status.idle": "2024-04-07T13:33:05.375795Z",
     "shell.execute_reply": "2024-04-07T13:33:05.373252Z"
    },
    "papermill": {
     "duration": 0.07273,
     "end_time": "2024-04-07T13:33:05.378879",
     "exception": false,
     "start_time": "2024-04-07T13:33:05.306149",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>FALSE</li><li>FALSE</li><li>TRUE</li><li>FALSE</li><li>FALSE</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item FALSE\n",
       "\\item FALSE\n",
       "\\item TRUE\n",
       "\\item FALSE\n",
       "\\item FALSE\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. FALSE\n",
       "2. FALSE\n",
       "3. TRUE\n",
       "4. FALSE\n",
       "5. FALSE\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] FALSE FALSE  TRUE FALSE FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# .を用いて明示的に値を渡す\n",
    "letters[1:5] %>%\n",
    "    grepl('c', x=.)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "a89da9e4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:33:05.444103Z",
     "iopub.status.busy": "2024-04-07T13:33:05.442218Z",
     "iopub.status.idle": "2024-04-07T13:34:04.779254Z",
     "shell.execute_reply": "2024-04-07T13:34:04.777287Z"
    },
    "papermill": {
     "duration": 59.406968,
     "end_time": "2024-04-07T13:34:04.816353",
     "exception": false,
     "start_time": "2024-04-07T13:33:05.409385",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 13151 × 29</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>playerID</th><th scope=col>yearID</th><th scope=col>stint</th><th scope=col>teamID</th><th scope=col>lgID</th><th scope=col>G</th><th scope=col>AB</th><th scope=col>R</th><th scope=col>H</th><th scope=col>X2B</th><th scope=col>⋯</th><th scope=col>SH</th><th scope=col>SF</th><th scope=col>GIDP</th><th scope=col>BA</th><th scope=col>PA</th><th scope=col>TB</th><th scope=col>SlugPct</th><th scope=col>OBP</th><th scope=col>OPS</th><th scope=col>BABIP</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>⋯</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>aardsda01</td><td>2006</td><td>1</td><td>CHN</td><td>NL</td><td> 45</td><td>  2</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 1</td><td> 0</td><td> 0</td><td>0.000</td><td>  3</td><td>  0</td><td>0.000</td><td>0.000</td><td>0.000</td><td>0.000</td></tr>\n",
       "\t<tr><td>aaronha01</td><td>1955</td><td>1</td><td>ML1</td><td>NL</td><td>153</td><td>602</td><td>105</td><td>189</td><td>37</td><td>⋯</td><td> 7</td><td> 4</td><td>20</td><td>0.314</td><td>665</td><td>325</td><td>0.540</td><td>0.366</td><td>0.906</td><td>0.313</td></tr>\n",
       "\t<tr><td>aaronto01</td><td>1968</td><td>1</td><td>ATL</td><td>NL</td><td> 98</td><td>283</td><td> 21</td><td> 69</td><td>10</td><td>⋯</td><td> 2</td><td> 1</td><td> 9</td><td>0.244</td><td>307</td><td> 88</td><td>0.311</td><td>0.295</td><td>0.606</td><td>0.276</td></tr>\n",
       "\t<tr><td>aasedo01 </td><td>1978</td><td>1</td><td>CAL</td><td>AL</td><td> 29</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>abadan01 </td><td>2003</td><td>1</td><td>BOS</td><td>AL</td><td>  9</td><td> 17</td><td>  1</td><td>  2</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 1</td><td>0.118</td><td> 19</td><td>  2</td><td>0.118</td><td>0.211</td><td>0.329</td><td>0.167</td></tr>\n",
       "\t<tr><td>abadfe01 </td><td>2011</td><td>1</td><td>HOU</td><td>NL</td><td> 29</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>abadijo01</td><td>1875</td><td>1</td><td>PH3</td><td>NA</td><td> 11</td><td> 45</td><td>  3</td><td> 10</td><td> 0</td><td>⋯</td><td>NA</td><td>NA</td><td> 0</td><td>0.222</td><td> 45</td><td> 10</td><td>0.222</td><td>0.222</td><td>0.444</td><td>0.238</td></tr>\n",
       "\t<tr><td>abbated01</td><td>1898</td><td>1</td><td>PHI</td><td>NL</td><td> 25</td><td> 92</td><td>  9</td><td> 21</td><td> 4</td><td>⋯</td><td> 2</td><td>NA</td><td>NA</td><td>0.228</td><td>102</td><td> 25</td><td>0.272</td><td>0.290</td><td>0.562</td><td>0.273</td></tr>\n",
       "\t<tr><td>abbeybe01</td><td>1894</td><td>1</td><td>CHN</td><td>NL</td><td> 11</td><td> 39</td><td>  3</td><td>  5</td><td> 0</td><td>⋯</td><td> 2</td><td>NA</td><td>NA</td><td>0.128</td><td> 43</td><td>  5</td><td>0.128</td><td>0.171</td><td>0.299</td><td>0.156</td></tr>\n",
       "\t<tr><td>abbeych01</td><td>1894</td><td>1</td><td>WAS</td><td>NL</td><td>129</td><td>523</td><td> 95</td><td>164</td><td>26</td><td>⋯</td><td> 1</td><td>NA</td><td>NA</td><td>0.314</td><td>589</td><td>247</td><td>0.472</td><td>0.389</td><td>0.861</td><td>0.328</td></tr>\n",
       "\t<tr><td>abbotco01</td><td>2022</td><td>1</td><td>WAS</td><td>NL</td><td> 16</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>abbotfr01</td><td>1905</td><td>1</td><td>PHI</td><td>NL</td><td> 42</td><td>128</td><td>  9</td><td> 25</td><td> 6</td><td>⋯</td><td> 6</td><td>NA</td><td>NA</td><td>0.195</td><td>143</td><td> 33</td><td>0.258</td><td>0.248</td><td>0.506</td><td>0.238</td></tr>\n",
       "\t<tr><td>abbotgl01</td><td>1974</td><td>1</td><td>OAK</td><td>AL</td><td> 19</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>abbotje01</td><td>1998</td><td>1</td><td>CHA</td><td>AL</td><td> 89</td><td>244</td><td> 33</td><td> 68</td><td>14</td><td>⋯</td><td> 2</td><td> 5</td><td> 2</td><td>0.279</td><td>260</td><td>120</td><td>0.492</td><td>0.298</td><td>0.790</td><td>0.268</td></tr>\n",
       "\t<tr><td>abbotji01</td><td>1990</td><td>1</td><td>CAL</td><td>AL</td><td> 33</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>abbotku01</td><td>1994</td><td>1</td><td>FLO</td><td>NL</td><td>101</td><td>345</td><td> 41</td><td> 86</td><td>17</td><td>⋯</td><td> 3</td><td> 2</td><td> 5</td><td>0.249</td><td>371</td><td>136</td><td>0.394</td><td>0.291</td><td>0.685</td><td>0.321</td></tr>\n",
       "\t<tr><td>abbotky01</td><td>1992</td><td>1</td><td>PHI</td><td>NL</td><td> 31</td><td> 29</td><td>  1</td><td>  2</td><td> 1</td><td>⋯</td><td> 6</td><td> 0</td><td> 0</td><td>0.069</td><td> 36</td><td>  3</td><td>0.103</td><td>0.100</td><td>0.203</td><td>0.182</td></tr>\n",
       "\t<tr><td>abbotpa01</td><td>1991</td><td>1</td><td>MIN</td><td>AL</td><td> 15</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>aberal01 </td><td>1953</td><td>1</td><td>CLE</td><td>AL</td><td>  6</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td>NA</td><td> 0</td><td>   NA</td><td>  2</td><td>  0</td><td>   NA</td><td>1.000</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>abernbr01</td><td>2002</td><td>1</td><td>TBA</td><td>AL</td><td>117</td><td>463</td><td> 46</td><td>112</td><td>18</td><td>⋯</td><td> 8</td><td> 2</td><td> 8</td><td>0.242</td><td>504</td><td>144</td><td>0.311</td><td>0.288</td><td>0.599</td><td>0.264</td></tr>\n",
       "\t<tr><td>abernte01</td><td>1943</td><td>1</td><td>PHA</td><td>AL</td><td>  5</td><td>  4</td><td>  0</td><td>  1</td><td> 0</td><td>⋯</td><td> 0</td><td>NA</td><td> 0</td><td>0.250</td><td>  4</td><td>  1</td><td>0.250</td><td>0.250</td><td>0.500</td><td>0.500</td></tr>\n",
       "\t<tr><td>abernte02</td><td>1957</td><td>1</td><td>WS1</td><td>AL</td><td> 26</td><td> 24</td><td>  3</td><td>  4</td><td> 1</td><td>⋯</td><td> 2</td><td> 0</td><td> 2</td><td>0.167</td><td> 28</td><td>  5</td><td>0.208</td><td>0.231</td><td>0.439</td><td>0.211</td></tr>\n",
       "\t<tr><td>abnersh01</td><td>1988</td><td>1</td><td>SDN</td><td>NL</td><td> 37</td><td> 83</td><td>  6</td><td> 15</td><td> 3</td><td>⋯</td><td> 0</td><td> 1</td><td> 1</td><td>0.181</td><td> 89</td><td> 24</td><td>0.289</td><td>0.225</td><td>0.514</td><td>0.206</td></tr>\n",
       "\t<tr><td>abramca01</td><td>1950</td><td>1</td><td>BRO</td><td>NL</td><td> 38</td><td> 44</td><td>  5</td><td>  9</td><td> 1</td><td>⋯</td><td> 1</td><td>NA</td><td> 0</td><td>0.205</td><td> 54</td><td> 10</td><td>0.227</td><td>0.340</td><td>0.567</td><td>0.290</td></tr>\n",
       "\t<tr><td>abreual01</td><td>2021</td><td>1</td><td>NYA</td><td>AL</td><td> 28</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>abreubo01</td><td>1997</td><td>1</td><td>HOU</td><td>NL</td><td> 59</td><td>188</td><td> 22</td><td> 47</td><td>10</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>0.250</td><td>210</td><td> 70</td><td>0.372</td><td>0.329</td><td>0.701</td><td>0.321</td></tr>\n",
       "\t<tr><td>abreubr01</td><td>2021</td><td>1</td><td>HOU</td><td>AL</td><td> 31</td><td>  0</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>abreujo02</td><td>2015</td><td>1</td><td>CHA</td><td>AL</td><td>154</td><td>613</td><td> 88</td><td>178</td><td>34</td><td>⋯</td><td> 0</td><td> 1</td><td>16</td><td>0.290</td><td>668</td><td>308</td><td>0.502</td><td>0.347</td><td>0.849</td><td>0.333</td></tr>\n",
       "\t<tr><td>abreuto01</td><td>2010</td><td>1</td><td>ARI</td><td>NL</td><td> 81</td><td>193</td><td> 16</td><td> 45</td><td>11</td><td>⋯</td><td> 0</td><td> 4</td><td> 8</td><td>0.233</td><td>201</td><td> 61</td><td>0.316</td><td>0.244</td><td>0.560</td><td>0.295</td></tr>\n",
       "\t<tr><td>abreuwi01</td><td>2007</td><td>1</td><td>WAS</td><td>NL</td><td> 26</td><td>  2</td><td>  0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>0.000</td><td>  2</td><td>  0</td><td>0.000</td><td>0.000</td><td>0.000</td><td>0.000</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋱</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>zimmech01</td><td>1887</td><td>1</td><td>CL3</td><td>AA</td><td> 14</td><td> 52</td><td> 9</td><td> 12</td><td> 5</td><td>⋯</td><td>NA</td><td>NA</td><td>NA</td><td>0.231</td><td> 57</td><td> 17</td><td>0.327</td><td>0.298</td><td>0.625</td><td>0.250</td></tr>\n",
       "\t<tr><td>zimmedo01</td><td>1955</td><td>1</td><td>BRO</td><td>NL</td><td> 88</td><td>280</td><td>38</td><td> 67</td><td>10</td><td>⋯</td><td> 4</td><td> 4</td><td> 7</td><td>0.239</td><td>309</td><td>124</td><td>0.443</td><td>0.289</td><td>0.732</td><td>0.256</td></tr>\n",
       "\t<tr><td>zimmeed01</td><td>1911</td><td>1</td><td>BRO</td><td>NL</td><td>122</td><td>417</td><td>31</td><td> 77</td><td>10</td><td>⋯</td><td>16</td><td>NA</td><td>NA</td><td>0.185</td><td>469</td><td>110</td><td>0.264</td><td>0.249</td><td>0.513</td><td>0.196</td></tr>\n",
       "\t<tr><td>zimmehe01</td><td>1908</td><td>1</td><td>CHN</td><td>NL</td><td> 46</td><td>113</td><td>17</td><td> 33</td><td> 4</td><td>⋯</td><td> 4</td><td>NA</td><td>NA</td><td>0.292</td><td>118</td><td> 39</td><td>0.345</td><td>0.298</td><td>0.643</td><td>0.333</td></tr>\n",
       "\t<tr><td>zimmeje01</td><td>1963</td><td>1</td><td>MIN</td><td>AL</td><td> 39</td><td> 56</td><td> 3</td><td> 13</td><td> 1</td><td>⋯</td><td> 3</td><td> 0</td><td> 3</td><td>0.232</td><td> 61</td><td> 14</td><td>0.250</td><td>0.259</td><td>0.509</td><td>0.271</td></tr>\n",
       "\t<tr><td>zimmeje02</td><td>2001</td><td>1</td><td>TEX</td><td>AL</td><td> 66</td><td>  0</td><td> 0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>zimmejo02</td><td>2011</td><td>1</td><td>WAS</td><td>NL</td><td> 29</td><td> 43</td><td> 1</td><td>  9</td><td> 1</td><td>⋯</td><td>11</td><td> 0</td><td> 0</td><td>0.209</td><td> 56</td><td> 10</td><td>0.233</td><td>0.244</td><td>0.477</td><td>0.290</td></tr>\n",
       "\t<tr><td>zimmeky01</td><td>2020</td><td>1</td><td>KCA</td><td>AL</td><td> 16</td><td>  0</td><td> 0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>zimmery01</td><td>2006</td><td>1</td><td>WAS</td><td>NL</td><td>157</td><td>614</td><td>84</td><td>176</td><td>47</td><td>⋯</td><td> 1</td><td> 4</td><td>15</td><td>0.287</td><td>682</td><td>289</td><td>0.471</td><td>0.351</td><td>0.822</td><td>0.326</td></tr>\n",
       "\t<tr><td>zinngu01 </td><td>1912</td><td>1</td><td>NYA</td><td>AL</td><td>106</td><td>401</td><td>56</td><td>105</td><td>15</td><td>⋯</td><td>10</td><td>NA</td><td>NA</td><td>0.262</td><td>462</td><td>158</td><td>0.394</td><td>0.345</td><td>0.739</td><td>0.251</td></tr>\n",
       "\t<tr><td>zinnji01 </td><td>1921</td><td>1</td><td>PIT</td><td>NL</td><td> 33</td><td> 49</td><td> 6</td><td> 11</td><td> 2</td><td>⋯</td><td> 0</td><td>NA</td><td>NA</td><td>0.224</td><td> 50</td><td> 13</td><td>0.265</td><td>0.240</td><td>0.505</td><td>0.282</td></tr>\n",
       "\t<tr><td>zipfebu01</td><td>1962</td><td>1</td><td>WS2</td><td>AL</td><td> 68</td><td>184</td><td>21</td><td> 44</td><td> 4</td><td>⋯</td><td> 1</td><td> 0</td><td> 1</td><td>0.239</td><td>203</td><td> 68</td><td>0.370</td><td>0.307</td><td>0.677</td><td>0.281</td></tr>\n",
       "\t<tr><td>ziskri01 </td><td>1972</td><td>1</td><td>PIT</td><td>NL</td><td> 17</td><td> 37</td><td> 4</td><td>  7</td><td> 3</td><td>⋯</td><td> 0</td><td> 0</td><td> 1</td><td>0.189</td><td> 44</td><td> 10</td><td>0.270</td><td>0.318</td><td>0.588</td><td>0.259</td></tr>\n",
       "\t<tr><td>zitoba01 </td><td>2001</td><td>1</td><td>OAK</td><td>AL</td><td> 35</td><td>  5</td><td> 0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>0.000</td><td>  5</td><td>  0</td><td>0.000</td><td>0.000</td><td>0.000</td><td>0.000</td></tr>\n",
       "\t<tr><td>zitzmbi01</td><td>1919</td><td>1</td><td>PIT</td><td>NL</td><td> 11</td><td> 26</td><td> 5</td><td>  5</td><td> 1</td><td>⋯</td><td> 1</td><td>NA</td><td>NA</td><td>0.192</td><td> 27</td><td>  6</td><td>0.231</td><td>0.192</td><td>0.423</td><td>0.250</td></tr>\n",
       "\t<tr><td>zobribe01</td><td>2008</td><td>1</td><td>TBA</td><td>AL</td><td> 62</td><td>198</td><td>32</td><td> 50</td><td>10</td><td>⋯</td><td> 0</td><td> 2</td><td> 4</td><td>0.253</td><td>227</td><td>100</td><td>0.505</td><td>0.339</td><td>0.844</td><td>0.252</td></tr>\n",
       "\t<tr><td>zoldasa01</td><td>1945</td><td>1</td><td>SLA</td><td>AL</td><td> 27</td><td> 20</td><td> 0</td><td>  1</td><td> 0</td><td>⋯</td><td> 0</td><td>NA</td><td> 0</td><td>0.050</td><td> 20</td><td>  1</td><td>0.050</td><td>0.050</td><td>0.100</td><td>0.083</td></tr>\n",
       "\t<tr><td>zoskyed01</td><td>1999</td><td>1</td><td>MIL</td><td>NL</td><td>  8</td><td>  7</td><td> 1</td><td>  1</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>0.143</td><td>  8</td><td>  1</td><td>0.143</td><td>0.250</td><td>0.393</td><td>0.200</td></tr>\n",
       "\t<tr><td>zuberbi01</td><td>1938</td><td>1</td><td>CLE</td><td>AL</td><td> 15</td><td>  7</td><td> 0</td><td>  0</td><td> 0</td><td>⋯</td><td> 1</td><td>NA</td><td>NA</td><td>0.000</td><td>  8</td><td>  0</td><td>0.000</td><td>0.000</td><td>0.000</td><td>0.000</td></tr>\n",
       "\t<tr><td>zuberjo01</td><td>1998</td><td>1</td><td>PHI</td><td>NL</td><td> 38</td><td> 45</td><td> 6</td><td> 11</td><td> 3</td><td>⋯</td><td> 0</td><td> 0</td><td> 1</td><td>0.244</td><td> 52</td><td> 22</td><td>0.489</td><td>0.346</td><td>0.835</td><td>0.265</td></tr>\n",
       "\t<tr><td>zuberty01</td><td>2021</td><td>1</td><td>KCA</td><td>AL</td><td> 31</td><td>  1</td><td> 0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>0.000</td><td>  1</td><td>  0</td><td>0.000</td><td>0.000</td><td>0.000</td><td>  NaN</td></tr>\n",
       "\t<tr><td>zuletju01</td><td>2001</td><td>1</td><td>CHN</td><td>NL</td><td> 49</td><td>106</td><td>11</td><td> 23</td><td> 3</td><td>⋯</td><td> 0</td><td> 1</td><td> 3</td><td>0.217</td><td>118</td><td> 44</td><td>0.415</td><td>0.288</td><td>0.703</td><td>0.246</td></tr>\n",
       "\t<tr><td>zumayjo01</td><td>2009</td><td>1</td><td>DET</td><td>AL</td><td> 29</td><td>  0</td><td> 0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "\t<tr><td>zuninmi01</td><td>2014</td><td>1</td><td>SEA</td><td>AL</td><td>131</td><td>438</td><td>51</td><td> 87</td><td>20</td><td>⋯</td><td> 0</td><td> 4</td><td>12</td><td>0.199</td><td>476</td><td>177</td><td>0.404</td><td>0.254</td><td>0.658</td><td>0.248</td></tr>\n",
       "\t<tr><td>zupcibo01</td><td>1992</td><td>1</td><td>BOS</td><td>AL</td><td>124</td><td>392</td><td>46</td><td>108</td><td>19</td><td>⋯</td><td> 7</td><td> 4</td><td> 6</td><td>0.276</td><td>432</td><td>138</td><td>0.352</td><td>0.322</td><td>0.674</td><td>0.315</td></tr>\n",
       "\t<tr><td>zupofr01 </td><td>1961</td><td>1</td><td>BAL</td><td>AL</td><td>  5</td><td>  4</td><td> 1</td><td>  2</td><td> 1</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>0.500</td><td>  5</td><td>  3</td><td>0.750</td><td>0.600</td><td>1.350</td><td>0.667</td></tr>\n",
       "\t<tr><td>zuvelpa01</td><td>1983</td><td>1</td><td>ATL</td><td>NL</td><td>  3</td><td>  5</td><td> 0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>0.000</td><td>  8</td><td>  0</td><td>0.000</td><td>0.375</td><td>0.375</td><td>0.000</td></tr>\n",
       "\t<tr><td>zuverge01</td><td>1954</td><td>2</td><td>DET</td><td>AL</td><td> 35</td><td> 64</td><td> 1</td><td>  8</td><td> 1</td><td>⋯</td><td> 9</td><td> 0</td><td> 2</td><td>0.125</td><td> 74</td><td>  9</td><td>0.141</td><td>0.138</td><td>0.279</td><td>0.160</td></tr>\n",
       "\t<tr><td>zwilldu01</td><td>1914</td><td>1</td><td>CHF</td><td>FL</td><td>154</td><td>592</td><td>91</td><td>185</td><td>38</td><td>⋯</td><td>10</td><td>NA</td><td>NA</td><td>0.312</td><td>649</td><td>287</td><td>0.485</td><td>0.363</td><td>0.848</td><td>0.333</td></tr>\n",
       "\t<tr><td>zychto01 </td><td>2017</td><td>1</td><td>SEA</td><td>AL</td><td> 45</td><td>  0</td><td> 0</td><td>  0</td><td> 0</td><td>⋯</td><td> 0</td><td> 0</td><td> 0</td><td>   NA</td><td>  0</td><td>  0</td><td>   NA</td><td>   NA</td><td>   NA</td><td>   NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 13151 × 29\n",
       "\\begin{tabular}{lllllllllllllllllllll}\n",
       " playerID & yearID & stint & teamID & lgID & G & AB & R & H & X2B & ⋯ & SH & SF & GIDP & BA & PA & TB & SlugPct & OBP & OPS & BABIP\\\\\n",
       " <chr> & <int> & <int> & <fct> & <fct> & <int> & <int> & <int> & <int> & <int> & ⋯ & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t aardsda01 & 2006 & 1 & CHN & NL &  45 &   2 &   0 &   0 &  0 & ⋯ &  1 &  0 &  0 & 0.000 &   3 &   0 & 0.000 & 0.000 & 0.000 & 0.000\\\\\n",
       "\t aaronha01 & 1955 & 1 & ML1 & NL & 153 & 602 & 105 & 189 & 37 & ⋯ &  7 &  4 & 20 & 0.314 & 665 & 325 & 0.540 & 0.366 & 0.906 & 0.313\\\\\n",
       "\t aaronto01 & 1968 & 1 & ATL & NL &  98 & 283 &  21 &  69 & 10 & ⋯ &  2 &  1 &  9 & 0.244 & 307 &  88 & 0.311 & 0.295 & 0.606 & 0.276\\\\\n",
       "\t aasedo01  & 1978 & 1 & CAL & AL &  29 &   0 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t abadan01  & 2003 & 1 & BOS & AL &   9 &  17 &   1 &   2 &  0 & ⋯ &  0 &  0 &  1 & 0.118 &  19 &   2 & 0.118 & 0.211 & 0.329 & 0.167\\\\\n",
       "\t abadfe01  & 2011 & 1 & HOU & NL &  29 &   0 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t abadijo01 & 1875 & 1 & PH3 & NA &  11 &  45 &   3 &  10 &  0 & ⋯ & NA & NA &  0 & 0.222 &  45 &  10 & 0.222 & 0.222 & 0.444 & 0.238\\\\\n",
       "\t abbated01 & 1898 & 1 & PHI & NL &  25 &  92 &   9 &  21 &  4 & ⋯ &  2 & NA & NA & 0.228 & 102 &  25 & 0.272 & 0.290 & 0.562 & 0.273\\\\\n",
       "\t abbeybe01 & 1894 & 1 & CHN & NL &  11 &  39 &   3 &   5 &  0 & ⋯ &  2 & NA & NA & 0.128 &  43 &   5 & 0.128 & 0.171 & 0.299 & 0.156\\\\\n",
       "\t abbeych01 & 1894 & 1 & WAS & NL & 129 & 523 &  95 & 164 & 26 & ⋯ &  1 & NA & NA & 0.314 & 589 & 247 & 0.472 & 0.389 & 0.861 & 0.328\\\\\n",
       "\t abbotco01 & 2022 & 1 & WAS & NL &  16 &   0 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t abbotfr01 & 1905 & 1 & PHI & NL &  42 & 128 &   9 &  25 &  6 & ⋯ &  6 & NA & NA & 0.195 & 143 &  33 & 0.258 & 0.248 & 0.506 & 0.238\\\\\n",
       "\t abbotgl01 & 1974 & 1 & OAK & AL &  19 &   0 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t abbotje01 & 1998 & 1 & CHA & AL &  89 & 244 &  33 &  68 & 14 & ⋯ &  2 &  5 &  2 & 0.279 & 260 & 120 & 0.492 & 0.298 & 0.790 & 0.268\\\\\n",
       "\t abbotji01 & 1990 & 1 & CAL & AL &  33 &   0 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t abbotku01 & 1994 & 1 & FLO & NL & 101 & 345 &  41 &  86 & 17 & ⋯ &  3 &  2 &  5 & 0.249 & 371 & 136 & 0.394 & 0.291 & 0.685 & 0.321\\\\\n",
       "\t abbotky01 & 1992 & 1 & PHI & NL &  31 &  29 &   1 &   2 &  1 & ⋯ &  6 &  0 &  0 & 0.069 &  36 &   3 & 0.103 & 0.100 & 0.203 & 0.182\\\\\n",
       "\t abbotpa01 & 1991 & 1 & MIN & AL &  15 &   0 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t aberal01  & 1953 & 1 & CLE & AL &   6 &   0 &   0 &   0 &  0 & ⋯ &  0 & NA &  0 &    NA &   2 &   0 &    NA & 1.000 &    NA &    NA\\\\\n",
       "\t abernbr01 & 2002 & 1 & TBA & AL & 117 & 463 &  46 & 112 & 18 & ⋯ &  8 &  2 &  8 & 0.242 & 504 & 144 & 0.311 & 0.288 & 0.599 & 0.264\\\\\n",
       "\t abernte01 & 1943 & 1 & PHA & AL &   5 &   4 &   0 &   1 &  0 & ⋯ &  0 & NA &  0 & 0.250 &   4 &   1 & 0.250 & 0.250 & 0.500 & 0.500\\\\\n",
       "\t abernte02 & 1957 & 1 & WS1 & AL &  26 &  24 &   3 &   4 &  1 & ⋯ &  2 &  0 &  2 & 0.167 &  28 &   5 & 0.208 & 0.231 & 0.439 & 0.211\\\\\n",
       "\t abnersh01 & 1988 & 1 & SDN & NL &  37 &  83 &   6 &  15 &  3 & ⋯ &  0 &  1 &  1 & 0.181 &  89 &  24 & 0.289 & 0.225 & 0.514 & 0.206\\\\\n",
       "\t abramca01 & 1950 & 1 & BRO & NL &  38 &  44 &   5 &   9 &  1 & ⋯ &  1 & NA &  0 & 0.205 &  54 &  10 & 0.227 & 0.340 & 0.567 & 0.290\\\\\n",
       "\t abreual01 & 2021 & 1 & NYA & AL &  28 &   0 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t abreubo01 & 1997 & 1 & HOU & NL &  59 & 188 &  22 &  47 & 10 & ⋯ &  0 &  0 &  0 & 0.250 & 210 &  70 & 0.372 & 0.329 & 0.701 & 0.321\\\\\n",
       "\t abreubr01 & 2021 & 1 & HOU & AL &  31 &   0 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t abreujo02 & 2015 & 1 & CHA & AL & 154 & 613 &  88 & 178 & 34 & ⋯ &  0 &  1 & 16 & 0.290 & 668 & 308 & 0.502 & 0.347 & 0.849 & 0.333\\\\\n",
       "\t abreuto01 & 2010 & 1 & ARI & NL &  81 & 193 &  16 &  45 & 11 & ⋯ &  0 &  4 &  8 & 0.233 & 201 &  61 & 0.316 & 0.244 & 0.560 & 0.295\\\\\n",
       "\t abreuwi01 & 2007 & 1 & WAS & NL &  26 &   2 &   0 &   0 &  0 & ⋯ &  0 &  0 &  0 & 0.000 &   2 &   0 & 0.000 & 0.000 & 0.000 & 0.000\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋱ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t zimmech01 & 1887 & 1 & CL3 & AA &  14 &  52 &  9 &  12 &  5 & ⋯ & NA & NA & NA & 0.231 &  57 &  17 & 0.327 & 0.298 & 0.625 & 0.250\\\\\n",
       "\t zimmedo01 & 1955 & 1 & BRO & NL &  88 & 280 & 38 &  67 & 10 & ⋯ &  4 &  4 &  7 & 0.239 & 309 & 124 & 0.443 & 0.289 & 0.732 & 0.256\\\\\n",
       "\t zimmeed01 & 1911 & 1 & BRO & NL & 122 & 417 & 31 &  77 & 10 & ⋯ & 16 & NA & NA & 0.185 & 469 & 110 & 0.264 & 0.249 & 0.513 & 0.196\\\\\n",
       "\t zimmehe01 & 1908 & 1 & CHN & NL &  46 & 113 & 17 &  33 &  4 & ⋯ &  4 & NA & NA & 0.292 & 118 &  39 & 0.345 & 0.298 & 0.643 & 0.333\\\\\n",
       "\t zimmeje01 & 1963 & 1 & MIN & AL &  39 &  56 &  3 &  13 &  1 & ⋯ &  3 &  0 &  3 & 0.232 &  61 &  14 & 0.250 & 0.259 & 0.509 & 0.271\\\\\n",
       "\t zimmeje02 & 2001 & 1 & TEX & AL &  66 &   0 &  0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t zimmejo02 & 2011 & 1 & WAS & NL &  29 &  43 &  1 &   9 &  1 & ⋯ & 11 &  0 &  0 & 0.209 &  56 &  10 & 0.233 & 0.244 & 0.477 & 0.290\\\\\n",
       "\t zimmeky01 & 2020 & 1 & KCA & AL &  16 &   0 &  0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t zimmery01 & 2006 & 1 & WAS & NL & 157 & 614 & 84 & 176 & 47 & ⋯ &  1 &  4 & 15 & 0.287 & 682 & 289 & 0.471 & 0.351 & 0.822 & 0.326\\\\\n",
       "\t zinngu01  & 1912 & 1 & NYA & AL & 106 & 401 & 56 & 105 & 15 & ⋯ & 10 & NA & NA & 0.262 & 462 & 158 & 0.394 & 0.345 & 0.739 & 0.251\\\\\n",
       "\t zinnji01  & 1921 & 1 & PIT & NL &  33 &  49 &  6 &  11 &  2 & ⋯ &  0 & NA & NA & 0.224 &  50 &  13 & 0.265 & 0.240 & 0.505 & 0.282\\\\\n",
       "\t zipfebu01 & 1962 & 1 & WS2 & AL &  68 & 184 & 21 &  44 &  4 & ⋯ &  1 &  0 &  1 & 0.239 & 203 &  68 & 0.370 & 0.307 & 0.677 & 0.281\\\\\n",
       "\t ziskri01  & 1972 & 1 & PIT & NL &  17 &  37 &  4 &   7 &  3 & ⋯ &  0 &  0 &  1 & 0.189 &  44 &  10 & 0.270 & 0.318 & 0.588 & 0.259\\\\\n",
       "\t zitoba01  & 2001 & 1 & OAK & AL &  35 &   5 &  0 &   0 &  0 & ⋯ &  0 &  0 &  0 & 0.000 &   5 &   0 & 0.000 & 0.000 & 0.000 & 0.000\\\\\n",
       "\t zitzmbi01 & 1919 & 1 & PIT & NL &  11 &  26 &  5 &   5 &  1 & ⋯ &  1 & NA & NA & 0.192 &  27 &   6 & 0.231 & 0.192 & 0.423 & 0.250\\\\\n",
       "\t zobribe01 & 2008 & 1 & TBA & AL &  62 & 198 & 32 &  50 & 10 & ⋯ &  0 &  2 &  4 & 0.253 & 227 & 100 & 0.505 & 0.339 & 0.844 & 0.252\\\\\n",
       "\t zoldasa01 & 1945 & 1 & SLA & AL &  27 &  20 &  0 &   1 &  0 & ⋯ &  0 & NA &  0 & 0.050 &  20 &   1 & 0.050 & 0.050 & 0.100 & 0.083\\\\\n",
       "\t zoskyed01 & 1999 & 1 & MIL & NL &   8 &   7 &  1 &   1 &  0 & ⋯ &  0 &  0 &  0 & 0.143 &   8 &   1 & 0.143 & 0.250 & 0.393 & 0.200\\\\\n",
       "\t zuberbi01 & 1938 & 1 & CLE & AL &  15 &   7 &  0 &   0 &  0 & ⋯ &  1 & NA & NA & 0.000 &   8 &   0 & 0.000 & 0.000 & 0.000 & 0.000\\\\\n",
       "\t zuberjo01 & 1998 & 1 & PHI & NL &  38 &  45 &  6 &  11 &  3 & ⋯ &  0 &  0 &  1 & 0.244 &  52 &  22 & 0.489 & 0.346 & 0.835 & 0.265\\\\\n",
       "\t zuberty01 & 2021 & 1 & KCA & AL &  31 &   1 &  0 &   0 &  0 & ⋯ &  0 &  0 &  0 & 0.000 &   1 &   0 & 0.000 & 0.000 & 0.000 &   NaN\\\\\n",
       "\t zuletju01 & 2001 & 1 & CHN & NL &  49 & 106 & 11 &  23 &  3 & ⋯ &  0 &  1 &  3 & 0.217 & 118 &  44 & 0.415 & 0.288 & 0.703 & 0.246\\\\\n",
       "\t zumayjo01 & 2009 & 1 & DET & AL &  29 &   0 &  0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\t zuninmi01 & 2014 & 1 & SEA & AL & 131 & 438 & 51 &  87 & 20 & ⋯ &  0 &  4 & 12 & 0.199 & 476 & 177 & 0.404 & 0.254 & 0.658 & 0.248\\\\\n",
       "\t zupcibo01 & 1992 & 1 & BOS & AL & 124 & 392 & 46 & 108 & 19 & ⋯ &  7 &  4 &  6 & 0.276 & 432 & 138 & 0.352 & 0.322 & 0.674 & 0.315\\\\\n",
       "\t zupofr01  & 1961 & 1 & BAL & AL &   5 &   4 &  1 &   2 &  1 & ⋯ &  0 &  0 &  0 & 0.500 &   5 &   3 & 0.750 & 0.600 & 1.350 & 0.667\\\\\n",
       "\t zuvelpa01 & 1983 & 1 & ATL & NL &   3 &   5 &  0 &   0 &  0 & ⋯ &  0 &  0 &  0 & 0.000 &   8 &   0 & 0.000 & 0.375 & 0.375 & 0.000\\\\\n",
       "\t zuverge01 & 1954 & 2 & DET & AL &  35 &  64 &  1 &   8 &  1 & ⋯ &  9 &  0 &  2 & 0.125 &  74 &   9 & 0.141 & 0.138 & 0.279 & 0.160\\\\\n",
       "\t zwilldu01 & 1914 & 1 & CHF & FL & 154 & 592 & 91 & 185 & 38 & ⋯ & 10 & NA & NA & 0.312 & 649 & 287 & 0.485 & 0.363 & 0.848 & 0.333\\\\\n",
       "\t zychto01  & 2017 & 1 & SEA & AL &  45 &   0 &  0 &   0 &  0 & ⋯ &  0 &  0 &  0 &    NA &   0 &   0 &    NA &    NA &    NA &    NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 13151 × 29\n",
       "\n",
       "| playerID &lt;chr&gt; | yearID &lt;int&gt; | stint &lt;int&gt; | teamID &lt;fct&gt; | lgID &lt;fct&gt; | G &lt;int&gt; | AB &lt;int&gt; | R &lt;int&gt; | H &lt;int&gt; | X2B &lt;int&gt; | ⋯ ⋯ | SH &lt;int&gt; | SF &lt;int&gt; | GIDP &lt;int&gt; | BA &lt;dbl&gt; | PA &lt;dbl&gt; | TB &lt;dbl&gt; | SlugPct &lt;dbl&gt; | OBP &lt;dbl&gt; | OPS &lt;dbl&gt; | BABIP &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| aardsda01 | 2006 | 1 | CHN | NL |  45 |   2 |   0 |   0 |  0 | ⋯ |  1 |  0 |  0 | 0.000 |   3 |   0 | 0.000 | 0.000 | 0.000 | 0.000 |\n",
       "| aaronha01 | 1955 | 1 | ML1 | NL | 153 | 602 | 105 | 189 | 37 | ⋯ |  7 |  4 | 20 | 0.314 | 665 | 325 | 0.540 | 0.366 | 0.906 | 0.313 |\n",
       "| aaronto01 | 1968 | 1 | ATL | NL |  98 | 283 |  21 |  69 | 10 | ⋯ |  2 |  1 |  9 | 0.244 | 307 |  88 | 0.311 | 0.295 | 0.606 | 0.276 |\n",
       "| aasedo01  | 1978 | 1 | CAL | AL |  29 |   0 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| abadan01  | 2003 | 1 | BOS | AL |   9 |  17 |   1 |   2 |  0 | ⋯ |  0 |  0 |  1 | 0.118 |  19 |   2 | 0.118 | 0.211 | 0.329 | 0.167 |\n",
       "| abadfe01  | 2011 | 1 | HOU | NL |  29 |   0 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| abadijo01 | 1875 | 1 | PH3 | NA |  11 |  45 |   3 |  10 |  0 | ⋯ | NA | NA |  0 | 0.222 |  45 |  10 | 0.222 | 0.222 | 0.444 | 0.238 |\n",
       "| abbated01 | 1898 | 1 | PHI | NL |  25 |  92 |   9 |  21 |  4 | ⋯ |  2 | NA | NA | 0.228 | 102 |  25 | 0.272 | 0.290 | 0.562 | 0.273 |\n",
       "| abbeybe01 | 1894 | 1 | CHN | NL |  11 |  39 |   3 |   5 |  0 | ⋯ |  2 | NA | NA | 0.128 |  43 |   5 | 0.128 | 0.171 | 0.299 | 0.156 |\n",
       "| abbeych01 | 1894 | 1 | WAS | NL | 129 | 523 |  95 | 164 | 26 | ⋯ |  1 | NA | NA | 0.314 | 589 | 247 | 0.472 | 0.389 | 0.861 | 0.328 |\n",
       "| abbotco01 | 2022 | 1 | WAS | NL |  16 |   0 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| abbotfr01 | 1905 | 1 | PHI | NL |  42 | 128 |   9 |  25 |  6 | ⋯ |  6 | NA | NA | 0.195 | 143 |  33 | 0.258 | 0.248 | 0.506 | 0.238 |\n",
       "| abbotgl01 | 1974 | 1 | OAK | AL |  19 |   0 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| abbotje01 | 1998 | 1 | CHA | AL |  89 | 244 |  33 |  68 | 14 | ⋯ |  2 |  5 |  2 | 0.279 | 260 | 120 | 0.492 | 0.298 | 0.790 | 0.268 |\n",
       "| abbotji01 | 1990 | 1 | CAL | AL |  33 |   0 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| abbotku01 | 1994 | 1 | FLO | NL | 101 | 345 |  41 |  86 | 17 | ⋯ |  3 |  2 |  5 | 0.249 | 371 | 136 | 0.394 | 0.291 | 0.685 | 0.321 |\n",
       "| abbotky01 | 1992 | 1 | PHI | NL |  31 |  29 |   1 |   2 |  1 | ⋯ |  6 |  0 |  0 | 0.069 |  36 |   3 | 0.103 | 0.100 | 0.203 | 0.182 |\n",
       "| abbotpa01 | 1991 | 1 | MIN | AL |  15 |   0 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| aberal01  | 1953 | 1 | CLE | AL |   6 |   0 |   0 |   0 |  0 | ⋯ |  0 | NA |  0 |    NA |   2 |   0 |    NA | 1.000 |    NA |    NA |\n",
       "| abernbr01 | 2002 | 1 | TBA | AL | 117 | 463 |  46 | 112 | 18 | ⋯ |  8 |  2 |  8 | 0.242 | 504 | 144 | 0.311 | 0.288 | 0.599 | 0.264 |\n",
       "| abernte01 | 1943 | 1 | PHA | AL |   5 |   4 |   0 |   1 |  0 | ⋯ |  0 | NA |  0 | 0.250 |   4 |   1 | 0.250 | 0.250 | 0.500 | 0.500 |\n",
       "| abernte02 | 1957 | 1 | WS1 | AL |  26 |  24 |   3 |   4 |  1 | ⋯ |  2 |  0 |  2 | 0.167 |  28 |   5 | 0.208 | 0.231 | 0.439 | 0.211 |\n",
       "| abnersh01 | 1988 | 1 | SDN | NL |  37 |  83 |   6 |  15 |  3 | ⋯ |  0 |  1 |  1 | 0.181 |  89 |  24 | 0.289 | 0.225 | 0.514 | 0.206 |\n",
       "| abramca01 | 1950 | 1 | BRO | NL |  38 |  44 |   5 |   9 |  1 | ⋯ |  1 | NA |  0 | 0.205 |  54 |  10 | 0.227 | 0.340 | 0.567 | 0.290 |\n",
       "| abreual01 | 2021 | 1 | NYA | AL |  28 |   0 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| abreubo01 | 1997 | 1 | HOU | NL |  59 | 188 |  22 |  47 | 10 | ⋯ |  0 |  0 |  0 | 0.250 | 210 |  70 | 0.372 | 0.329 | 0.701 | 0.321 |\n",
       "| abreubr01 | 2021 | 1 | HOU | AL |  31 |   0 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| abreujo02 | 2015 | 1 | CHA | AL | 154 | 613 |  88 | 178 | 34 | ⋯ |  0 |  1 | 16 | 0.290 | 668 | 308 | 0.502 | 0.347 | 0.849 | 0.333 |\n",
       "| abreuto01 | 2010 | 1 | ARI | NL |  81 | 193 |  16 |  45 | 11 | ⋯ |  0 |  4 |  8 | 0.233 | 201 |  61 | 0.316 | 0.244 | 0.560 | 0.295 |\n",
       "| abreuwi01 | 2007 | 1 | WAS | NL |  26 |   2 |   0 |   0 |  0 | ⋯ |  0 |  0 |  0 | 0.000 |   2 |   0 | 0.000 | 0.000 | 0.000 | 0.000 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋱ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| zimmech01 | 1887 | 1 | CL3 | AA |  14 |  52 |  9 |  12 |  5 | ⋯ | NA | NA | NA | 0.231 |  57 |  17 | 0.327 | 0.298 | 0.625 | 0.250 |\n",
       "| zimmedo01 | 1955 | 1 | BRO | NL |  88 | 280 | 38 |  67 | 10 | ⋯ |  4 |  4 |  7 | 0.239 | 309 | 124 | 0.443 | 0.289 | 0.732 | 0.256 |\n",
       "| zimmeed01 | 1911 | 1 | BRO | NL | 122 | 417 | 31 |  77 | 10 | ⋯ | 16 | NA | NA | 0.185 | 469 | 110 | 0.264 | 0.249 | 0.513 | 0.196 |\n",
       "| zimmehe01 | 1908 | 1 | CHN | NL |  46 | 113 | 17 |  33 |  4 | ⋯ |  4 | NA | NA | 0.292 | 118 |  39 | 0.345 | 0.298 | 0.643 | 0.333 |\n",
       "| zimmeje01 | 1963 | 1 | MIN | AL |  39 |  56 |  3 |  13 |  1 | ⋯ |  3 |  0 |  3 | 0.232 |  61 |  14 | 0.250 | 0.259 | 0.509 | 0.271 |\n",
       "| zimmeje02 | 2001 | 1 | TEX | AL |  66 |   0 |  0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| zimmejo02 | 2011 | 1 | WAS | NL |  29 |  43 |  1 |   9 |  1 | ⋯ | 11 |  0 |  0 | 0.209 |  56 |  10 | 0.233 | 0.244 | 0.477 | 0.290 |\n",
       "| zimmeky01 | 2020 | 1 | KCA | AL |  16 |   0 |  0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| zimmery01 | 2006 | 1 | WAS | NL | 157 | 614 | 84 | 176 | 47 | ⋯ |  1 |  4 | 15 | 0.287 | 682 | 289 | 0.471 | 0.351 | 0.822 | 0.326 |\n",
       "| zinngu01  | 1912 | 1 | NYA | AL | 106 | 401 | 56 | 105 | 15 | ⋯ | 10 | NA | NA | 0.262 | 462 | 158 | 0.394 | 0.345 | 0.739 | 0.251 |\n",
       "| zinnji01  | 1921 | 1 | PIT | NL |  33 |  49 |  6 |  11 |  2 | ⋯ |  0 | NA | NA | 0.224 |  50 |  13 | 0.265 | 0.240 | 0.505 | 0.282 |\n",
       "| zipfebu01 | 1962 | 1 | WS2 | AL |  68 | 184 | 21 |  44 |  4 | ⋯ |  1 |  0 |  1 | 0.239 | 203 |  68 | 0.370 | 0.307 | 0.677 | 0.281 |\n",
       "| ziskri01  | 1972 | 1 | PIT | NL |  17 |  37 |  4 |   7 |  3 | ⋯ |  0 |  0 |  1 | 0.189 |  44 |  10 | 0.270 | 0.318 | 0.588 | 0.259 |\n",
       "| zitoba01  | 2001 | 1 | OAK | AL |  35 |   5 |  0 |   0 |  0 | ⋯ |  0 |  0 |  0 | 0.000 |   5 |   0 | 0.000 | 0.000 | 0.000 | 0.000 |\n",
       "| zitzmbi01 | 1919 | 1 | PIT | NL |  11 |  26 |  5 |   5 |  1 | ⋯ |  1 | NA | NA | 0.192 |  27 |   6 | 0.231 | 0.192 | 0.423 | 0.250 |\n",
       "| zobribe01 | 2008 | 1 | TBA | AL |  62 | 198 | 32 |  50 | 10 | ⋯ |  0 |  2 |  4 | 0.253 | 227 | 100 | 0.505 | 0.339 | 0.844 | 0.252 |\n",
       "| zoldasa01 | 1945 | 1 | SLA | AL |  27 |  20 |  0 |   1 |  0 | ⋯ |  0 | NA |  0 | 0.050 |  20 |   1 | 0.050 | 0.050 | 0.100 | 0.083 |\n",
       "| zoskyed01 | 1999 | 1 | MIL | NL |   8 |   7 |  1 |   1 |  0 | ⋯ |  0 |  0 |  0 | 0.143 |   8 |   1 | 0.143 | 0.250 | 0.393 | 0.200 |\n",
       "| zuberbi01 | 1938 | 1 | CLE | AL |  15 |   7 |  0 |   0 |  0 | ⋯ |  1 | NA | NA | 0.000 |   8 |   0 | 0.000 | 0.000 | 0.000 | 0.000 |\n",
       "| zuberjo01 | 1998 | 1 | PHI | NL |  38 |  45 |  6 |  11 |  3 | ⋯ |  0 |  0 |  1 | 0.244 |  52 |  22 | 0.489 | 0.346 | 0.835 | 0.265 |\n",
       "| zuberty01 | 2021 | 1 | KCA | AL |  31 |   1 |  0 |   0 |  0 | ⋯ |  0 |  0 |  0 | 0.000 |   1 |   0 | 0.000 | 0.000 | 0.000 |   NaN |\n",
       "| zuletju01 | 2001 | 1 | CHN | NL |  49 | 106 | 11 |  23 |  3 | ⋯ |  0 |  1 |  3 | 0.217 | 118 |  44 | 0.415 | 0.288 | 0.703 | 0.246 |\n",
       "| zumayjo01 | 2009 | 1 | DET | AL |  29 |   0 |  0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "| zuninmi01 | 2014 | 1 | SEA | AL | 131 | 438 | 51 |  87 | 20 | ⋯ |  0 |  4 | 12 | 0.199 | 476 | 177 | 0.404 | 0.254 | 0.658 | 0.248 |\n",
       "| zupcibo01 | 1992 | 1 | BOS | AL | 124 | 392 | 46 | 108 | 19 | ⋯ |  7 |  4 |  6 | 0.276 | 432 | 138 | 0.352 | 0.322 | 0.674 | 0.315 |\n",
       "| zupofr01  | 1961 | 1 | BAL | AL |   5 |   4 |  1 |   2 |  1 | ⋯ |  0 |  0 |  0 | 0.500 |   5 |   3 | 0.750 | 0.600 | 1.350 | 0.667 |\n",
       "| zuvelpa01 | 1983 | 1 | ATL | NL |   3 |   5 |  0 |   0 |  0 | ⋯ |  0 |  0 |  0 | 0.000 |   8 |   0 | 0.000 | 0.375 | 0.375 | 0.000 |\n",
       "| zuverge01 | 1954 | 2 | DET | AL |  35 |  64 |  1 |   8 |  1 | ⋯ |  9 |  0 |  2 | 0.125 |  74 |   9 | 0.141 | 0.138 | 0.279 | 0.160 |\n",
       "| zwilldu01 | 1914 | 1 | CHF | FL | 154 | 592 | 91 | 185 | 38 | ⋯ | 10 | NA | NA | 0.312 | 649 | 287 | 0.485 | 0.363 | 0.848 | 0.333 |\n",
       "| zychto01  | 2017 | 1 | SEA | AL |  45 |   0 |  0 |   0 |  0 | ⋯ |  0 |  0 |  0 |    NA |   0 |   0 |    NA |    NA |    NA |    NA |\n",
       "\n"
      ],
      "text/plain": [
       "      playerID  yearID stint teamID lgID G   AB  R   H   X2B ⋯ SH SF GIDP BA   \n",
       "1     aardsda01 2006   1     CHN    NL    45   2   0   0  0  ⋯  1  0  0   0.000\n",
       "2     aaronha01 1955   1     ML1    NL   153 602 105 189 37  ⋯  7  4 20   0.314\n",
       "3     aaronto01 1968   1     ATL    NL    98 283  21  69 10  ⋯  2  1  9   0.244\n",
       "4     aasedo01  1978   1     CAL    AL    29   0   0   0  0  ⋯  0  0  0      NA\n",
       "5     abadan01  2003   1     BOS    AL     9  17   1   2  0  ⋯  0  0  1   0.118\n",
       "6     abadfe01  2011   1     HOU    NL    29   0   0   0  0  ⋯  0  0  0      NA\n",
       "7     abadijo01 1875   1     PH3    NA    11  45   3  10  0  ⋯ NA NA  0   0.222\n",
       "8     abbated01 1898   1     PHI    NL    25  92   9  21  4  ⋯  2 NA NA   0.228\n",
       "9     abbeybe01 1894   1     CHN    NL    11  39   3   5  0  ⋯  2 NA NA   0.128\n",
       "10    abbeych01 1894   1     WAS    NL   129 523  95 164 26  ⋯  1 NA NA   0.314\n",
       "11    abbotco01 2022   1     WAS    NL    16   0   0   0  0  ⋯  0  0  0      NA\n",
       "12    abbotfr01 1905   1     PHI    NL    42 128   9  25  6  ⋯  6 NA NA   0.195\n",
       "13    abbotgl01 1974   1     OAK    AL    19   0   0   0  0  ⋯  0  0  0      NA\n",
       "14    abbotje01 1998   1     CHA    AL    89 244  33  68 14  ⋯  2  5  2   0.279\n",
       "15    abbotji01 1990   1     CAL    AL    33   0   0   0  0  ⋯  0  0  0      NA\n",
       "16    abbotku01 1994   1     FLO    NL   101 345  41  86 17  ⋯  3  2  5   0.249\n",
       "17    abbotky01 1992   1     PHI    NL    31  29   1   2  1  ⋯  6  0  0   0.069\n",
       "18    abbotpa01 1991   1     MIN    AL    15   0   0   0  0  ⋯  0  0  0      NA\n",
       "19    aberal01  1953   1     CLE    AL     6   0   0   0  0  ⋯  0 NA  0      NA\n",
       "20    abernbr01 2002   1     TBA    AL   117 463  46 112 18  ⋯  8  2  8   0.242\n",
       "21    abernte01 1943   1     PHA    AL     5   4   0   1  0  ⋯  0 NA  0   0.250\n",
       "22    abernte02 1957   1     WS1    AL    26  24   3   4  1  ⋯  2  0  2   0.167\n",
       "23    abnersh01 1988   1     SDN    NL    37  83   6  15  3  ⋯  0  1  1   0.181\n",
       "24    abramca01 1950   1     BRO    NL    38  44   5   9  1  ⋯  1 NA  0   0.205\n",
       "25    abreual01 2021   1     NYA    AL    28   0   0   0  0  ⋯  0  0  0      NA\n",
       "26    abreubo01 1997   1     HOU    NL    59 188  22  47 10  ⋯  0  0  0   0.250\n",
       "27    abreubr01 2021   1     HOU    AL    31   0   0   0  0  ⋯  0  0  0      NA\n",
       "28    abreujo02 2015   1     CHA    AL   154 613  88 178 34  ⋯  0  1 16   0.290\n",
       "29    abreuto01 2010   1     ARI    NL    81 193  16  45 11  ⋯  0  4  8   0.233\n",
       "30    abreuwi01 2007   1     WAS    NL    26   2   0   0  0  ⋯  0  0  0   0.000\n",
       "⋮     ⋮         ⋮      ⋮     ⋮      ⋮    ⋮   ⋮   ⋮   ⋮   ⋮   ⋱ ⋮  ⋮  ⋮    ⋮    \n",
       "13122 zimmech01 1887   1     CL3    AA    14  52  9   12  5  ⋯ NA NA NA   0.231\n",
       "13123 zimmedo01 1955   1     BRO    NL    88 280 38   67 10  ⋯  4  4  7   0.239\n",
       "13124 zimmeed01 1911   1     BRO    NL   122 417 31   77 10  ⋯ 16 NA NA   0.185\n",
       "13125 zimmehe01 1908   1     CHN    NL    46 113 17   33  4  ⋯  4 NA NA   0.292\n",
       "13126 zimmeje01 1963   1     MIN    AL    39  56  3   13  1  ⋯  3  0  3   0.232\n",
       "13127 zimmeje02 2001   1     TEX    AL    66   0  0    0  0  ⋯  0  0  0      NA\n",
       "13128 zimmejo02 2011   1     WAS    NL    29  43  1    9  1  ⋯ 11  0  0   0.209\n",
       "13129 zimmeky01 2020   1     KCA    AL    16   0  0    0  0  ⋯  0  0  0      NA\n",
       "13130 zimmery01 2006   1     WAS    NL   157 614 84  176 47  ⋯  1  4 15   0.287\n",
       "13131 zinngu01  1912   1     NYA    AL   106 401 56  105 15  ⋯ 10 NA NA   0.262\n",
       "13132 zinnji01  1921   1     PIT    NL    33  49  6   11  2  ⋯  0 NA NA   0.224\n",
       "13133 zipfebu01 1962   1     WS2    AL    68 184 21   44  4  ⋯  1  0  1   0.239\n",
       "13134 ziskri01  1972   1     PIT    NL    17  37  4    7  3  ⋯  0  0  1   0.189\n",
       "13135 zitoba01  2001   1     OAK    AL    35   5  0    0  0  ⋯  0  0  0   0.000\n",
       "13136 zitzmbi01 1919   1     PIT    NL    11  26  5    5  1  ⋯  1 NA NA   0.192\n",
       "13137 zobribe01 2008   1     TBA    AL    62 198 32   50 10  ⋯  0  2  4   0.253\n",
       "13138 zoldasa01 1945   1     SLA    AL    27  20  0    1  0  ⋯  0 NA  0   0.050\n",
       "13139 zoskyed01 1999   1     MIL    NL     8   7  1    1  0  ⋯  0  0  0   0.143\n",
       "13140 zuberbi01 1938   1     CLE    AL    15   7  0    0  0  ⋯  1 NA NA   0.000\n",
       "13141 zuberjo01 1998   1     PHI    NL    38  45  6   11  3  ⋯  0  0  1   0.244\n",
       "13142 zuberty01 2021   1     KCA    AL    31   1  0    0  0  ⋯  0  0  0   0.000\n",
       "13143 zuletju01 2001   1     CHN    NL    49 106 11   23  3  ⋯  0  1  3   0.217\n",
       "13144 zumayjo01 2009   1     DET    AL    29   0  0    0  0  ⋯  0  0  0      NA\n",
       "13145 zuninmi01 2014   1     SEA    AL   131 438 51   87 20  ⋯  0  4 12   0.199\n",
       "13146 zupcibo01 1992   1     BOS    AL   124 392 46  108 19  ⋯  7  4  6   0.276\n",
       "13147 zupofr01  1961   1     BAL    AL     5   4  1    2  1  ⋯  0  0  0   0.500\n",
       "13148 zuvelpa01 1983   1     ATL    NL     3   5  0    0  0  ⋯  0  0  0   0.000\n",
       "13149 zuverge01 1954   2     DET    AL    35  64  1    8  1  ⋯  9  0  2   0.125\n",
       "13150 zwilldu01 1914   1     CHF    FL   154 592 91  185 38  ⋯ 10 NA NA   0.312\n",
       "13151 zychto01  2017   1     SEA    AL    45   0  0    0  0  ⋯  0  0  0      NA\n",
       "      PA  TB  SlugPct OBP   OPS   BABIP\n",
       "1       3   0 0.000   0.000 0.000 0.000\n",
       "2     665 325 0.540   0.366 0.906 0.313\n",
       "3     307  88 0.311   0.295 0.606 0.276\n",
       "4       0   0    NA      NA    NA    NA\n",
       "5      19   2 0.118   0.211 0.329 0.167\n",
       "6       0   0    NA      NA    NA    NA\n",
       "7      45  10 0.222   0.222 0.444 0.238\n",
       "8     102  25 0.272   0.290 0.562 0.273\n",
       "9      43   5 0.128   0.171 0.299 0.156\n",
       "10    589 247 0.472   0.389 0.861 0.328\n",
       "11      0   0    NA      NA    NA    NA\n",
       "12    143  33 0.258   0.248 0.506 0.238\n",
       "13      0   0    NA      NA    NA    NA\n",
       "14    260 120 0.492   0.298 0.790 0.268\n",
       "15      0   0    NA      NA    NA    NA\n",
       "16    371 136 0.394   0.291 0.685 0.321\n",
       "17     36   3 0.103   0.100 0.203 0.182\n",
       "18      0   0    NA      NA    NA    NA\n",
       "19      2   0    NA   1.000    NA    NA\n",
       "20    504 144 0.311   0.288 0.599 0.264\n",
       "21      4   1 0.250   0.250 0.500 0.500\n",
       "22     28   5 0.208   0.231 0.439 0.211\n",
       "23     89  24 0.289   0.225 0.514 0.206\n",
       "24     54  10 0.227   0.340 0.567 0.290\n",
       "25      0   0    NA      NA    NA    NA\n",
       "26    210  70 0.372   0.329 0.701 0.321\n",
       "27      0   0    NA      NA    NA    NA\n",
       "28    668 308 0.502   0.347 0.849 0.333\n",
       "29    201  61 0.316   0.244 0.560 0.295\n",
       "30      2   0 0.000   0.000 0.000 0.000\n",
       "⋮     ⋮   ⋮   ⋮       ⋮     ⋮     ⋮    \n",
       "13122  57  17 0.327   0.298 0.625 0.250\n",
       "13123 309 124 0.443   0.289 0.732 0.256\n",
       "13124 469 110 0.264   0.249 0.513 0.196\n",
       "13125 118  39 0.345   0.298 0.643 0.333\n",
       "13126  61  14 0.250   0.259 0.509 0.271\n",
       "13127   0   0    NA      NA    NA    NA\n",
       "13128  56  10 0.233   0.244 0.477 0.290\n",
       "13129   0   0    NA      NA    NA    NA\n",
       "13130 682 289 0.471   0.351 0.822 0.326\n",
       "13131 462 158 0.394   0.345 0.739 0.251\n",
       "13132  50  13 0.265   0.240 0.505 0.282\n",
       "13133 203  68 0.370   0.307 0.677 0.281\n",
       "13134  44  10 0.270   0.318 0.588 0.259\n",
       "13135   5   0 0.000   0.000 0.000 0.000\n",
       "13136  27   6 0.231   0.192 0.423 0.250\n",
       "13137 227 100 0.505   0.339 0.844 0.252\n",
       "13138  20   1 0.050   0.050 0.100 0.083\n",
       "13139   8   1 0.143   0.250 0.393 0.200\n",
       "13140   8   0 0.000   0.000 0.000 0.000\n",
       "13141  52  22 0.489   0.346 0.835 0.265\n",
       "13142   1   0 0.000   0.000 0.000   NaN\n",
       "13143 118  44 0.415   0.288 0.703 0.246\n",
       "13144   0   0    NA      NA    NA    NA\n",
       "13145 476 177 0.404   0.254 0.658 0.248\n",
       "13146 432 138 0.352   0.322 0.674 0.315\n",
       "13147   5   3 0.750   0.600 1.350 0.667\n",
       "13148   8   0 0.000   0.375 0.375 0.000\n",
       "13149  74   9 0.141   0.138 0.279 0.160\n",
       "13150 649 287 0.485   0.363 0.848 0.333\n",
       "13151   0   0    NA      NA    NA    NA"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# window関数\n",
    "# Lahmanパッケージのインストール\n",
    "install.packages('Lahman', quiet = TRUE)\n",
    "\n",
    "# Lahmanパッケージの打者データをplayerID、yearID、teamIDの優先順で並び替え\n",
    "library(Lahman)\n",
    "batting <- arrange(battingStats(), playerID, yearID, teamID)\n",
    "# playerID単位でグループ化する\n",
    "players <- group_by(batting, playerID)\n",
    "# 前回の記録よりも出場試合数が多い選手データを抽出する\n",
    "filter(players, G > lag(G)) %>% do(head(., 1))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "be7d12a0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:04.885982Z",
     "iopub.status.busy": "2024-04-07T13:34:04.884272Z",
     "iopub.status.idle": "2024-04-07T13:34:04.981867Z",
     "shell.execute_reply": "2024-04-07T13:34:04.979935Z"
    },
    "papermill": {
     "duration": 0.136404,
     "end_time": "2024-04-07T13:34:04.984694",
     "exception": false,
     "start_time": "2024-04-07T13:34:04.848290",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa    </td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa    </td></tr>\n",
       "\t<tr><td>7.0</td><td>3.2</td><td>4.7</td><td>1.4</td><td>versicolor</td></tr>\n",
       "\t<tr><td>6.4</td><td>3.2</td><td>4.5</td><td>1.5</td><td>versicolor</td></tr>\n",
       "\t<tr><td>6.3</td><td>3.3</td><td>6.0</td><td>2.5</td><td>virginica </td></tr>\n",
       "\t<tr><td>5.8</td><td>2.7</td><td>5.1</td><td>1.9</td><td>virginica </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa    \\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa    \\\\\n",
       "\t 7.0 & 3.2 & 4.7 & 1.4 & versicolor\\\\\n",
       "\t 6.4 & 3.2 & 4.5 & 1.5 & versicolor\\\\\n",
       "\t 6.3 & 3.3 & 6.0 & 2.5 & virginica \\\\\n",
       "\t 5.8 & 2.7 & 5.1 & 1.9 & virginica \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 6 × 5\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa     |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa     |\n",
       "| 7.0 | 3.2 | 4.7 | 1.4 | versicolor |\n",
       "| 6.4 | 3.2 | 4.5 | 1.5 | versicolor |\n",
       "| 6.3 | 3.3 | 6.0 | 2.5 | virginica  |\n",
       "| 5.8 | 2.7 | 5.1 | 1.9 | virginica  |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species   \n",
       "1 5.1          3.5         1.4          0.2         setosa    \n",
       "2 4.9          3.0         1.4          0.2         setosa    \n",
       "3 7.0          3.2         4.7          1.4         versicolor\n",
       "4 6.4          3.2         4.5          1.5         versicolor\n",
       "5 6.3          3.3         6.0          2.5         virginica \n",
       "6 5.8          2.7         5.1          1.9         virginica "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# do関数\n",
    "library(dplyr)\n",
    "# iris_grouped <- group_by(iris, Species)\n",
    "# do(iris_grouped, head(., n=2))\n",
    "iris %>% group_by(Species) %>% do(head(., 2))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa92d1c3",
   "metadata": {
    "papermill": {
     "duration": 0.033637,
     "end_time": "2024-04-07T13:34:05.050720",
     "exception": false,
     "start_time": "2024-04-07T13:34:05.017083",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3 data.tableパッケージを用いたデータハンドリング"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "c0a0f6eb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:05.119875Z",
     "iopub.status.busy": "2024-04-07T13:34:05.118093Z",
     "iopub.status.idle": "2024-04-07T13:34:49.247494Z",
     "shell.execute_reply": "2024-04-07T13:34:49.244714Z"
    },
    "papermill": {
     "duration": 44.168257,
     "end_time": "2024-04-07T13:34:49.251512",
     "exception": false,
     "start_time": "2024-04-07T13:34:05.083255",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# data.tableパッケージのインストール\n",
    "install.packages('data.table', quiet = TRUE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1069d02a",
   "metadata": {
    "papermill": {
     "duration": 0.032845,
     "end_time": "2024-04-07T13:34:49.318288",
     "exception": false,
     "start_time": "2024-04-07T13:34:49.285443",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3-1 行の抽出"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "0e6e0ff3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:49.386945Z",
     "iopub.status.busy": "2024-04-07T13:34:49.385222Z",
     "iopub.status.idle": "2024-04-07T13:34:49.586569Z",
     "shell.execute_reply": "2024-04-07T13:34:49.584721Z"
    },
    "papermill": {
     "duration": 0.238347,
     "end_time": "2024-04-07T13:34:49.589237",
     "exception": false,
     "start_time": "2024-04-07T13:34:49.350890",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 5 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa\\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa\\\\\n",
       "\t 4.7 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t 4.6 & 3.1 & 1.5 & 0.2 & setosa\\\\\n",
       "\t 5.0 & 3.6 & 1.4 & 0.2 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 5 × 5\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa |\n",
       "| 4.7 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 4.6 | 3.1 | 1.5 | 0.2 | setosa |\n",
       "| 5.0 | 3.6 | 1.4 | 0.2 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species\n",
       "1 5.1          3.5         1.4          0.2         setosa \n",
       "2 4.9          3.0         1.4          0.2         setosa \n",
       "3 4.7          3.2         1.3          0.2         setosa \n",
       "4 4.6          3.1         1.5          0.2         setosa \n",
       "5 5.0          3.6         1.4          0.2         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 5 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 5 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa\\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa\\\\\n",
       "\t 4.7 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\t 4.6 & 3.1 & 1.5 & 0.2 & setosa\\\\\n",
       "\t 5.0 & 3.6 & 1.4 & 0.2 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 5 × 5\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa |\n",
       "| 4.7 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "| 4.6 | 3.1 | 1.5 | 0.2 | setosa |\n",
       "| 5.0 | 3.6 | 1.4 | 0.2 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species\n",
       "1 5.1          3.5         1.4          0.2         setosa \n",
       "2 4.9          3.0         1.4          0.2         setosa \n",
       "3 4.7          3.2         1.3          0.2         setosa \n",
       "4 4.6          3.1         1.5          0.2         setosa \n",
       "5 5.0          3.6         1.4          0.2         setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(data.table)\n",
    "iris_dt <- as.data.table(iris)\n",
    "iris_dt[Species == 'setosa'] %>% head(n=5)\n",
    "iris_dt %>% filter(Species == 'setosa') %>% head(n=5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "09126290",
   "metadata": {
    "papermill": {
     "duration": 0.033446,
     "end_time": "2024-04-07T13:34:49.658973",
     "exception": false,
     "start_time": "2024-04-07T13:34:49.625527",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3-2 列の抽出"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "0f4153a5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:49.729808Z",
     "iopub.status.busy": "2024-04-07T13:34:49.728139Z",
     "iopub.status.idle": "2024-04-07T13:34:49.774957Z",
     "shell.execute_reply": "2024-04-07T13:34:49.772987Z"
    },
    "papermill": {
     "duration": 0.084212,
     "end_time": "2024-04-07T13:34:49.777517",
     "exception": false,
     "start_time": "2024-04-07T13:34:49.693305",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 5 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.9</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.7</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.6</td><td>setosa</td></tr>\n",
       "\t<tr><td>5.0</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 5 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Sepal.Length & Species\\\\\n",
       " <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t 5.1 & setosa\\\\\n",
       "\t 4.9 & setosa\\\\\n",
       "\t 4.7 & setosa\\\\\n",
       "\t 4.6 & setosa\\\\\n",
       "\t 5.0 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 5 × 2\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|\n",
       "| 5.1 | setosa |\n",
       "| 4.9 | setosa |\n",
       "| 4.7 | setosa |\n",
       "| 4.6 | setosa |\n",
       "| 5.0 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Species\n",
       "1 5.1          setosa \n",
       "2 4.9          setosa \n",
       "3 4.7          setosa \n",
       "4 4.6          setosa \n",
       "5 5.0          setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 5 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.9</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.7</td><td>setosa</td></tr>\n",
       "\t<tr><td>4.6</td><td>setosa</td></tr>\n",
       "\t<tr><td>5.0</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 5 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Sepal.Length & Species\\\\\n",
       " <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t 5.1 & setosa\\\\\n",
       "\t 4.9 & setosa\\\\\n",
       "\t 4.7 & setosa\\\\\n",
       "\t 4.6 & setosa\\\\\n",
       "\t 5.0 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 5 × 2\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|\n",
       "| 5.1 | setosa |\n",
       "| 4.9 | setosa |\n",
       "| 4.7 | setosa |\n",
       "| 4.6 | setosa |\n",
       "| 5.0 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Species\n",
       "1 5.1          setosa \n",
       "2 4.9          setosa \n",
       "3 4.7          setosa \n",
       "4 4.6          setosa \n",
       "5 5.0          setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "iris_dt[, list(Sepal.Length, Species)] %>% head(5)\n",
    "iris_dt %>% select(Sepal.Length, Species) %>% head(n=5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b1077a1c",
   "metadata": {
    "papermill": {
     "duration": 0.033174,
     "end_time": "2024-04-07T13:34:49.843732",
     "exception": false,
     "start_time": "2024-04-07T13:34:49.810558",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3-3 列の作成"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "84a390a3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:49.914580Z",
     "iopub.status.busy": "2024-04-07T13:34:49.912801Z",
     "iopub.status.idle": "2024-04-07T13:34:49.960393Z",
     "shell.execute_reply": "2024-04-07T13:34:49.958429Z"
    },
    "papermill": {
     "duration": 0.086595,
     "end_time": "2024-04-07T13:34:49.963130",
     "exception": false,
     "start_time": "2024-04-07T13:34:49.876535",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "\t<tr><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa & 7.9\\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa & 7.9\\\\\n",
       "\t 4.7 & 3.2 & 1.3 & 0.2 & setosa & 7.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 6\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa | 7.9 |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa | 7.9 |\n",
       "| 4.7 | 3.2 | 1.3 | 0.2 | setosa | 7.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Length_max\n",
       "1 5.1          3.5         1.4          0.2         setosa  7.9             \n",
       "2 4.9          3.0         1.4          0.2         setosa  7.9             \n",
       "3 4.7          3.2         1.3          0.2         setosa  7.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "\t<tr><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td><td>7.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa & 7.9\\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa & 7.9\\\\\n",
       "\t 4.7 & 3.2 & 1.3 & 0.2 & setosa & 7.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 6\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa | 7.9 |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa | 7.9 |\n",
       "| 4.7 | 3.2 | 1.3 | 0.2 | setosa | 7.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Length_max\n",
       "1 5.1          3.5         1.4          0.2         setosa  7.9             \n",
       "2 4.9          3.0         1.4          0.2         setosa  7.9             \n",
       "3 4.7          3.2         1.3          0.2         setosa  7.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "iris_dt[, Sepal.Length_max := max(Sepal.Length)] %>% head(3)\n",
    "iris_dt %>% mutate(Sepal.Length_max = max(Sepal.Length)) %>% head(3)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4281b3af",
   "metadata": {
    "papermill": {
     "duration": 0.033421,
     "end_time": "2024-04-07T13:34:50.031213",
     "exception": false,
     "start_time": "2024-04-07T13:34:49.997792",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3-4 並び替え"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "e92660ab",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:50.105863Z",
     "iopub.status.busy": "2024-04-07T13:34:50.104112Z",
     "iopub.status.idle": "2024-04-07T13:34:50.151876Z",
     "shell.execute_reply": "2024-04-07T13:34:50.149698Z"
    },
    "papermill": {
     "duration": 0.087984,
     "end_time": "2024-04-07T13:34:50.155100",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.067116",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 5 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.0</td><td>2.0</td><td>3.5</td><td>1.0</td><td>versicolor</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.0</td><td>2.2</td><td>4.0</td><td>1.0</td><td>versicolor</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.2</td><td>2.2</td><td>4.5</td><td>1.5</td><td>versicolor</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.0</td><td>2.2</td><td>5.0</td><td>1.5</td><td>virginica </td><td>7.9</td></tr>\n",
       "\t<tr><td>4.5</td><td>2.3</td><td>1.3</td><td>0.3</td><td>setosa    </td><td>7.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 5 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 5.0 & 2.0 & 3.5 & 1.0 & versicolor & 7.9\\\\\n",
       "\t 6.0 & 2.2 & 4.0 & 1.0 & versicolor & 7.9\\\\\n",
       "\t 6.2 & 2.2 & 4.5 & 1.5 & versicolor & 7.9\\\\\n",
       "\t 6.0 & 2.2 & 5.0 & 1.5 & virginica  & 7.9\\\\\n",
       "\t 4.5 & 2.3 & 1.3 & 0.3 & setosa     & 7.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 5 × 6\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 5.0 | 2.0 | 3.5 | 1.0 | versicolor | 7.9 |\n",
       "| 6.0 | 2.2 | 4.0 | 1.0 | versicolor | 7.9 |\n",
       "| 6.2 | 2.2 | 4.5 | 1.5 | versicolor | 7.9 |\n",
       "| 6.0 | 2.2 | 5.0 | 1.5 | virginica  | 7.9 |\n",
       "| 4.5 | 2.3 | 1.3 | 0.3 | setosa     | 7.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species    Sepal.Length_max\n",
       "1 5.0          2.0         3.5          1.0         versicolor 7.9             \n",
       "2 6.0          2.2         4.0          1.0         versicolor 7.9             \n",
       "3 6.2          2.2         4.5          1.5         versicolor 7.9             \n",
       "4 6.0          2.2         5.0          1.5         virginica  7.9             \n",
       "5 4.5          2.3         1.3          0.3         setosa     7.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 5 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.0</td><td>2.0</td><td>3.5</td><td>1.0</td><td>versicolor</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.0</td><td>2.2</td><td>4.0</td><td>1.0</td><td>versicolor</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.2</td><td>2.2</td><td>4.5</td><td>1.5</td><td>versicolor</td><td>7.9</td></tr>\n",
       "\t<tr><td>6.0</td><td>2.2</td><td>5.0</td><td>1.5</td><td>virginica </td><td>7.9</td></tr>\n",
       "\t<tr><td>4.5</td><td>2.3</td><td>1.3</td><td>0.3</td><td>setosa    </td><td>7.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 5 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 5.0 & 2.0 & 3.5 & 1.0 & versicolor & 7.9\\\\\n",
       "\t 6.0 & 2.2 & 4.0 & 1.0 & versicolor & 7.9\\\\\n",
       "\t 6.2 & 2.2 & 4.5 & 1.5 & versicolor & 7.9\\\\\n",
       "\t 6.0 & 2.2 & 5.0 & 1.5 & virginica  & 7.9\\\\\n",
       "\t 4.5 & 2.3 & 1.3 & 0.3 & setosa     & 7.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 5 × 6\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 5.0 | 2.0 | 3.5 | 1.0 | versicolor | 7.9 |\n",
       "| 6.0 | 2.2 | 4.0 | 1.0 | versicolor | 7.9 |\n",
       "| 6.2 | 2.2 | 4.5 | 1.5 | versicolor | 7.9 |\n",
       "| 6.0 | 2.2 | 5.0 | 1.5 | virginica  | 7.9 |\n",
       "| 4.5 | 2.3 | 1.3 | 0.3 | setosa     | 7.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species    Sepal.Length_max\n",
       "1 5.0          2.0         3.5          1.0         versicolor 7.9             \n",
       "2 6.0          2.2         4.0          1.0         versicolor 7.9             \n",
       "3 6.2          2.2         4.5          1.5         versicolor 7.9             \n",
       "4 6.0          2.2         5.0          1.5         virginica  7.9             \n",
       "5 4.5          2.3         1.3          0.3         setosa     7.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "setorder(iris_dt, Sepal.Width) %>% head(5)\n",
    "iris_dt %>% setorder(Sepal.Width) %>% head(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "42f86bcc",
   "metadata": {
    "papermill": {
     "duration": 0.03433,
     "end_time": "2024-04-07T13:34:50.225555",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.191225",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3-5 列名の変更"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "dd55271b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:50.298285Z",
     "iopub.status.busy": "2024-04-07T13:34:50.296393Z",
     "iopub.status.idle": "2024-04-07T13:34:50.345966Z",
     "shell.execute_reply": "2024-04-07T13:34:50.343869Z"
    },
    "papermill": {
     "duration": 0.08921,
     "end_time": "2024-04-07T13:34:50.348734",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.259524",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>PL</th><th scope=col>PW</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & PL & PW & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & 3.5 & 1.4 & 0.2 & setosa\\\\\n",
       "\t2 & 4.9 & 3.0 & 1.4 & 0.2 & setosa\\\\\n",
       "\t3 & 4.7 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | PL &lt;dbl&gt; | PW &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 5.1 | 3.5 | 1.4 | 0.2 | setosa |\n",
       "| 2 | 4.9 | 3.0 | 1.4 | 0.2 | setosa |\n",
       "| 3 | 4.7 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width PL  PW  Species\n",
       "1 5.1          3.5         1.4 0.2 setosa \n",
       "2 4.9          3.0         1.4 0.2 setosa \n",
       "3 4.7          3.2         1.3 0.2 setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>PL</th><th scope=col>PW</th><th scope=col>Species</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Sepal.Length & Sepal.Width & PL & PW & Species\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 5.1 & 3.5 & 1.4 & 0.2 & setosa\\\\\n",
       "\t2 & 4.9 & 3.0 & 1.4 & 0.2 & setosa\\\\\n",
       "\t3 & 4.7 & 3.2 & 1.3 & 0.2 & setosa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 5\n",
       "\n",
       "| <!--/--> | Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | PL &lt;dbl&gt; | PW &lt;dbl&gt; | Species &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 5.1 | 3.5 | 1.4 | 0.2 | setosa |\n",
       "| 2 | 4.9 | 3.0 | 1.4 | 0.2 | setosa |\n",
       "| 3 | 4.7 | 3.2 | 1.3 | 0.2 | setosa |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width PL  PW  Species\n",
       "1 5.1          3.5         1.4 0.2 setosa \n",
       "2 4.9          3.0         1.4 0.2 setosa \n",
       "3 4.7          3.2         1.3 0.2 setosa "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "iris_dt <- data.frame(iris)\n",
    "setnames(iris_dt, c('Petal.Length', 'Petal.Width'), c('PL', 'PW')) %>% head(3)\n",
    "\n",
    "iris_dt <- data.frame(iris)\n",
    "iris_dt %>% rename(PL = Petal.Length, PW = Petal.Width) %>% head(3)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f3f7050b",
   "metadata": {
    "papermill": {
     "duration": 0.035472,
     "end_time": "2024-04-07T13:34:50.418710",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.383238",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3-6 データの結合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "id": "4ee3f5b9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:50.497442Z",
     "iopub.status.busy": "2024-04-07T13:34:50.495634Z",
     "iopub.status.idle": "2024-04-07T13:34:50.551221Z",
     "shell.execute_reply": "2024-04-07T13:34:50.548604Z"
    },
    "papermill": {
     "duration": 0.098632,
     "end_time": "2024-04-07T13:34:50.554496",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.455864",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>value1</th><th scope=col>id</th><th scope=col>value2</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>A</td><td>1</td><td>A</td><td>4</td></tr>\n",
       "\t<tr><td>B</td><td>2</td><td>B</td><td>5</td></tr>\n",
       "\t<tr><td>C</td><td>3</td><td>D</td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 4\n",
       "\\begin{tabular}{llll}\n",
       " id & value1 & id & value2\\\\\n",
       " <chr> & <int> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t A & 1 & A & 4\\\\\n",
       "\t B & 2 & B & 5\\\\\n",
       "\t C & 3 & D & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 4\n",
       "\n",
       "| id &lt;chr&gt; | value1 &lt;int&gt; | id &lt;chr&gt; | value2 &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| A | 1 | A | 4 |\n",
       "| B | 2 | B | 5 |\n",
       "| C | 3 | D | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "  id value1 id value2\n",
       "1 A  1      A  4     \n",
       "2 B  2      B  5     \n",
       "3 C  3      D  6     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>value1</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>A</td><td>1</td></tr>\n",
       "\t<tr><td>B</td><td>2</td></tr>\n",
       "\t<tr><td>C</td><td>3</td></tr>\n",
       "\t<tr><td>D</td><td>4</td></tr>\n",
       "\t<tr><td>E</td><td>5</td></tr>\n",
       "\t<tr><td>F</td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 6 × 2\n",
       "\\begin{tabular}{ll}\n",
       " id & value1\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t A & 1\\\\\n",
       "\t B & 2\\\\\n",
       "\t C & 3\\\\\n",
       "\t D & 4\\\\\n",
       "\t E & 5\\\\\n",
       "\t F & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 6 × 2\n",
       "\n",
       "| id &lt;chr&gt; | value1 &lt;int&gt; |\n",
       "|---|---|\n",
       "| A | 1 |\n",
       "| B | 2 |\n",
       "| C | 3 |\n",
       "| D | 4 |\n",
       "| E | 5 |\n",
       "| F | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "  id value1\n",
       "1 A  1     \n",
       "2 B  2     \n",
       "3 C  3     \n",
       "4 D  4     \n",
       "5 E  5     \n",
       "6 F  6     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "A <- data.table(id=c('A', 'B', 'C'), value1=1:3)\n",
    "B <- data.table(id=c('A', 'B', 'D'), value2=4:6)\n",
    "C <- data.table(id=c('D', 'E', 'F'), value1=4:6)\n",
    "# 列方向の結合\n",
    "cbind(A, B)\n",
    "\n",
    "# 行方向の結合\n",
    "rbind(A, C)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "id": "94e36fea",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:50.630300Z",
     "iopub.status.busy": "2024-04-07T13:34:50.628545Z",
     "iopub.status.idle": "2024-04-07T13:34:50.685848Z",
     "shell.execute_reply": "2024-04-07T13:34:50.682333Z"
    },
    "papermill": {
     "duration": 0.098765,
     "end_time": "2024-04-07T13:34:50.689207",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.590442",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>value1</th><th scope=col>value2</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>A</td><td>1</td><td>4</td></tr>\n",
       "\t<tr><td>B</td><td>2</td><td>5</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " id & value1 & value2\\\\\n",
       " <chr> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t A & 1 & 4\\\\\n",
       "\t B & 2 & 5\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 2 × 3\n",
       "\n",
       "| id &lt;chr&gt; | value1 &lt;int&gt; | value2 &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| A | 1 | 4 |\n",
       "| B | 2 | 5 |\n",
       "\n"
      ],
      "text/plain": [
       "  id value1 value2\n",
       "1 A  1      4     \n",
       "2 B  2      5     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 結合キーを用いたデータの結合\n",
    "merge(A, B, by='id') # 内部結合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "id": "e6c82dbd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:50.764807Z",
     "iopub.status.busy": "2024-04-07T13:34:50.763009Z",
     "iopub.status.idle": "2024-04-07T13:34:50.794013Z",
     "shell.execute_reply": "2024-04-07T13:34:50.791171Z"
    },
    "papermill": {
     "duration": 0.072045,
     "end_time": "2024-04-07T13:34:50.797204",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.725159",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>value1</th><th scope=col>value2</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>A</td><td>1</td><td> 4</td></tr>\n",
       "\t<tr><td>B</td><td>2</td><td> 5</td></tr>\n",
       "\t<tr><td>C</td><td>3</td><td>NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 3\n",
       "\\begin{tabular}{lll}\n",
       " id & value1 & value2\\\\\n",
       " <chr> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t A & 1 &  4\\\\\n",
       "\t B & 2 &  5\\\\\n",
       "\t C & 3 & NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 3\n",
       "\n",
       "| id &lt;chr&gt; | value1 &lt;int&gt; | value2 &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| A | 1 |  4 |\n",
       "| B | 2 |  5 |\n",
       "| C | 3 | NA |\n",
       "\n"
      ],
      "text/plain": [
       "  id value1 value2\n",
       "1 A  1       4    \n",
       "2 B  2       5    \n",
       "3 C  3      NA    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 結合キーを用いたデータの結合\n",
    "merge(A, B, by='id', all.x=TRUE) # 左外部結合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "id": "0a1f52b3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:50.875050Z",
     "iopub.status.busy": "2024-04-07T13:34:50.873168Z",
     "iopub.status.idle": "2024-04-07T13:34:50.905173Z",
     "shell.execute_reply": "2024-04-07T13:34:50.902659Z"
    },
    "papermill": {
     "duration": 0.074483,
     "end_time": "2024-04-07T13:34:50.907805",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.833322",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>value1</th><th scope=col>value2</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>A</td><td> 1</td><td>4</td></tr>\n",
       "\t<tr><td>B</td><td> 2</td><td>5</td></tr>\n",
       "\t<tr><td>D</td><td>NA</td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 3\n",
       "\\begin{tabular}{lll}\n",
       " id & value1 & value2\\\\\n",
       " <chr> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t A &  1 & 4\\\\\n",
       "\t B &  2 & 5\\\\\n",
       "\t D & NA & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 3\n",
       "\n",
       "| id &lt;chr&gt; | value1 &lt;int&gt; | value2 &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| A |  1 | 4 |\n",
       "| B |  2 | 5 |\n",
       "| D | NA | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "  id value1 value2\n",
       "1 A   1     4     \n",
       "2 B   2     5     \n",
       "3 D  NA     6     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 結合キーを用いたデータの結合\n",
    "merge(A, B, by='id', all.y=TRUE) # 右外部結合"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 43,
   "id": "5e08e6bd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:50.985091Z",
     "iopub.status.busy": "2024-04-07T13:34:50.983394Z",
     "iopub.status.idle": "2024-04-07T13:34:51.016341Z",
     "shell.execute_reply": "2024-04-07T13:34:51.013764Z"
    },
    "papermill": {
     "duration": 0.075802,
     "end_time": "2024-04-07T13:34:51.019826",
     "exception": false,
     "start_time": "2024-04-07T13:34:50.944024",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 4 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>value1</th><th scope=col>value2</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>A</td><td> 1</td><td> 4</td></tr>\n",
       "\t<tr><td>B</td><td> 2</td><td> 5</td></tr>\n",
       "\t<tr><td>C</td><td> 3</td><td>NA</td></tr>\n",
       "\t<tr><td>D</td><td>NA</td><td> 6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 4 × 3\n",
       "\\begin{tabular}{lll}\n",
       " id & value1 & value2\\\\\n",
       " <chr> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t A &  1 &  4\\\\\n",
       "\t B &  2 &  5\\\\\n",
       "\t C &  3 & NA\\\\\n",
       "\t D & NA &  6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 4 × 3\n",
       "\n",
       "| id &lt;chr&gt; | value1 &lt;int&gt; | value2 &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| A |  1 |  4 |\n",
       "| B |  2 |  5 |\n",
       "| C |  3 | NA |\n",
       "| D | NA |  6 |\n",
       "\n"
      ],
      "text/plain": [
       "  id value1 value2\n",
       "1 A   1      4    \n",
       "2 B   2      5    \n",
       "3 C   3     NA    \n",
       "4 D  NA      6    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 結合キーを用いたデータの結合\n",
    "merge(A, B, by='id', all=TRUE) # 完全外部結合"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "10ba140a",
   "metadata": {
    "papermill": {
     "duration": 0.037634,
     "end_time": "2024-04-07T13:34:51.095372",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.057738",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3-7  グループ単位の操作・集計"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 44,
   "id": "a5b3b721",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:51.172874Z",
     "iopub.status.busy": "2024-04-07T13:34:51.171087Z",
     "iopub.status.idle": "2024-04-07T13:34:51.192855Z",
     "shell.execute_reply": "2024-04-07T13:34:51.190198Z"
    },
    "papermill": {
     "duration": 0.063945,
     "end_time": "2024-04-07T13:34:51.196135",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.132190",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Sepal.Length'</li><li>'Sepal.Width'</li><li>'Petal.Length'</li><li>'Petal.Width'</li><li>'Species'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Sepal.Length'\n",
       "\\item 'Sepal.Width'\n",
       "\\item 'Petal.Length'\n",
       "\\item 'Petal.Width'\n",
       "\\item 'Species'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Sepal.Length'\n",
       "2. 'Sepal.Width'\n",
       "3. 'Petal.Length'\n",
       "4. 'Petal.Width'\n",
       "5. 'Species'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Sepal.Length\" \"Sepal.Width\"  \"Petal.Length\" \"Petal.Width\"  \"Species\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(iris_dt)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 45,
   "id": "e0bfdf29",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:51.276273Z",
     "iopub.status.busy": "2024-04-07T13:34:51.274552Z",
     "iopub.status.idle": "2024-04-07T13:34:51.346376Z",
     "shell.execute_reply": "2024-04-07T13:34:51.344393Z"
    },
    "papermill": {
     "duration": 0.114537,
     "end_time": "2024-04-07T13:34:51.348981",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.234444",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Sepal.Length</th><th scope=col>Sepal.Width</th><th scope=col>Petal.Length</th><th scope=col>Petal.Width</th><th scope=col>Species</th><th scope=col>Sepal.Length_max</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td></tr>\n",
       "\t<tr><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td><td>5.8</td></tr>\n",
       "\t<tr><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td><td>5.8</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species & Sepal.Length\\_max\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 5.1 & 3.5 & 1.4 & 0.2 & setosa & 5.8\\\\\n",
       "\t 4.9 & 3.0 & 1.4 & 0.2 & setosa & 5.8\\\\\n",
       "\t 4.7 & 3.2 & 1.3 & 0.2 & setosa & 5.8\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 6\n",
       "\n",
       "| Sepal.Length &lt;dbl&gt; | Sepal.Width &lt;dbl&gt; | Petal.Length &lt;dbl&gt; | Petal.Width &lt;dbl&gt; | Species &lt;fct&gt; | Sepal.Length_max &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 5.1 | 3.5 | 1.4 | 0.2 | setosa | 5.8 |\n",
       "| 4.9 | 3.0 | 1.4 | 0.2 | setosa | 5.8 |\n",
       "| 4.7 | 3.2 | 1.3 | 0.2 | setosa | 5.8 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Length_max\n",
       "1 5.1          3.5         1.4          0.2         setosa  5.8             \n",
       "2 4.9          3.0         1.4          0.2         setosa  5.8             \n",
       "3 4.7          3.2         1.3          0.2         setosa  5.8             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Species</th><th scope=col>V1</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>setosa    </td><td>4.3</td></tr>\n",
       "\t<tr><td>versicolor</td><td>4.9</td></tr>\n",
       "\t<tr><td>virginica </td><td>4.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Species & V1\\\\\n",
       " <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t setosa     & 4.3\\\\\n",
       "\t versicolor & 4.9\\\\\n",
       "\t virginica  & 4.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 2\n",
       "\n",
       "| Species &lt;fct&gt; | V1 &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| setosa     | 4.3 |\n",
       "| versicolor | 4.9 |\n",
       "| virginica  | 4.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Species    V1 \n",
       "1 setosa     4.3\n",
       "2 versicolor 4.9\n",
       "3 virginica  4.9"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Species</th><th scope=col>Sepal.Length_min</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>setosa    </td><td>4.3</td></tr>\n",
       "\t<tr><td>versicolor</td><td>4.9</td></tr>\n",
       "\t<tr><td>virginica </td><td>4.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Species & Sepal.Length\\_min\\\\\n",
       " <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t setosa     & 4.3\\\\\n",
       "\t versicolor & 4.9\\\\\n",
       "\t virginica  & 4.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 2\n",
       "\n",
       "| Species &lt;fct&gt; | Sepal.Length_min &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| setosa     | 4.3 |\n",
       "| versicolor | 4.9 |\n",
       "| virginica  | 4.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Species    Sepal.Length_min\n",
       "1 setosa     4.3             \n",
       "2 versicolor 4.9             \n",
       "3 virginica  4.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.table: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Species</th><th scope=col>Sepal.Length_min</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>setosa    </td><td>4.3</td></tr>\n",
       "\t<tr><td>versicolor</td><td>4.9</td></tr>\n",
       "\t<tr><td>virginica </td><td>4.9</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.table: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Species & Sepal.Length\\_min\\\\\n",
       " <fct> & <dbl>\\\\\n",
       "\\hline\n",
       "\t setosa     & 4.3\\\\\n",
       "\t versicolor & 4.9\\\\\n",
       "\t virginica  & 4.9\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.table: 3 × 2\n",
       "\n",
       "| Species &lt;fct&gt; | Sepal.Length_min &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| setosa     | 4.3 |\n",
       "| versicolor | 4.9 |\n",
       "| virginica  | 4.9 |\n",
       "\n"
      ],
      "text/plain": [
       "  Species    Sepal.Length_min\n",
       "1 setosa     4.3             \n",
       "2 versicolor 4.9             \n",
       "3 virginica  4.9             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "iris_dt <- data.table(iris)\n",
    "iris_dt[, Sepal.Length_max := max(Sepal.Length), by = Species] %>% head(3)\n",
    "\n",
    "\n",
    "# 集計：指定したグループ単位（Species）で最小のSepal.Lengthを集計\n",
    "iris_dt[, min(Sepal.Length), by=Species]\n",
    "# 列名を指定する時はlistを併用\n",
    "iris_dt[, list(Sepal.Length_min = min(Sepal.Length)), by=Species]\n",
    "# .記法を用いることもできる\n",
    "iris_dt[, .(Sepal.Length_min = min(Sepal.Length)), by=Species]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f2dd372b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-05T14:58:07.410766Z",
     "iopub.status.busy": "2024-04-05T14:58:07.408973Z",
     "iopub.status.idle": "2024-04-05T14:58:07.511359Z"
    },
    "papermill": {
     "duration": 0.038869,
     "end_time": "2024-04-07T13:34:51.425417",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.386548",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-3-8 データの縦横変換"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 46,
   "id": "db83d80c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:51.506725Z",
     "iopub.status.busy": "2024-04-07T13:34:51.504920Z",
     "iopub.status.idle": "2024-04-07T13:34:51.581676Z",
     "shell.execute_reply": "2024-04-07T13:34:51.579649Z"
    },
    "papermill": {
     "duration": 0.120216,
     "end_time": "2024-04-07T13:34:51.584502",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.464286",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# wide形式のデータを用意\n",
    "stocks_dt <- data.table(\n",
    "    time = as.Date('2009-01-01') + 0:1,\n",
    "    X = rnorm(2, 0, 1),\n",
    "    Y = rnorm(2, 0, 2),\n",
    "    Z = rnorm(2, 0, 4)\n",
    "    )\n",
    "\n",
    "# wide形式からlong形式に変換\n",
    "# 対象データ、key、value、返還の対象とする列の順に指定\n",
    "# マイナスを付与した場合その列以外のすべて\n",
    "strocks_long <- melt(stocks_dt, 'time')\n",
    "\n",
    "# long形式からwide形式に変換\n",
    "# 対象データ、key、valueの順に指定\n",
    "stocks_wide <- reshape2::dcast(stocks_long, time~variable)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d9e3c340",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-05T15:42:15.161366Z",
     "iopub.status.busy": "2024-04-05T15:42:15.159396Z",
     "iopub.status.idle": "2024-04-05T15:42:15.190696Z"
    },
    "papermill": {
     "duration": 0.038676,
     "end_time": "2024-04-07T13:34:51.662209",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.623533",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 8-4 そのほかのデータハンドリングに必要な操作"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9957c360",
   "metadata": {
    "papermill": {
     "duration": 0.037784,
     "end_time": "2024-04-07T13:34:51.737995",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.700211",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-4-1 列の分割・合成"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 47,
   "id": "38685997",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:51.817845Z",
     "iopub.status.busy": "2024-04-07T13:34:51.815880Z",
     "iopub.status.idle": "2024-04-07T13:34:51.893587Z",
     "shell.execute_reply": "2024-04-07T13:34:51.891485Z"
    },
    "papermill": {
     "duration": 0.121186,
     "end_time": "2024-04-07T13:34:51.896895",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.775709",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(tidyr)\n",
    "# サンプルデータ\n",
    "df <- data.frame(x = c('a_b', 'a_d', 'b_c'))\n",
    "# 対象データ、分割したい列名、分割先の列名、分割する際の区切り文字の順に指定\n",
    "df_sep <- separate(df, x, c('A', 'B'), sep='_')\n",
    "# 対照データ、合成先の列名、合成したい列名、合成する際の区切り文字の順に指定\n",
    "df_uni <- unite(df_sep, x, A, B, sep='_')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 48,
   "id": "9d0038cd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:51.977910Z",
     "iopub.status.busy": "2024-04-07T13:34:51.975987Z",
     "iopub.status.idle": "2024-04-07T13:34:52.001961Z",
     "shell.execute_reply": "2024-04-07T13:34:51.999348Z"
    },
    "papermill": {
     "duration": 0.07036,
     "end_time": "2024-04-07T13:34:52.005243",
     "exception": false,
     "start_time": "2024-04-07T13:34:51.934883",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>x</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>a_b</td></tr>\n",
       "\t<tr><td>a_d</td></tr>\n",
       "\t<tr><td>b_c</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 1\n",
       "\\begin{tabular}{l}\n",
       " x\\\\\n",
       " <chr>\\\\\n",
       "\\hline\n",
       "\t a\\_b\\\\\n",
       "\t a\\_d\\\\\n",
       "\t b\\_c\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 1\n",
       "\n",
       "| x &lt;chr&gt; |\n",
       "|---|\n",
       "| a_b |\n",
       "| a_d |\n",
       "| b_c |\n",
       "\n"
      ],
      "text/plain": [
       "  x  \n",
       "1 a_b\n",
       "2 a_d\n",
       "3 b_c"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 49,
   "id": "610103a2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:52.087653Z",
     "iopub.status.busy": "2024-04-07T13:34:52.085671Z",
     "iopub.status.idle": "2024-04-07T13:34:52.112856Z",
     "shell.execute_reply": "2024-04-07T13:34:52.110138Z"
    },
    "papermill": {
     "duration": 0.073091,
     "end_time": "2024-04-07T13:34:52.116165",
     "exception": false,
     "start_time": "2024-04-07T13:34:52.043074",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>A</th><th scope=col>B</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>a</td><td>b</td></tr>\n",
       "\t<tr><td>a</td><td>d</td></tr>\n",
       "\t<tr><td>b</td><td>c</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " A & B\\\\\n",
       " <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t a & b\\\\\n",
       "\t a & d\\\\\n",
       "\t b & c\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 2\n",
       "\n",
       "| A &lt;chr&gt; | B &lt;chr&gt; |\n",
       "|---|---|\n",
       "| a | b |\n",
       "| a | d |\n",
       "| b | c |\n",
       "\n"
      ],
      "text/plain": [
       "  A B\n",
       "1 a b\n",
       "2 a d\n",
       "3 b c"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df_sep"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 50,
   "id": "78d10566",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:52.198712Z",
     "iopub.status.busy": "2024-04-07T13:34:52.196778Z",
     "iopub.status.idle": "2024-04-07T13:34:52.223165Z",
     "shell.execute_reply": "2024-04-07T13:34:52.220529Z"
    },
    "papermill": {
     "duration": 0.070885,
     "end_time": "2024-04-07T13:34:52.226476",
     "exception": false,
     "start_time": "2024-04-07T13:34:52.155591",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>x</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>a_b</td></tr>\n",
       "\t<tr><td>a_d</td></tr>\n",
       "\t<tr><td>b_c</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 1\n",
       "\\begin{tabular}{l}\n",
       " x\\\\\n",
       " <chr>\\\\\n",
       "\\hline\n",
       "\t a\\_b\\\\\n",
       "\t a\\_d\\\\\n",
       "\t b\\_c\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 1\n",
       "\n",
       "| x &lt;chr&gt; |\n",
       "|---|\n",
       "| a_b |\n",
       "| a_d |\n",
       "| b_c |\n",
       "\n"
      ],
      "text/plain": [
       "  x  \n",
       "1 a_b\n",
       "2 a_d\n",
       "3 b_c"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df_uni"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8b00976e",
   "metadata": {
    "papermill": {
     "duration": 0.038663,
     "end_time": "2024-04-07T13:34:52.303731",
     "exception": false,
     "start_time": "2024-04-07T13:34:52.265068",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 8-4-2 文字列処理"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 51,
   "id": "e2d44ecc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:34:52.384791Z",
     "iopub.status.busy": "2024-04-07T13:34:52.382802Z",
     "iopub.status.idle": "2024-04-07T13:35:03.733971Z",
     "shell.execute_reply": "2024-04-07T13:35:03.732054Z"
    },
    "papermill": {
     "duration": 11.395806,
     "end_time": "2024-04-07T13:35:03.737867",
     "exception": false,
     "start_time": "2024-04-07T13:34:52.342061",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'AB'"
      ],
      "text/latex": [
       "'AB'"
      ],
      "text/markdown": [
       "'AB'"
      ],
      "text/plain": [
       "[1] \"AB\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "'1'"
      ],
      "text/latex": [
       "'1'"
      ],
      "text/markdown": [
       "'1'"
      ],
      "text/plain": [
       "[1] \"1\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>TRUE</li><li>FALSE</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item TRUE\n",
       "\\item FALSE\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. TRUE\n",
       "2. FALSE\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1]  TRUE FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# stringrパッケージのインストール\n",
    "install.packages('stringr', quiet = TRUE)\n",
    "\n",
    "library(stringr)\n",
    "\n",
    "# 文字列の結合\n",
    "str_c('A', 'B') # stringr\n",
    "\n",
    "# 文字列の検索\n",
    "# パターンと一致する文字列を返したい場合\n",
    "str_subset(c('1', 'B'), '[0-9]')\n",
    "# TRUE/FALSEで文字列の位置を返したい場合\n",
    "str_detect(c('1', 'B'), '[0-9]')\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 52,
   "id": "8cc3e5c0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:35:03.821074Z",
     "iopub.status.busy": "2024-04-07T13:35:03.819338Z",
     "iopub.status.idle": "2024-04-07T13:35:03.873533Z",
     "shell.execute_reply": "2024-04-07T13:35:03.871643Z"
    },
    "papermill": {
     "duration": 0.099188,
     "end_time": "2024-04-07T13:35:03.876466",
     "exception": false,
     "start_time": "2024-04-07T13:35:03.777278",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'H3A2c'</li><li>'3hoge2'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'H3A2c'\n",
       "\\item '3hoge2'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'H3A2c'\n",
       "2. '3hoge2'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"H3A2c\"  \"3hoge2\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'H3A3c'</li><li>'3hoge3'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'H3A3c'\n",
       "\\item '3hoge3'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'H3A3c'\n",
       "2. '3hoge3'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"H3A3c\"  \"3hoge3\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 文字列の置換\n",
    "# 文字列ごとに最初に一致するパターンを置換\n",
    "str_replace(c('H1A2c', '1hoge2'), '[0-9]', '3')\n",
    "# 文字列ごとに一致する全てのパターンを置換\n",
    "str_replace_all(c('H1A2c', '1hoge2'), '[0-9]', '3')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 53,
   "id": "ff74a83b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-04-07T13:35:03.960533Z",
     "iopub.status.busy": "2024-04-07T13:35:03.958664Z",
     "iopub.status.idle": "2024-04-07T13:35:03.990529Z",
     "shell.execute_reply": "2024-04-07T13:35:03.988050Z"
    },
    "papermill": {
     "duration": 0.078068,
     "end_time": "2024-04-07T13:35:03.994237",
     "exception": false,
     "start_time": "2024-04-07T13:35:03.916169",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'1'</li><li>'1'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item '1'\n",
       "\\item '1'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. '1'\n",
       "2. '1'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"1\" \"1\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<ol>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'1'</li><li>'2'</li></ol>\n",
       "</li>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'1'</li><li>'2'</li></ol>\n",
       "</li>\n",
       "</ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate}\n",
       "\\item \\begin{enumerate*}\n",
       "\\item '1'\n",
       "\\item '2'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\item \\begin{enumerate*}\n",
       "\\item '1'\n",
       "\\item '2'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\end{enumerate}\n"
      ],
      "text/markdown": [
       "1. 1. '1'\n",
       "2. '2'\n",
       "\n",
       "\n",
       "\n",
       "2. 1. '1'\n",
       "2. '2'\n",
       "\n",
       "\n",
       "\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[[1]]\n",
       "[1] \"1\" \"2\"\n",
       "\n",
       "[[2]]\n",
       "[1] \"1\" \"2\"\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 文字の抽出\n",
    "# 文字列ごとに最初に一致するパターンのみ返す\n",
    "str_extract(c('H1A2c', '1hoge2'), '[0-9]')\n",
    "# 文字列ごとに一致するする全てのパターンを返す\n",
    "str_extract_all(c('H1A2c', '1hoge2'), '[0-9]')"
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
   "duration": 162.215895,
   "end_time": "2024-04-07T13:35:04.158503",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-04-07T13:32:21.942608",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
