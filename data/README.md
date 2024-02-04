n is decided as the average length of sentences in test set.

To get stats of a file

```sh
python data/get_stats.py --inp data/DDC/test.txt
```

For creating DSTC7 test formatted
```sh
python data/create_test.py --inp data/DSTC7/test.txt --out data/DSTC7/test_formatted.txt --n 80
```

For creating DDC test formatted
```sh
python data/create_test.py --inp data/DDC/test.txt --out data/DDC/test_formatted.txt --n 57
```