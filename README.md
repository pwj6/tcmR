tcmR

tcmR是一个基于R平台的中药网络药理学数据挖掘工具，可以实现的功能包括：将中药转化为化合物、化合物及其对应靶点、常见疾病的靶点、中药和疾病的共同靶点等。

An R package on traditional Chinese medicine and common disease targets.Its functions include: transforming traditional Chinese medicine into compounds, compounds and their corresponding targets, targets of common diseases, common targets of traditional Chinese medicine and diseases, etc.

Authors

[周晓北](Zhou Xiaobei)

[彭文杰](Peng Wenjie)

Installation

for Linux,Mac or Win user:

install.packages("devtools")

devtools::install_github("pwj6/tcmR")

Usage

library(tcmR)

y <- h2m(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin')

x is the name of traditional Chinese medicine, which can be the Chinese name(type='chinese') or Chinese Pinyin of traditional Chinese medicine(type='pinyin'), or the Latin name of traditional Chinese medicine(type='latin').

y is the relevant information of all compounds of the two traditional Chinese medicines,including molecule,molecule_id,cid.














