{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "0a210ad6",
   "metadata": {
    "papermill": {
     "duration": 0.011108,
     "end_time": "2024-03-28T15:24:39.462345",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.451237",
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
   "id": "88bbe18e",
   "metadata": {
    "papermill": {
     "duration": 0.00983,
     "end_time": "2024-03-28T15:24:39.482805",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.472975",
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
   "id": "7ab3bf6a",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:39.507362Z",
     "iopub.status.busy": "2024-03-28T15:24:39.505022Z",
     "iopub.status.idle": "2024-03-28T15:24:39.653253Z",
     "shell.execute_reply": "2024-03-28T15:24:39.651154Z"
    },
    "papermill": {
     "duration": 0.163165,
     "end_time": "2024-03-28T15:24:39.656173",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.493008",
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
   "id": "708a0d07",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:39.716919Z",
     "iopub.status.busy": "2024-03-28T15:24:39.677571Z",
     "iopub.status.idle": "2024-03-28T15:24:39.732939Z",
     "shell.execute_reply": "2024-03-28T15:24:39.730760Z"
    },
    "papermill": {
     "duration": 0.06994,
     "end_time": "2024-03-28T15:24:39.735711",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.665771",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5bd283f9e270>\n",
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
   "id": "01e5c653",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:39.759562Z",
     "iopub.status.busy": "2024-03-28T15:24:39.757737Z",
     "iopub.status.idle": "2024-03-28T15:24:39.784657Z",
     "shell.execute_reply": "2024-03-28T15:24:39.782299Z"
    },
    "papermill": {
     "duration": 0.042278,
     "end_time": "2024-03-28T15:24:39.787866",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.745588",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5bd2826deba0>\n",
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
   "id": "b9f79b0c",
   "metadata": {
    "papermill": {
     "duration": 0.009877,
     "end_time": "2024-03-28T15:24:39.807370",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.797493",
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
   "id": "72249c9c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:39.831216Z",
     "iopub.status.busy": "2024-03-28T15:24:39.829337Z",
     "iopub.status.idle": "2024-03-28T15:24:39.848453Z",
     "shell.execute_reply": "2024-03-28T15:24:39.846253Z"
    },
    "papermill": {
     "duration": 0.03464,
     "end_time": "2024-03-28T15:24:39.851840",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.817200",
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
   "id": "36f31301",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:39.875544Z",
     "iopub.status.busy": "2024-03-28T15:24:39.873623Z",
     "iopub.status.idle": "2024-03-28T15:24:39.901915Z",
     "shell.execute_reply": "2024-03-28T15:24:39.899690Z"
    },
    "papermill": {
     "duration": 0.043229,
     "end_time": "2024-03-28T15:24:39.904773",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.861544",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5bd283395538>\n",
      "<environment: 0x5bd28448b988>\n",
      "<environment: 0x5bd283395538>\n"
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
   "id": "f0cd329f",
   "metadata": {
    "papermill": {
     "duration": 0.009999,
     "end_time": "2024-03-28T15:24:39.924790",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.914791",
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
   "id": "f8785632",
   "metadata": {
    "papermill": {
     "duration": 0.010823,
     "end_time": "2024-03-28T15:24:39.946138",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.935315",
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
   "id": "984ed278",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:39.970717Z",
     "iopub.status.busy": "2024-03-28T15:24:39.968909Z",
     "iopub.status.idle": "2024-03-28T15:24:39.992903Z",
     "shell.execute_reply": "2024-03-28T15:24:39.990848Z"
    },
    "papermill": {
     "duration": 0.039689,
     "end_time": "2024-03-28T15:24:39.995693",
     "exception": false,
     "start_time": "2024-03-28T15:24:39.956004",
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
   "id": "eb0e45eb",
   "metadata": {
    "papermill": {
     "duration": 0.010203,
     "end_time": "2024-03-28T15:24:40.016684",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.006481",
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
   "id": "155f4196",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.042460Z",
     "iopub.status.busy": "2024-03-28T15:24:40.040279Z",
     "iopub.status.idle": "2024-03-28T15:24:40.063665Z",
     "shell.execute_reply": "2024-03-28T15:24:40.061014Z"
    },
    "papermill": {
     "duration": 0.039461,
     "end_time": "2024-03-28T15:24:40.066648",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.027187",
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
   "id": "2e919ede",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.092172Z",
     "iopub.status.busy": "2024-03-28T15:24:40.090341Z",
     "iopub.status.idle": "2024-03-28T15:24:40.115811Z",
     "shell.execute_reply": "2024-03-28T15:24:40.113409Z"
    },
    "papermill": {
     "duration": 0.041435,
     "end_time": "2024-03-28T15:24:40.118865",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.077430",
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
   "id": "476b52ba",
   "metadata": {
    "papermill": {
     "duration": 0.012612,
     "end_time": "2024-03-28T15:24:40.144079",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.131467",
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
   "id": "64104ded",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.171563Z",
     "iopub.status.busy": "2024-03-28T15:24:40.169637Z",
     "iopub.status.idle": "2024-03-28T15:24:40.199588Z",
     "shell.execute_reply": "2024-03-28T15:24:40.197292Z"
    },
    "papermill": {
     "duration": 0.046933,
     "end_time": "2024-03-28T15:24:40.202548",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.155615",
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
   "id": "13e44e7a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.230168Z",
     "iopub.status.busy": "2024-03-28T15:24:40.228165Z",
     "iopub.status.idle": "2024-03-28T15:24:40.301434Z",
     "shell.execute_reply": "2024-03-28T15:24:40.299299Z"
    },
    "papermill": {
     "duration": 0.090899,
     "end_time": "2024-03-28T15:24:40.304432",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.213533",
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
   "id": "bf0e0477",
   "metadata": {
    "papermill": {
     "duration": 0.011303,
     "end_time": "2024-03-28T15:24:40.327072",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.315769",
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
   "id": "dce96a6a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.354278Z",
     "iopub.status.busy": "2024-03-28T15:24:40.352209Z",
     "iopub.status.idle": "2024-03-28T15:24:40.377570Z",
     "shell.execute_reply": "2024-03-28T15:24:40.375520Z"
    },
    "papermill": {
     "duration": 0.041319,
     "end_time": "2024-03-28T15:24:40.380310",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.338991",
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
   "id": "3f81938b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.408173Z",
     "iopub.status.busy": "2024-03-28T15:24:40.406409Z",
     "iopub.status.idle": "2024-03-28T15:24:40.430978Z",
     "shell.execute_reply": "2024-03-28T15:24:40.428982Z"
    },
    "papermill": {
     "duration": 0.041839,
     "end_time": "2024-03-28T15:24:40.433862",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.392023",
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
   "id": "a004448d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.461180Z",
     "iopub.status.busy": "2024-03-28T15:24:40.459412Z",
     "iopub.status.idle": "2024-03-28T15:24:40.483634Z",
     "shell.execute_reply": "2024-03-28T15:24:40.481716Z"
    },
    "papermill": {
     "duration": 0.040992,
     "end_time": "2024-03-28T15:24:40.486306",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.445314",
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
   "id": "798dbb87",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.514539Z",
     "iopub.status.busy": "2024-03-28T15:24:40.512587Z",
     "iopub.status.idle": "2024-03-28T15:24:40.531216Z",
     "shell.execute_reply": "2024-03-28T15:24:40.529257Z"
    },
    "papermill": {
     "duration": 0.036036,
     "end_time": "2024-03-28T15:24:40.534143",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.498107",
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
   "id": "439a31bb",
   "metadata": {
    "papermill": {
     "duration": 0.011863,
     "end_time": "2024-03-28T15:24:40.557585",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.545722",
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
   "id": "765083c3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.584943Z",
     "iopub.status.busy": "2024-03-28T15:24:40.583148Z",
     "iopub.status.idle": "2024-03-28T15:24:40.610219Z",
     "shell.execute_reply": "2024-03-28T15:24:40.608168Z"
    },
    "papermill": {
     "duration": 0.043754,
     "end_time": "2024-03-28T15:24:40.612984",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.569230",
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
   "id": "b6761f89",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.641965Z",
     "iopub.status.busy": "2024-03-28T15:24:40.639993Z",
     "iopub.status.idle": "2024-03-28T15:24:40.663889Z",
     "shell.execute_reply": "2024-03-28T15:24:40.661777Z"
    },
    "papermill": {
     "duration": 0.040913,
     "end_time": "2024-03-28T15:24:40.666772",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.625859",
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
   "id": "4868d632",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.695540Z",
     "iopub.status.busy": "2024-03-28T15:24:40.693808Z",
     "iopub.status.idle": "2024-03-28T15:24:40.730022Z",
     "shell.execute_reply": "2024-03-28T15:24:40.727298Z"
    },
    "papermill": {
     "duration": 0.054752,
     "end_time": "2024-03-28T15:24:40.733639",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.678887",
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
   "id": "f67359b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.762539Z",
     "iopub.status.busy": "2024-03-28T15:24:40.760771Z",
     "iopub.status.idle": "2024-03-28T15:24:40.786410Z",
     "shell.execute_reply": "2024-03-28T15:24:40.784029Z"
    },
    "papermill": {
     "duration": 0.043761,
     "end_time": "2024-03-28T15:24:40.790128",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.746367",
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
   "id": "6a36dac2",
   "metadata": {
    "papermill": {
     "duration": 0.013006,
     "end_time": "2024-03-28T15:24:40.816186",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.803180",
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
   "id": "1d877daf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.845331Z",
     "iopub.status.busy": "2024-03-28T15:24:40.843562Z",
     "iopub.status.idle": "2024-03-28T15:24:40.881257Z",
     "shell.execute_reply": "2024-03-28T15:24:40.878689Z"
    },
    "papermill": {
     "duration": 0.05575,
     "end_time": "2024-03-28T15:24:40.884577",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.828827",
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
   "id": "9f5bf04c",
   "metadata": {
    "papermill": {
     "duration": 0.01254,
     "end_time": "2024-03-28T15:24:40.909779",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.897239",
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
   "id": "2558886d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.939645Z",
     "iopub.status.busy": "2024-03-28T15:24:40.937510Z",
     "iopub.status.idle": "2024-03-28T15:24:40.958020Z",
     "shell.execute_reply": "2024-03-28T15:24:40.956007Z"
    },
    "papermill": {
     "duration": 0.039664,
     "end_time": "2024-03-28T15:24:40.962095",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.922431",
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
   "id": "5dd06b32",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:40.993069Z",
     "iopub.status.busy": "2024-03-28T15:24:40.991221Z",
     "iopub.status.idle": "2024-03-28T15:24:41.020410Z",
     "shell.execute_reply": "2024-03-28T15:24:41.014056Z"
    },
    "papermill": {
     "duration": 0.049221,
     "end_time": "2024-03-28T15:24:41.024104",
     "exception": false,
     "start_time": "2024-03-28T15:24:40.974883",
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
   "id": "de8b5c37",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:41.054642Z",
     "iopub.status.busy": "2024-03-28T15:24:41.052196Z",
     "iopub.status.idle": "2024-03-28T15:24:41.072905Z",
     "shell.execute_reply": "2024-03-28T15:24:41.070812Z"
    },
    "papermill": {
     "duration": 0.038867,
     "end_time": "2024-03-28T15:24:41.075774",
     "exception": false,
     "start_time": "2024-03-28T15:24:41.036907",
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
   "id": "1d8beb8a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-28T15:24:41.105860Z",
     "iopub.status.busy": "2024-03-28T15:24:41.104012Z",
     "iopub.status.idle": "2024-03-28T15:24:41.127770Z",
     "shell.execute_reply": "2024-03-28T15:24:41.125738Z"
    },
    "papermill": {
     "duration": 0.041389,
     "end_time": "2024-03-28T15:24:41.130385",
     "exception": false,
     "start_time": "2024-03-28T15:24:41.088996",
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
   "cell_type": "code",
   "execution_count": null,
   "id": "548779a5",
   "metadata": {
    "papermill": {
     "duration": 0.013406,
     "end_time": "2024-03-28T15:24:41.159185",
     "exception": false,
     "start_time": "2024-03-28T15:24:41.145779",
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
   "duration": 5.921169,
   "end_time": "2024-03-28T15:24:41.295826",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-28T15:24:35.374657",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
