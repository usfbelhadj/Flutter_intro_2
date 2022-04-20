



import xml.etree.cElementTree as ET

tree = ET.parse('./report.xml')
root = tree.getroot()

for child in root:
    # print(root.tag)
    print(child.attrib)
