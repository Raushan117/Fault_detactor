import pymongo
import pandas as pd 
import json

DATA_PATH = '/config/workspace/aps_failure_training_set1.csv'
DATABASE_NAME = 'APS'
COLLECTION = 'Sensor'
client = pymongo.MongoClient("mongodb://localhost:27017/neurolabDB")

if __name__ == '__main__':

    df = pd.read_csv(DATA_PATH)
    print(f'Raw & Column : {df.shape}')

    # converting dataframe into json
    df.reset_index(drop=True , inplace= True)
    jason_record = list(json.loads(df.T.to_json()).values())
    print(jason_record[0])

    client[DATABASE_NAME][COLLECTION].insert_many(jason_record)



