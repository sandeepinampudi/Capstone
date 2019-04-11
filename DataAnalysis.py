import json
input_file=open('top_100_techs.json', 'r')
data=json.load(input_file)
print(data[0]['ipc_codes'][0][])