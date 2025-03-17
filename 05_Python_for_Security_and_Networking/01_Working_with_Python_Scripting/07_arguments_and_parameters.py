#!/bin/python3
# Managing parameters in Python

from optparse import OptionParser


class Parameters:
    def __init__(self, **kwargs):
        self.param1 = kwargs.get("param1")
        self.param2 = kwargs.get("param2")

    def view(self):
        print(self.param1)
        print(self.param2)


parser = OptionParser()
parser.add_option("--p1", dest="param1", help="parameter 1")
parser.add_option("--p2", dest="param2", help="parameter 2")

(options, args) = parser.parse_args()
input_param = Parameters(param1=options.param1, param2=options.param2)
input_param.view()
