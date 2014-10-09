A = [[1,2,3],
     [4,5,6],
     [7,8,9]]

B = [[None, None, None],
     [None, None, None],
     [None, None, None]]

rows = len(A)

def invert(x, length):
    return length - x

for idx_i, i in enumerate(A):

    for j in range(rows):
        point = invert(idx_i, rows) - 1

        #print("A[i][j] is", i[j])
        #print("B[j][point] is", j, point)
        B[j][point] = i[j]

        #print("point", point)
        #print("j", j)
        #print("i", i)
        #B[j][point] = i[j]

print(B)

