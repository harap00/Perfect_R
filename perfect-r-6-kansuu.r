{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "f5478fff",
   "metadata": {
    "papermill": {
     "duration": 0.007285,
     "end_time": "2024-03-27T14:54:52.915408",
     "exception": false,
     "start_time": "2024-03-27T14:54:52.908123",
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
   "id": "05008124",
   "metadata": {
    "papermill": {
     "duration": 0.00589,
     "end_time": "2024-03-27T14:54:52.927389",
     "exception": false,
     "start_time": "2024-03-27T14:54:52.921499",
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
   "id": "3f31711e",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:52.943574Z",
     "iopub.status.busy": "2024-03-27T14:54:52.941279Z",
     "iopub.status.idle": "2024-03-27T14:54:53.103138Z",
     "shell.execute_reply": "2024-03-27T14:54:53.101129Z"
    },
    "papermill": {
     "duration": 0.172948,
     "end_time": "2024-03-27T14:54:53.106187",
     "exception": false,
     "start_time": "2024-03-27T14:54:52.933239",
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
   "id": "e92c3cae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.159285Z",
     "iopub.status.busy": "2024-03-27T14:54:53.120992Z",
     "iopub.status.idle": "2024-03-27T14:54:53.175408Z",
     "shell.execute_reply": "2024-03-27T14:54:53.173482Z"
    },
    "papermill": {
     "duration": 0.065509,
     "end_time": "2024-03-27T14:54:53.177895",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.112386",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x565eb914f850>\n",
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
   "id": "5395d795",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.193691Z",
     "iopub.status.busy": "2024-03-27T14:54:53.192030Z",
     "iopub.status.idle": "2024-03-27T14:54:53.215435Z",
     "shell.execute_reply": "2024-03-27T14:54:53.213654Z"
    },
    "papermill": {
     "duration": 0.033781,
     "end_time": "2024-03-27T14:54:53.217803",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.184022",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x565eb788dbe0>\n",
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
   "id": "8e05725a",
   "metadata": {
    "papermill": {
     "duration": 0.006076,
     "end_time": "2024-03-27T14:54:53.230106",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.224030",
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
   "id": "19fb7fd5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.246174Z",
     "iopub.status.busy": "2024-03-27T14:54:53.244448Z",
     "iopub.status.idle": "2024-03-27T14:54:53.261603Z",
     "shell.execute_reply": "2024-03-27T14:54:53.259593Z"
    },
    "papermill": {
     "duration": 0.028177,
     "end_time": "2024-03-27T14:54:53.264335",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.236158",
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
   "id": "60a8aebc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.280971Z",
     "iopub.status.busy": "2024-03-27T14:54:53.279217Z",
     "iopub.status.idle": "2024-03-27T14:54:53.307471Z",
     "shell.execute_reply": "2024-03-27T14:54:53.305299Z"
    },
    "papermill": {
     "duration": 0.039897,
     "end_time": "2024-03-27T14:54:53.310578",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.270681",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x565eb8554e28>\n",
      "<environment: 0x565eb9642a60>\n",
      "<environment: 0x565eb8554e28>\n"
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
   "id": "590d1fea",
   "metadata": {
    "papermill": {
     "duration": 0.006423,
     "end_time": "2024-03-27T14:54:53.323419",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.316996",
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
   "id": "5492ba83",
   "metadata": {
    "papermill": {
     "duration": 0.006205,
     "end_time": "2024-03-27T14:54:53.335962",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.329757",
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
   "id": "2ad719fd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.352396Z",
     "iopub.status.busy": "2024-03-27T14:54:53.350711Z",
     "iopub.status.idle": "2024-03-27T14:54:53.375823Z",
     "shell.execute_reply": "2024-03-27T14:54:53.373343Z"
    },
    "papermill": {
     "duration": 0.036792,
     "end_time": "2024-03-27T14:54:53.379037",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.342245",
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
   "id": "3edd078e",
   "metadata": {
    "papermill": {
     "duration": 0.006602,
     "end_time": "2024-03-27T14:54:53.392296",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.385694",
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
   "id": "d1416e8c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.409505Z",
     "iopub.status.busy": "2024-03-27T14:54:53.407779Z",
     "iopub.status.idle": "2024-03-27T14:54:53.428026Z",
     "shell.execute_reply": "2024-03-27T14:54:53.425844Z"
    },
    "papermill": {
     "duration": 0.032181,
     "end_time": "2024-03-27T14:54:53.431036",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.398855",
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
   "id": "feb9ca14",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.448825Z",
     "iopub.status.busy": "2024-03-27T14:54:53.447104Z",
     "iopub.status.idle": "2024-03-27T14:54:53.471325Z",
     "shell.execute_reply": "2024-03-27T14:54:53.469024Z"
    },
    "papermill": {
     "duration": 0.03664,
     "end_time": "2024-03-27T14:54:53.474390",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.437750",
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
   "id": "b13a50a4",
   "metadata": {
    "papermill": {
     "duration": 0.007201,
     "end_time": "2024-03-27T14:54:53.488510",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.481309",
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
   "id": "0a322138",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.506425Z",
     "iopub.status.busy": "2024-03-27T14:54:53.504733Z",
     "iopub.status.idle": "2024-03-27T14:54:53.533958Z",
     "shell.execute_reply": "2024-03-27T14:54:53.531529Z"
    },
    "papermill": {
     "duration": 0.041663,
     "end_time": "2024-03-27T14:54:53.537149",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.495486",
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
   "id": "d29640db",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.555380Z",
     "iopub.status.busy": "2024-03-27T14:54:53.553692Z",
     "iopub.status.idle": "2024-03-27T14:54:53.621787Z",
     "shell.execute_reply": "2024-03-27T14:54:53.619242Z"
    },
    "papermill": {
     "duration": 0.080672,
     "end_time": "2024-03-27T14:54:53.624976",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.544304",
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
   "id": "8bd40e8f",
   "metadata": {
    "papermill": {
     "duration": 0.007374,
     "end_time": "2024-03-27T14:54:53.639725",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.632351",
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
   "id": "0ed198a6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.658865Z",
     "iopub.status.busy": "2024-03-27T14:54:53.657129Z",
     "iopub.status.idle": "2024-03-27T14:54:53.682968Z",
     "shell.execute_reply": "2024-03-27T14:54:53.680426Z"
    },
    "papermill": {
     "duration": 0.038689,
     "end_time": "2024-03-27T14:54:53.686227",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.647538",
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
   "id": "e005bb69",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-27T14:54:53.705227Z",
     "iopub.status.busy": "2024-03-27T14:54:53.703507Z",
     "iopub.status.idle": "2024-03-27T14:54:53.728250Z",
     "shell.execute_reply": "2024-03-27T14:54:53.726056Z"
    },
    "papermill": {
     "duration": 0.037497,
     "end_time": "2024-03-27T14:54:53.731272",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.693775",
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
   "execution_count": null,
   "id": "7dabe73a",
   "metadata": {
    "papermill": {
     "duration": 0.007762,
     "end_time": "2024-03-27T14:54:53.746619",
     "exception": false,
     "start_time": "2024-03-27T14:54:53.738857",
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
   "duration": 4.586531,
   "end_time": "2024-03-27T14:54:53.876804",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-27T14:54:49.290273",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
