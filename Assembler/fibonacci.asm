#####
#	Universität Bremen - SoSe15 - Technische Informatik 1 - Uebungsblatt 2
#	Tutor: Sebastian Huhn
#	Gruppe 7 
#	- Tim Hansen
#	- Regina Wilhelm
#	- Mikhail Petrishchev
#	
#	Fibonacci
#
#	This program calculates the n-th fibonacci-number.
#	If an "n" smaller 0 is used, an error will be printed and
#	no calculation will be performed.
#####

.data
errormsg: .asciiz "Invalid operand!\n"

.text
li $t3,10  # Amount of iterations to perform ("n")
li $t0,0  # last fibonacci-child
li $t1,1  # current fibonacci-child (final result)
li $t2,0  # buffer-value

# Main-part
main:
# Validate argument
blez $t3,error
j step

# Fibonacci-Step
# Performs a single iteration
step:
# Lowering iteration-counter
sub $t3,$t3,1
# If n <= 0, stop iteration and print result
blez $t3,end

# Move last fibonacci-child to the buffer-value
move $t2,$t0
# Save child from last iteration as old child
move $t0,$t1
# Save new child as sum of old and buffered child
add $t1,$t0,$t2

# Perform next step
j step

# Presenting the error to the user
error:
li $v0,4 	 # Opcode for print_string
la $a0,errormsg
syscall

# Printing the result on the screen
end:
move $a0,$t0
li $v0,1	# Opcode for print_integer
syscall
nop