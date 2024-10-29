def dec_to_bit_24(chislo):
    strok = ""
    for i in range(24):
        strok += str(chislo % 2)
        chislo = chislo // 2
    return strok[::-1]

def dec_to_bit_12(chislo):
    strok = ""
    for i in range(12):
        strok += str(chislo % 2)
        chislo = chislo // 2
    return strok[::-1]

def bit_to_dec(chislo):
    strok = 0
    for i in range(23, -1, -1):
        strok += 2 ** i * int(chislo[i])
    return strok

massiv = [
    #23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0,0,0,0,0,0,0,0,0,0],
    [1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0,0,0,0,0,0,0,0,0,0],
    [1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1,0,0,0,0,0,0,0,0,0],
    [0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0,1,0,0,0,0,0,0,0,0],
    [1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0,0,1,0,0,0,0,0,0,0],
    [1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0,0,0,1,0,0,0,0,0,0],
    [1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0,0,0,0,1,0,0,0,0,0],
    [0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0,0,0,0,0,1,0,0,0,0],
    [0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0,0,0,0,0,0,1,0,0,0],
    [0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0,0,0,0,0,0,0,1,0,0],
    [1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0,0,0,0,0,0,0,0,1,0],
    [0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0,0,0,0,0,0,0,0,0,1]
    ]
    
    
massiv_err = []
massiv_addres = []
def multiplex(error):
    addres = ""
    for i in range(len(massiv)):
        counter_one = 0
        for j in range(len(massiv[0])):
            if((massiv[i][j] == int(error[j])) and massiv[i][j] == 1):
                counter_one += 1
        if(counter_one % 2 == 1):
            addres += "1"
        else:
            addres += "0"
    return addres

for i in range(4096 * 4096):
    chis = dec_to_bit_24(i)
    if(chis.count("1") <= 4):
       addres = multiplex(chis)
       if(addres in massiv_addres):
           if(chis.count("1") == 4):
               massiv_addres.append(addres)
               massiv_err.append("0")
       else:
            massiv_addres.append(addres)
            massiv_err.append(chis)


new_err = []
new_add = []
for i in range(len(massiv_addres)):
    if(massiv_err[i] != "0"):
        new_add.append(massiv_addres[i])
        new_err.append(massiv_err[i])

    
#for i in range(1800, len(massiv_err)):
#    print(massiv_addres[i], massiv_err[i])
    
def proverka_na_blud(massiv):
    for i in range(len(massiv) - 1):
        addres = massiv[i]
        for j in range(i + 1, len(massiv)):
            if(addres == massiv[j]):
                print("error")
    return





carteg = zip(new_add, new_err)

sorted_carteg = sorted(carteg, key=lambda tup: tup[0])


file = open('123', 'w+')

for i in range(4096):
    
    file.write(str(sorted_carteg[i][1]) + " \n")
file.close()

print("stop")
        

        
        
        