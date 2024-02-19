.PHONY: test

gen:
	gap_to_julia FinSetsForCAP

test:
	julia -e 'using Pkg; Pkg.test("FinSetsForCAP", julia_args = ["--warn-overwrite=no"]);'
