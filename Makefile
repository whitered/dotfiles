install:
	find files -type f -execdir ln {} ~/.{} \; -exec echo Linked {} \;

# .PHONY:
