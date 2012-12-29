import sys
input_string = raw_input('Enter the string to type: ')
for letter in input_string:
	# Button 0
	if(letter == ' '):
		sys.stdout.write("0")
	
	# Button 1
	elif(letter == '.'):
		sys.stdout.write("1x1")
	elif(letter == '@'):
		sys.stdout.write("1x2")
	elif(letter == '/'):
		sys.stdout.write("1x3")
	elif(letter == ':'):
		sys.stdout.write("1x4")
	elif(letter == '1'):
		sys.stdout.write("1x5")
	
	# Button 2
	elif(letter == 'a'):
		sys.stdout.write("2x1")
	elif(letter == 'b'):
		sys.stdout.write("2x2")
	elif(letter == 'c'):
		sys.stdout.write("2x3")
	elif(letter == '2'):
		sys.stdout.write("2x4")

	# Button 3
	elif(letter == 'd'):
		sys.stdout.write("3x1")
	elif(letter == 'e'):
		sys.stdout.write("3x2")
	elif(letter == 'f'):
		sys.stdout.write("3x3")
	elif(letter == '3'):
		sys.stdout.write("3x4")

	# Button 4
	elif(letter == 'g'):
		sys.stdout.write("4x1")
	elif(letter == 'h'):
		sys.stdout.write("4x2")
	elif(letter == 'i'):
		sys.stdout.write("4x3")
	elif(letter == '4'):
		sys.stdout.write("4x4")

	# Button 5
	elif(letter == 'j'):
		sys.stdout.write("5x1")
	elif(letter == 'k'):
		sys.stdout.write("5x2")
	elif(letter == 'l'):
		sys.stdout.write("5x3")
	elif(letter == '5'):
		sys.stdout.write("5x4")

	# Button 6
	elif(letter == 'm'):
		sys.stdout.write("6x1")
	elif(letter == 'n'):
		sys.stdout.write("6x2")
	elif(letter == 'o'):
		sys.stdout.write("6x3")
	elif(letter == '6'):
		sys.stdout.write("6x4")

	# Button 7
	elif(letter == 'p'):
		sys.stdout.write("7x1")
	elif(letter == 'q'):
		sys.stdout.write("7x2")
	elif(letter == 'r'):
		sys.stdout.write("7x3")
	elif(letter == 's'):
		sys.stdout.write("7x4")
	elif(letter == '7'):
		sys.stdout.write("7x5")

	# Button 8
	elif(letter == 't'):
		sys.stdout.write("8x1")
	elif(letter == 'u'):
		sys.stdout.write("8x2")
	elif(letter == 'v'):
		sys.stdout.write("8x3")
	elif(letter == '8'):
		sys.stdout.write("8x4")

	# Button 9
	elif(letter == 'w'):
		sys.stdout.write("9x1")
	elif(letter == 'x'):
		sys.stdout.write("9x2")
	elif(letter == 'y'):
		sys.stdout.write("9x3")
	elif(letter == 'z'):
		sys.stdout.write("9x4")
	elif(letter == '9'):
		sys.stdout.write("9x5")
	sys.stdout.write(" - ")
print("<enter>")
