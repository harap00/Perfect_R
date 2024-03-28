{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "fe02ca3e",
   "metadata": {
    "papermill": {
     "duration": 0.013014,
     "end_time": "2024-03-28T22:57:48.181684",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.168670",
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
   "id": "3b6f5ca2",
   "metadata": {
    "papermill": {
     "duration": 0.012578,
     "end_time": "2024-03-28T22:57:48.206961",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.194383",
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
   "id": "0151f653",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.237733Z",
     "iopub.status.busy": "2024-03-28T22:57:48.235471Z",
     "iopub.status.idle": "2024-03-28T22:57:48.375972Z",
     "shell.execute_reply": "2024-03-28T22:57:48.373863Z"
    },
    "papermill": {
     "duration": 0.158726,
     "end_time": "2024-03-28T22:57:48.378792",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.220066",
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
   "id": "3cd4ef60",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.446542Z",
     "iopub.status.busy": "2024-03-28T22:57:48.406628Z",
     "iopub.status.idle": "2024-03-28T22:57:48.462547Z",
     "shell.execute_reply": "2024-03-28T22:57:48.460728Z"
    },
    "papermill": {
     "duration": 0.073546,
     "end_time": "2024-03-28T22:57:48.465151",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.391605",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5b2d0806bd90>\n",
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
   "id": "8490957c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.494652Z",
     "iopub.status.busy": "2024-03-28T22:57:48.493024Z",
     "iopub.status.idle": "2024-03-28T22:57:48.517040Z",
     "shell.execute_reply": "2024-03-28T22:57:48.515213Z"
    },
    "papermill": {
     "duration": 0.041501,
     "end_time": "2024-03-28T22:57:48.519610",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.478109",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5b2d067ae890>\n",
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
   "id": "6ac53333",
   "metadata": {
    "papermill": {
     "duration": 0.012268,
     "end_time": "2024-03-28T22:57:48.543960",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.531692",
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
   "id": "a588d8cd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.572221Z",
     "iopub.status.busy": "2024-03-28T22:57:48.570458Z",
     "iopub.status.idle": "2024-03-28T22:57:48.588832Z",
     "shell.execute_reply": "2024-03-28T22:57:48.586759Z"
    },
    "papermill": {
     "duration": 0.035805,
     "end_time": "2024-03-28T22:57:48.591890",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.556085",
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
   "id": "5c48ac35",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.620626Z",
     "iopub.status.busy": "2024-03-28T22:57:48.618815Z",
     "iopub.status.idle": "2024-03-28T22:57:48.644357Z",
     "shell.execute_reply": "2024-03-28T22:57:48.642483Z"
    },
    "papermill": {
     "duration": 0.042583,
     "end_time": "2024-03-28T22:57:48.646906",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.604323",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5b2d07465c38>\n",
      "<environment: 0x5b2d0855bb48>\n",
      "<environment: 0x5b2d07465c38>\n"
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
   "id": "0132f752",
   "metadata": {
    "papermill": {
     "duration": 0.012356,
     "end_time": "2024-03-28T22:57:48.671854",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.659498",
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
   "id": "a6d66712",
   "metadata": {
    "papermill": {
     "duration": 0.012281,
     "end_time": "2024-03-28T22:57:48.696339",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.684058",
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
   "id": "fb93c944",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.724976Z",
     "iopub.status.busy": "2024-03-28T22:57:48.723111Z",
     "iopub.status.idle": "2024-03-28T22:57:48.750666Z",
     "shell.execute_reply": "2024-03-28T22:57:48.748508Z"
    },
    "papermill": {
     "duration": 0.045016,
     "end_time": "2024-03-28T22:57:48.753452",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.708436",
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
   "id": "4ea10da1",
   "metadata": {
    "papermill": {
     "duration": 0.012771,
     "end_time": "2024-03-28T22:57:48.778913",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.766142",
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
   "id": "04f74660",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.808218Z",
     "iopub.status.busy": "2024-03-28T22:57:48.806459Z",
     "iopub.status.idle": "2024-03-28T22:57:48.826734Z",
     "shell.execute_reply": "2024-03-28T22:57:48.824369Z"
    },
    "papermill": {
     "duration": 0.038393,
     "end_time": "2024-03-28T22:57:48.829858",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.791465",
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
   "id": "710d8830",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.859988Z",
     "iopub.status.busy": "2024-03-28T22:57:48.858290Z",
     "iopub.status.idle": "2024-03-28T22:57:48.882870Z",
     "shell.execute_reply": "2024-03-28T22:57:48.880515Z"
    },
    "papermill": {
     "duration": 0.043329,
     "end_time": "2024-03-28T22:57:48.886128",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.842799",
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
   "id": "5dd4bef0",
   "metadata": {
    "papermill": {
     "duration": 0.012703,
     "end_time": "2024-03-28T22:57:48.911470",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.898767",
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
   "id": "944187f9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:48.940571Z",
     "iopub.status.busy": "2024-03-28T22:57:48.938865Z",
     "iopub.status.idle": "2024-03-28T22:57:48.967725Z",
     "shell.execute_reply": "2024-03-28T22:57:48.965413Z"
    },
    "papermill": {
     "duration": 0.046895,
     "end_time": "2024-03-28T22:57:48.970926",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.924031",
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
   "id": "6aa4e757",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.000786Z",
     "iopub.status.busy": "2024-03-28T22:57:48.999104Z",
     "iopub.status.idle": "2024-03-28T22:57:49.067474Z",
     "shell.execute_reply": "2024-03-28T22:57:49.064787Z"
    },
    "papermill": {
     "duration": 0.087851,
     "end_time": "2024-03-28T22:57:49.071704",
     "exception": false,
     "start_time": "2024-03-28T22:57:48.983853",
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
   "id": "21b3a169",
   "metadata": {
    "papermill": {
     "duration": 0.013199,
     "end_time": "2024-03-28T22:57:49.098328",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.085129",
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
   "id": "71214811",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.128282Z",
     "iopub.status.busy": "2024-03-28T22:57:49.126674Z",
     "iopub.status.idle": "2024-03-28T22:57:49.149507Z",
     "shell.execute_reply": "2024-03-28T22:57:49.147535Z"
    },
    "papermill": {
     "duration": 0.040657,
     "end_time": "2024-03-28T22:57:49.152110",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.111453",
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
   "id": "65f9391b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.184477Z",
     "iopub.status.busy": "2024-03-28T22:57:49.182704Z",
     "iopub.status.idle": "2024-03-28T22:57:49.205799Z",
     "shell.execute_reply": "2024-03-28T22:57:49.203817Z"
    },
    "papermill": {
     "duration": 0.042205,
     "end_time": "2024-03-28T22:57:49.208504",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.166299",
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
   "id": "d5b37495",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.240894Z",
     "iopub.status.busy": "2024-03-28T22:57:49.239242Z",
     "iopub.status.idle": "2024-03-28T22:57:49.263472Z",
     "shell.execute_reply": "2024-03-28T22:57:49.261518Z"
    },
    "papermill": {
     "duration": 0.042696,
     "end_time": "2024-03-28T22:57:49.266019",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.223323",
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
   "id": "22b2bc12",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.297796Z",
     "iopub.status.busy": "2024-03-28T22:57:49.296048Z",
     "iopub.status.idle": "2024-03-28T22:57:49.314303Z",
     "shell.execute_reply": "2024-03-28T22:57:49.312256Z"
    },
    "papermill": {
     "duration": 0.037519,
     "end_time": "2024-03-28T22:57:49.317568",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.280049",
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
   "id": "4ee5c089",
   "metadata": {
    "papermill": {
     "duration": 0.014252,
     "end_time": "2024-03-28T22:57:49.345653",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.331401",
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
   "id": "b2f44322",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.377235Z",
     "iopub.status.busy": "2024-03-28T22:57:49.375426Z",
     "iopub.status.idle": "2024-03-28T22:57:49.401378Z",
     "shell.execute_reply": "2024-03-28T22:57:49.399412Z"
    },
    "papermill": {
     "duration": 0.044555,
     "end_time": "2024-03-28T22:57:49.404028",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.359473",
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
   "id": "1a486e3a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.435776Z",
     "iopub.status.busy": "2024-03-28T22:57:49.434114Z",
     "iopub.status.idle": "2024-03-28T22:57:49.457334Z",
     "shell.execute_reply": "2024-03-28T22:57:49.454792Z"
    },
    "papermill": {
     "duration": 0.04215,
     "end_time": "2024-03-28T22:57:49.460221",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.418071",
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
   "id": "1bee5058",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.494807Z",
     "iopub.status.busy": "2024-03-28T22:57:49.493050Z",
     "iopub.status.idle": "2024-03-28T22:57:49.525057Z",
     "shell.execute_reply": "2024-03-28T22:57:49.522811Z"
    },
    "papermill": {
     "duration": 0.051859,
     "end_time": "2024-03-28T22:57:49.527910",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.476051",
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
   "id": "548150d6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.561856Z",
     "iopub.status.busy": "2024-03-28T22:57:49.559999Z",
     "iopub.status.idle": "2024-03-28T22:57:49.581982Z",
     "shell.execute_reply": "2024-03-28T22:57:49.580024Z"
    },
    "papermill": {
     "duration": 0.041448,
     "end_time": "2024-03-28T22:57:49.584708",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.543260",
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
   "id": "a122517c",
   "metadata": {
    "papermill": {
     "duration": 0.01537,
     "end_time": "2024-03-28T22:57:49.614807",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.599437",
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
   "id": "35c0927b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.648504Z",
     "iopub.status.busy": "2024-03-28T22:57:49.646863Z",
     "iopub.status.idle": "2024-03-28T22:57:49.682826Z",
     "shell.execute_reply": "2024-03-28T22:57:49.680186Z"
    },
    "papermill": {
     "duration": 0.055673,
     "end_time": "2024-03-28T22:57:49.685756",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.630083",
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
   "id": "8810c95c",
   "metadata": {
    "papermill": {
     "duration": 0.014874,
     "end_time": "2024-03-28T22:57:49.715473",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.700599",
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
   "id": "ca272633",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.751109Z",
     "iopub.status.busy": "2024-03-28T22:57:49.749427Z",
     "iopub.status.idle": "2024-03-28T22:57:49.766777Z",
     "shell.execute_reply": "2024-03-28T22:57:49.764945Z"
    },
    "papermill": {
     "duration": 0.038842,
     "end_time": "2024-03-28T22:57:49.769436",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.730594",
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
   "id": "5f472945",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.804379Z",
     "iopub.status.busy": "2024-03-28T22:57:49.802586Z",
     "iopub.status.idle": "2024-03-28T22:57:49.829115Z",
     "shell.execute_reply": "2024-03-28T22:57:49.823478Z"
    },
    "papermill": {
     "duration": 0.047654,
     "end_time": "2024-03-28T22:57:49.831950",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.784296",
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
   "id": "cea2045f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.901550Z",
     "iopub.status.busy": "2024-03-28T22:57:49.899713Z",
     "iopub.status.idle": "2024-03-28T22:57:49.916269Z",
     "shell.execute_reply": "2024-03-28T22:57:49.914359Z"
    },
    "papermill": {
     "duration": 0.071852,
     "end_time": "2024-03-28T22:57:49.918807",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.846955",
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
   "id": "748ce077",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:49.954757Z",
     "iopub.status.busy": "2024-03-28T22:57:49.952910Z",
     "iopub.status.idle": "2024-03-28T22:57:49.976655Z",
     "shell.execute_reply": "2024-03-28T22:57:49.974695Z"
    },
    "papermill": {
     "duration": 0.045585,
     "end_time": "2024-03-28T22:57:49.979386",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.933801",
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
   "id": "6d012af3",
   "metadata": {
    "papermill": {
     "duration": 0.015274,
     "end_time": "2024-03-28T22:57:50.010982",
     "exception": false,
     "start_time": "2024-03-28T22:57:49.995708",
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
   "id": "2f361202",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:50.045774Z",
     "iopub.status.busy": "2024-03-28T22:57:50.043915Z",
     "iopub.status.idle": "2024-03-28T22:57:50.085275Z",
     "shell.execute_reply": "2024-03-28T22:57:50.083185Z"
    },
    "papermill": {
     "duration": 0.061889,
     "end_time": "2024-03-28T22:57:50.088102",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.026213",
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
   "id": "5c643a7d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:50.123122Z",
     "iopub.status.busy": "2024-03-28T22:57:50.121285Z",
     "iopub.status.idle": "2024-03-28T22:57:50.155686Z",
     "shell.execute_reply": "2024-03-28T22:57:50.149384Z"
    },
    "papermill": {
     "duration": 0.054592,
     "end_time": "2024-03-28T22:57:50.158506",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.103914",
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
   "id": "1a8e7e78",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:50.193445Z",
     "iopub.status.busy": "2024-03-28T22:57:50.191731Z",
     "iopub.status.idle": "2024-03-28T22:57:50.212381Z",
     "shell.execute_reply": "2024-03-28T22:57:50.210472Z"
    },
    "papermill": {
     "duration": 0.041202,
     "end_time": "2024-03-28T22:57:50.215199",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.173997",
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
   "id": "f15b5388",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:50.250714Z",
     "iopub.status.busy": "2024-03-28T22:57:50.249031Z",
     "iopub.status.idle": "2024-03-28T22:57:50.269892Z",
     "shell.execute_reply": "2024-03-28T22:57:50.268021Z"
    },
    "papermill": {
     "duration": 0.041725,
     "end_time": "2024-03-28T22:57:50.272634",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.230909",
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
   "id": "93692932",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:50.310927Z",
     "iopub.status.busy": "2024-03-28T22:57:50.308928Z",
     "iopub.status.idle": "2024-03-28T22:57:50.326835Z",
     "shell.execute_reply": "2024-03-28T22:57:50.324883Z"
    },
    "papermill": {
     "duration": 0.039895,
     "end_time": "2024-03-28T22:57:50.329491",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.289596",
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
   "id": "0be1782e",
   "metadata": {
    "papermill": {
     "duration": 0.016552,
     "end_time": "2024-03-28T22:57:50.363985",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.347433",
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
   "id": "ef5d184a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:50.402533Z",
     "iopub.status.busy": "2024-03-28T22:57:50.400645Z",
     "iopub.status.idle": "2024-03-28T22:57:50.420437Z",
     "shell.execute_reply": "2024-03-28T22:57:50.418453Z"
    },
    "papermill": {
     "duration": 0.042388,
     "end_time": "2024-03-28T22:57:50.423621",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.381233",
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
   "id": "0d93cab3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:50.461221Z",
     "iopub.status.busy": "2024-03-28T22:57:50.459528Z",
     "iopub.status.idle": "2024-03-28T22:57:50.493165Z",
     "shell.execute_reply": "2024-03-28T22:57:50.486356Z"
    },
    "papermill": {
     "duration": 0.056446,
     "end_time": "2024-03-28T22:57:50.496734",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.440288",
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
   "id": "4bf6314c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T22:57:50.533608Z",
     "iopub.status.busy": "2024-03-28T22:57:50.531719Z",
     "iopub.status.idle": "2024-03-28T22:57:50.560653Z",
     "shell.execute_reply": "2024-03-28T22:57:50.558789Z"
    },
    "papermill": {
     "duration": 0.05019,
     "end_time": "2024-03-28T22:57:50.563305",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.513115",
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
   "cell_type": "code",
   "execution_count": null,
   "id": "a1067b55",
   "metadata": {
    "papermill": {
     "duration": 0.017329,
     "end_time": "2024-03-28T22:57:50.598401",
     "exception": false,
     "start_time": "2024-03-28T22:57:50.581072",
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
   "duration": 6.095265,
   "end_time": "2024-03-28T22:57:50.740386",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-28T22:57:44.645121",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
