import os
import sys
import subprocess


def test_build_mfio():
    opth = os.getcwd()

    # set path to document files
    npth = os.path.join('..', 'doc', 'mf6io')
    os.chdir(npth)

    pth = './'

    # remove existing files
    files = ['mf6io.nightlybuild.pdf', 'mf6io.nightlybuild.aux',
             'mf6io.nightlybuild.bbl']
    delete_files(files, pth, allow_failure=True)

    # build pdf
    argv = ['pdflatex', 'mf6io.nightlybuild.tex']
    ierr = run_command(argv, pth)
    assert ierr == 0, 'Error on first call to pdflatex ({})'.format(ierr)

    argv = ['bibtex', 'mf6io.nightlybuild.aux']
    ierr = run_command(argv, pth)
    assert ierr == 0, 'Error on bibtex call ({})'.format(ierr)

    argv = ['pdflatex', 'mf6io.nightlybuild.tex']
    ierr = run_command(argv, pth)
    assert ierr == 0, 'Error on second call to pdflatex ({})'.format(ierr)

    argv = ['pdflatex', 'mf6io.nightlybuild.tex']
    ierr = run_command(argv, pth)
    assert ierr == 0, 'Error on third call to pdflatex ({})'.format(ierr)

    msg = 'mf6io.nightlybuild.pdf does not exist'
    assert os.path.isfile(os.path.join(pth, 'mf6io.nightlybuild.pdf')), msg

    # change back to starting directory
    os.chdir(opth)

    return


def delete_files(files, pth, allow_failure=False):
    for file in files:
        fpth = os.path.join(pth, file)
        try:
            print('removing...{}'.format(file))
            os.remove(fpth)
        except:
            print('could not remove...{}'.format(file))
            if not allow_failure:
                return False
    return True


def run_command(argv, pth):
    try:
        # run the model with Popen
        proc = subprocess.Popen(argv,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT,
                                cwd=pth)
        while True:
            line = proc.stdout.readline()
            c = line.decode('utf-8')
            if c != '':
                c = c.rstrip('\r\n')
                print('{}'.format(c))
            else:
                break
        ierr = 0
        if proc.returncode is not None:
            ierr = proc.returncode
        return ierr
    except:
        sys.stdout.write('could not run:')
        for arg in argv:
            sys.stdout.write(' {}'.format(arg))
        sys.stdout.write('\n')
        return 100



def main():
    # write message
    tnam = os.path.splitext(os.path.basename(__file__))[0]
    msg = 'Running {} test'.format(tnam)
    print(msg)

    test_build_mfio()

    return


if __name__ == "__main__":
    print('standalone run of {}'.format(os.path.basename(__file__)))

    # run main routine
    main()
