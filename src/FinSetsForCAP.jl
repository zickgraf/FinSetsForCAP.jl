__precompile__(false)

module FinSetsForCAP

@nospecialize

import Base.in
import Base.getindex
import Base.iterate

using CAP

import CAP.ImageObject_OPERATION
import CAP.CallFuncList
import CAP.DisplayString
import CAP.ViewString
import CAP.PrintString
import CAP.StringGAP_OPERATION
import CAP.ListOp
import CAP.FilteredOp
import CAP.First

using CartesianCategories

using Toposes

push!(ModulesForEvaluationStack, FinSetsForCAP)

include("init.jl")

pop!(ModulesForEvaluationStack)

# convenience converting Int to BigInt

##
function FinSet(n::Int)
    FinSet(BigInt(n));
end

##
function MapOfFinSets(s::IsSkeletalFiniteSet.abstract_type, G::Vector{Int}, t::IsSkeletalFiniteSet.abstract_type)
	MapOfFinSets( s, Vector{BigInt}(G), t );
end

function MapOfFinSets(s::IsSkeletalFiniteSet.abstract_type, G::UnitRange{Int}, t::IsSkeletalFiniteSet.abstract_type)
	MapOfFinSets( s, UnitRange{BigInt}(G), t );
end

function MapOfFinSets(s::IsSkeletalFiniteSet.abstract_type, G::StepRange{Int}, t::IsSkeletalFiniteSet.abstract_type)
	MapOfFinSets( s, StepRange{BigInt}(G), t );
end

end # module FinSetsForCAP
