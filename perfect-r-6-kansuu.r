{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "91d3a79b",
   "metadata": {
    "papermill": {
     "duration": 0.004183,
     "end_time": "2024-03-24T15:26:52.037507",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.033324",
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
   "id": "883ee536",
   "metadata": {
    "papermill": {
     "duration": 0.003404,
     "end_time": "2024-03-24T15:26:52.044514",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.041110",
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
   "id": "10541fbc",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-03-24T15:26:52.056597Z",
     "iopub.status.busy": "2024-03-24T15:26:52.054091Z",
     "iopub.status.idle": "2024-03-24T15:26:52.219157Z",
     "shell.execute_reply": "2024-03-24T15:26:52.217078Z"
    },
    "papermill": {
     "duration": 0.17418,
     "end_time": "2024-03-24T15:26:52.221999",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.047819",
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
   "id": "ca5f509b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-24T15:26:52.271900Z",
     "iopub.status.busy": "2024-03-24T15:26:52.230669Z",
     "iopub.status.idle": "2024-03-24T15:26:52.290079Z",
     "shell.execute_reply": "2024-03-24T15:26:52.287516Z"
    },
    "papermill": {
     "duration": 0.068205,
     "end_time": "2024-03-24T15:26:52.293468",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.225263",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5bf9a98a1968>\n",
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
   "id": "b224b983",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-24T15:26:52.304426Z",
     "iopub.status.busy": "2024-03-24T15:26:52.302589Z",
     "iopub.status.idle": "2024-03-24T15:26:52.331340Z",
     "shell.execute_reply": "2024-03-24T15:26:52.328819Z"
    },
    "papermill": {
     "duration": 0.037767,
     "end_time": "2024-03-24T15:26:52.334659",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.296892",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5bf9a7fd7d30>\n",
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
   "id": "ae3111b3",
   "metadata": {
    "papermill": {
     "duration": 0.003519,
     "end_time": "2024-03-24T15:26:52.341679",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.338160",
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
   "id": "2b1830af",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-24T15:26:52.353044Z",
     "iopub.status.busy": "2024-03-24T15:26:52.351244Z",
     "iopub.status.idle": "2024-03-24T15:26:52.370021Z",
     "shell.execute_reply": "2024-03-24T15:26:52.368077Z"
    },
    "papermill": {
     "duration": 0.028234,
     "end_time": "2024-03-24T15:26:52.373626",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.345392",
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
   "id": "5fd641d9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-03-24T15:26:52.384961Z",
     "iopub.status.busy": "2024-03-24T15:26:52.383194Z",
     "iopub.status.idle": "2024-03-24T15:26:52.413249Z",
     "shell.execute_reply": "2024-03-24T15:26:52.411005Z"
    },
    "papermill": {
     "duration": 0.039363,
     "end_time": "2024-03-24T15:26:52.416624",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.377261",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<environment: 0x5bf9a8c9ecd8>\n",
      "<environment: 0x5bf9a9d8c8d8>\n",
      "<environment: 0x5bf9a8c9ecd8>\n"
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
   "cell_type": "code",
   "execution_count": null,
   "id": "518734ed",
   "metadata": {
    "papermill": {
     "duration": 0.003796,
     "end_time": "2024-03-24T15:26:52.424528",
     "exception": false,
     "start_time": "2024-03-24T15:26:52.420732",
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
   "duration": 4.605891,
   "end_time": "2024-03-24T15:26:52.552424",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-24T15:26:47.946533",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
