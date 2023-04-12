module FinSetsForCAP

import Base.in
import Base.getindex
import Base.iterate

using CAP

import CAP.ImageObjectOperation
import CAP.CallFuncList
import CAP.DisplayString
import CAP.ViewString
import CAP.PrintString
import CAP.StringGAPOperation
import CAP.ListOp
import CAP.FilteredOp
import CAP.First

using CartesianCategories

push!(ModulesForEvaluationStack, FinSetsForCAP)

include("init.jl")

pop!(ModulesForEvaluationStack)

end # module FinSetsForCAP
