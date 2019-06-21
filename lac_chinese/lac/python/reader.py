"""
The file_reader converts raw corpus to input.
"""
import os
import __future__
import io

def file_reader(file_dir,
                word2id_dict,
                label2id_dict,
                word_replace_dict,
                filename_feature=""):
    """
    define the reader to read files in file_dir
    """
    word_dict_len = max(map(int, word2id_dict.values())) + 1
    label_dict_len = max(map(int, label2id_dict.values())) + 1
    def reader():
        """
        the data generator
        """
        index = 0
        for root, dirs, files in os.walk(file_dir):
            for filename in files:
                if not filename.startswith(filename_feature):
                    continue
                for line in io.open(os.path.join(root, filename), 'r', encoding='utf8'):
                    index += 1
                    bad_line = False
                    line = line.strip("\n")
                    if len(line) == 0:
                        continue
                    seg_tag = line.rfind("\t")
                    word_part = line[0:seg_tag]
                    label_part = line[seg_tag + 1:]
                    word_idx = []
                    words = word_part
                    for word in words:
                        if ord(word) < 0x20:
                            word = ' '
                        if word in word_replace_dict:
                            word = word_replace_dict[word]
                        if word in word2id_dict:
                            word_idx.append(int(word2id_dict[word]))
                        else:
                            word_idx.append(int(word2id_dict["OOV"]))
                    target_idx = []
                    labels = label_part.strip().split(" ")
                    for label in labels:
                        if label in label2id_dict:
                            target_idx.append(int(label2id_dict[label]))
                        else:
                            target_idx.append(int(label2id_dict["O"]))
                    if len(word_idx) != len(target_idx):
                        continue             
                    yield word_idx, target_idx
    return reader

def test_reader(file_dir,
                word2id_dict,
                label2id_dict,
                word_replace_dict,
                filename_feature=""):
    """
    define the reader to read test files in file_dir
    """
    word_dict_len = max(map(int, word2id_dict.values())) + 1
    label_dict_len = max(map(int, label2id_dict.values())) + 1
    def reader():
        """
        the data generator
        """
        index = 0
        for root, dirs, files in os.walk(file_dir):
            for filename in files:
                if not filename.startswith(filename_feature):
                    continue
                for line in io.open(os.path.join(root, filename), 'r', encoding='utf8'):
                    index += 1
                    bad_line = False
                    line = line.strip("\n")
                    print(line)
                    if len(line) == 0:
                        continue
                    seg_tag = line.rfind("\t")
                    if seg_tag == -1:
                        seg_tag = len(line)
                    word_part = line[0:seg_tag]
                    label_part = line[seg_tag + 1:]
                    word_idx = []
                    words = word_part
                    for word in words:
                        if ord(word) < 0x20:
                            word = ' '
                        if word in word_replace_dict:
                            word = word_replace_dict[word]
                        if word in word2id_dict:
                            word_idx.append(int(word2id_dict[word]))
                        else:
                            word_idx.append(int(word2id_dict["OOV"]))

                    # print(words,word_idx)
                    yield word_idx, words


    return reader


def cmd_reader(data,word2id_dict,
                label2id_dict,
                word_replace_dict):
    
    word_dict_len = max(map(int, word2id_dict.values())) + 1
    label_dict_len = max(map(int, label2id_dict.values())) + 1
    
    def reader():
        

        seg_tag = data.rfind("\t")
        if seg_tag == -1:
            seg_tag = len(data)
        word_part = data[0:seg_tag]
        label_part = data[seg_tag + 1:]
        word_idx = []
        words = word_part
        for word in words:
            if ord(word) < 0x20:
                word = ' '
            if word in word_replace_dict:
                word = word_replace_dict[word]
            if word in word2id_dict:
                word_idx.append(int(word2id_dict[word]))
            else:
                word_idx.append(int(word2id_dict["OOV"]))

        # print(words,word_idx)
            yield word_idx, words

    return reader

def load_dict(dict_path):
    """
    Load a dict. The first column is the key and the second column is the value.
    """
    result_dict = {}
    for line in io.open(dict_path, "r", encoding='utf8'):
        terms = line.strip("\n").split("\t")
        if len(terms) != 2:
            continue
        result_dict[terms[0]] = terms[1]
    return result_dict


def load_reverse_dict(dict_path):
    """
    Load a dict. The first column is the value and the second column is the key.
    """
    result_dict = {}
    for line in io.open(dict_path, "r", encoding='utf8'):
        terms = line.strip("\n").split("\t")
        if len(terms) != 2:
            continue
        result_dict[terms[1]] = terms[0]
    return result_dict