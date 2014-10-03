#!/usr/bin/env python
# -*- coding:utf-8 -*-

from pymongo import Connection
from bson.json_util import dumps
import pymongo
import json
#コネクション作成
con = Connection('localhost', 27017)

#コネクションからtestデータベースを取得
db = con.local

# 以下のように記載することも可能
# db = con['test']

#testデータベースからfooコレクションを取得
col = db.members

# 以下のように記載することも可能
# col = db['foo']

print "========find_one========"
print col.find_one()

test = dumps(col.find_one())
print test
print(json.dumps(test,sort_keys = True,indent=4))

#print "========find========"
#for data in col.find():
#    print data

#print col.find()
#print "========find_query========"
#for data in col.find({u'a':10}):
#    print data
