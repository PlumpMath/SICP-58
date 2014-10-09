def create_output_matrix(matrix):
    """Takes a matrix and returns an empty matrix template of the same dimensions.
    
    It will be filled with placeholders: [[None, None, None], [None, None, None], [None, None, None]]
    """

    # TODO: refactor with the other function below
    rows = len(matrix)
    cols = len(matrix[0])

    return [[None] * cols for row in range(rows)]

def get_mirrored_point(n, length):
    """Takes a number from a list like [0, 1, 2] and a length and returns the mirrored point.
    
    If you have a sequence like [0, 1, 2], you could pass each number in here, along with a length
    and get back its mirrored counterpart:
    0 -> 2
    1 -> 1
    2 -> 0

    >>> get_mirrored_point(0, 3)
    2
    >>> get_mirrored_point(1, 3)
    1
    >>> get_mirrored_point(2, 3)
    0
    """

    # TODO: The list must at zero. This needs to be fixed.
    return length - n - 1

def get_matrix_dimensions(matrix):
    """Returns the number of rows and colums in a matrix."""

    matrix_dimensions = {
        "rows": len(matrix),
        "cols": len(matrix[0])
    }

    return matrix_dimensions

def do_it(matrix):
    dims = get_matrix_dimensions(matrix)
    num_rows = dims['rows']
    num_cols = dims['cols']
    output_matrix = create_output_matrix(matrix)

    for idx_i, i in enumerate(matrix):

        for j in range(num_rows):
            point = get_mirrored_point(idx_i, num_rows)

            print("i[j]", i[j], "is being assigned to output_matrix", j, point)
            output_matrix[j][point] = i[j]

    print(output_matrix)
    return output_matrix

# Sample matrix
A = [[1,2,3],
     [4,5,6],
     [7,8,9]]

# do it
do_it(A)

B = [[1,2,3,4],
     [5,6,7,8],
     [9,10,11,12],
     [13,14,15,16]]

do_it(B)
