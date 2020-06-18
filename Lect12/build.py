from modeller import *
from modeller.automodel import *    # Load the automodel class
 
log.verbose()
env = environ()
 
# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']
 
a = loopmodel(env, alnfile = 'align.ali',
              knowns = 'template.pdb', sequence = 'sequence')
a.starting_model= 1
a.ending_model  = 1 
a.loop.starting_model = 1
a.loop.ending_model   = 2
a.loop.md_level       = refine.fast

a.make()
