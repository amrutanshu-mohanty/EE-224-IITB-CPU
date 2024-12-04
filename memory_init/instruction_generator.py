import itertools
print("Enter the Assembly Code (type 'done' to finish):")
instruction = []
while True:
    instructions = input()
    if (instructions.lower() == 'done'):
        break
    instruction.append(instructions.split())
instruction = list(itertools.chain.from_iterable(instruction))
print(instruction)

machine_level_code = []
for i in range(len(instruction)):
    if (instruction[i] == 'ADD'):
        machine_level_code.append('0000' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3] + '000')
    elif (instruction[i] == 'SUB'):
        machine_level_code.append('0010' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3] + '000')
    elif (instruction[i] == 'MUL'):
        machine_level_code.append('0011' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3] + '000')
    elif (instruction[i] == 'ADI'):
        machine_level_code.append('0001' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3])
    elif (instruction[i] == 'AND'):
        machine_level_code.append('0100' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3] + '000')
    elif (instruction[i] == 'ORA'):
        machine_level_code.append('0101' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3] + '000')
    elif (instruction[i] == 'IMP'):
        machine_level_code.append('0110' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3] + '000')
    elif (instruction[i] == 'LHI'):
        machine_level_code.append('1000' + instruction[i + 1] + '0' + instruction[i + 2])
    elif (instruction[i] == 'LLI'):
        machine_level_code.append('1001' + instruction[i + 1] + '0' + instruction[i + 2])
    elif (instruction[i] == 'LW'):
        machine_level_code.append('1010' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3])
    elif (instruction[i] == 'SW'):
        machine_level_code.append('1011' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3])
    elif (instruction[i] == 'BEQ'):
        machine_level_code.append('1100' + instruction[i + 1] + instruction[i + 2] + instruction[i + 3])
    elif (instruction[i] == 'JAL'):
        machine_level_code.append('1101' + instruction[i + 1] + instruction[i + 2])
    elif (instruction[i] == 'JLR'):
        machine_level_code.append('1111' + instruction[i + 1] + instruction[i + 2] + '000000')
    elif (instruction[i] == 'J'):
        machine_level_code.append('1110' + instruction[i + 1] + instruction[i + 2])
    
while len(machine_level_code) < 127:
    machine_level_code.append('0001000000000000')

machine_level_code.append('1110000110000001')

print("Enter a 16-bit binary data value to input in the memory from byte 257: (type 'done' to finish):")
data_values = []
while True:
    data = input()
    if data.lower() == 'done':
        break
    data_values.append(data)

for i in range(128, 256):  
    if i - 128 < len(data_values):
        machine_level_code.append(data_values[i - 128])  
    else:
        machine_level_code.append('0000000000000000') 


program = open(r"MEM_INITIALIZATION.txt", "w")

for code in machine_level_code:
    
    high_byte = code[:8]  
    low_byte = code[8:]   
    program.write(high_byte + '\n')
    program.write(low_byte + '\n')

remaining_lines = 512 - len(machine_level_code) * 2
filler_high = "00010000"  
filler_low = "00000000"   

for j in range(remaining_lines // 2): 
    program.write(filler_high + '\n')
    if j != (remaining_lines // 2) - 1:
        program.write(filler_low + '\n')
    else:
        program.write(filler_low)  

program.close()


