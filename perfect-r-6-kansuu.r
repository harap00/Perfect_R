{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "31259d67",
   "metadata": {
    "papermill": {
     "duration": 0.006001,
     "end_time": "2024-03-25T15:44:42.766696",
     "exception": false,
     "start_time": "2024-03-25T15:44:42.760695",
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
   "id": "5ef6ce6e",
   "metadata": {
    "papermill": {
     "duration": 0.005307,
     "end_time": "2024-03-25T15:44:42.777102",
     "exception": false,
     "start_time": "2024-03-25T15:44:42.771795",
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
   "id": "563ce909",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:42.792350Z",
     "iopub.status.busy": "2024-03-25T15:44:42.790003Z",
     "iopub.status.idle": "2024-03-25T15:44:42.922552Z",
     "shell.execute_reply": "2024-03-25T15:44:42.920446Z"
    },
    "papermill": {
     "duration": 0.143689,
     "end_time": "2024-03-25T15:44:42.925841",
     "exception": false,
     "start_time": "2024-03-25T15:44:42.782152",
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
   "id": "ce2f81f1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:42.977264Z",
     "iopub.status.busy": "2024-03-25T15:44:42.938416Z",
     "iopub.status.idle": "2024-03-25T15:44:42.994197Z",
     "shell.execute_reply": "2024-03-25T15:44:42.991684Z"
    },
    "papermill": {
     "duration": 0.06621,
     "end_time": "2024-03-25T15:44:42.997158",
     "exception": false,
     "start_time": "2024-03-25T15:44:42.930948",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5b7b1b43c7a8>\n",
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
   "id": "ed3c6223",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:43.011482Z",
     "iopub.status.busy": "2024-03-25T15:44:43.009757Z",
     "iopub.status.idle": "2024-03-25T15:44:43.035378Z",
     "shell.execute_reply": "2024-03-25T15:44:43.033144Z"
    },
    "papermill": {
     "duration": 0.036237,
     "end_time": "2024-03-25T15:44:43.038674",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.002437",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5b7b19ba0ef0>\n",
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
   "id": "2cc5b78d",
   "metadata": {
    "papermill": {
     "duration": 0.005276,
     "end_time": "2024-03-25T15:44:43.049341",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.044065",
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
   "id": "d0e5d4b4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:43.064105Z",
     "iopub.status.busy": "2024-03-25T15:44:43.062455Z",
     "iopub.status.idle": "2024-03-25T15:44:43.080457Z",
     "shell.execute_reply": "2024-03-25T15:44:43.078585Z"
    },
    "papermill": {
     "duration": 0.028917,
     "end_time": "2024-03-25T15:44:43.083830",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.054913",
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
   "id": "1f83a8fe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:43.098146Z",
     "iopub.status.busy": "2024-03-25T15:44:43.096554Z",
     "iopub.status.idle": "2024-03-25T15:44:43.123638Z",
     "shell.execute_reply": "2024-03-25T15:44:43.121394Z"
    },
    "papermill": {
     "duration": 0.037553,
     "end_time": "2024-03-25T15:44:43.126677",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.089124",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5b7b1a816560>\n",
      "<environment: 0x5b7b1b92ff68>\n",
      "<environment: 0x5b7b1a816560>\n"
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
   "id": "e276c840",
   "metadata": {
    "papermill": {
     "duration": 0.005396,
     "end_time": "2024-03-25T15:44:43.137688",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.132292",
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
   "id": "c3f8368f",
   "metadata": {
    "papermill": {
     "duration": 0.005343,
     "end_time": "2024-03-25T15:44:43.148345",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.143002",
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
   "id": "a4b7c83c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:43.162970Z",
     "iopub.status.busy": "2024-03-25T15:44:43.161338Z",
     "iopub.status.idle": "2024-03-25T15:44:43.186565Z",
     "shell.execute_reply": "2024-03-25T15:44:43.184046Z"
    },
    "papermill": {
     "duration": 0.036067,
     "end_time": "2024-03-25T15:44:43.189757",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.153690",
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
   "id": "f9263332",
   "metadata": {
    "papermill": {
     "duration": 0.005577,
     "end_time": "2024-03-25T15:44:43.200986",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.195409",
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
   "id": "bd95bf31",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:43.216140Z",
     "iopub.status.busy": "2024-03-25T15:44:43.214473Z",
     "iopub.status.idle": "2024-03-25T15:44:43.234338Z",
     "shell.execute_reply": "2024-03-25T15:44:43.232011Z"
    },
    "papermill": {
     "duration": 0.031013,
     "end_time": "2024-03-25T15:44:43.237650",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.206637",
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
   "id": "eb8a243c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:43.253423Z",
     "iopub.status.busy": "2024-03-25T15:44:43.251593Z",
     "iopub.status.idle": "2024-03-25T15:44:43.275189Z",
     "shell.execute_reply": "2024-03-25T15:44:43.272933Z"
    },
    "papermill": {
     "duration": 0.034695,
     "end_time": "2024-03-25T15:44:43.278213",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.243518",
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
   "id": "0cfb7ab0",
   "metadata": {
    "papermill": {
     "duration": 0.005788,
     "end_time": "2024-03-25T15:44:43.289949",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.284161",
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
   "id": "41d3461b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-25T15:44:43.306401Z",
     "iopub.status.busy": "2024-03-25T15:44:43.304253Z",
     "iopub.status.idle": "2024-03-25T15:44:43.338474Z",
     "shell.execute_reply": "2024-03-25T15:44:43.336105Z"
    },
    "papermill": {
     "duration": 0.045603,
     "end_time": "2024-03-25T15:44:43.341374",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.295771",
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
   "execution_count": null,
   "id": "5c03e23d",
   "metadata": {
    "papermill": {
     "duration": 0.006181,
     "end_time": "2024-03-25T15:44:43.353983",
     "exception": false,
     "start_time": "2024-03-25T15:44:43.347802",
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
   "duration": 4.239746,
   "end_time": "2024-03-25T15:44:43.484644",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-25T15:44:39.244898",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
