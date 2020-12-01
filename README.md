# 2WikiMultihopQA: A Dataset for Comprehensive Evaluation of Reasoning Steps

This is the repository for the paper: [Constructing A Multi-hop QA Dataset for Comprehensive Evaluation of Reasoning Steps](https://arxiv.org/abs/2011.01060) (COLING 2020).


### Leaderboard 

| Date | Model| Ans <br> EM | Ans <br> F1 | Sup <br> EM | Sup <br> F1 | Evi <br> EM | Evi <br> F1 | Joint <br> EM | Joint <br> F1 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Oct 25 | Baseline model | 36.53 | 43.93 | 24.99 | 65.26 | 1.07 | 14.94 | 0.35 | 5.41 |


### Submission guide

To evaluate your model on the test data, please contact us (We will build the server for evaluation in the future).
Please prepare the following information: 


1. Your prediction file (follow format in file: [prediction_format.json](https://github.com/Alab-NII/2wikimultihop/blob/main/prediction_format.json))
2. The name of your model
3. Public repository of your model (optional)
4. Reference to your publication (optional)



### Dataset Contents
The full dataset is in [here](https://www.dropbox.com/s/npidmtadreo6df2/data.zip).

Our dataset follows the format of HotpotQA.
Each sample has the following keys:
- ```_id```: a unique id for each sample
- ```question```: a string
- ```answer```: an answer to the question. The test data does not have this information.
- ```supporting_facts```: a list, each element is a list that contains: ```[title, sent_id]```, ```title``` is the title of the paragraph, ```sent_id``` is the sentence index (start from 0) of the sentence that the model uses. The test data does not have this information.
- ```context```: a list, each element is a list that contains ```[title, setences]```, ```sentences``` is a list of sentences.
- ```evidences```: a list, each element is a triple that contains ```[subject entity, relation, object entity]```. The test data does not have this information.
- ```type```: a string, there are four types of questions in our dataset: comparison, inference, compositional, and bridge-comparison.





### Baseline model 
Our baseline model is based on the baseline model in HotpotQA. The process to train and test is quite similar to HotpotQA.

- Process train data
```
python3 main.py --mode prepro --data_file wikimultihop/train.json --para_limit 2250 --data_split train

```

- Process dev data
```
python3 main.py --mode prepro --data_file wikimultihop/dev.json --para_limit 2250 --data_split dev

```

- Train a model
```
python3 -u main.py --mode train --para_limit 2250 --batch_size 24 --init_lr 0.1 --keep_prob 1.0
```

- Evaluation on dev (Local Evaluation)

```
python3 main.py --mode test --data_split dev --para_limit 2250 --batch_size 24 --init_lr 0.1 --keep_prob 1.0 --save WikiMultiHop-20201024-023745 --prediction_file predictions/wikimultihop_dev_pred.json

```

```
python3 2wikimultihop_evaluate.py predictions/wikimultihop_dev_pred.json wikimultihop/dev.json
```




### Citation
If you plan to use the dataset, please cite our paper:

```
@inproceedings{xanh2020_2wikimultihop,
    title = "Constructing A Multi-hop {QA} Dataset for Comprehensive Evaluation of Reasoning Steps",
    author = "Ho, Xanh  and
      Duong Nguyen, Anh-Khoa  and
      Sugawara, Saku  and
      Aizawa, Akiko",
    booktitle = "Proceedings of the 28th International Conference on Computational Linguistics",
    month = dec,
    year = "2020",
    address = "Barcelona, Spain (Online)",
    publisher = "International Committee on Computational Linguistics",
    url = "https://www.aclweb.org/anthology/2020.coling-main.580",
    pages = "6609--6625",
}
```


### References
The baseline model and the evaluation script are adapted from https://github.com/hotpotqa/hotpot

