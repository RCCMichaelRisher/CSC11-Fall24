# this creates the object files where % is a wildcard meaning anything can be there
# it follows the format of
# output: input
%.o: %.s
#	the command to run in the to make the object files
#	note that $@ is the %.o file and $< is the %.s
	as -o $@ $<

%.out: %.o
#	link the objects together and remove the clutter of the objects
#	note that $@ is the %.o file and $< is the %.s
	ld -o $@ $<
	rm $<

clean:
	rm -f *.o *.out