# 2WikiMultihopQA: A Dataset for Comprehensive Evaluation of Reasoning Steps

This is the repository for the paper: Constructing A Multi-hop QA Dataset for Comprehensive Evaluation of Reasoning Steps (COLING 2020).



### Dataset Contents
Our dataset follows the format of HotpotQA.
Each sample in our dataset has the following keys:
- ```_id```: a unique id for each sample
- ```question```: a string
- ```answer```: an answer to the question. The test data does not have this information.
- ```supporting_facts```: a list, each element is a list that contains: ```[title, sent_id]```, ```title``` is the title of the paragraph, ```sent_id``` is the sentence index (start from 0) of the sentence that the model uses. The test data does not have this information.
- ```context```: a list, each element is a list that contains ```[title, setences]```, ```sentences``` is a list of sentences.
- ```evidences```: a list, each element is a triple that contains ```[subject entity, relation, object entity]```. 
- ```original_triples```: similar as ```evidences```, the difference is the triples are obtained from Wikidata. 
- ```type```: a string, there are four types of question in our dataset: comparison, inference, compositional, and bridge-comparison.





### Baseline model
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
python3 -u main.py --mode train --para_limit 2250 --batch_size 24 --init_lr 0.1 --keep_prob 1.0 --sp_lambda 1.0
```

- Evaluation on dev

```
python3 main.py --mode test --data_split dev --para_limit 2250 --batch_size 24 --init_lr 0.1 --keep_prob 1.0 --sp_lambda 1.0 --save WikiMultiHop-20201024-023745 --prediction_file predictions/wikimultihop_dev_pred.json

```

```
python3 2wikimultihop_evaluate.py predictions/wikimultihop_test_pred.json wikimultihop/dev.json
```




### Citation
If you plan to use the dataset, please cite our paper:

```
@inproceedings{xanh2020_2wikimultihop,
    title={ {Constructing {A} {M}ulti-hop {QA} Dataset for Comprehensive Evaluation of Reasoning Steps},
    author={Xanh Ho and
        Anh-Khoa Duong Nguyen and
        Saku Sugawara and
        Akiko Aizawa},
    booktitle={{COLING}},
    year={2020}
}
```