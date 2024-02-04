import sys
import argparse
from numpy import random
import tqdm

"""
read queries from stdin corresponding each line
randomly generate a prefix and print along with query in a single line with a tab
skip queries that do not meet the condition provided
"""

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--seed', type=int, default=42)
    parser.add_argument('--n', type=int, required=True, help='number of prefix/suffix splits to be done for each query')
    parser.add_argument('--inp', type=str, default='data/DDC/test.txt')
    parser.add_argument('--out', type=str, default='data/DDC/test_formatted.txt')
    args = parser.parse_args()
    random.seed(args.seed)

    with open(args.out, 'w') as fw:
        with open(args.inp, 'r') as fr:
            for query in tqdm.tqdm(fr):
                query = query.strip().lower()
                n = len(query)
                if n < 2:
                    continue
                for kk in range(min(args.n, n-1)):
                    l = random.randint(1, n)
                    fw.write('\t'.join([query[:l], query[l:]]) + "\n")


if __name__ == '__main__':
    main()