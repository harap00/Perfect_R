{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "71072ab3",
   "metadata": {
    "papermill": {
     "duration": 0.015174,
     "end_time": "2024-03-29T07:45:14.644549",
     "exception": false,
     "start_time": "2024-03-29T07:45:14.629375",
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
   "id": "2319df2c",
   "metadata": {
    "papermill": {
     "duration": 0.014315,
     "end_time": "2024-03-29T07:45:14.673081",
     "exception": false,
     "start_time": "2024-03-29T07:45:14.658766",
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
   "id": "ca401921",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:14.707217Z",
     "iopub.status.busy": "2024-03-29T07:45:14.704139Z",
     "iopub.status.idle": "2024-03-29T07:45:14.837999Z",
     "shell.execute_reply": "2024-03-29T07:45:14.835901Z"
    },
    "papermill": {
     "duration": 0.154616,
     "end_time": "2024-03-29T07:45:14.841671",
     "exception": false,
     "start_time": "2024-03-29T07:45:14.687055",
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
   "id": "8400a2c9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:14.918588Z",
     "iopub.status.busy": "2024-03-29T07:45:14.875000Z",
     "iopub.status.idle": "2024-03-29T07:45:14.935825Z",
     "shell.execute_reply": "2024-03-29T07:45:14.933511Z"
    },
    "papermill": {
     "duration": 0.081671,
     "end_time": "2024-03-29T07:45:14.938648",
     "exception": false,
     "start_time": "2024-03-29T07:45:14.856977",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x569b56342930>\n",
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
   "id": "9d6b7200",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:14.975504Z",
     "iopub.status.busy": "2024-03-29T07:45:14.973663Z",
     "iopub.status.idle": "2024-03-29T07:45:15.001123Z",
     "shell.execute_reply": "2024-03-29T07:45:14.998779Z"
    },
    "papermill": {
     "duration": 0.048932,
     "end_time": "2024-03-29T07:45:15.004020",
     "exception": false,
     "start_time": "2024-03-29T07:45:14.955088",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x569b54a78c18>\n",
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
   "id": "5f21af54",
   "metadata": {
    "papermill": {
     "duration": 0.015024,
     "end_time": "2024-03-29T07:45:15.034756",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.019732",
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
   "id": "683d29eb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.068053Z",
     "iopub.status.busy": "2024-03-29T07:45:15.065942Z",
     "iopub.status.idle": "2024-03-29T07:45:15.084463Z",
     "shell.execute_reply": "2024-03-29T07:45:15.082384Z"
    },
    "papermill": {
     "duration": 0.038214,
     "end_time": "2024-03-29T07:45:15.087345",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.049131",
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
   "id": "d889a96e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.122826Z",
     "iopub.status.busy": "2024-03-29T07:45:15.121105Z",
     "iopub.status.idle": "2024-03-29T07:45:15.148016Z",
     "shell.execute_reply": "2024-03-29T07:45:15.145848Z"
    },
    "papermill": {
     "duration": 0.047861,
     "end_time": "2024-03-29T07:45:15.150599",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.102738",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x569b5573fdf0>\n",
      "<environment: 0x569b5682da28>\n",
      "<environment: 0x569b5573fdf0>\n"
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
   "id": "8092b0cd",
   "metadata": {
    "papermill": {
     "duration": 0.014622,
     "end_time": "2024-03-29T07:45:15.179894",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.165272",
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
   "id": "c175718a",
   "metadata": {
    "papermill": {
     "duration": 0.015091,
     "end_time": "2024-03-29T07:45:15.209996",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.194905",
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
   "id": "01cbbac6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.243816Z",
     "iopub.status.busy": "2024-03-29T07:45:15.242119Z",
     "iopub.status.idle": "2024-03-29T07:45:15.264771Z",
     "shell.execute_reply": "2024-03-29T07:45:15.262969Z"
    },
    "papermill": {
     "duration": 0.04271,
     "end_time": "2024-03-29T07:45:15.267441",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.224731",
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
   "id": "a16270fc",
   "metadata": {
    "papermill": {
     "duration": 0.015421,
     "end_time": "2024-03-29T07:45:15.297775",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.282354",
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
   "id": "da2f6cdd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.331562Z",
     "iopub.status.busy": "2024-03-29T07:45:15.329801Z",
     "iopub.status.idle": "2024-03-29T07:45:15.349487Z",
     "shell.execute_reply": "2024-03-29T07:45:15.347394Z"
    },
    "papermill": {
     "duration": 0.039617,
     "end_time": "2024-03-29T07:45:15.352137",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.312520",
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
   "id": "44d7632f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.386120Z",
     "iopub.status.busy": "2024-03-29T07:45:15.384358Z",
     "iopub.status.idle": "2024-03-29T07:45:15.409521Z",
     "shell.execute_reply": "2024-03-29T07:45:15.407066Z"
    },
    "papermill": {
     "duration": 0.046028,
     "end_time": "2024-03-29T07:45:15.413068",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.367040",
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
   "id": "c4c76a73",
   "metadata": {
    "papermill": {
     "duration": 0.015307,
     "end_time": "2024-03-29T07:45:15.443571",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.428264",
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
   "id": "20bebfa0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.477681Z",
     "iopub.status.busy": "2024-03-29T07:45:15.475997Z",
     "iopub.status.idle": "2024-03-29T07:45:15.505507Z",
     "shell.execute_reply": "2024-03-29T07:45:15.503067Z"
    },
    "papermill": {
     "duration": 0.050036,
     "end_time": "2024-03-29T07:45:15.508637",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.458601",
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
   "id": "328afa4b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.543156Z",
     "iopub.status.busy": "2024-03-29T07:45:15.541529Z",
     "iopub.status.idle": "2024-03-29T07:45:15.608578Z",
     "shell.execute_reply": "2024-03-29T07:45:15.606744Z"
    },
    "papermill": {
     "duration": 0.087305,
     "end_time": "2024-03-29T07:45:15.611288",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.523983",
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
   "id": "d0213d6e",
   "metadata": {
    "papermill": {
     "duration": 0.015879,
     "end_time": "2024-03-29T07:45:15.642722",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.626843",
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
   "id": "47802666",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.680420Z",
     "iopub.status.busy": "2024-03-29T07:45:15.678702Z",
     "iopub.status.idle": "2024-03-29T07:45:15.704150Z",
     "shell.execute_reply": "2024-03-29T07:45:15.702193Z"
    },
    "papermill": {
     "duration": 0.048068,
     "end_time": "2024-03-29T07:45:15.707086",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.659018",
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
   "id": "f3dbacc2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.743719Z",
     "iopub.status.busy": "2024-03-29T07:45:15.742014Z",
     "iopub.status.idle": "2024-03-29T07:45:15.765402Z",
     "shell.execute_reply": "2024-03-29T07:45:15.763523Z"
    },
    "papermill": {
     "duration": 0.044626,
     "end_time": "2024-03-29T07:45:15.768118",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.723492",
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
   "id": "38aee233",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.805572Z",
     "iopub.status.busy": "2024-03-29T07:45:15.803825Z",
     "iopub.status.idle": "2024-03-29T07:45:15.828383Z",
     "shell.execute_reply": "2024-03-29T07:45:15.826429Z"
    },
    "papermill": {
     "duration": 0.045763,
     "end_time": "2024-03-29T07:45:15.830983",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.785220",
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
   "id": "f630d266",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.868250Z",
     "iopub.status.busy": "2024-03-29T07:45:15.866068Z",
     "iopub.status.idle": "2024-03-29T07:45:15.884981Z",
     "shell.execute_reply": "2024-03-29T07:45:15.882963Z"
    },
    "papermill": {
     "duration": 0.03985,
     "end_time": "2024-03-29T07:45:15.887708",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.847858",
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
   "id": "8342fab5",
   "metadata": {
    "papermill": {
     "duration": 0.054882,
     "end_time": "2024-03-29T07:45:15.958653",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.903771",
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
   "id": "3af55f59",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:15.996961Z",
     "iopub.status.busy": "2024-03-29T07:45:15.994884Z",
     "iopub.status.idle": "2024-03-29T07:45:16.025663Z",
     "shell.execute_reply": "2024-03-29T07:45:16.023532Z"
    },
    "papermill": {
     "duration": 0.053043,
     "end_time": "2024-03-29T07:45:16.028340",
     "exception": false,
     "start_time": "2024-03-29T07:45:15.975297",
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
   "id": "230f1317",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.067051Z",
     "iopub.status.busy": "2024-03-29T07:45:16.064956Z",
     "iopub.status.idle": "2024-03-29T07:45:16.089921Z",
     "shell.execute_reply": "2024-03-29T07:45:16.087757Z"
    },
    "papermill": {
     "duration": 0.047115,
     "end_time": "2024-03-29T07:45:16.092785",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.045670",
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
   "id": "d4715ccc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.132968Z",
     "iopub.status.busy": "2024-03-29T07:45:16.130861Z",
     "iopub.status.idle": "2024-03-29T07:45:16.168541Z",
     "shell.execute_reply": "2024-03-29T07:45:16.166085Z"
    },
    "papermill": {
     "duration": 0.061692,
     "end_time": "2024-03-29T07:45:16.171428",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.109736",
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
   "id": "58758fe7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.210749Z",
     "iopub.status.busy": "2024-03-29T07:45:16.208746Z",
     "iopub.status.idle": "2024-03-29T07:45:16.234049Z",
     "shell.execute_reply": "2024-03-29T07:45:16.231859Z"
    },
    "papermill": {
     "duration": 0.047887,
     "end_time": "2024-03-29T07:45:16.237001",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.189114",
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
   "id": "1f058d19",
   "metadata": {
    "papermill": {
     "duration": 0.016861,
     "end_time": "2024-03-29T07:45:16.271155",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.254294",
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
   "id": "9980b0f9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.309587Z",
     "iopub.status.busy": "2024-03-29T07:45:16.307538Z",
     "iopub.status.idle": "2024-03-29T07:45:16.346362Z",
     "shell.execute_reply": "2024-03-29T07:45:16.344134Z"
    },
    "papermill": {
     "duration": 0.061163,
     "end_time": "2024-03-29T07:45:16.349040",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.287877",
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
   "id": "9ec88e47",
   "metadata": {
    "papermill": {
     "duration": 0.017535,
     "end_time": "2024-03-29T07:45:16.383843",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.366308",
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
   "id": "182c54cf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.425190Z",
     "iopub.status.busy": "2024-03-29T07:45:16.423151Z",
     "iopub.status.idle": "2024-03-29T07:45:16.444230Z",
     "shell.execute_reply": "2024-03-29T07:45:16.441878Z"
    },
    "papermill": {
     "duration": 0.045213,
     "end_time": "2024-03-29T07:45:16.447551",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.402338",
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
   "id": "b8d2d313",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.489039Z",
     "iopub.status.busy": "2024-03-29T07:45:16.486954Z",
     "iopub.status.idle": "2024-03-29T07:45:16.520117Z",
     "shell.execute_reply": "2024-03-29T07:45:16.512542Z"
    },
    "papermill": {
     "duration": 0.057532,
     "end_time": "2024-03-29T07:45:16.523242",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.465710",
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
   "id": "71c96f07",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.563696Z",
     "iopub.status.busy": "2024-03-29T07:45:16.561561Z",
     "iopub.status.idle": "2024-03-29T07:45:16.581188Z",
     "shell.execute_reply": "2024-03-29T07:45:16.578988Z"
    },
    "papermill": {
     "duration": 0.04368,
     "end_time": "2024-03-29T07:45:16.584282",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.540602",
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
   "id": "8400a27c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.624475Z",
     "iopub.status.busy": "2024-03-29T07:45:16.622396Z",
     "iopub.status.idle": "2024-03-29T07:45:16.649215Z",
     "shell.execute_reply": "2024-03-29T07:45:16.647071Z"
    },
    "papermill": {
     "duration": 0.050295,
     "end_time": "2024-03-29T07:45:16.652127",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.601832",
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
   "id": "5dbf58c7",
   "metadata": {
    "papermill": {
     "duration": 0.017711,
     "end_time": "2024-03-29T07:45:16.687462",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.669751",
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
   "id": "6a4267c0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.728384Z",
     "iopub.status.busy": "2024-03-29T07:45:16.726344Z",
     "iopub.status.idle": "2024-03-29T07:45:16.772674Z",
     "shell.execute_reply": "2024-03-29T07:45:16.770285Z"
    },
    "papermill": {
     "duration": 0.070389,
     "end_time": "2024-03-29T07:45:16.775667",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.705278",
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
   "id": "8533a9f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.815868Z",
     "iopub.status.busy": "2024-03-29T07:45:16.813835Z",
     "iopub.status.idle": "2024-03-29T07:45:16.856015Z",
     "shell.execute_reply": "2024-03-29T07:45:16.847718Z"
    },
    "papermill": {
     "duration": 0.066607,
     "end_time": "2024-03-29T07:45:16.859958",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.793351",
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
   "id": "129a76f7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.902585Z",
     "iopub.status.busy": "2024-03-29T07:45:16.900426Z",
     "iopub.status.idle": "2024-03-29T07:45:16.926115Z",
     "shell.execute_reply": "2024-03-29T07:45:16.923272Z"
    },
    "papermill": {
     "duration": 0.050697,
     "end_time": "2024-03-29T07:45:16.930082",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.879385",
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
   "id": "42ca5232",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:16.973348Z",
     "iopub.status.busy": "2024-03-29T07:45:16.971346Z",
     "iopub.status.idle": "2024-03-29T07:45:16.999214Z",
     "shell.execute_reply": "2024-03-29T07:45:16.996633Z"
    },
    "papermill": {
     "duration": 0.0534,
     "end_time": "2024-03-29T07:45:17.002509",
     "exception": false,
     "start_time": "2024-03-29T07:45:16.949109",
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
   "id": "7856b259",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.043152Z",
     "iopub.status.busy": "2024-03-29T07:45:17.041487Z",
     "iopub.status.idle": "2024-03-29T07:45:17.061244Z",
     "shell.execute_reply": "2024-03-29T07:45:17.059257Z"
    },
    "papermill": {
     "duration": 0.043049,
     "end_time": "2024-03-29T07:45:17.064001",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.020952",
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
   "id": "7785962b",
   "metadata": {
    "papermill": {
     "duration": 0.026385,
     "end_time": "2024-03-29T07:45:17.111515",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.085130",
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
   "id": "d527161a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.159267Z",
     "iopub.status.busy": "2024-03-29T07:45:17.157444Z",
     "iopub.status.idle": "2024-03-29T07:45:17.176576Z",
     "shell.execute_reply": "2024-03-29T07:45:17.174630Z"
    },
    "papermill": {
     "duration": 0.042678,
     "end_time": "2024-03-29T07:45:17.179109",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.136431",
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
   "id": "0f142a4d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.220483Z",
     "iopub.status.busy": "2024-03-29T07:45:17.218360Z",
     "iopub.status.idle": "2024-03-29T07:45:17.262693Z",
     "shell.execute_reply": "2024-03-29T07:45:17.253312Z"
    },
    "papermill": {
     "duration": 0.069732,
     "end_time": "2024-03-29T07:45:17.267464",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.197732",
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
   "id": "13d0a528",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.316994Z",
     "iopub.status.busy": "2024-03-29T07:45:17.314960Z",
     "iopub.status.idle": "2024-03-29T07:45:17.347850Z",
     "shell.execute_reply": "2024-03-29T07:45:17.344788Z"
    },
    "papermill": {
     "duration": 0.063764,
     "end_time": "2024-03-29T07:45:17.352354",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.288590",
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
   "id": "3734e564",
   "metadata": {
    "papermill": {
     "duration": 0.019989,
     "end_time": "2024-03-29T07:45:17.391483",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.371494",
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
   "id": "5fa82075",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.433863Z",
     "iopub.status.busy": "2024-03-29T07:45:17.432153Z",
     "iopub.status.idle": "2024-03-29T07:45:17.457283Z",
     "shell.execute_reply": "2024-03-29T07:45:17.454848Z"
    },
    "papermill": {
     "duration": 0.050246,
     "end_time": "2024-03-29T07:45:17.460734",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.410488",
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
   "id": "10642d4d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.519336Z",
     "iopub.status.busy": "2024-03-29T07:45:17.517441Z",
     "iopub.status.idle": "2024-03-29T07:45:17.540281Z",
     "shell.execute_reply": "2024-03-29T07:45:17.537991Z"
    },
    "papermill": {
     "duration": 0.059739,
     "end_time": "2024-03-29T07:45:17.542974",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.483235",
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
   "id": "f9b0da87",
   "metadata": {
    "papermill": {
     "duration": 0.020074,
     "end_time": "2024-03-29T07:45:17.583048",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.562974",
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
   "id": "e81eb3df",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.625806Z",
     "iopub.status.busy": "2024-03-29T07:45:17.624076Z",
     "iopub.status.idle": "2024-03-29T07:45:17.646317Z",
     "shell.execute_reply": "2024-03-29T07:45:17.644223Z"
    },
    "papermill": {
     "duration": 0.046783,
     "end_time": "2024-03-29T07:45:17.649080",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.602297",
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
   "id": "d46ee526",
   "metadata": {
    "papermill": {
     "duration": 0.019435,
     "end_time": "2024-03-29T07:45:17.688397",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.668962",
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
   "id": "bd06c28f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.730792Z",
     "iopub.status.busy": "2024-03-29T07:45:17.729098Z",
     "iopub.status.idle": "2024-03-29T07:45:17.763669Z",
     "shell.execute_reply": "2024-03-29T07:45:17.761538Z"
    },
    "papermill": {
     "duration": 0.059433,
     "end_time": "2024-03-29T07:45:17.767117",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.707684",
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
   "id": "df75adcf",
   "metadata": {
    "papermill": {
     "duration": 0.019957,
     "end_time": "2024-03-29T07:45:17.807423",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.787466",
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
   "id": "827664da",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.851885Z",
     "iopub.status.busy": "2024-03-29T07:45:17.850142Z",
     "iopub.status.idle": "2024-03-29T07:45:17.888104Z",
     "shell.execute_reply": "2024-03-29T07:45:17.885259Z"
    },
    "papermill": {
     "duration": 0.063612,
     "end_time": "2024-03-29T07:45:17.891652",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.828040",
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
   "id": "2e5eb702",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:17.937779Z",
     "iopub.status.busy": "2024-03-29T07:45:17.936050Z",
     "iopub.status.idle": "2024-03-29T07:45:17.964517Z",
     "shell.execute_reply": "2024-03-29T07:45:17.962178Z"
    },
    "papermill": {
     "duration": 0.054715,
     "end_time": "2024-03-29T07:45:17.967787",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.913072",
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
   "id": "296df09b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:45:18.012791Z",
     "iopub.status.busy": "2024-03-29T07:45:18.011011Z",
     "iopub.status.idle": "2024-03-29T07:45:18.041305Z",
     "shell.execute_reply": "2024-03-29T07:45:18.038799Z"
    },
    "papermill": {
     "duration": 0.055976,
     "end_time": "2024-03-29T07:45:18.044450",
     "exception": false,
     "start_time": "2024-03-29T07:45:17.988474",
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
   "duration": 7.193125,
   "end_time": "2024-03-29T07:45:18.188179",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-29T07:45:10.995054",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
