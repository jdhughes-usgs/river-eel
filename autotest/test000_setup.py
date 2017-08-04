import os
import sys
import platform
import shutil
import pymake

fc = 'gfortran'
cc = 'gcc'


def test_create_bindir():
    pth = os.path.join('..', 'bin')

    # remove bin directory if it exists
    if os.path.exists(pth):
        print('removing...{}'.format(pth))
        shutil.rmtree(pth)
    # create bin directory
    print('creating...{}'.format(pth))
    os.makedirs(pth)

    msg = 'could not create {}'.format(pth)
    assert os.path.exists(pth), msg
    return


def test_build_modflow():
    fct = fc
    cct = cc
    starget = 'MODFLOW-2005'
    # parse command line arguments to see if user specified options
    # relative to building the target
    msg = ''
    for idx, arg in enumerate(sys.argv):
        if arg.lower() == '--ifort':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with ifort.'.format(starget)
            fct = 'ifort'
        elif arg.lower() == '--cl':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with cl.'.format(starget)
            cct = 'cl'
        elif arg.lower() == '--clang':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with clang.'.format(starget)
            cct = 'clang'

    # set up target
    target = os.path.abspath(os.path.join('..', 'bin', 'mf2005dbl'))

    # get current directory
    cpth = os.getcwd()

    # create temporary path
    dstpth = os.path.join('temp')
    print('create...{}'.format(dstpth))
    if not os.path.exists(dstpth):
        os.makedirs(dstpth)
    os.chdir(dstpth)

    # Download the MODFLOW-2005 distribution
    url = "https://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.12.00/MF2005.1_12u.zip"
    pymake.download_and_unzip(url)

    # Set dir name
    dirname = 'MF2005.1_12u'
    srcdir = os.path.join(dirname, 'src')

    # compile code
    print('compiling...{}'.format(os.path.relpath(target)))
    pymake.main(srcdir, target, fct, cct, makeclean=True,
                expedite=False, dryrun=False, double=True, debug=False)

    msg = '{} does not exist.'.format(os.path.relpath(target))
    assert os.path.isfile(target), msg

    # change back to original path
    os.chdir(cpth)

    # Clean up downloaded directory
    print('delete...{}'.format(dstpth))
    if os.path.isdir(dstpth):
        shutil.rmtree(dstpth)

    return


def test_build_mfnwt():
    fct = fc
    cct = cc
    starget = 'MODFLOW-NWT'
    # parse command line arguments to see if user specified options
    # relative to building the target
    msg = ''
    for idx, arg in enumerate(sys.argv):
        if arg.lower() == '--ifort':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with ifort.'.format(starget)
            fct = 'ifort'
        elif arg.lower() == '--cl':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with cl.'.format(starget)
            cct = 'cl'
        elif arg.lower() == '--clang':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with clang.'.format(starget)
            cct = 'clang'

    # set up target
    target = os.path.abspath(os.path.join('..', 'bin', 'mfnwtdbl'))

    # get current directory
    cpth = os.getcwd()

    # create temporary path
    dstpth = os.path.join('temp')
    print('create...{}'.format(dstpth))
    if not os.path.exists(dstpth):
        os.makedirs(dstpth)
    os.chdir(dstpth)

    # Set dir name
    dirname = 'MODFLOW-NWT_1.1.2'
    srcdir = os.path.join(dirname, 'src')

    # Download the MODFLOW-2005 distribution
    url = "http://water.usgs.gov/ogw/modflow-nwt/{0}.zip".format(dirname)
    pymake.download_and_unzip(url)

    # compile code
    print('compiling...{}'.format(os.path.relpath(target)))
    pymake.main(srcdir, target, fct, cct, makeclean=True,
                expedite=False, dryrun=False, double=True, debug=False)

    msg = '{} does not exist.'.format(os.path.relpath(target))
    assert os.path.isfile(target), msg

    # change back to original path
    os.chdir(cpth)

    # Clean up downloaded directory
    print('delete...{}'.format(dstpth))
    if os.path.isdir(dstpth):
        shutil.rmtree(dstpth)

    return


def test_build_usg():
    fct = fc
    cct = cc
    starget = 'MODFLOW-USG'
    # parse command line arguments to see if user specified options
    # relative to building the target
    msg = ''
    for idx, arg in enumerate(sys.argv):
        if arg.lower() == '--ifort':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with ifort.'.format(starget)
            fct = 'ifort'
        elif arg.lower() == '--cl':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with cl.'.format(starget)
            cct = 'cl'
        elif arg.lower() == '--clang':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with clang.'.format(starget)
            cct = 'clang'

    # set up target
    target = os.path.abspath(os.path.join('..', 'bin', 'mfusgdbl'))

    # get current directory
    cpth = os.getcwd()

    # create temporary path
    dstpth = os.path.join('temp')
    print('create...{}'.format(dstpth))
    if not os.path.exists(dstpth):
        os.makedirs(dstpth)
    os.chdir(dstpth)

    # Set dir name
    dirname = 'mfusg.1_3'
    srcdir = os.path.join(dirname, 'src')

    # Download the MODFLOW-2005 distribution
    url = 'http://water.usgs.gov/ogw/mfusg/{0}.zip'.format(dirname)
    pymake.download_and_unzip(url)

    # compile code
    print('compiling...{}'.format(os.path.relpath(target)))
    pymake.main(srcdir, target, fct, cct, makeclean=True,
                expedite=False, dryrun=False, double=True, debug=False)

    msg = '{} does not exist.'.format(os.path.relpath(target))
    assert os.path.isfile(target), msg

    # change back to original path
    os.chdir(cpth)

    # Clean up downloaded directory
    print('delete...{}'.format(dstpth))
    if os.path.isdir(dstpth):
        shutil.rmtree(dstpth)

    return


def test_build_modflow6():
    # determine if app should be build
    for idx, arg in enumerate(sys.argv):
        if arg.lower() == '--nomf6':
            txt = 'Command line cancel of MODFLOW 6 build'
            print(txt)
            return

    # set source and target paths
    srcdir = os.path.join('..', 'src')
    target = os.path.join('..', 'bin', 'mf6')
    srcdir2 = None

    build(srcdir, srcdir2, target, 'MODFLOW 6')

    msg = '{} does not exist.'.format(os.path.relpath(target))
    assert os.path.isfile(target), msg


def test_build_mf5to6():
    # determine if app should be build
    for idx, arg in enumerate(sys.argv):
        if arg.lower() == '--nomf5to6':
            txt = 'Command line cancel of MODFLOW 5 to 6 converter build'
            print(txt)
            return

    # set source and target paths
    srcdir = os.path.join('..', 'utils', 'mf5to6', 'src')
    target = os.path.join('..', 'bin', 'mf5to6')
    srcdir2 = None
    extrafiles = os.path.join('..', 'utils', 'mf5to6', 'pymake',
                              'extrafiles.txt')

    # build modflow 5 to 6 converter
    build(srcdir, srcdir2, target, 'MODFLOW 5 to 6 converter',
          extrafiles=extrafiles)

    msg = '{} does not exist.'.format(os.path.relpath(target))
    assert os.path.isfile(target), msg


def test_build_zonebudget():
    # determine if app should be build
    for idx, arg in enumerate(sys.argv):
        if arg.lower() == '--nozonebudget':
            txt = 'Command line cancel of ZONEBUDGET for MODFLOW 6 build'
            print(txt)
            return

    # set source and target paths
    srcdir = os.path.join('..', 'utils', 'zonebudget', 'src')
    target = os.path.join('..', 'bin', 'zbud6')
    srcdir2 = None
    extrafiles = os.path.join('..', 'utils', 'zonebudget', 'pymake',
                              'extrafiles.txt')

    build(srcdir, srcdir2, target, 'ZONEBUDGET for MODFLOW 6',
          extrafiles=extrafiles)

    msg = '{} does not exist.'.format(os.path.relpath(target))
    assert os.path.isfile(target), msg


def build(srcdir, srcdir2, target, starget, extrafiles=None):
    """
    Build a specified target
    """
    debug = False
    fflags = None
    fct = fc
    cct = cc
    # parse command line arguments to see if user specified options
    # relative to building the target
    msg = ''
    for idx, arg in enumerate(sys.argv):
        if arg.lower() == '--ifort':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with ifort.'.format(starget)
            fct = 'ifort'
        elif arg.lower() == '--cl':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with cl.'.format(starget)
            cct = 'cl'
        elif arg.lower() == '--clang':
            if len(msg) > 0:
                msg += '\n'
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with cland.'.format(starget)
            cct = 'clang'
        elif arg.lower() == '--debug':
            debug = True
            msg += '{} - '.format(arg.lower()) + \
                   '{} will be built with debug flags.'.format(starget)
        elif arg.lower() == '--fflags':
            if len(sys.argv) > idx + 1:
                t = sys.argv[idx + 1:]
                fflags = ''
                for tt in t:
                    fflags += tt + ' '
                break
    if len(msg) > 0:
        print(msg)

    # write message to log
    txt = 'checking if {} should be built'.format(starget)
    print(txt)
    # determine if MODFLOW 6 should be built
    for idx, arg in enumerate(sys.argv):
        if arg.lower() == '--nobuild':
            print('{} will not be built'.format(starget))
            return

    # make sure exe extension is used on windows
    sysinfo = platform.system()
    if sysinfo.lower() == 'windows':
        filename, fileext = os.path.splitext(target)
        if fileext.lower() != '.exe':
            target += '.exe'

    # call main -- note that this form allows main to be called
    # from python as a function.
    success = pymake.pymake.main(srcdir, target, fct, cct,
                                 include_subdirs=True,
                                 srcdir2=srcdir2,
                                 debug=debug, extrafiles=extrafiles,
                                 fflags=fflags)

    msg = 'Could not build {}'.format(target)
    assert success == 0, msg

    return


if __name__ == "__main__":
    # test_create_bindir()
    # test_build_modflow()
    # test_build_mfnwt()
    # test_build_usg()
    # test_build_modflow6()
    test_build_mf5to6()
    test_build_zonebudget()
