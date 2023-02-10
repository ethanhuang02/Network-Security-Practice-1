import numpy as np
#讀Key
filename = 'Key.txt'

elements = []
with open(filename, 'r') as file:
    for line in file:
        line = line.strip().split()
        line = list(map(int,line))
        elements.append(line)

key = matrix(elements)
print (key)


#讀plaintext
filename = 'plainText.txt'

data = []

with open(filename, 'r') as file:
    line = file.readline()
print('plain text :',line)
for i in range(len(line)):
    data.append(ord(line[i].upper()) - ord('A'))

plaintext = matrix(data)
plaintext = plaintext.T
print ('change into integer :')
print (plaintext)


#加密
encrypted = key*plaintext
moded = Matrix(IntegerModRing(26), encrypted)
print ('encrpted :')
print (encrypted)
print ('mod26 :')
print (moded)


#加密後存檔
encrypted = np.array(encrypted)
filename = 'cipherText.txt'

np.savetxt('cipherText.txt', encrypted, fmt = '%d')


#讀cipherText
filename = 'cipherText.txt'

elements = []
with open(filename, 'r') as file:
    for line in file:
        line = line.strip().split()
        line = list(map(int,line))
        elements.append(line)

ciphertext = matrix(elements)
print (ciphertext)


#解密
inversekey = key.inverse()
decrypted = inversekey*ciphertext
print ('inverse of the key matrix :')
print (inversekey)
print ('decrypted :')
print (decrypted)


#解密後存檔
decrypted = np.array(decrypted)

data = []

i = 0
for i in range(0,decrypted.size):
    data.append(chr(decrypted[i]+97).upper())
    i+=1
str1 = ''.join(data)

filename = 'cipherText.txt'
print (data)
print (str1)

with open(filename, 'w') as file:
    file.write(str1)