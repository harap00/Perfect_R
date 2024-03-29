{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "39380d7e",
   "metadata": {
    "papermill": {
     "duration": 0.01647,
     "end_time": "2024-03-29T06:25:06.508370",
     "exception": false,
     "start_time": "2024-03-29T06:25:06.491900",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 第6章 関数"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5b835f0d",
   "metadata": {
    "papermill": {
     "duration": 0.014346,
     "end_time": "2024-03-29T06:25:06.538127",
     "exception": false,
     "start_time": "2024-03-29T06:25:06.523781",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 6-1評価環境"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c0383bca",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:06.571802Z",
     "iopub.status.busy": "2024-03-29T06:25:06.568740Z",
     "iopub.status.idle": "2024-03-29T06:25:06.725189Z",
     "shell.execute_reply": "2024-03-29T06:25:06.722562Z"
    },
    "papermill": {
     "duration": 0.176755,
     "end_time": "2024-03-29T06:25:06.729038",
     "exception": false,
     "start_time": "2024-03-29T06:25:06.552283",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# 関数の実行環境を出力する関数を定義する\n",
    "fun <- function(){\n",
    "    e <- environment()\n",
    "    print(e)\n",
    "    print(parent.env(e))\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "38ae8e27",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:06.802305Z",
     "iopub.status.busy": "2024-03-29T06:25:06.759927Z",
     "iopub.status.idle": "2024-03-29T06:25:06.819927Z",
     "shell.execute_reply": "2024-03-29T06:25:06.817552Z"
    },
    "papermill": {
     "duration": 0.079386,
     "end_time": "2024-03-29T06:25:06.822722",
     "exception": false,
     "start_time": "2024-03-29T06:25:06.743336",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x57e91d4a6930>\n",
      "<environment: R_GlobalEnv>\n"
     ]
    }
   ],
   "source": [
    "# 関数の評価環境を出力する\n",
    "fun()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "6feb2ef3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:06.856419Z",
     "iopub.status.busy": "2024-03-29T06:25:06.854484Z",
     "iopub.status.idle": "2024-03-29T06:25:06.881896Z",
     "shell.execute_reply": "2024-03-29T06:25:06.879603Z"
    },
    "papermill": {
     "duration": 0.047034,
     "end_time": "2024-03-29T06:25:06.884809",
     "exception": false,
     "start_time": "2024-03-29T06:25:06.837775",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x57e91bbdcd68>\n",
      "<environment: R_GlobalEnv>\n"
     ]
    }
   ],
   "source": [
    "# 関数の評価環境を調べる（直前の呼び出しと結果が変わる）\n",
    "fun()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8a7fa0fd",
   "metadata": {
    "papermill": {
     "duration": 0.014475,
     "end_time": "2024-03-29T06:25:06.913932",
     "exception": false,
     "start_time": "2024-03-29T06:25:06.899457",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-1-1 親環境"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "c6dca763",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:06.946967Z",
     "iopub.status.busy": "2024-03-29T06:25:06.944977Z",
     "iopub.status.idle": "2024-03-29T06:25:06.963752Z",
     "shell.execute_reply": "2024-03-29T06:25:06.961605Z"
    },
    "papermill": {
     "duration": 0.038339,
     "end_time": "2024-03-29T06:25:06.966662",
     "exception": false,
     "start_time": "2024-03-29T06:25:06.928323",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# 関数の親環境を変更する\n",
    "e <- new.env(parent = baseenv())\n",
    "environment(fun) <- e"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "1dc3d918",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.000739Z",
     "iopub.status.busy": "2024-03-29T06:25:06.998879Z",
     "iopub.status.idle": "2024-03-29T06:25:07.026961Z",
     "shell.execute_reply": "2024-03-29T06:25:07.024823Z"
    },
    "papermill": {
     "duration": 0.048245,
     "end_time": "2024-03-29T06:25:07.029652",
     "exception": false,
     "start_time": "2024-03-29T06:25:06.981407",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x57e91c8a3c30>\n",
      "<environment: 0x57e91d9918a0>\n",
      "<environment: 0x57e91c8a3c30>\n"
     ]
    }
   ],
   "source": [
    "# 関数の評価環境を調べる\n",
    "print(e)\n",
    "fun()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d501f9c2",
   "metadata": {
    "papermill": {
     "duration": 0.014689,
     "end_time": "2024-03-29T06:25:07.059115",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.044426",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 6-2 パラメータ"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "26d6ff16",
   "metadata": {
    "papermill": {
     "duration": 0.015572,
     "end_time": "2024-03-29T06:25:07.091708",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.076136",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-2-1 パラメータ名のマッチング"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "78024252",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.126561Z",
     "iopub.status.busy": "2024-03-29T06:25:07.124638Z",
     "iopub.status.idle": "2024-03-29T06:25:07.149706Z",
     "shell.execute_reply": "2024-03-29T06:25:07.147605Z"
    },
    "papermill": {
     "duration": 0.045413,
     "end_time": "2024-03-29T06:25:07.152733",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.107320",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "3"
      ],
      "text/latex": [
       "3"
      ],
      "text/markdown": [
       "3"
      ],
      "text/plain": [
       "[1] 3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 長いパラメータ名の関数を定義する\n",
    "fun <- function(long_long_parameter_name){\n",
    "    long_long_parameter_name\n",
    "}\n",
    "# 先頭が一致するので適当なパラメータ名となる\n",
    "fun(long = 3)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "802a9d41",
   "metadata": {
    "papermill": {
     "duration": 0.014884,
     "end_time": "2024-03-29T06:25:07.182582",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.167698",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-2-2 遅延評価"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "b430a034",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.217816Z",
     "iopub.status.busy": "2024-03-29T06:25:07.215904Z",
     "iopub.status.idle": "2024-03-29T06:25:07.236083Z",
     "shell.execute_reply": "2024-03-29T06:25:07.233759Z"
    },
    "papermill": {
     "duration": 0.041378,
     "end_time": "2024-03-29T06:25:07.238809",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.197431",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 5\n",
      "[1] 3\n"
     ]
    }
   ],
   "source": [
    "fun <- function(x, y = x + 1){\n",
    "    # ｘの初期値を確認する\n",
    "    print(x)\n",
    "    x <- 2\n",
    "    # xを変更してからyを評価する\n",
    "    print(y)\n",
    "}\n",
    "fun(5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "7890cf0e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.273089Z",
     "iopub.status.busy": "2024-03-29T06:25:07.271084Z",
     "iopub.status.idle": "2024-03-29T06:25:07.297053Z",
     "shell.execute_reply": "2024-03-29T06:25:07.294782Z"
    },
    "papermill": {
     "duration": 0.046215,
     "end_time": "2024-03-29T06:25:07.299980",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.253765",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 5\n",
      "[1] 6\n"
     ]
    }
   ],
   "source": [
    "fun <- function(x, y = x + 1){\n",
    "    # 遅延評価を行わないためにここでyの評価を行う\n",
    "    force(y)\n",
    "    # xの初期値を確認する\n",
    "    print(x)\n",
    "    x <- 2\n",
    "    # yはすでに評価されているのでxの変更の影響を受けない\n",
    "    print(y)\n",
    "}\n",
    "fun(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e3bbbdb5",
   "metadata": {
    "papermill": {
     "duration": 0.016185,
     "end_time": "2024-03-29T06:25:07.331430",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.315245",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-2-3 値渡し"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "93457b83",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.367507Z",
     "iopub.status.busy": "2024-03-29T06:25:07.365515Z",
     "iopub.status.idle": "2024-03-29T06:25:07.396787Z",
     "shell.execute_reply": "2024-03-29T06:25:07.394650Z"
    },
    "papermill": {
     "duration": 0.052299,
     "end_time": "2024-03-29T06:25:07.399814",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.347515",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 2\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "1"
      ],
      "text/latex": [
       "1"
      ],
      "text/markdown": [
       "1"
      ],
      "text/plain": [
       "[1] 1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "x <- 1\n",
    "fun <- function(x){\n",
    "    # xを変更する\n",
    "    x <- 2\n",
    "}\n",
    "# xは変更されない\n",
    "print(fun(x))\n",
    "x"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "4161ea05",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.436737Z",
     "iopub.status.busy": "2024-03-29T06:25:07.434893Z",
     "iopub.status.idle": "2024-03-29T06:25:07.509512Z",
     "shell.execute_reply": "2024-03-29T06:25:07.506777Z"
    },
    "papermill": {
     "duration": 0.096551,
     "end_time": "2024-03-29T06:25:07.513154",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.416603",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'x'"
      ],
      "text/latex": [
       "'x'"
      ],
      "text/markdown": [
       "'x'"
      ],
      "text/plain": [
       "[1] \"x\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "e <- new.env()\n",
    "fun <- function(env){\n",
    "    env$x <- 1\n",
    "}\n",
    "\n",
    "# e は変更される\n",
    "fun(e)\n",
    "ls(envir = e)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "97736e11",
   "metadata": {
    "papermill": {
     "duration": 0.015997,
     "end_time": "2024-03-29T06:25:07.544577",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.528580",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-2-4 ... (ドットドットドットオブジェクト）"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "b2fd0171",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.580179Z",
     "iopub.status.busy": "2024-03-29T06:25:07.578322Z",
     "iopub.status.idle": "2024-03-29T06:25:07.605123Z",
     "shell.execute_reply": "2024-03-29T06:25:07.602492Z"
    },
    "papermill": {
     "duration": 0.048613,
     "end_time": "2024-03-29T06:25:07.608740",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.560127",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "1"
      ],
      "text/latex": [
       "1"
      ],
      "text/markdown": [
       "1"
      ],
      "text/plain": [
       "[1] 1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 通常の関数は存在しないパラメータを渡されるとエラーになる\n",
    "fun <- function(x) {x}\n",
    "# fun(x = 1, y = 2, z = 3)\n",
    "\n",
    "# ドットドットドットオブジェクトをパラメータに設定すると、任意のパラメータを受け取れる\n",
    "fun <- function(x, ...){x} \n",
    "fun(x =1, y = 2, z = 3)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "c4564f42",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.645079Z",
     "iopub.status.busy": "2024-03-29T06:25:07.643255Z",
     "iopub.status.idle": "2024-03-29T06:25:07.670789Z",
     "shell.execute_reply": "2024-03-29T06:25:07.667960Z"
    },
    "papermill": {
     "duration": 0.049218,
     "end_time": "2024-03-29T06:25:07.673774",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.624556",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "$y\n",
      "[1] 2\n",
      "\n",
      "$z\n",
      "[1] 3\n",
      "\n",
      "[1] 3\n"
     ]
    }
   ],
   "source": [
    "fun <- function(x, ...){\n",
    "    # 要素をリストに変換する\n",
    "    args <- list(...)\n",
    "    print(args)\n",
    "    # ドットドットドットの2番目の要素を出力する\n",
    "    print(..2)\n",
    "    # 結果を返さない\n",
    "    invisible()\n",
    "}\n",
    "fun(x = 1, y = 2, z = 3)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "779a93e6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.711151Z",
     "iopub.status.busy": "2024-03-29T06:25:07.709182Z",
     "iopub.status.idle": "2024-03-29T06:25:07.734433Z",
     "shell.execute_reply": "2024-03-29T06:25:07.732367Z"
    },
    "papermill": {
     "duration": 0.046612,
     "end_time": "2024-03-29T06:25:07.737145",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.690533",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "21"
      ],
      "text/latex": [
       "21"
      ],
      "text/markdown": [
       "21"
      ],
      "text/plain": [
       "[1] 21"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 移譲先の関数を定義する\n",
    "delegatee <- function(x, y){\n",
    "    x + y\n",
    "}\n",
    "# 移譲元の関数を定義する\n",
    "delegator <- function(a, b, ...){\n",
    "    z <- delegatee(...)\n",
    "    (a + b) * z\n",
    "}\n",
    "# ドットドットドットパラメータに移譲先の関数のパラメータを渡す\n",
    "delegator(1, 2, x = 3, y = 4)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "9dbdda33",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.773657Z",
     "iopub.status.busy": "2024-03-29T06:25:07.771874Z",
     "iopub.status.idle": "2024-03-29T06:25:07.790589Z",
     "shell.execute_reply": "2024-03-29T06:25:07.788548Z"
    },
    "papermill": {
     "duration": 0.040327,
     "end_time": "2024-03-29T06:25:07.793655",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.753328",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "delegatee <- function(abc){\n",
    "    abc\n",
    "}\n",
    "delegator <- function(abcxyz, ...){\n",
    "    delegatee(...)\n",
    "}\n",
    "# abcがabcxyzに部分マッチするのでdelegateeの引数は渡らない\n",
    "# delegator(abc = 3)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9af15c57",
   "metadata": {
    "papermill": {
     "duration": 0.057318,
     "end_time": "2024-03-29T06:25:07.867532",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.810214",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-2-5 パラメータの操作"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "88b5a18e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.905936Z",
     "iopub.status.busy": "2024-03-29T06:25:07.904109Z",
     "iopub.status.idle": "2024-03-29T06:25:07.931293Z",
     "shell.execute_reply": "2024-03-29T06:25:07.929360Z"
    },
    "papermill": {
     "duration": 0.048577,
     "end_time": "2024-03-29T06:25:07.933926",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.885349",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "$x\n",
       "\n",
       "\n",
       "$y\n",
       "[1] 2\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 関数を定義する\n",
    "fun <- function(x, y = 2){\n",
    "    x + y\n",
    "}\n",
    "\n",
    "# 関数のパラメータをリストを取得する\n",
    "formals(fun)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "8daf7697",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:07.971982Z",
     "iopub.status.busy": "2024-03-29T06:25:07.970197Z",
     "iopub.status.idle": "2024-03-29T06:25:07.996178Z",
     "shell.execute_reply": "2024-03-29T06:25:07.994187Z"
    },
    "papermill": {
     "duration": 0.048485,
     "end_time": "2024-03-29T06:25:07.999018",
     "exception": false,
     "start_time": "2024-03-29T06:25:07.950533",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<pre class=language-r><code>function (x = 3, y) \n",
       "{\n",
       "<span style=white-space:pre-wrap>    x + y</span>\n",
       "}</code></pre>"
      ],
      "text/latex": [
       "\\begin{minted}{r}\n",
       "function (x = 3, y) \n",
       "\\{\n",
       "    x + y\n",
       "\\}\n",
       "\\end{minted}"
      ],
      "text/markdown": [
       "```r\n",
       "function (x = 3, y) \n",
       "{\n",
       "    x + y\n",
       "}\n",
       "```"
      ],
      "text/plain": [
       "function (x = 3, y) \n",
       "{\n",
       "    x + y\n",
       "}"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 関数のパラメータリストを置換する\n",
    "formals(fun) <- alist(x = 3, y =)\n",
    "fun"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "14f2cdae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.038749Z",
     "iopub.status.busy": "2024-03-29T06:25:08.036596Z",
     "iopub.status.idle": "2024-03-29T06:25:08.073634Z",
     "shell.execute_reply": "2024-03-29T06:25:08.071045Z"
    },
    "papermill": {
     "duration": 0.061482,
     "end_time": "2024-03-29T06:25:08.077142",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.015660",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 1\n",
      "引数ｘが与えられませんでした。\n"
     ]
    }
   ],
   "source": [
    "fun <- function(x = 1){\n",
    "    if(missing(x)){\n",
    "        cat('引数ｘが与えられませんでした。', fill = TRUE)\n",
    "    } else {\n",
    "        print(x)\n",
    "    }\n",
    "}\n",
    "# 引数あり\n",
    "fun(1)\n",
    "\n",
    "# 引数なし\n",
    "fun()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "b436e113",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.115936Z",
     "iopub.status.busy": "2024-03-29T06:25:08.114059Z",
     "iopub.status.idle": "2024-03-29T06:25:08.139729Z",
     "shell.execute_reply": "2024-03-29T06:25:08.137602Z"
    },
    "papermill": {
     "duration": 0.049401,
     "end_time": "2024-03-29T06:25:08.143215",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.093814",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'停止'"
      ],
      "text/latex": [
       "'停止'"
      ],
      "text/markdown": [
       "'停止'"
      ],
      "text/plain": [
       "[1] \"停止\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "signal <- function(color = c('red', 'yellow', 'blue')){\n",
    "    color <- match.arg(color)\n",
    "    switch(color, 'red' = '停止', 'yellow' = '注意', 'blue' = '進行')\n",
    "}\n",
    "signal('red')\n",
    "# signal('white')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "095f1190",
   "metadata": {
    "papermill": {
     "duration": 0.017714,
     "end_time": "2024-03-29T06:25:08.179148",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.161434",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 6-3 本体\n",
    "### 6-3-1 本体の操作"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "730b8a07",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.217139Z",
     "iopub.status.busy": "2024-03-29T06:25:08.215372Z",
     "iopub.status.idle": "2024-03-29T06:25:08.254438Z",
     "shell.execute_reply": "2024-03-29T06:25:08.251810Z"
    },
    "papermill": {
     "duration": 0.061715,
     "end_time": "2024-03-29T06:25:08.257821",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.196106",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "7"
      ],
      "text/latex": [
       "7"
      ],
      "text/markdown": [
       "7"
      ],
      "text/plain": [
       "[1] 7"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "49"
      ],
      "text/latex": [
       "49"
      ],
      "text/markdown": [
       "49"
      ],
      "text/plain": [
       "[1] 49"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 関数を普通に定義する\n",
    "fun <- function(x, y){\n",
    "    x + y\n",
    "}\n",
    "fun(3, 4)\n",
    "\n",
    "# 関数の本体を差し替える\n",
    "body(fun) <- expression({\n",
    "    z <- x + y\n",
    "    z * z\n",
    "})\n",
    "fun(3, 4)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4bc27e76",
   "metadata": {
    "papermill": {
     "duration": 0.017385,
     "end_time": "2024-03-29T06:25:08.292584",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.275199",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 6-4 メソッドディスパッチ\n",
    "### 6-4-1 S3クラス"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "5eec5dd5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.331151Z",
     "iopub.status.busy": "2024-03-29T06:25:08.329397Z",
     "iopub.status.idle": "2024-03-29T06:25:08.348588Z",
     "shell.execute_reply": "2024-03-29T06:25:08.346660Z"
    },
    "papermill": {
     "duration": 0.042207,
     "end_time": "2024-03-29T06:25:08.352062",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.309855",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# ジェネリック関数を定義する\n",
    "fun <- function(x, ...){\n",
    "    UseMethod('fun')\n",
    "}\n",
    "# abcクラスメソッドを定義する\n",
    "fun.abc <- function(x, y){\n",
    "    x + y\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "fbbfd7bc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.390819Z",
     "iopub.status.busy": "2024-03-29T06:25:08.388951Z",
     "iopub.status.idle": "2024-03-29T06:25:08.417906Z",
     "shell.execute_reply": "2024-03-29T06:25:08.411456Z"
    },
    "papermill": {
     "duration": 0.051619,
     "end_time": "2024-03-29T06:25:08.420843",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.369224",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[1] 3\n",
       "attr(,\"class\")\n",
       "[1] \"abc\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "x <- 1\n",
    "\n",
    "# fun.abcが呼ばれる\n",
    "class(x) <- 'abc'\n",
    "fun(x, 2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "eb0b633f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.460700Z",
     "iopub.status.busy": "2024-03-29T06:25:08.458936Z",
     "iopub.status.idle": "2024-03-29T06:25:08.476095Z",
     "shell.execute_reply": "2024-03-29T06:25:08.474107Z"
    },
    "papermill": {
     "duration": 0.04015,
     "end_time": "2024-03-29T06:25:08.479220",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.439070",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# xyzに対するメソッドが存在しないためエラーとなる\n",
    "class(x) <- 'xyz'\n",
    "# fun(x, 2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "27148397",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.519750Z",
     "iopub.status.busy": "2024-03-29T06:25:08.517915Z",
     "iopub.status.idle": "2024-03-29T06:25:08.541925Z",
     "shell.execute_reply": "2024-03-29T06:25:08.539975Z"
    },
    "papermill": {
     "duration": 0.047512,
     "end_time": "2024-03-29T06:25:08.544637",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.497125",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[1] -1\n",
       "attr(,\"class\")\n",
       "[1] \"xyz\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# デフォルト関数を定義するとそれが呼ばれる\n",
    "fun.default <- function(x, y){\n",
    "    x - y\n",
    "}\n",
    "fun(x, 2)\n",
    "# attr(, 'class')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "31845772",
   "metadata": {
    "papermill": {
     "duration": 0.018312,
     "end_time": "2024-03-29T06:25:08.580718",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.562406",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-4-2 S4クラス"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "510e55a7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.620253Z",
     "iopub.status.busy": "2024-03-29T06:25:08.618534Z",
     "iopub.status.idle": "2024-03-29T06:25:08.659605Z",
     "shell.execute_reply": "2024-03-29T06:25:08.657620Z"
    },
    "papermill": {
     "duration": 0.063789,
     "end_time": "2024-03-29T06:25:08.662333",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.598544",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "setClass('X')\n",
    "setClass('Y', contains = 'X')\n",
    "setClass('Z', contains = 'X')\n",
    "setClass('W', contains = 'Z')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "8eff6de9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.702802Z",
     "iopub.status.busy": "2024-03-29T06:25:08.700978Z",
     "iopub.status.idle": "2024-03-29T06:25:08.738145Z",
     "shell.execute_reply": "2024-03-29T06:25:08.731178Z"
    },
    "papermill": {
     "duration": 0.06083,
     "end_time": "2024-03-29T06:25:08.741050",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.680220",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'fun'"
      ],
      "text/latex": [
       "'fun'"
      ],
      "text/markdown": [
       "'fun'"
      ],
      "text/plain": [
       "[1] \"fun\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "setGeneric('fun', function(x1, x2) standardGeneric('fun'))\n",
    "setMethod('fun', signature('Y', 'Y'), function(x1, x2) 'Y/Y')\n",
    "setMethod('fun', signature('Y', 'Z'), function(x1, x2) 'Y/Z')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "ddf4ed10",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.781246Z",
     "iopub.status.busy": "2024-03-29T06:25:08.779417Z",
     "iopub.status.idle": "2024-03-29T06:25:08.800243Z",
     "shell.execute_reply": "2024-03-29T06:25:08.798170Z"
    },
    "papermill": {
     "duration": 0.044062,
     "end_time": "2024-03-29T06:25:08.803107",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.759045",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'Y/Z'"
      ],
      "text/latex": [
       "'Y/Z'"
      ],
      "text/markdown": [
       "'Y/Z'"
      ],
      "text/plain": [
       "[1] \"Y/Z\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# メソッドディスパッチにより最も近い関数が呼ばれる\n",
    "fun(new('Y'), new('Z'))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "fdd23ed3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.845216Z",
     "iopub.status.busy": "2024-03-29T06:25:08.843388Z",
     "iopub.status.idle": "2024-03-29T06:25:08.865279Z",
     "shell.execute_reply": "2024-03-29T06:25:08.863347Z"
    },
    "papermill": {
     "duration": 0.046505,
     "end_time": "2024-03-29T06:25:08.868121",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.821616",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'Y/Z'"
      ],
      "text/latex": [
       "'Y/Z'"
      ],
      "text/markdown": [
       "'Y/Z'"
      ],
      "text/plain": [
       "[1] \"Y/Z\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# WはZを継承しているのでY/Zにマッチする\n",
    "fun(new('Y'), new('W'))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "029a7aa7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:08.909606Z",
     "iopub.status.busy": "2024-03-29T06:25:08.907774Z",
     "iopub.status.idle": "2024-03-29T06:25:08.927079Z",
     "shell.execute_reply": "2024-03-29T06:25:08.925049Z"
    },
    "papermill": {
     "duration": 0.043406,
     "end_time": "2024-03-29T06:25:08.929998",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.886592",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# WはYを継承していないのでY/Zにマッチする関数がない\n",
    "# fun(new('W'), new('Z'))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b8413d03",
   "metadata": {
    "papermill": {
     "duration": 0.019318,
     "end_time": "2024-03-29T06:25:08.968967",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.949649",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 6-5 特別な関数\n",
    "### 6-5-1 演算子"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "d452897b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.010266Z",
     "iopub.status.busy": "2024-03-29T06:25:09.008350Z",
     "iopub.status.idle": "2024-03-29T06:25:09.030663Z",
     "shell.execute_reply": "2024-03-29T06:25:09.027021Z"
    },
    "papermill": {
     "duration": 0.046577,
     "end_time": "2024-03-29T06:25:09.034094",
     "exception": false,
     "start_time": "2024-03-29T06:25:08.987517",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "7"
      ],
      "text/latex": [
       "7"
      ],
      "text/markdown": [
       "7"
      ],
      "text/plain": [
       "[1] 7"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 演算子を関数呼び出し形式で利用する\n",
    "`+`(3, 4)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "8b97ec8f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.088683Z",
     "iopub.status.busy": "2024-03-29T06:25:09.085074Z",
     "iopub.status.idle": "2024-03-29T06:25:09.126133Z",
     "shell.execute_reply": "2024-03-29T06:25:09.118844Z"
    },
    "papermill": {
     "duration": 0.070688,
     "end_time": "2024-03-29T06:25:09.129178",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.058490",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 2 of type int</caption>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td> 9</td></tr>\n",
       "\t<tr><td>4</td><td>16</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 2 of type int\n",
       "\\begin{tabular}{ll}\n",
       "\t 1 &  9\\\\\n",
       "\t 4 & 16\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 2 of type int\n",
       "\n",
       "| 1 |  9 |\n",
       "| 4 | 16 |\n",
       "\n"
      ],
      "text/plain": [
       "     [,1] [,2]\n",
       "[1,] 1     9  \n",
       "[2,] 4    16  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# *を行列に対して行うと成分ごとの積になる\n",
    "m <- matrix(1:4, 2, 2)\n",
    "m * m"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "29033b19",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.181156Z",
     "iopub.status.busy": "2024-03-29T06:25:09.177421Z",
     "iopub.status.idle": "2024-03-29T06:25:09.221328Z",
     "shell.execute_reply": "2024-03-29T06:25:09.218435Z"
    },
    "papermill": {
     "duration": 0.077877,
     "end_time": "2024-03-29T06:25:09.225876",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.147999",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 2 × 2 of type dbl</caption>\n",
       "<tbody>\n",
       "\t<tr><td> 7</td><td>15</td></tr>\n",
       "\t<tr><td>10</td><td>22</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 2 × 2 of type dbl\n",
       "\\begin{tabular}{ll}\n",
       "\t  7 & 15\\\\\n",
       "\t 10 & 22\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 2 × 2 of type dbl\n",
       "\n",
       "|  7 | 15 |\n",
       "| 10 | 22 |\n",
       "\n"
      ],
      "text/plain": [
       "     [,1] [,2]\n",
       "[1,]  7   15  \n",
       "[2,] 10   22  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# *を%*%で置き換える\n",
    "`*` <- `%*%`\n",
    "m * m"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "acb33400",
   "metadata": {
    "papermill": {
     "duration": 0.019131,
     "end_time": "2024-03-29T06:25:09.268543",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.249412",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-5-2 制御構文"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "700f0da2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.311676Z",
     "iopub.status.busy": "2024-03-29T06:25:09.309771Z",
     "iopub.status.idle": "2024-03-29T06:25:09.333710Z",
     "shell.execute_reply": "2024-03-29T06:25:09.331302Z"
    },
    "papermill": {
     "duration": 0.052214,
     "end_time": "2024-03-29T06:25:09.340729",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.288515",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 0\n",
      "[1] 1\n",
      "[1] 2\n"
     ]
    }
   ],
   "source": [
    " i <- 0\n",
    "while(i < 3){\n",
    "    print(i)\n",
    "    i <- i + 1\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "e837da2f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.383838Z",
     "iopub.status.busy": "2024-03-29T06:25:09.381443Z",
     "iopub.status.idle": "2024-03-29T06:25:09.409247Z",
     "shell.execute_reply": "2024-03-29T06:25:09.406879Z"
    },
    "papermill": {
     "duration": 0.053348,
     "end_time": "2024-03-29T06:25:09.413126",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.359778",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 0\n",
      "[1] 1\n",
      "[1] 2\n"
     ]
    }
   ],
   "source": [
    "i <- 0\n",
    "`while`(i < 3, {\n",
    "    print(i)\n",
    "    i <- i + 1\n",
    "})"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8ef6f7dd",
   "metadata": {
    "papermill": {
     "duration": 0.024713,
     "end_time": "2024-03-29T06:25:09.462568",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.437855",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-5-3 インデックスアクセス"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "65d4ce08",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.506255Z",
     "iopub.status.busy": "2024-03-29T06:25:09.504401Z",
     "iopub.status.idle": "2024-03-29T06:25:09.527901Z",
     "shell.execute_reply": "2024-03-29T06:25:09.525561Z"
    },
    "papermill": {
     "duration": 0.048705,
     "end_time": "2024-03-29T06:25:09.530604",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.481899",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"D\" \"E\" \"F\"\n",
      "[1] \"D\" \"E\" \"F\"\n"
     ]
    }
   ],
   "source": [
    "# インデックスアクセスを関数呼び出し形式で行う\n",
    "print(`[`(LETTERS, 4:6))\n",
    "print(LETTERS[4:6])"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0321b449",
   "metadata": {
    "papermill": {
     "duration": 0.019584,
     "end_time": "2024-03-29T06:25:09.569997",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.550413",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-5-4 括弧"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "322a132c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.614923Z",
     "iopub.status.busy": "2024-03-29T06:25:09.613026Z",
     "iopub.status.idle": "2024-03-29T06:25:09.649596Z",
     "shell.execute_reply": "2024-03-29T06:25:09.647413Z"
    },
    "papermill": {
     "duration": 0.061633,
     "end_time": "2024-03-29T06:25:09.652573",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.590940",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 10\n",
      "[1] 20\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 1 × 1 of type dbl</caption>\n",
       "<tbody>\n",
       "\t<tr><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 1 × 1 of type dbl\n",
       "\\begin{tabular}{l}\n",
       "\t 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 1 × 1 of type dbl\n",
       "\n",
       "| 6 |\n",
       "\n"
      ],
      "text/plain": [
       "     [,1]\n",
       "[1,] 6   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 括弧({)を関数として評価する\n",
    "`{`(print(10), print(20))\n",
    "# 括弧(()を関数として定義する\n",
    "`(` <- function(x){2 * x}\n",
    "(3)\n",
    "rm(`(`)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e7e00d5d",
   "metadata": {
    "papermill": {
     "duration": 0.022241,
     "end_time": "2024-03-29T06:25:09.695386",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.673145",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6-5-5 置換関数"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "225250c3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.743656Z",
     "iopub.status.busy": "2024-03-29T06:25:09.741879Z",
     "iopub.status.idle": "2024-03-29T06:25:09.793335Z",
     "shell.execute_reply": "2024-03-29T06:25:09.789603Z"
    },
    "papermill": {
     "duration": 0.079624,
     "end_time": "2024-03-29T06:25:09.798948",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.719324",
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
       "<ol class=list-inline><li>'X'</li><li>'Y'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'X'\n",
       "\\item 'Y'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'X'\n",
       "2. 'Y'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"X\" \"Y\""
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
       "<ol class=list-inline><li>'A'</li><li>'B'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'A'\n",
       "\\item 'B'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'A'\n",
       "2. 'B'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"A\" \"B\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df <- data.frame(X = 1:3, Y = 4:6)\n",
    "names(df)\n",
    "# 列名を置き換える\n",
    "names(df) <- c('A', 'B')\n",
    "names(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "6aa648b1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.845736Z",
     "iopub.status.busy": "2024-03-29T06:25:09.843699Z",
     "iopub.status.idle": "2024-03-29T06:25:09.873067Z",
     "shell.execute_reply": "2024-03-29T06:25:09.870852Z"
    },
    "papermill": {
     "duration": 0.055,
     "end_time": "2024-03-29T06:25:09.875889",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.820889",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "NULL"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# 属性abcを取得する\n",
    "abc <- function(x){\n",
    "    attr(x, 'abc')\n",
    "}\n",
    "# 属性abcを置換する\n",
    "`abc<-` <- function(x, value){\n",
    "    attr(x, 'abc') <- value\n",
    "}\n",
    "\n",
    "# 置換関数を利用する\n",
    "x <- 1:3\n",
    "abc(x) <- 'foo'\n",
    "abc(x)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "0d5572c2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T06:25:09.921778Z",
     "iopub.status.busy": "2024-03-29T06:25:09.919715Z",
     "iopub.status.idle": "2024-03-29T06:25:09.951513Z",
     "shell.execute_reply": "2024-03-29T06:25:09.949251Z"
    },
    "papermill": {
     "duration": 0.058125,
     "end_time": "2024-03-29T06:25:09.954547",
     "exception": false,
     "start_time": "2024-03-29T06:25:09.896422",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<dl>\n",
       "\t<dt>$X</dt>\n",
       "\t\t<dd>3</dd>\n",
       "\t<dt>$Y</dt>\n",
       "\t\t<dd>2</dd>\n",
       "</dl>\n"
      ],
      "text/latex": [
       "\\begin{description}\n",
       "\\item[\\$X] 3\n",
       "\\item[\\$Y] 2\n",
       "\\end{description}\n"
      ],
      "text/markdown": [
       "$X\n",
       ":   3\n",
       "$Y\n",
       ":   2\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "$X\n",
       "[1] 3\n",
       "\n",
       "$Y\n",
       "[1] 2\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "v <- list(X = 1, Y = 2)\n",
    "\n",
    "# ドル演算子で置換する\n",
    "v$X <- 3\n",
    "v"
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
   "duration": 7.6848,
   "end_time": "2024-03-29T06:25:10.098424",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-29T06:25:02.413624",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
