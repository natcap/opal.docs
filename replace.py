import os
import sys
import shutil
import tempfile

def main(input_file, version):
    """
    Search through input_file and replace instances of +VERSION+ with the
    input version string.

    Parameters:
        input_file (string): A filepath to the input file to scan.
        version (string): The version string to use.

    Returns:
        None
    """
    out_dir = tempfile.mkdtemp()
    out_filepath = os.path.join(out_dir, 'foo.txt')
    output_file = open(out_filepath, 'w')

    with open(input_file, 'r') as open_input_file:
        for line in open_input_file:
            line = line.replace('+VERSION+', version)
            output_file.write(line)

    output_file.flush()
    shutil.copyfile(out_filepath, input_file)

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])

