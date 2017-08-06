import os
import platform

target_ext = ''
sysinfo = platform.system()
if sysinfo.lower() == 'windows':
    target_ext = '.exe'

# paths to MODFLOW 6 executable , source files, and example files
bindir = os.path.join('..', 'bin')

# create dictionary of valid executable targets for regression tests
target_dict = {}
target_dict['mf2005'] = os.path.join(bindir, 'mf2005dbl{}'.format(target_ext))
target_dict['mfnwt'] = os.path.join(bindir, 'mfnwtdbl{}'.format(target_ext))
target_dict['mfusg'] = os.path.join(bindir, 'mfusgdbl{}'.format(target_ext))
target_dict['mflgr'] = os.path.join(bindir, 'mflgrdbl{}'.format(target_ext))

# create MODFLOW 6 target name
program = 'mf6{}'.format(target_ext)
target = os.path.join(bindir, program)

# add MODFLOW 6 to dictionary of valid executable targets
target_dict[os.path.basename(target)] = target

# add MODFLOW 5 to 6 converter to dictionary of valid executable targets
tprog = 'mf5to6{}'.format(target_ext)
ttarg = os.path.join(bindir, tprog)
target_dict['mf5to6'] = ttarg

# add Zonebudget for 6 to dictionary of valid executable targets
tprog = 'zbud6{}'.format(target_ext)
ttarg = os.path.join(bindir, tprog)
target_dict['zbud6'] = ttarg
