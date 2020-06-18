from modeller import *
from modeller.automodel import *

log.verbose()
env = environ()
code = 'template.pdb'
m = model(env, file=code)
aln = alignment(env)
aln.append_model(m, align_codes=code)
aln.write(file=code+'.seq')
