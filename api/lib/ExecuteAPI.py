from robot.libraries.BuiltIn import BuiltIn
import json
import os
import requests

class ExecuteAPI():

    def __init__(self, host="API_HOST" ,content=True):
        self.BuiltIn = BuiltIn()
        self.HOST = self.BuiltIn.get_variable_value('${0}'.format(host))

    def get_current_weather_report(self, dataType="dataType", dataTypeValue="rhrread", lang="lang",langValue=""):
        base = f'?{dataType if dataType else ""}={dataTypeValue if dataTypeValue else ""}&{lang}={langValue if langValue else ""}'
        url = self.HOST + base

        resp = requests.request("get", url)
        return resp