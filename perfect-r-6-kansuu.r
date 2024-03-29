{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "4f5808ca",
   "metadata": {
    "papermill": {
     "duration": 0.015195,
     "end_time": "2024-03-29T07:28:17.907297",
     "exception": false,
     "start_time": "2024-03-29T07:28:17.892102",
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
   "id": "abaf7935",
   "metadata": {
    "papermill": {
     "duration": 0.014165,
     "end_time": "2024-03-29T07:28:17.935708",
     "exception": false,
     "start_time": "2024-03-29T07:28:17.921543",
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
   "id": "10640ccb",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:17.970302Z",
     "iopub.status.busy": "2024-03-29T07:28:17.967220Z",
     "iopub.status.idle": "2024-03-29T07:28:18.097671Z",
     "shell.execute_reply": "2024-03-29T07:28:18.095585Z"
    },
    "papermill": {
     "duration": 0.151529,
     "end_time": "2024-03-29T07:28:18.101292",
     "exception": false,
     "start_time": "2024-03-29T07:28:17.949763",
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
   "id": "e56f44b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.174272Z",
     "iopub.status.busy": "2024-03-29T07:28:18.132009Z",
     "iopub.status.idle": "2024-03-29T07:28:18.192942Z",
     "shell.execute_reply": "2024-03-29T07:28:18.190345Z"
    },
    "papermill": {
     "duration": 0.080691,
     "end_time": "2024-03-29T07:28:18.196198",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.115507",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5a9fc094e8c0>\n",
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
   "id": "1ad9e333",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.230633Z",
     "iopub.status.busy": "2024-03-29T07:28:18.228769Z",
     "iopub.status.idle": "2024-03-29T07:28:18.258159Z",
     "shell.execute_reply": "2024-03-29T07:28:18.255603Z"
    },
    "papermill": {
     "duration": 0.049896,
     "end_time": "2024-03-29T07:28:18.261825",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.211929",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5a9fbf084e48>\n",
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
   "id": "ede8c421",
   "metadata": {
    "papermill": {
     "duration": 0.014822,
     "end_time": "2024-03-29T07:28:18.291116",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.276294",
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
   "id": "1e81a278",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.325108Z",
     "iopub.status.busy": "2024-03-29T07:28:18.323277Z",
     "iopub.status.idle": "2024-03-29T07:28:18.343109Z",
     "shell.execute_reply": "2024-03-29T07:28:18.341051Z"
    },
    "papermill": {
     "duration": 0.040332,
     "end_time": "2024-03-29T07:28:18.346552",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.306220",
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
   "id": "bff26f4e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.379264Z",
     "iopub.status.busy": "2024-03-29T07:28:18.377481Z",
     "iopub.status.idle": "2024-03-29T07:28:18.407338Z",
     "shell.execute_reply": "2024-03-29T07:28:18.404866Z"
    },
    "papermill": {
     "duration": 0.04994,
     "end_time": "2024-03-29T07:28:18.410826",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.360886",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5a9fbfd4bb18>\n",
      "<environment: 0x5a9fc0e397c0>\n",
      "<environment: 0x5a9fbfd4bb18>\n"
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
   "id": "3923cd6c",
   "metadata": {
    "papermill": {
     "duration": 0.014464,
     "end_time": "2024-03-29T07:28:18.439911",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.425447",
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
   "id": "371daa44",
   "metadata": {
    "papermill": {
     "duration": 0.014591,
     "end_time": "2024-03-29T07:28:18.469021",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.454430",
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
   "id": "8dc55f6c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.502052Z",
     "iopub.status.busy": "2024-03-29T07:28:18.500214Z",
     "iopub.status.idle": "2024-03-29T07:28:18.524735Z",
     "shell.execute_reply": "2024-03-29T07:28:18.522648Z"
    },
    "papermill": {
     "duration": 0.044058,
     "end_time": "2024-03-29T07:28:18.527489",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.483431",
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
   "id": "d8ce5c13",
   "metadata": {
    "papermill": {
     "duration": 0.014808,
     "end_time": "2024-03-29T07:28:18.557303",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.542495",
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
   "id": "ef9ef619",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.591077Z",
     "iopub.status.busy": "2024-03-29T07:28:18.589223Z",
     "iopub.status.idle": "2024-03-29T07:28:18.608911Z",
     "shell.execute_reply": "2024-03-29T07:28:18.606651Z"
    },
    "papermill": {
     "duration": 0.039513,
     "end_time": "2024-03-29T07:28:18.611646",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.572133",
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
   "id": "5f13072b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.645557Z",
     "iopub.status.busy": "2024-03-29T07:28:18.643743Z",
     "iopub.status.idle": "2024-03-29T07:28:18.668563Z",
     "shell.execute_reply": "2024-03-29T07:28:18.666157Z"
    },
    "papermill": {
     "duration": 0.044721,
     "end_time": "2024-03-29T07:28:18.671309",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.626588",
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
   "id": "5982ea82",
   "metadata": {
    "papermill": {
     "duration": 0.015086,
     "end_time": "2024-03-29T07:28:18.701350",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.686264",
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
   "id": "9010ad7a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.735156Z",
     "iopub.status.busy": "2024-03-29T07:28:18.733320Z",
     "iopub.status.idle": "2024-03-29T07:28:18.763084Z",
     "shell.execute_reply": "2024-03-29T07:28:18.761080Z"
    },
    "papermill": {
     "duration": 0.04958,
     "end_time": "2024-03-29T07:28:18.765826",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.716246",
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
   "id": "5e534afa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.800741Z",
     "iopub.status.busy": "2024-03-29T07:28:18.798928Z",
     "iopub.status.idle": "2024-03-29T07:28:18.870589Z",
     "shell.execute_reply": "2024-03-29T07:28:18.868556Z"
    },
    "papermill": {
     "duration": 0.09175,
     "end_time": "2024-03-29T07:28:18.873142",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.781392",
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
   "id": "e7ecfd52",
   "metadata": {
    "papermill": {
     "duration": 0.015376,
     "end_time": "2024-03-29T07:28:18.903877",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.888501",
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
   "id": "5114adc0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:18.938986Z",
     "iopub.status.busy": "2024-03-29T07:28:18.937175Z",
     "iopub.status.idle": "2024-03-29T07:28:18.961876Z",
     "shell.execute_reply": "2024-03-29T07:28:18.959901Z"
    },
    "papermill": {
     "duration": 0.045218,
     "end_time": "2024-03-29T07:28:18.964448",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.919230",
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
   "id": "5efbe517",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.000005Z",
     "iopub.status.busy": "2024-03-29T07:28:18.998185Z",
     "iopub.status.idle": "2024-03-29T07:28:19.023741Z",
     "shell.execute_reply": "2024-03-29T07:28:19.021196Z"
    },
    "papermill": {
     "duration": 0.046612,
     "end_time": "2024-03-29T07:28:19.026707",
     "exception": false,
     "start_time": "2024-03-29T07:28:18.980095",
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
   "id": "18fa2cad",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.063616Z",
     "iopub.status.busy": "2024-03-29T07:28:19.061674Z",
     "iopub.status.idle": "2024-03-29T07:28:19.086969Z",
     "shell.execute_reply": "2024-03-29T07:28:19.084889Z"
    },
    "papermill": {
     "duration": 0.046268,
     "end_time": "2024-03-29T07:28:19.089808",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.043540",
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
   "id": "bb839d89",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.125818Z",
     "iopub.status.busy": "2024-03-29T07:28:19.124016Z",
     "iopub.status.idle": "2024-03-29T07:28:19.142979Z",
     "shell.execute_reply": "2024-03-29T07:28:19.140847Z"
    },
    "papermill": {
     "duration": 0.040188,
     "end_time": "2024-03-29T07:28:19.145971",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.105783",
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
   "id": "37307220",
   "metadata": {
    "papermill": {
     "duration": 0.053977,
     "end_time": "2024-03-29T07:28:19.216483",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.162506",
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
   "id": "308ebc34",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.253066Z",
     "iopub.status.busy": "2024-03-29T07:28:19.251266Z",
     "iopub.status.idle": "2024-03-29T07:28:19.277945Z",
     "shell.execute_reply": "2024-03-29T07:28:19.275901Z"
    },
    "papermill": {
     "duration": 0.047791,
     "end_time": "2024-03-29T07:28:19.280739",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.232948",
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
   "id": "5b313668",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.318330Z",
     "iopub.status.busy": "2024-03-29T07:28:19.315950Z",
     "iopub.status.idle": "2024-03-29T07:28:19.340603Z",
     "shell.execute_reply": "2024-03-29T07:28:19.338499Z"
    },
    "papermill": {
     "duration": 0.046492,
     "end_time": "2024-03-29T07:28:19.343489",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.296997",
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
   "id": "70e233e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.380932Z",
     "iopub.status.busy": "2024-03-29T07:28:19.379109Z",
     "iopub.status.idle": "2024-03-29T07:28:19.413910Z",
     "shell.execute_reply": "2024-03-29T07:28:19.411540Z"
    },
    "papermill": {
     "duration": 0.056662,
     "end_time": "2024-03-29T07:28:19.416675",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.360013",
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
   "id": "2b56e682",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.454370Z",
     "iopub.status.busy": "2024-03-29T07:28:19.452515Z",
     "iopub.status.idle": "2024-03-29T07:28:19.476046Z",
     "shell.execute_reply": "2024-03-29T07:28:19.473909Z"
    },
    "papermill": {
     "duration": 0.045468,
     "end_time": "2024-03-29T07:28:19.479064",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.433596",
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
   "id": "b0e3cb0f",
   "metadata": {
    "papermill": {
     "duration": 0.016892,
     "end_time": "2024-03-29T07:28:19.513092",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.496200",
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
   "id": "8b4cef54",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.551150Z",
     "iopub.status.busy": "2024-03-29T07:28:19.549327Z",
     "iopub.status.idle": "2024-03-29T07:28:19.584068Z",
     "shell.execute_reply": "2024-03-29T07:28:19.581884Z"
    },
    "papermill": {
     "duration": 0.056964,
     "end_time": "2024-03-29T07:28:19.586872",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.529908",
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
   "id": "717cb35f",
   "metadata": {
    "papermill": {
     "duration": 0.018303,
     "end_time": "2024-03-29T07:28:19.623045",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.604742",
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
   "id": "593bc99c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.661482Z",
     "iopub.status.busy": "2024-03-29T07:28:19.659633Z",
     "iopub.status.idle": "2024-03-29T07:28:19.678847Z",
     "shell.execute_reply": "2024-03-29T07:28:19.676698Z"
    },
    "papermill": {
     "duration": 0.041463,
     "end_time": "2024-03-29T07:28:19.681722",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.640259",
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
   "id": "964e1c43",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.720872Z",
     "iopub.status.busy": "2024-03-29T07:28:19.718934Z",
     "iopub.status.idle": "2024-03-29T07:28:19.749138Z",
     "shell.execute_reply": "2024-03-29T07:28:19.740746Z"
    },
    "papermill": {
     "duration": 0.052905,
     "end_time": "2024-03-29T07:28:19.752254",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.699349",
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
   "id": "21c7741c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.791663Z",
     "iopub.status.busy": "2024-03-29T07:28:19.789935Z",
     "iopub.status.idle": "2024-03-29T07:28:19.808547Z",
     "shell.execute_reply": "2024-03-29T07:28:19.806059Z"
    },
    "papermill": {
     "duration": 0.042018,
     "end_time": "2024-03-29T07:28:19.812105",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.770087",
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
   "id": "e8ea7ba2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.851112Z",
     "iopub.status.busy": "2024-03-29T07:28:19.849296Z",
     "iopub.status.idle": "2024-03-29T07:28:19.875472Z",
     "shell.execute_reply": "2024-03-29T07:28:19.873491Z"
    },
    "papermill": {
     "duration": 0.049344,
     "end_time": "2024-03-29T07:28:19.878808",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.829464",
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
   "id": "8ed39a00",
   "metadata": {
    "papermill": {
     "duration": 0.017611,
     "end_time": "2024-03-29T07:28:19.914250",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.896639",
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
   "id": "73844f24",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:19.953554Z",
     "iopub.status.busy": "2024-03-29T07:28:19.951670Z",
     "iopub.status.idle": "2024-03-29T07:28:19.994861Z",
     "shell.execute_reply": "2024-03-29T07:28:19.992644Z"
    },
    "papermill": {
     "duration": 0.065731,
     "end_time": "2024-03-29T07:28:19.997538",
     "exception": false,
     "start_time": "2024-03-29T07:28:19.931807",
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
   "id": "5289229b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.037904Z",
     "iopub.status.busy": "2024-03-29T07:28:20.035929Z",
     "iopub.status.idle": "2024-03-29T07:28:20.073223Z",
     "shell.execute_reply": "2024-03-29T07:28:20.066312Z"
    },
    "papermill": {
     "duration": 0.060444,
     "end_time": "2024-03-29T07:28:20.076350",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.015906",
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
   "id": "2a29a75f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.116622Z",
     "iopub.status.busy": "2024-03-29T07:28:20.114745Z",
     "iopub.status.idle": "2024-03-29T07:28:20.135335Z",
     "shell.execute_reply": "2024-03-29T07:28:20.133392Z"
    },
    "papermill": {
     "duration": 0.043772,
     "end_time": "2024-03-29T07:28:20.138190",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.094418",
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
   "id": "78916e66",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.178864Z",
     "iopub.status.busy": "2024-03-29T07:28:20.176995Z",
     "iopub.status.idle": "2024-03-29T07:28:20.199570Z",
     "shell.execute_reply": "2024-03-29T07:28:20.197575Z"
    },
    "papermill": {
     "duration": 0.045849,
     "end_time": "2024-03-29T07:28:20.202352",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.156503",
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
   "id": "6ae73d9c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.244015Z",
     "iopub.status.busy": "2024-03-29T07:28:20.242206Z",
     "iopub.status.idle": "2024-03-29T07:28:20.261017Z",
     "shell.execute_reply": "2024-03-29T07:28:20.258837Z"
    },
    "papermill": {
     "duration": 0.041873,
     "end_time": "2024-03-29T07:28:20.263727",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.221854",
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
   "id": "6ae256d7",
   "metadata": {
    "papermill": {
     "duration": 0.018252,
     "end_time": "2024-03-29T07:28:20.300652",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.282400",
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
   "id": "01ff808e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.341467Z",
     "iopub.status.busy": "2024-03-29T07:28:20.339538Z",
     "iopub.status.idle": "2024-03-29T07:28:20.360373Z",
     "shell.execute_reply": "2024-03-29T07:28:20.358272Z"
    },
    "papermill": {
     "duration": 0.044255,
     "end_time": "2024-03-29T07:28:20.363061",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.318806",
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
   "id": "12f2979b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.404021Z",
     "iopub.status.busy": "2024-03-29T07:28:20.402070Z",
     "iopub.status.idle": "2024-03-29T07:28:20.436905Z",
     "shell.execute_reply": "2024-03-29T07:28:20.429911Z"
    },
    "papermill": {
     "duration": 0.059017,
     "end_time": "2024-03-29T07:28:20.440471",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.381454",
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
   "id": "c72bc65d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.482716Z",
     "iopub.status.busy": "2024-03-29T07:28:20.480774Z",
     "iopub.status.idle": "2024-03-29T07:28:20.510397Z",
     "shell.execute_reply": "2024-03-29T07:28:20.507676Z"
    },
    "papermill": {
     "duration": 0.054045,
     "end_time": "2024-03-29T07:28:20.513747",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.459702",
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
   "id": "3b1eef21",
   "metadata": {
    "papermill": {
     "duration": 0.018873,
     "end_time": "2024-03-29T07:28:20.551549",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.532676",
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
   "id": "1343573d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.593724Z",
     "iopub.status.busy": "2024-03-29T07:28:20.591821Z",
     "iopub.status.idle": "2024-03-29T07:28:20.617702Z",
     "shell.execute_reply": "2024-03-29T07:28:20.615217Z"
    },
    "papermill": {
     "duration": 0.05059,
     "end_time": "2024-03-29T07:28:20.621042",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.570452",
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
   "id": "c0805ef1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.667606Z",
     "iopub.status.busy": "2024-03-29T07:28:20.665836Z",
     "iopub.status.idle": "2024-03-29T07:28:20.691501Z",
     "shell.execute_reply": "2024-03-29T07:28:20.688638Z"
    },
    "papermill": {
     "duration": 0.054905,
     "end_time": "2024-03-29T07:28:20.694972",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.640067",
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
   "id": "536dc6c4",
   "metadata": {
    "papermill": {
     "duration": 0.018999,
     "end_time": "2024-03-29T07:28:20.733041",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.714042",
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
   "id": "efd5d51f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.776340Z",
     "iopub.status.busy": "2024-03-29T07:28:20.774443Z",
     "iopub.status.idle": "2024-03-29T07:28:20.799284Z",
     "shell.execute_reply": "2024-03-29T07:28:20.797214Z"
    },
    "papermill": {
     "duration": 0.050146,
     "end_time": "2024-03-29T07:28:20.802404",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.752258",
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
   "id": "ae5afff8",
   "metadata": {
    "papermill": {
     "duration": 0.019178,
     "end_time": "2024-03-29T07:28:20.840731",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.821553",
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
   "id": "03700969",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:20.883006Z",
     "iopub.status.busy": "2024-03-29T07:28:20.881221Z",
     "iopub.status.idle": "2024-03-29T07:28:20.919442Z",
     "shell.execute_reply": "2024-03-29T07:28:20.917410Z"
    },
    "papermill": {
     "duration": 0.063095,
     "end_time": "2024-03-29T07:28:20.922879",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.859784",
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
   "id": "4843f5d2",
   "metadata": {
    "papermill": {
     "duration": 0.019452,
     "end_time": "2024-03-29T07:28:20.961816",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.942364",
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
   "id": "5c2e13f3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:21.004981Z",
     "iopub.status.busy": "2024-03-29T07:28:21.003126Z",
     "iopub.status.idle": "2024-03-29T07:28:21.044550Z",
     "shell.execute_reply": "2024-03-29T07:28:21.041949Z"
    },
    "papermill": {
     "duration": 0.066588,
     "end_time": "2024-03-29T07:28:21.047847",
     "exception": false,
     "start_time": "2024-03-29T07:28:20.981259",
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
   "id": "d49023c4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:21.092209Z",
     "iopub.status.busy": "2024-03-29T07:28:21.090333Z",
     "iopub.status.idle": "2024-03-29T07:28:21.121170Z",
     "shell.execute_reply": "2024-03-29T07:28:21.118728Z"
    },
    "papermill": {
     "duration": 0.056711,
     "end_time": "2024-03-29T07:28:21.124621",
     "exception": false,
     "start_time": "2024-03-29T07:28:21.067910",
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
   "id": "3a125eca",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-29T07:28:21.170035Z",
     "iopub.status.busy": "2024-03-29T07:28:21.168144Z",
     "iopub.status.idle": "2024-03-29T07:28:21.202358Z",
     "shell.execute_reply": "2024-03-29T07:28:21.199746Z"
    },
    "papermill": {
     "duration": 0.061178,
     "end_time": "2024-03-29T07:28:21.206000",
     "exception": false,
     "start_time": "2024-03-29T07:28:21.144822",
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
   "duration": 7.127758,
   "end_time": "2024-03-29T07:28:21.350931",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-29T07:28:14.223173",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
