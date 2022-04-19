from test_suite import TestSuite
import os
import sys

if len(sys.argv)>1:
    nb_print_per_section = int(sys.argv[1])
else:
    nb_print_per_section = 3

tests=TestSuite(filename="report.xml",language="flutter")


tests.print(nb_print_per_section)